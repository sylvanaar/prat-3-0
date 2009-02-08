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
Name: PratFiltering
Revision: $Revision: 81859 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Filtering
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: A module to provide basic chat filtering. (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Filtering")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["Filtering"] = true,
	["A module to provide basic chat filtering."] = true,
    ["leavejoin_name"] = "Filter Channel Leave/Join",
    ["leavejoin_desc"] = "Filter out channel leave/join spam",
    ["notices_name"] = "Filter Channel Notices",
    ["notices_desc"] = "Filter out other custom channel notification messages, e.g. moderator changes.",
    ["bgjoin_name"] = "Filter BG Leave/Join",
    ["bgjoin_desc"] = "Filter out channel Battleground leave/join spam",
--    ["tradespam_name"] = "tradespam",
--    ["tradespam_desc"] = "tradespam",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Filtering")@
)
--@end-non-debug@]===]


local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module, {
	profile = {
		on	= false,
	    leavejoin = true,
	    notices = true,
--	    bgjoin = false,
		tradespam = true,
	}
} )

Prat:SetModuleOptions(module, {
        name = L["Filtering"] ,
        desc = L["A module to provide basic chat filtering."],
        type = "group",
        args = {
--		    leavejoin = { 
--				name = L["leavejoin_name"],
--				desc = L["leavejoin_desc"],
--				type = "toggle",
--				order = 100 
--			},
		    notices = { 
				name = L["notices_name"],
				desc = L["notices_desc"],
				type = "toggle",
				order = 110 
			},
--		    tradespam = { 
--				name = L["tradespam_name"],
--				desc = L["tradespam_desc"],
--				type = "toggle",
--				order = 110 
--			},


--		    bgjoin = { 
--				name = L["bgjoin_name"],
--				desc = L["bgjoin_desc"],
--				type = "toggle",
--				order = 111 
--			},	
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
local deformat

function module:OnModuleEnable()
	Prat.RegisterChatEvent(self, "Prat_FrameMessage")

--	Prat.RegisterLinkType(  { linkid="tradespam", linkfunc=module.TradeSpam, handler=module }, module.name)
end

-- things to do when the module is disabled
function module:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

--
-- Prat Event Implementation
--

--function module:TradeSpam(link, text, button, ...)
--	local realtext = strsub(link, 11)
--
--	ShowUIPanel(ItemRefTooltip)
--	if (not ItemRefTooltip:IsVisible()) then
--		ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
--	end
--	
--	ItemRefTooltip:ClearLines()
--	ItemRefTooltip:AddLine(realtext:gsub("@@", "|"), 1,1,1,1)
--	ItemRefTooltip:Show()
--
--	return false
--end
--
-----BuildLink(linktype, data, text, color, link_start, link_end)
--local function buildSpamLink(text)
--	return Prat.BuildLink("tradespam", text:gsub("|", "@@"),  text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", ""):sub(1, 20).."...", "8080ff")
--end


function module:Prat_FrameMessage(arg, message, frame, event)
--    if self.db.profile.leavejoin then 
--    	if  event == "CHAT_MSG_CHANNEL_JOIN" or event == "CHAT_MSG_CHANNEL_LEAVE"  then
--    		message.DONOTPROCESS = true
--    	end
--    end
    
        	
    if self.db.profile.notices then 
    	if  event == "CHAT_MSG_CHANNEL_NOTICE_USER" or event == "CHAT_MSG_CHANNEL_NOTICE"  then
    		message.DONOTPROCESS = true
    	end
    end
    
--	if self.db.profile.tradespam then
--		if message.ORG.CHANNEL and message.ORG.CHANNEL:find("Trade") and message.MESSAGE:len() > 40 then -- Temp implementation, todo: options?
--			message.MESSAGE = buildSpamLink(message.MESSAGE)
--		end
--	end


--    if self.db.profile.bgjoin and event == "CHAT_MSG_SYSTEM" then 
--        if MiniMapBattlefieldFrame.status == "active" then
--		    deformat = deformat or PRAT_LIBRARY(LIB.PARSING)
--
--            if deformat:Deformat(message.ORG.MESSAGE, ERR_BG_PLAYER_JOINED_SS) then
--                self:Debug("bgjoin", message.ORG)
--                message.DONOTPROCESS = true
--            elseif deformat:Deformat(message.ORG.MESSAGE,  ERR_BG_PLAYER_LEFT_S) then
--                message.DONOTPROCESS = true
--                self:Debug("bgleave", message.ORG)
--            end   
--        end
--   end        
end

  return
end ) -- Prat:AddModuleToLoad