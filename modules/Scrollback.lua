---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2007  Prat Development Team
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

    local L = module.L


    module.pluginopts["GlobalPatterns"] = {
        scrollbackhistheader = {
            name = L["Scrollback Options"],
            type = "header",
            order = 124,
        },
        scrollback = {
            type = "toggle",
            name = L["Scrollback"],
            desc = L["Store the chat lines between sessions"],
            order = 125
        },
        scrollbacklen = {
            name = L.scrollbacklen_name,
            desc = L.scrollbacklen_desc,
            type = "range",
            order = 126,
            min = 0,
            max = 500,
            step = 10,
            bigStep = 50,
            disabled = function() return not module.db.profile.scrollback end
        }
    }

    local MAX_TIME = 60 * 60 * 24


    local orgOME = module.OnModuleEnable
    function module:OnModuleEnable(...)
        orgOME(self, ...)

        Prat3HighCPUPerCharDB = Prat3HighCPUPerCharDB
        Prat3HighCPUPerCharDB = Prat3HighCPUPerCharDB or {}

        Prat3HighCPUPerCharDB.time = Prat3HighCPUPerCharDB.time or time()

        if time() - Prat3HighCPUPerCharDB.time > MAX_TIME then
            Prat3HighCPUPerCharDB.scrollback = {}
        end

        Prat3HighCPUPerCharDB.scrollback = Prat3HighCPUPerCharDB.scrollback or {}

        self.scrollback = Prat3HighCPUPerCharDB.scrollback

        self.timestamps = Prat.Addon:GetModule("Timestamps", true)

        if self.db.profile.scrollback then
            self:RestoreLastSession()
        end

        Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)
    end


    function module:RestoreLastSession()
        local textadded
        Prat.loading = true
        for frame,scrollback in pairs(self.scrollback) do
            local f = _G[frame]
            if f then
                for _,line in ipairs(scrollback) do
                    f:AddMessage(unpack(line))
                    textadded = true
                end

                if textadded then
                    f:AddMessage(L.divider)
                    f:AddMessage(format(TIME_DAYHOURMINUTESECOND,
                                ChatFrame_TimeBreakDown( time() - Prat3HighCPUPerCharDB.time ) ))
                end
            end
        end
        Prat.loading = nil
    end

    --function module:OnModuleDisable()
    --	 Prat3HighCPUPerCharDB.scrollback = nil
    --end

    function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
        if not self.db.profile.scrollback then return end

        self.scrollback[frame:GetName()] = self.scrollback[frame:GetName()] or {}
        local scrollback = self.scrollback[frame:GetName()]

        text = self.timestamps and self.timestamps:InsertTimeStamp(text, frame) or text

        table.insert(scrollback, {
            text, r, g, b, id
        })

        Prat3HighCPUPerCharDB.time = time()

        if #scrollback > self.db.profile.scrollbacklen then
            table.remove(scrollback, 1)
        end
    end

end)