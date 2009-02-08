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
--[[
Name: PratEventNames
Revision: $Revision: 82149 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#EventNames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that toggles showing hidden addon messages on and off (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("EventNames")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["EventNames"] = true,
    ["Chat window event name options."] = true,
	["Show"] = true,
	["Show events on chatframes"] = true, 
    ["show_name"] = "Show Event Names",
    ["show_desc"] = "Toggle showing event names in each window.",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="EventNames")@
)
--@end-non-debug@]===]

local mod = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(mod.name, {
	profile = {
	    on = true,
	    show = {},
	}
} )

Prat:SetModuleOptions(mod.name, {
        name = L["EventNames"],
        desc = L["Chat window event name options."],
        type = "group",
        args = {
			show = {
		        name = L["show_name"],
		        desc = L["show_desc"],
		        type = "multiselect",
				values = Prat.HookedFrameList,
				get = "GetSubValue",
				set = "SetSubValue"
			}
        }
    }
)

function mod:OnModuleEnable()
	Prat.RegisterChatEvent(self,"Prat_PreAddMessage","Prat_PreAddMessage")
end

function mod:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
do
	local CLR = Prat.CLR
	local function EventBrackets(text) return CLR:Colorize("ffffff", text) end
	local function EventName(text, c)  return CLR:Colorize(c, text) end
	local desat = 192*0.7+63
	local c
	function mod:Prat_PreAddMessage(arg, message, frame, event, t, r, g, b)		
		if self.db.profile.show[frame:GetName()] then
			c = ("%02x%02x%02x"):format((r or 1.0)*desat, (g or 1.0)*desat, (b or 1.0)*desat)
			message.POST =  "  "..EventBrackets("(")..EventName(tostring(event), c)..EventBrackets(")")
		end
	end
end

  return
end ) -- Prat:AddModuleToLoad