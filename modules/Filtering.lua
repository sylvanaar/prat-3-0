---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2011  Prat Development Team
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

local PRAT_MODULE = Prat:RequestModuleName("Filtering")

if PRAT_MODULE == nil then 
    return 
end

local PL = Prat:GetLocalizer({})

--@debug@
PL:AddLocale("enUS", {
	["Filtering"] = true,
	["A module to provide basic chat filtering."] = true,
    ["leavejoin_name"] = "Filter Channel Leave/Join",
    ["leavejoin_desc"] = "Filter out channel leave/join spam",
    ["notices_name"] = "Filter Channel Notices",
    ["notices_desc"] = "Filter out other custom channel notification messages, e.g. moderator changes.",
    ["bgjoin_name"] = "Filter BG Leave/Join",
    ["bgjoin_desc"] = "Filter out channel Battleground leave/join spam",
    ["tradespam_name"] = "Throttle Spam",
    ["tradespam_desc"] = "Throttle messages to prevent the same message from being repeated multiple times",
    ["afkdnd_name"] = "Throttle AFK and DND messages.",
    ["afkdnd_desc"] = "Throttle AFK and DND messages."
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@



--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("enUS", L)


--@localization(locale="itIT", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("itIT", L)


--@localization(locale="ptBR", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("ptBR", L)

--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("frFR",L)



--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("deDE", L)

--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("koKR",L)
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("esMX",L)
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("ruRU",L)
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("zhCN",L)
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("esES",L)
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Filtering")@
PL:AddLocale("zhTW",L)
--@end-non-debug@]===]


local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")

Prat:SetModuleDefaults(module, {
	profile = {
		on	= false,
	    leavejoin = true,
	    notices = true,
		tradespam = false,
        afkdnd = true,
	}
} )

Prat:SetModuleOptions(module, {
        name = PL["Filtering"] ,
        desc = PL["A module to provide basic chat filtering."],
        type = "group",
        args = {
--		    leavejoin = { 
--				name = PL["leavejoin_name"],
--				desc = PL["leavejoin_desc"],
--				type = "toggle",
--				order = 100 
--			},
		    notices = { 
				name = PL["notices_name"],
				desc = PL["notices_desc"],
				type = "toggle",
				order = 110 
			},
		    tradespam = { 
				name = PL["tradespam_name"],
				desc = PL["tradespam_desc"],
				type = "toggle",
				order = 115 
			},
            afkdnd = {
                name = PL["afkdnd_name"],
                desc = PL["afkdnd_desc"],
                type = "toggle",
                order = 115
            }

--		    bgjoin = { 
--				name = PL["bgjoin_name"],
--				desc = PL["bgjoin_desc"],
--				type = "toggle",
--				order = 111 
--			},	
        }
    }
)

local THROTTLE_TIME = 120
 
MessageTime = {}

local function cleanText(msg, author)
	local cleanmsg = msg:gsub("...hic!",""):gsub("%d",""):gsub("%c",""):gsub("%p",""):gsub("%s",""):upper():gsub("SH","S");
	return (author and author:upper() or "") .. cleanmsg;
end

--function tradeSpamFilter(frame, event, ...)
--    local arg1, arg2 = ...
--	local block = false;
--	local msg = cleanText(arg1, arg2);
--	
--	if arg2 == UnitName("player") then 
--		return false, ...
--	end
--
--	if MessageTime[msg] then
--		if difftime(time(), MessageTime[msg]) <= THROTTLE_TIME then
--			block = true;
--		else 
--		    MessageTime[msg] = nil 
--		end
--	else
--    	MessageTime[msg] = time();
--	end
--
--	if block then
--	    print("Filtered: "..msg)
--		return true
--	end
--
--    
--
--	return false, ...
--end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
function module:OnModuleEnable()
    self.throttleFrame = self.throttleFrame or CreateFrame("FRAME");
    
    self.throttle = THROTTLE_TIME
    
    self.throttleFrame:SetScript("OnUpdate", 
        function(frame, elapsed) 
            self.throttle = self.throttle - elapsed
            if frame:IsShown() and self.throttle < 0 then
                self.throttle = THROTTLE_TIME
                self:PruneMessages()
            end
        end)
    
--    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", tradeSpamFilter)
--    ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", tradeSpamFilter)
       
	Prat.RegisterChatEvent(self, "Prat_FrameMessage")
end

-- things to do when the module is disabled
function module:OnModuleDisable()
--    ChatFrame_RemoveMessageEventFilter("CHAT_MSG_CHANNEL", tradeSpamFilter)
--    ChatFrame_RemoveMessageEventFilter("CHAT_MSG_YELL", tradeSpamFilter)


	Prat.UnregisterAllChatEvents(self)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--



function module:PruneMessages()
    for k,v in pairs(MessageTime) do
        if difftime(time(), v) > THROTTLE_TIME then
            MessageTime[k] = nil
        end
    end
end




function module:Prat_FrameMessage(arg, message, frame, event)
    local newEvent = true
    if Prat.EVENT_ID and 
       Prat.EVENT_ID == self.lastevent and 
       self.lasteventtype == event then 
       newEvent = false
    end
     
    if self.db.profile.tradespam then
        if event == "CHAT_MSG_CHANNEL" or event == "CHAT_MSG_YELL" then          
        	local msg = cleanText(message.ORG.MESSAGE, message.ORG.PLAYER)

        	if message.ORG.PLAYER ~= UnitName("player") then     
            	if newEvent and MessageTime[msg] then
            		if difftime(time(), MessageTime[msg]) <= THROTTLE_TIME then            		  
            			message.DONOTPROCESS = true
            		else 
            		    MessageTime[msg] = nil 
            		end
            	else
      	            self.lasteventtype = event
                    self.lastevent = Prat.EVENT_ID
                	MessageTime[msg] = time();
            	end    
            end
        end
    end

    if self.db.profile.afkdnd then
        if event == "CHAT_MSG_AFK" or event == "CHAT_MSG_DND" then
        	local msg = cleanText(message.ORG.MESSAGE, message.ORG.PLAYER)

            if newEvent and MessageTime[msg] then
                if difftime(time(), MessageTime[msg]) <= THROTTLE_TIME then
                    message.DONOTPROCESS = true
                else
                    MessageTime[msg] = nil
                end
            else
                self.lasteventtype = event
                self.lastevent = Prat.EVENT_ID
                MessageTime[msg] = time();
            end
        end
    end



    if self.db.profile.notices then 
    	if  event == "CHAT_MSG_CHANNEL_NOTICE_USER" or event == "CHAT_MSG_CHANNEL_NOTICE"  then
    		message.DONOTPROCESS = true
    	end
    end
     
end

  return
end ) -- Prat:AddModuleToLoad