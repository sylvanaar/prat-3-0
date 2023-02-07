---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2022  Prat Development Team
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


Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("ItemInfo")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

  local PL = module.PL

  -- define localized strings
  local PL = module.PL

  --@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
  })
  --@end-debug@


  function module:OnModuleEnable()
    Prat.RegisterChatEvent(self, "Prat_FrameMessage")
    Prat.RegisterChatEvent(self, "Prat_Ready")
  end

  function module:OnModuleDisable()
    Prat.UnregisterAllChatEvents(self)
  end


  function module:Prat_Ready()
    self:updateAll()
  end

  function module:GetDescription()
    return "testing 15"--PL["Player name formating options."]
  end

  function module:Prat_FrameMessage(info, message, frame, event)
    DevTools_Dump(message)
  end

  Prat.RegisterPattern({
    pattern = "|c.-|Hitem:.-|h.-|h|r",
    matchfunc = function(link)
      C_Timer.After(5, function()
        local level = GetDetailedItemLevelInfo(link)
        local res = link
        if level then
          res = link:gsub("|h%[(.-)%]|h", "|h%[%1 %(" .. level .. "%)%]|h")
        end
        Prat.RegisterPattern({
          pattern = link:gsub("(%W)", "%%%1"),
          matchfunc = function() return res end,
          type = "FRAME",
          priority = 43,
        })
      end)
      return Prat:RegisterMatch(link)
    end,
    type = "FRAME",
    priority = 43
  }, module.name)

  return
end) -- Prat:AddModuleToLoad
