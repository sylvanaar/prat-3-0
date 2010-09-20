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


Prat:AddModuleToLoad(function()

local PRAT_MODULE = Prat:RequestModuleName("Scrollback")

if PRAT_MODULE == nil then
    return
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["Scrollback"] = true,
	["Store the chat lines between sessions"] = true,
	divider = "========== End of Scrollback ==========",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS",
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("frFR",
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("deDE",
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("koKR",
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("esMX",
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("ruRU",
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("zhCN",
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("esES",
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
L:AddLocale("zhTW",
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Scrollback")@
)
--@end-non-debug@]===]

-- create prat module
local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleOptions(module.name, {
        name = L["Scrollback"],
        desc = L["Store the chat lines between sessions"],
        type = "group",
        args = {
			info = {
				name = "This module remembers the last 50 lines of chat on each chat frame and restores them at login.",
				type = "description",
			}
        }
    }
)


Prat:SetModuleDefaults(module.name, {
	profile = {
		on = false,
	},
})

local MAX_SCROLLBACK = 50


function module:OnModuleEnable()
    Prat3PerCharDB = Prat3PerCharDB or {}
    Prat3PerCharDB.scrollback = Prat3PerCharDB.scrollback or {}

    self.scrollback = Prat3PerCharDB.scrollback

    self.timestamps = Prat.Addon:GetModule("Timestamps")

    local textadded
    Prat.loading = true
    for frame,scrollback in pairs(self.scrollback) do
        for _, line in ipairs(scrollback) do
            _G[frame]:AddMessage(unpack(line))
            textadded=true
        end
        
        if textadded then
             _G[frame]:AddMessage(L.divider)
        end
    end
    Prat.loading = nil

    Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)
end

function module:OnModuleDisable()
	 Prat3PerCharDB.scrollback = nil
end

function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    self.scrollback[frame:GetName()] = self.scrollback[frame:GetName()] or {}
    local scrollback = self.scrollback[frame:GetName()]

    text = self.timestamps and self.timestamps:InsertTimeStamp(text, frame) or text

    table.insert(scrollback, { text, r, g, b, id } )
    if #scrollback > MAX_SCROLLBACK then
        table.remove(scrollback,1)
    end
end

end )