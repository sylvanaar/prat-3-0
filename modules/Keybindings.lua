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
Name: PratKeyBindings
Revision: $Revision: 80432 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#KeyBindings
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds keybindings for modules.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

-- Get Utility Libraries
local PRAT_MODULE = Prat:RequestModuleName("KeyBindings")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["Prat Keybindings"] = true,
    ["Officer Channel"] = true,
	["Guild Channel"] = true,
	["Party Channel"] = true,
	["Raid Channel"] = true,
    ["Raid Warning Channel"] = true,
    ["Battleground Channel"] = true,
    ["Say"] = true,
    ["Yell"] = true,
    ["Whisper"] = true,
    ["Channel %d"] = true,
	["Prat TellTarget"] = true,
    ["TellTarget"] = true,
    ["Prat CopyChat"] = true,
    ["Copy Selected Chat Frame"] = true,
    ["Smart Group Channel"] = true,
    ["Next Chat Tab"] = true
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="KeyBindings")@
)
--@end-non-debug@]===]




----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80432 $
--]]
--

--

--

--

--

--


local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleInit(module, 
	function(self)
		BINDING_HEADER_Prat = L["Prat Keybindings"]
		BINDING_NAME_officer = L["Officer Channel"]
		BINDING_NAME_guild = L["Guild Channel"]
		BINDING_NAME_party = L["Party Channel"]
		BINDING_NAME_raid = L["Raid Channel"]
		BINDING_NAME_raidwarn = L["Raid Warning Channel"]
		BINDING_NAME_battleground = L["Battleground Channel"]
		BINDING_NAME_say = L["Say"]
		BINDING_NAME_yell = L["Yell"]
		BINDING_NAME_whisper = L["Whisper"]
		BINDING_NAME_one = (L["Channel %d"]):format(1)
		BINDING_NAME_two = (L["Channel %d"]):format(2)
		BINDING_NAME_three = (L["Channel %d"]):format(3)
		BINDING_NAME_four = (L["Channel %d"]):format(4)
		BINDING_NAME_five = (L["Channel %d"]):format(5)
		BINDING_NAME_six = (L["Channel %d"]):format(6)
		BINDING_NAME_seven = (L["Channel %d"]):format(7)
		BINDING_NAME_eight = (L["Channel %d"]):format(8)
		BINDING_NAME_nine = (L["Channel %d"]):format(9)
		BINDING_NAME_SmartGroup = L["Smart Group Channel"]
--	    BINDING_HEADER_Prat_TellTarget = L["Prat TellTarget"]
--	    BINDING_HEADER_Prat_CopyChat = L["Prat CopyChat"]
        BINDING_NAME_NextTab = L["Next Chat Tab"]
	    BINDING_NAME_CopySelected = L["Copy Selected Chat Frame"]
	end
)

-- /script keybindings:CycleChatTabs()
function module:CycleChatTabs()
    local current = SELECTED_DOCK_FRAME
    local idx
    for i, v in ipairs(DOCKED_CHAT_FRAMES) do
        if v == current then
            idx = i
        end
    end

    if idx == nil then return end

    idx = idx + 1
    if DOCKED_CHAT_FRAMES[idx] == nil then
        idx = 1
    end

    FCF_SelectDockFrame(DOCKED_CHAT_FRAMES[idx])
end

  return
end ) -- Prat:AddModuleToLoad