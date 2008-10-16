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
Name: PratChannelSticky
Revision: $Revision: 80710 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
           Sylvanaar (sylvanaar@mindspring.com)
Inspired by: idChat2_StickyChannels by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChannelSticky
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that toggles sticky of different chat channel types on and off (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("ChannelSticky")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["ChannelSticky"] = true,
    ["Chat channel sticky options."] = true,
    ["ChatType"] = true,
    ["Per chat type options."] = true,
    ["Channel"] = true,
    ["Sticky %s"] = true,
    ["Toggles sticky on and off for %s."] = true,
    ["smartgroup_name"] = "Smart Groups",
    ["smartgroup_desc"] = "Adds a /gr command which automatically picks the correct type of chat, RAID, PARTY, or BATTLEGROUND",
    ["Sticky Per Chat Frame"] = true,
    ["Toggle remembering the chat type last used per chat frame."] = true,
})

L:AddLocale("ruRU", {
    ["ChannelSticky"] = true,
    ["Chat channel sticky options."] = true,
    ["ChatType"] = true,
    ["Per chat type options."] = true,
    ["Channel"] = true,
    ["Sticky %s"] = true,
    ["Toggles sticky on and off for %s."] = true,
    ["smartgroup_name"] = "Smart Groups",
    ["smartgroup_desc"] = "Adds a /gr command which automatically picks the correct type of chat, RAID, PARTY, or BATTLEGROUND",
    ["Sticky Per Chat Frame"] = true,
    ["Toggle remembering the chat type last used per chat frame."] = true,
})

--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["ChannelSticky"] = "Persistance des canaux",
--    ["Chat channel sticky options."] = "Options de persistance de canal.",
--    ["ChatType"] = "Type de chat",
--    ["Per chat type options."] = "Options par type de chat",
--    ["Channel"] = "Canal",
--    ["Sticky %s"] = "Persistance %s",
--    ["Toggles sticky on and off for %s."] = "Active ou d\195\169sactive la persistance pour %s.",
--    ["Sticky Per Chat Frame"] = "Persistance par fen\195\170tre de chat",
--    ["Toggle remembering the chat type last used per chat frame."] = "Active/d\195\169sactive le type de chat utilis\195\169 la dernière fois pour chaque fen\195\170tre.",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["ChannelSticky"] = "Haftende Kanäle",
--    ["Chat channel sticky options."] = "Haftende Chatkanäle Optionen",
--    ["ChatType"] = "Chat Typ",
--    ["Per chat type options."] = "Nach Chat Typ Optionen",
--    ["Channel"] = "Kanal",
--    ["Sticky %s"] = "%s Haftend",
--    ["Toggles sticky on and off for %s."] = "Schaltet haftend an und aus f\195\188r %s.",
--    ["Sticky Per Chat Frame"] = "Haftende Fenster Chat Typen",
--    ["Toggle remembering the chat type last used per chat frame."] = "Schaltet das merken des zuletzt genutzten Chat Typen pro Chatfenster ein.",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["ChannelSticky"] = "Canales Pegajosos",
--    ["Chat channel sticky options."] = "Opciones para canales pegajosos",
--    ["ChatType"] = "Tipo de Chat",
--    ["Per chat type options."] = "Opciones por tipo de chat",
--    ["Channel"] = "Canal",
--    ["Sticky %s"] = "%s Pegajoso",
--    ["Toggles sticky on and off for %s."] = "Determina si %s es pegajoso",
--    ["Sticky Per Chat Frame"] = "Tipo de Marco de Chat Pegajoso",
--    ["Toggle remembering the chat type last used per chat frame."] = "Determina si se recuerda el \195\186ltimo tipo de chat usado por marco de chat",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["ChannelSticky"] = "채널 고정",
--    ["Chat channel sticky options."] = "대화 채널 고정 설정입니다.",
--    ["ChatType"] = "대화 종류",
--    ["Per chat type options."] = "대화 종류에 따른 설정입니다.",
--    ["Channel"] = "채널",
--    ["Sticky %s"] = "%s 고정",
--    ["Toggles sticky on and off for %s."] = "%s에 대한 고정 기능을 사용합니다.",
--    ["smartgroup_name"] = "스마트 파티",
--    ["smartgroup_desc"] = "대화, 공격대, 파티 혹은 전장 대화를 자동으로 선택하는 /gr 명령어를 추가합니다.",
--    ["Sticky Per Chat Frame"] = "대화창별 고정",
--    ["Toggle remembering the chat type last used per chat frame."] = "대화창에 따라 마지막에 사용된 대화 종류를 기억합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["ChannelSticky"] = "頻道固定",
--    ["Chat channel sticky options."] = "固定聊天頻道選項。",
---- no use anymore    ["ChatType"] = true,
---- no use anymore    ["Per chat type options."] = true,
--    ["Channel"] = "頻道",
--    ["Sticky %s"] = "固定%s",
--    ["Toggles sticky on and off for %s."] = "切換是否固定%s頻道。",
--    ["smartgroup_name"] = "智慧群組",
--    ["smartgroup_desc"] = "增加一個 /gr 指令用以自動選擇正確的頻道類型: 團隊，隊伍或戰場。",
--    ["Sticky Per Chat Frame"] = "固定每個聊天視窗",
--    ["Toggle remembering the chat type last used per chat frame."] = "切換記憶每個聊天視窗最後的頻道類型。",
--} end)
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["ChannelSticky"] = "固定频道",
--    ["Chat channel sticky options."] = "固定聊天频道选项。",
--    ["ChatType"] = "聊天分类",
--    ["Per chat type options."] = "聊天类型选项。",
--    ["Channel"] = "频道",
--    ["Sticky %s"] = "固定%s",
--    ["Toggles sticky on and off for %s."] = "切换固定%s频道.",
--    ["smartgroup_name"] = "智能团队",
--    ["smartgroup_desc"] = "添加 /gr 命令, 自动获取团队/队伍/战场聊天类型",
--    ["Sticky Per Chat Frame"] = "固定每个聊天框架",
--    ["Toggle remembering the chat type last used per chat frame."] = "切换记忆每个聊天框架最后的聊天分类",
--} end)

-- chat channel list
local chatList = {
    "SAY",
    "WHISPER",
    "YELL",
    "PARTY",
    "GUILD",
    "OFFICER",
    "RAID",
    "RAID_WARNING",
    "BATTLEGROUND",
    "CHANNEL",
    "EMOTE",
}

local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")

Prat:SetModuleDefaults(module, {
	profile = {
	    on = true,
	    say = true,
	    whisper = true,
	    yell = true,
	    party = true,
	    guild = true,
	    officer = true,
	    raid = true,
	    raid_warning = true,
	    battleground = true,
	    channel = true,
	    emote = true,
	    perframe = false,
	    smartgroup = false,
	}
} )

local chatTypePlugins = { ctype = {} }

Prat:SetModuleOptions(module, {
        name = L["ChannelSticky"],
        desc = L["Chat channel sticky options."],
        type = "group",
		plugins = chatTypePlugins,
        args = {
            perframe = {
                name = L["Sticky Per Chat Frame"],
                desc = L["Toggle remembering the chat type last used per chat frame."],
                type = "toggle",
            },
			smartgroup = {
				name = L["smartgroup_name"],
				desc = L["smartgroup_desc"],
				type = "toggle",
			}
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function module:OnModuleEnable()
    self:BuildChannelList()

    self:RegisterEvent("UPDATE_CHAT_COLOR")

	local prof = self.db.profile

    -- sticky each channel based on db settings
    self:Stickum("SAY",prof.say)
    self:Stickum("WHISPER",prof.whisper)
    self:Stickum("YELL",prof.yell)
    self:Stickum("PARTY",prof.party)
    self:Stickum("GUILD",prof.guild)
    self:Stickum("OFFICER",prof.officer)
    self:Stickum("RAID",prof.raid)
    self:Stickum("RAID_WARNING",prof.raid_warning)
    self:Stickum("BATTLEGROUND",prof.battleground)
    self:Stickum("CHANNEL",prof.channel)
    self:Stickum("EMOTE",prof.emote)

    self:StickyFrameChan(prof.perframe)
    
    Prat.RegisterChatEvent(self, "Prat_OutboundChat")
    
    if prof.smartgroup then 
        self:RegisterSmartGroup()
    end
end

function module:OnModuleDisable()
    -- dont sticky no mo!
    self:Stickum("SAY",false)
    self:Stickum("WHISPER",false)
    self:Stickum("YELL",false)
    self:Stickum("PARTY",false)
    self:Stickum("GUILD",false)
    self:Stickum("OFFICER",false)
    self:Stickum("RAID",false)
    self:Stickum("RAID_WARNING",false)
    self:Stickum("BATTLEGROUND",false)
    self:Stickum("CHANNEL",false)
    self:Stickum("EMOTE",false)
    -- forget about per chat frame stickying
    self:StickyFrameChan(false)
    -- unregister events
    self:UnregisterAllEvents()

	Prat.UnregisterAllChatEvents(self)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- rebuild options menu is chat colors change
function module:UPDATE_CHAT_COLOR()
	self:ScheduleTimer("BuildChannelList", 1)
end

function module:StickyFrameChan(enabled)
    if not enabled then
        self:UnhookAll()
    else
        self.perframe = {}
        self.perframechannum = {}
        self:RawHook("ChatFrame_OpenChat", true)
        self:SecureHook("ChatEdit_OnEscapePressed")
        self:SecureHook("SendChatMessage")
        self:SecureHook("ChatEdit_OnEnterPressed")
    end
end

function module:ChatFrame_OpenChat(text, chatFrame)
    if ( not chatFrame ) then
        chatFrame = SELECTED_CHAT_FRAME
    end

	local eb = chatFrame.editBox

    if eb == nil then
        return self.hooks["ChatFrame_OpenChat"](text, chatFrame)
    end
    
    local chatFrameN = chatFrame:GetName()

	--Prat.Print(eb:GetAttribute("chatType"))

    if eb:GetAttribute("chatType") == "WHISPER" then
		-- NADA
--    elseif eb:GetAttribute("chatType") == "GROUPSAY" then
--        eb:SetAttribute("origchatType", "GROUPSAY");
    elseif self.perframe[chatFrameN] then
        eb:SetAttribute("channelTarget", self.perframechannum[chatFrameN]);
        eb:SetAttribute("chatType", self.perframe[chatFrameN]);
        eb:SetAttribute("stickyType", self.perframe[chatFrameN]);
    end

    self.hooks["ChatFrame_OpenChat"](text, chatFrame)
end

function module:SendChatMessage(msg, chatType, language, channel)
    if self.memoNext then
        self.perframe[self.memoNext] = chatType
        self.perframechannum[self.memoNext] = channel
    end
end

function module:ChatEdit_OnEscapePressed(this)
    self.memoNext = nil
end

function module:ChatEdit_OnEnterPressed(this)
	this = this or _G.this
    local chatFrameN = SELECTED_CHAT_FRAME:GetName()
    local chatType = this:GetAttribute("chatType")
    
    local channel = this:GetAttribute("channelTarget")
    self.perframe[chatFrameN] = chatType
    self.perframechannum[chatFrameN] = channel
    self.memoNext = nil
end

function module:Stickum(channel, stickied)
	ChatTypeInfo[channel:upper()].sticky = stickied and 1 or 0
end

--[[------------------------------------------------
    Menu Builder Functions
------------------------------------------------]]--

local CLR = Prat.CLR
local function StkyChatType(text, type) return CLR:Colorize(module:GetChatCLR(type), text) end

function module:BuildChannelList()
	local o = chatTypePlugins["ctype"]

    for _,va in ipairs(chatList) do
        local val = va:lower()
        local chan
        if va ~= "CHANNEL" then
            chan = TEXT(getglobal("CHAT_MSG_"..va))
        else
            chan = L["Channel"]
        end
		
        o[val] = o[val] or {
            type = "toggle",
        }

		o[val].name = (L["Sticky %s"]):format(StkyChatType(chan:gsub(" ", ""), va))
		o[val].desc = (L["Toggles sticky on and off for %s."]):format(chan)
    end
end

function module:OnValueChanged(info, b)
	local o = info[#info] 
	
	if o == "smartgroup" then
		if b then self:RegisterSmartGroup() end
	elseif o == "perframe" then 
	    self:StickyFrameChan(b)		
	else
		self:Stickum(o, b)
	end
end

function module:GetChatCLR(name)
    local info = ChatTypeInfo[name];
    if not info then
        return CLR.COLOR_NONE
    end
    return CLR:GetHexColor(info)
end



function module:RegisterSmartGroup()
    if not self.smart_group then
    	self:SecureHook("ChatEdit_SendText", function(this) if self.groupsay then this:SetAttribute("chatType", "GROUPSAY") self.groupsay=nil end end)

	    self.smart_group = true

		SlashCmdList["SLASH_GROUPSAY"] = function(text)   
                 if text:trim():len() > 0 then   
                     local _,pvp = IsInInstance()   
                     if pvp == "pvp" then   
                         SendChatMessage(text, "BATTLEGROUND")   
                     elseif GetNumRaidMembers() > 0 then   
                         SendChatMessage(text, "RAID")   
                     elseif GetNumPartyMembers() > 0 then   
                         SendChatMessage(text, "PARTY")   
                     end   
                 end   
             end

		SLASH_GROUPSAY1 = "/gr"
		SLASH_GROUPSAY2 = "/group"
		ChatTypeInfo["GROUPSAY"] = { r=0.5, g=0.9, b=0.9, sticky = 1 }
		CHAT_GROUPSAY_SEND = "SmartGroup:\32 "
		CHAT_GROUPSAY_GET = "SmartGroup: %1\32 "
    end
end


function module:SmartGroupChatType()
     local _,pvp = IsInInstance()   

     if pvp == "pvp" then   
        return "BATTLEGROUND"  
     elseif GetNumRaidMembers() > 0 then   
         return "RAID"
     elseif GetNumPartyMembers() > 0 then   
         return "PARTY"
     end 
     
    return "SAY"
end  

function module:Prat_OutboundChat(arg, m)
	if m.CTYPE == "GROUPSAY" then
		self.groupsay = true
		m.CTYPE = self:SmartGroupChatType()
	end
end

  return
end ) -- Prat:AddModuleToLoad