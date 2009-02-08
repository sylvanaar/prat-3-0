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
Name: PratChatLog
Revision: $Revision: 80298 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatLog
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that controls toggling the chat and combat logs on and off (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("ChatLog")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["ChatLog"] = true,
    ["A module to automaticaly enable chat and combat logging."] = true,
    ["Toggle Chat Log"] = true,
    ["Toggle chat log on and off."] = true,
    ["Toggle Combat Log"] = true,
    ["Toggle combat log on and off."] = true,
    ["Combat Log: Enabled"] = true,
    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = true,
    ["Combat Log: Disabled"] = true,
    ["Chat Log: Enabled"] = true,
    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = true,
    ["Chat Log: Disabled"] = true,
    ["quiet_name"] = "Suppress Feedback Messages",
    ["quiet_desc"] = "Dont display any messages when this mod is enabled, or when it changes the log settings.",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="ChatLog")@
)
--@end-non-debug@]===]


local module = Prat:NewModule(PRAT_MODULE)


Prat:SetModuleDefaults(module.name, {
	profile = {
        on = false,
        chat = false,
        combat = false,
        quiet = true,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["ChatLog"],
        desc = L["A module to automaticaly enable chat and combat logging."],
        type = "group",
        args = {
            chat = {
                name = L["Toggle Chat Log"],
                desc = L["Toggle chat log on and off."],
                type = "toggle",
                set = "SetChatLog",
            },
            combat = {
                name = L["Toggle Combat Log"],
                desc = L["Toggle combat log on and off."],
                type = "toggle",
                set = "SetCombatLog",
            },
            quiet = {
                name = L["quiet_name"],
                desc = L["quiet_desc"],
                type = "toggle",
            }
        }
    })


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
    self:SetChatLog(nil, self.db.profile.chat)
    self:SetCombatLog(nil, self.db.profile.combat)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- enable or disable the chat log
function module:SetChatLog(info, val)
    self.db.profile.chat = val
    if self.db.profile.chat then
        self:Print(L["Chat Log: Enabled"])
        self:Print(L["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."])
        LoggingChat(1)
    else
        LoggingChat(0)
        self:Print(L["Chat Log: Disabled"])
    end
end

-- enable or disable the combat log
function module:SetCombatLog(info, val)
    self.db.profile.combat = val
    if self.db.profile.combat then
        self:Print(L["Combat Log: Enabled"])
        self:Print(L["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."])
        LoggingCombat(1)
    else
        LoggingCombat(0)
        self:Print(L["Combat Log: Disabled"])
    end
end

function module:Print(str)
    if self.db.profile.quiet then return end
    
    Prat:Print(str)
end



  return
end ) -- Prat:AddModuleToLoad