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
Name: module
Revision: $Revision: r24999 $
Author(s): Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Clear
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Adds /clear (or /cls) and /clearall (or /clsall) commands for clearing chat frames (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Clear")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["Clear"] = true,
	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = true,
	["Clears the current chat frame."] = true,
	["Clearall"] = true,
	["Clears all chat frames."] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = false,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["Clear"],
        desc = L["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."],
        type = "group",
        args = {
        }
    }
)

--[[------------------------------------------------
	Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
	Prat.RegisterChatCommand("clear", function() module:clear(SELECTED_CHAT_FRAME) end )
	Prat.RegisterChatCommand("cls", function() module:clear(SELECTED_CHAT_FRAME) end )
	Prat.RegisterChatCommand("clearall", function() module:clearAll() end )
	Prat.RegisterChatCommand("clsall", function() module:clearAll() end )

--	local slashcmds, cmdopts
--
--	-- clear
--	cmdopts_clear = {
--		name	= L["Clear"],
--		desc	= L["Clears the current chat frame."],
--		type	= "execute",
--		func	= function() module:clear(SELECTED_CHAT_FRAME) end,
--		}
--
--	-- cleartastic
--	cmdopts_clearall = {
--		name	= L["Clearall"],
--		desc	= L["Clears all chat frames."],
--		type	= "execute",
--		func	= function() module:clearAll() end,
--		}

-- TODO - need to find call equivalent to RCC in Ace2
--	Prat.Addon:RegisterChatCommand({ '/clear', '/cls' }, cmdopts_clear)
--	Prat.Addon:RegisterChatCommand({ '/clearall', '/clsall' }, cmdopts_clearall)
end

function module:OnModuleDisable()
end

--[[ - - ------------------------------------------------
	Core Functions
--------------------------------------------- - ]]--

function module:clear(chatframe)
	local vartype = type(chatframe)
	local type = chatframe:GetFrameType() or nil

	if self.db.profile.on and type == 'ScrollingMessageFrame' then
		chatframe:Clear()
	end
end

function module:clearAll()
	for i = 1, NUM_CHAT_WINDOWS do
		self:clear(getglobal('ChatFrame' .. i))
	end
end


  return
end ) -- Prat:AddModuleToLoad