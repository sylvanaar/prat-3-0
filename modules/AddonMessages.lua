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
Name: PratAddonMsgs
Revision: $Revision: 80330 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#AddonMsgs
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that toggles showing hidden addon messages on and off (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("AddonMsgs")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["AddonMsgs"] = true,
    ["Addon message options."] = true,
    ["show_name"] = "Show Addon Messages",
    ["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
    ["show_perframename"] = "ChatFrame%d AddonMsgsShow",
    ["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
} )
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, Namespace="AddonMsgs")@
)
--@end-non-debug@]===]


local mod = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")

Prat:SetModuleDefaults(mod.name, {
	profile = {
	    on = false,
	    show = {},
	}
} )

Prat:SetModuleOptions(mod.name, {
        name = L["AddonMsgs"],
        desc = L["Addon message options."],
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

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
function mod:OnModuleEnable()
	self:RegisterEvent("CHAT_MSG_ADDON")
end
function mod:OnModuleDisable()
	self:UnregisterEvent("CHAT_MSG_ADDON")
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

local CLR = Prat.CLR

-- add a splash of color to text
local function c1(text) return CLR:Colorize("ffff40", text) end
local function c2(text) return CLR:Colorize("a0a0a0", text) end
local function c3(text) return CLR:Colorize("40ff40", text) end
local function c4(text) return CLR:Colorize("4040ff", text) end

-- show hidden addon channel messages
function mod:CHAT_MSG_ADDON(arg1, arg2, arg3, arg4)
    for k,v in pairs(Prat.HookedFrames) do
        if self.db.profile.show[k] then
            v:AddMessage("["..c1(arg1).."]["..c2(arg2).."]["..c3(arg3).."]["..c4(arg4).."]")
        end
    end
end

  return
end ) -- Prat:AddModuleToLoad