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
Name: PratPopupMessage
Revision: $Revision: 80460 $
Author(s): Sylvanaar
Inspired by: CleanChat
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#PopupMessage
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that displays chat with your name in a pop up window
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("PopupMessage")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["PopupMessage"] = true,
    ["Shows messages with your name in a popup."] = true,
    ["Set Separately"] = true,
    ["Toggle setting options separately for each chat window."] = true,
    ["show_name"] = "Show Popups",
    ["show_desc"] = "Show Popups for each window.",
    ["Show Popups"] = true,
    ["Show Popups for each window."] = true,
    ["show_perframename"] = "Show ChatFrame%d Popups",
    ["show_perframedesc"] = "Toggles showing popups on and off.",
    ["showall_name"] = "Show All Popups",
    ["showall_desc"] = "Show Popups for all chat windows.",
    ["Show All Popups"] = true,
    ["Show Popups for all chat windows."] = true,
    ["Add Nickname"] = true,
    ["Adds an alternate name to show in popups."] = true,
    ["Remove Nickname"] = true,
    ["Removes an alternate name to show in popups."] = true,
    ["Clear Nickname"] = true,
    ["Clears alternate name to show in popups."] = true,
    ["framealpha_name"] = "Popup Frame Alpha",
    ["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
    ["Popup"] = true, 
    ["Shows messages in a popup window."] = true,
-- 	["Use SCT Message"] = true,
--	["Show the text as an SCT message instead of in its own frame"] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="PopupMessage")@
)
--@end-non-debug@]===]



--

--

--
----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80460 $
--]]
--

--

--

--


local EVENTS_EMOTES = {
  ["CHAT_MSG_BG_SYSTEM_ALLIANCE"] = true,
  ["CHAT_MSG_BG_SYSTEM_HORDE"] = true,
  ["CHAT_MSG_BG_SYSTEM_NEUTRAL"] = true,
  ["CHAT_MSG_EMOTE"] = true,
  ["CHAT_MSG_TEXT_EMOTE"] = true,
  ["CHAT_MSG_MONSTER_EMOTE"] = true,
  ["CHAT_MSG_MONSTER_SAY"] = true,
  ["CHAT_MSG_MONSTER_WHISPER"] = true,
  ["CHAT_MSG_MONSTER_YELL"] = true,
  ["CHAT_MSG_RAID_BOSS_EMOTE"] = true
};

local EVENTS_IGNORE = {
 ["CHAT_MSG_CHANNEL_NOTICE_USER"] = true,
 ["CHAT_MSG_SYSTEM"] = true,
}

-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = false,
	    separate = true,
	    show = { ChatFrame1 = true },
	    framealpha = 1.0,
	    nickname = {},
		sinkoptions = { ["sink20OutputSink"] = "Popup" },
	}
} )

local pluginOptions =  { sink = {} }

Prat:SetModuleOptions(module, {
    name = L["PopupMessage"],
    desc = L["Shows messages with your name in a popup."],
    type = "group",
	plugins = pluginOptions,
    args = {
		helpheader = {
			name = "Settings",
			type = "header",
			order = 105,
		},
        show = {
            name = L["Show Popups"],
            desc = L["Show Popups for each window."],
	        type = "multiselect",
            order = 110,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
        },
        addnick = {
            name = L["Add Nickname"],
            desc = L["Adds an alternate name to show in popups."],
            type = "input",
            order = 140,
            usage = "<string>",
            get = false,
			set = function(info, name) info.handler:AddNickname(name) end
        },
        removenick = {
            name = L["Remove Nickname"],
            desc = L["Removes an alternate name to show in popups."],
            type = "select",
            order = 150,
			get = function(info) return "" end,
			values = function(info) return info.handler.db.profile.nickname end,
            disabled = function(info) return #info.handler.db.profile.nickname == 0 end,
			set = function(info, value) info.handler:RemoveNickname(value) end
        },
        clearnick = {
            name = L["Clear Nickname"],
            desc = L["Clears alternate name to show in popups."],
			type = "execute",
            order = 160,
            disabled = function(info) return (#info.handler.db.profile.nickname == 0) end,
			func = "ClearNickname",
        },
    },
})

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
Prat:SetModuleInit(module, 
	function(self)
    	self:RegisterSink(
    	    L["Popup"], 
    	    L["PopupMessage"], 
    	    L["Shows messages in a popup window."],
    	    "Popup"
    	)		
		self:SetSinkStorage(self.db.profile.sinkoptions)
		
		pluginOptions.sink["output"] = self:GetSinkAce3OptionsDataTable()
		pluginOptions.sink["output"].inline = true
		
		self.db.profile.show = self.db.profile.show or {}
	end
)

function module:OnModuleEnable()
	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)      	    

    self.nickpat = {}
	for _, v in ipairs(self.db.profile.nickname) do
        self.nickpat[v] = Prat.GetNamePattern(v)
	end

    self.playerName = Prat.GetNamePattern(UnitName("player"))
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--

-- /dump module.moduleOptions.args.output.get():find("Default")
-- /script module.moduleOptions.args.output.set("PopupMessage")
-- /dump module.db.profile
-- /script module.db.profile.sink10OutputSink = nil
function module:Popup(source, text, r,g,b, ...)   
    if UIFrameIsFlashing(Prat_PopupFrame) then  
        UIFrameFlashRemoveFrame(Prat_PopupFrame)
    end
    
	Prat_PopupFrame.fadeOut = 5;
	Prat_PopupFrame:SetAlpha(module.db.profile.framealpha or 1.0);
	Prat_PopupFrameText:SetTextColor(r,g,b)
	Prat_PopupFrameText:SetText(text);
	
	local font, _, style = ChatFrame1:GetFont()
	local _, fontsize = GameFontNormal:GetFont()
	Prat_PopupFrameText:SetFont( font, fontsize, style )   
    Prat_PopupFrameText:SetNonSpaceWrap(false)
	Prat_PopupFrame:SetWidth(math.min(math.max(64, Prat_PopupFrameText:GetStringWidth()+20), 520))
    Prat_PopupFrame:SetHeight(64)
	Prat_PopupFrame:SetBackdropBorderColor(r,g,b) 	

    Prat_PopupFrameText:ClearAllPoints()
    Prat_PopupFrameText:SetPoint("TOPLEFT", Prat_PopupFrame, "TOPLEFT", 10, 10)
    Prat_PopupFrameText:SetPoint("BOTTOMRIGHT", Prat_PopupFrame, "BOTTOMRIGHT", -10, -10)
	Prat_PopupFrameText:Show()
	
	local inTime, outTime, holdTime = 1, Prat_PopupFrame.fadeOut, 4   
	    
	local fadeInfo = {}
	local fadeInfoOut = {}
	fadeInfo.timeToFade = inTime
	fadeInfo.mode = "IN"
	fadeInfo.fadeHoldTime = holdTime
	fadeInfo.startAlpha = 0
	fadeInfo.endAlpha = module.db.profile.framealpha or 1.0

	fadeInfo.finishedFunc = UIFrameFade
	fadeInfo.finishedArg1 = Prat_PopupFrame
	fadeInfo.finishedArg2 = fadeInfoOut
	fadeInfoOut.startAlpha = module.db.profile.framealpha or 1.0
	fadeInfoOut.endAlpha = 0
	fadeInfoOut.timeToFade = outTime
	fadeInfoOut.mode = "OUT"
	fadeInfoOut.finishedFunc = function() Prat_PopupFrameText:Hide() end
	UIFrameFade(Prat_PopupFrame, fadeInfo)	    	    
end

local DEBUG 
--@debug@ 
DEBUG = true
--@end-debug@

function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    if self.pouring then return end
    if Prat.EVENT_ID and 
       Prat.EVENT_ID == self.lastevent and 
       self.lasteventtype == event then 
       return 
    end
    
	if not (EVENTS_EMOTES[event] or EVENTS_IGNORE[event]) then
		if self.db.profile.showall or self.db.profile.show[frame:GetName()] then
			if DEBUG or not (message.PLAYERLINK:match(self.playerName)) then
				self:CheckText(message.ORG.MESSAGE, message.OUTPUT, event, r, g, b)
			end
		end
	end
end

function module:AddNickname(name)
	for _, v in ipairs(self.db.profile.nickname) do
		if v:lower() == name:lower() then
			return
		end
	end
	tinsert(self.db.profile.nickname, name)

    self.nickpat[name] = Prat.GetNamePattern(name)
end

function module:RemoveNickname(idx)
    self.nickpat[self.db.profile.nickname[idx]] = nil
	tremove(self.db.profile.nickname, idx)
end

function module:ClearNickname()
    local n = self.db.profile.nickname
	while #n > 0 do
        self.nickpat[n[#n]] = nil
        n[#n] = nil
--		tremove(self.db.profile.nickname)
	end
end

local tmp_color = {}
local function safestr(s) return s or "" end
function module:CheckText(text, display_text, event, r, g, b)
--	local textL = safestr(text):lower()

    local show = false
    
    if text:match(self.playerName) then	
        show = true;
    else
    	for i, v in pairs(self.nickpat) do
            if v:len() > 0 and text:match(v) then
                show = true
            end
    	end
	end
	
	if show then 
        self.lasteventtype = event
        self.lastevent = Prat.EVENT_ID
        self.pouring = true
		self:Pour(display_text or text, r,g,b)
		Prat:PlaySound("popup");
        self.pouring = nil
	end	
end




  return
end ) -- Prat:AddModuleToLoad