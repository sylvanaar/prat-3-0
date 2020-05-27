---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor,
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------


Prat:AddModuleExtension(function()

  local module = Prat.Addon:GetModule("History", true)
  if not module then return end

  local PL = module.PL


  module.pluginopts["GlobalPatterns"] = {
    scrollbackhistheader = {
      name = PL["Scrollback Options"],
      type = "header",
      order = 124,
    },
    scrollback = {
      type = "toggle",
      name = PL["Scrollback"],
      desc = PL["Store the chat lines between sessions"],
      order = 125
    },
    scrollbackduration = {
      name = PL.scrollbackduration_name,
      desc = PL.scrollbackduration_desc,
      type = "range",
      order = 126,
      min = 1,
      max = 168,
      step = 1,
      bigStep = 24,
      disabled = function() return not module.db.profile.scrollback end
    }
  }

  local orgOME = module.OnModuleEnable
  function module:OnModuleEnable(...)
    orgOME(self, ...)

    Prat3HighCPUPerCharDB = Prat3HighCPUPerCharDB
    Prat3HighCPUPerCharDB = Prat3HighCPUPerCharDB or {}

    Prat3HighCPUPerCharDB.scrollback = Prat3HighCPUPerCharDB.scrollback or {}

    self.scrollback = Prat3HighCPUPerCharDB.scrollback

    if self.db.profile.scrollback then
      self:RestoreLastSession()

      for k, v in pairs(Prat.Frames) do
        self.scrollback[k] = v.historyBuffer
      end
    end

    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
  end

  function module:OnValueChanged(info, b)
    if self.db.profile.scrollback then
      for k, v in pairs(Prat.Frames) do
        if not v.isTemporary then
          self.scrollback[k] = v.historyBuffer
        end
      end
    end
  end

  function module:Prat_FramesUpdated(_, name, chatFrame)
    if self.db.profile.scrollback and not chatFrame.isTemporary then
      self.scrollback[name] = chatFrame.historyBuffer
    end
  end

  function module:GetEntryAtIndex(scrollback, index)
    if index > 0 and index <= #scrollback.elements then
      local globalIndex = scrollback.headIndex - index + 1;
      local elementIndex = (globalIndex - 1) % scrollback.maxElements + 1
      return scrollback.elements[elementIndex];
    end
  end

  function module:RestoreLastSession()
    local now, maxTime = GetTime(), self.db.profile.scrollbackduration * 60 * 60
    for frame, scrollback in pairs(self.scrollback) do
      local f = _G[frame]
      if scrollback.elements and scrollback.headIndex and scrollback.maxElements then
        if f and #scrollback.elements then
          local timeShown = false
          for i = 1, #scrollback.elements do
            local line = self:GetEntryAtIndex(scrollback, i)
            if line and line.message then
              if (now - line.timestamp) <= maxTime then
                if not timeShown then
                  f:BackFillMessage(PL.divider)

                  f:BackFillMessage(format(TIME_DAYHOURMINUTESECOND,
                    ChatFrame_TimeBreakDown(now - line.timestamp)))
                  timeShown = true
                end

                line.message = line.message:gsub("|K.-|k", PL.bnet_removed)
                f:BackFillMessage(f:UnpackageEntry(line))
              end
            end
          end
        end
      end
    end
  end
end)