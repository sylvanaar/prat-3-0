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
Name: PratSounds
Revision: $Revision: 80553 $
Author(s): Sylvanaar - Copy/Pasted from ChatSounds hy TotalPackage
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Filtering
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: A port of the Chatsounds addon to the Prat framework. (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Sounds")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["Sounds"] = true,
	["A module to play sounds on certain chat messages."] = true,
	["Add a custom channel"] = true,
	["Play a sound for a certain channel name (can be a substring)"] = true,
	["Remove a custom channel"] = true,
	["Reset settings"] = true,
	["Restore default settings and resets custom channel list"] = true,
	["Incoming Sounds"] = true,
	["Sound selection for incoming chat messages"] = true,
	["party_name"] = "Party",
	["party_desc"] = "Sound for %s party messages",
	["raid_name"] = "Raid",
	["raid_desc"] = "Sound for %s raid or battleground group/leader messages",
	["guild_name"] = "Guild",
	["guild_desc"] = "Sound for %s guild messages",
	["officer_name"] = "Officer",
	["officer_desc"] = "Sound for %s officer or custom channel messages",
	["whisper_name"] = "Whisper",
	["whisper_desc"] = "Sound for %s whisper messages",
	["incoming"] = true,
	["outgoing"] = true,
	["Outgoing Sounds"] = true,
	["Sound selection for outgoing (from you) chat messages"] = true,
	["Custom Channels"] = true,
})

L:AddLocale("ruRU", {
	["Sounds"] = true,
	["A module to play sounds on certain chat messages."] = "Модуль проигрывает зуки для определённых сообщений в чате.",
	["Add a custom channel"] = "Добавить свой канал",
	["Play a sound for a certain channel name (can be a substring)"] = "Проигрывает зук для определённого канала чата (can be a substring)",
	["Remove a custom channel"] = "Удалить свой чат",
	["Reset settings"] = "Сброс настроек",
	["Restore default settings and resets custom channel list"] = "Восстановление стандартных настроек и сброс списка своих каналов чата",
	["Incoming Sounds"] = "Звук входящих",
	["Sound selection for incoming chat messages"] = "Выбор звука для входящих сообщений в чате",
	["party_name"] = "Группа",
	["party_desc"] = "Звук %s для сообщений группы",
	["raid_name"] = "Рейд",
	["raid_desc"] = "Звук %s для сообщений группы/лидера рейда или поля сражений",
	["guild_name"] = "Гильдия",
	["guild_desc"] = "Звук %s для сообщений гильдии",
	["officer_name"] = "Офицеры",
	["officer_desc"] = "Звук %s для сообщений офицеров или личного канала",
	["whisper_name"] = "Шепот",
	["whisper_desc"] = "Звук  %s для личных сообщений",
	["incoming"] = "Входящие",
	["outgoing"] = "Исходящие",
	["Outgoing Sounds"] = "Звуки исходящего",
	["Sound selection for outgoing (from you) chat messages"] = "Выбор звука для исходящих (от вас) сообщений в чате",
	["Custom Channels"] = "Личные каналы",
})

----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80553 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["Sounds"] = "声音",
--	["A module to play sounds on certain chat messages."] = "特定聊天消息出现时播放声音提醒.",
--	["Add a custom channel"] = "增加自定义频道",
--	["Play a sound for a certain channel name (can be a substring)"] = "频道有消息时播放音效 (可以是子字符串)。",
--	["Remove a custom channel"] = "移除自定义频道",
--	["Reset settings"] = "重设",
--	["Restore default settings and resets custom channel list"] = "重设回默认值和重设自定义频道列表。",
--	["Incoming Sounds"] = "音效 (入)",
--	["Sound selection for incoming chat messages"] = "聊天消息 (入) 的音效。",
--	["Party"] = "队伍",
--	["Sound for incoming party messages"] = "队伍频道 (入) 的音效。",
--	["Raid"] = "团队",
--	["Sound for incoming raid or battleground group/leader messages"] = "团队/团队队长/战场/战场指挥频道 (入) 的音效。",
--	["Guild"] = "公会",
--	["Sound for incoming guild messages"] = "公会频道 (入) 的音效。",
--	["Officer/Custom"] = "公会官员/自定义",
--	["Sound for incoming officer or custom channel messages"] = "公会官员/自定义频道 (入) 的音效。",
--	["Whisper"] = "悄悄话",
--	["Sound for incoming whisper messages"] = "悄悄话 (入) 的音效。",
--	["Outgoing Sounds"] = "音效 (出)",
--	["Sound selection for outgoing (from you) chat messages"] = "聊天消息 (出) 的音效。",
--	["Sound for outgoing party messages"] = "队伍频道 (出) 的音效。",
--	["Sound for outgoing raid or battleground group/leader messages"] = "团队/团队队长/战场/战场指挥频道 (出) 的音效。",
--	["Sound for outgoing guild messages"] = "公会频道 (出) 的音效。",
--	["Sound for outgoing officer or custom channel messages"] = "公会官员/自定义频道 (出) 的音效。",
--	["Sound for outgoing whisper messages"] = "悄悄话 (出) 的音效。",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["Sounds"] = "音效",
--	["A module to play sounds on certain chat messages."] = "在特定聊天訊息出現時播放音效。",
--	["Add a custom channel"] = "增加自訂頻道",
--	["Play a sound for a certain channel name (can be a substring)"] = "頻道有訊息時播放音效 (可以是子字串)。",
--	["Remove a custom channel"] = "移除自訂頻道",
--	["Reset settings"] = "重設",
--	["Restore default settings and resets custom channel list"] = "重設回預設值和重設自訂頻道列表。",
--	["Incoming Sounds"] = "音效 (入)",
--	["Sound selection for incoming chat messages"] = "聊天訊息 (入) 的音效。",
--	["Party"] = "隊伍",
--	["Sound for incoming party messages"] = "隊伍頻道 (入) 的音效。",
--	["Raid"] = "團隊",
--	["Sound for incoming raid or battleground group/leader messages"] = "團隊/團隊隊長/戰場/戰場領導者頻道 (入) 的音效。",
--	["Guild"] = "公會",
--	["Sound for incoming guild messages"] = "公會頻道 (入) 的音效。",
--	["Officer/Custom"] = "公會理事/自訂",
--	["Sound for incoming officer or custom channel messages"] = "公會理事/自訂頻道 (入) 的音效。",
--	["Whisper"] = "悄悄話",
--	["Sound for incoming whisper messages"] = "悄悄話 (入) 的音效。",
--	["Outgoing Sounds"] = "音效 (出)",
--	["Sound selection for outgoing (from you) chat messages"] = "聊天訊息 (出) 的音效。",
--	["Sound for outgoing party messages"] = "隊伍頻道 (出) 的音效。",
--	["Sound for outgoing raid or battleground group/leader messages"] = "團隊/團隊隊長/戰場/戰場領導者頻道 (出) 的音效。",
--	["Sound for outgoing guild messages"] = "公會頻道 (出) 的音效。",
--	["Sound for outgoing officer or custom channel messages"] = "公會理事/自訂頻道 (出) 的音效。",
--	["Sound for outgoing whisper messages"] = "悄悄話 (出) 的音效。",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Sounds"] = "Sounds",
--	["A module to play sounds on certain chat messages."] = "Ein Modul um Sounds jeh nach Chatnachrichtenart abzuspielen.",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["Sounds"] = "효과음",
--	["A module to play sounds on certain chat messages."] = "특정 대화 메세지에 효과음을 재생하기 위한 모듈입니다.",
--	["Add a custom channel"] = "사용자 채널 추가",
--	["Play a sound for a certain channel name (can be a substring)"] = "특정 채널명에 대한 효과음을 재생합니다.(단축 문자열 가능)",
--	["Remove a custom channel"] = "사용자 채널 제거",
--	["Reset settings"] = "설정 초기화",
--	["Restore default settings and resets custom channel list"] = "사용자 채널 목록을 초기화 하고 기본 설정으로 복원합니다.",
--	["Incoming Sounds"] = "받은 메세지 효과음",
--	["Sound selection for incoming chat messages"] = "받은 대화 메세지에 대한 효과음 선택",
--	["Sound selection for outgoing (from you) chat messages"] = "보낸 대화 메세지에 대한 효과음 선택",
--	["Party"] = "파티",
--	["Sound for incoming party messages"] = "받은 파티 메세지에 대한 효과음",
--	["Raid"] = "공격대",
--	["Sound for incoming raid or battleground group/leader messages"] = "받은 공격대 혹은 전장 파티/지휘관 메세지에 대한 효과음",
--	["Guild"] = "길드",
--	["Sound for incoming guild messages"] = "받은 길드 메세지에 대한 효과음",
--	["Officer/Custom"] = "오피서/사용자",
--	["Sound for incoming officer or custom channel messages"] = "받은 오피서 혹은 사용자 채널 메세지에 대한 효과음",
--	["Whisper"] = "귓속말",
--	["Sound for incoming whisper messages"] = "받은 귓속말 메세지에 대한 효과음",
--	["Outgoing Sounds"] = "보낸 메세지 효과음",
--	["Sound for outgoing party messages"] = "보낸 파티 메세지에 대한 효과음",
--	["Sound for outgoing raid or battleground group/leader messages"] = "보낸 공격대 혹은 전장 파티/지휘관 메세지에 대한 효과음",
--	["Sound for outgoing guild messages"] = "보낸 길드 메세지에 대한 효과음",
--	["Sound for outgoing officer or custom channel messages"] = "보낸 오피서 혹은 사용자 채널 메세지에 대한 효과음",
--	["Sound for outgoing whisper messages"] = "보낸 귓속말 메세지에 대한 효과음",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["Sounds"] = "Sonidos",
--	["A module to play sounds on certain chat messages."] = "Un módulo que permite reproducir sonidos para ciertos mensajes de chat.",
--} end)



-- create prat module
local module = Prat:NewModule(PRAT_MODULE)


Prat:SetModuleDefaults(module.name, {
	profile = {
		on	= false,
		["incoming"] = {
			["GUILD"] = "Kachink",
			["OFFICER"] = "Link",
			["PARTY"] = "Text1",
			["RAID"] = "Text2",
			["WHISPER"] = "Heart",
		},
		["outgoing"] = {
			["GUILD"] = "None",
			["OFFICER"] = "None",
			["PARTY"] = "None",
			["RAID"] = "None",
			["WHISPER"] = "None",
		},
		["customlist"] = GetLocale() == "zhTW" and {
		}
		or {
			"healer",
			"pall",
			"priest",
			"warrior",
			"mage",
			"hunter",
			"druid",
			"lock",
			"rogue",
	   },
	}
})



local media, SOUND

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
-- things to do when the module is enabled
function module:OnModuleEnable()
	media = Prat.Media    
	SOUND = media.MediaType.SOUND
	self:BuildSoundList()
	
	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)

	media.RegisterCallback(self, "LibSharedMedia_Registered", "SharedMedia_Registered")
	media.RegisterCallback(self, "LibSharedMedia_SetGlobal", "SharedMedia_Registered")
end

-- things to do when the module is disabled
function module:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
	media.UnregisterAllCallbacks(self)
end

local soundslist = {}


function module:BuildSoundList()
	if not media then return end

    for i,v in ipairs(soundslist) do
        soundslist[i] = nil
    end
    
    for k,v in pairs(media.MediaTable[SOUND]) do
        soundslist[k]=k
    end
end

function module:SharedMedia_Registered(mediatype, name)
    if mediatype == SOUND then
        self:BuildSoundList()
    end
end

do
	local optionGroup_mt = {
			type = "select",
			get = "GetChanOptValue",
			set = "SetChanOptValue",
			dialogControl = 'LSM30_Sound',
			values = AceGUIWidgetLSMlists.sound,
		}

	local optionGroup_mt = { __index = optionGroup_mt }
	
	local function newOptionGroup(text, incoming)
		local t= setmetatable({}, optionGroup_mt)
		t.name = L[text.."_name"]
		t.desc = (L[text.."_desc"]):format(incoming and L["incoming"] or L["outgoing"])
		return t
	end
	
	Prat:SetModuleOptions(module.name, {
	        name = L["Sounds"],
	        desc = L["A module to play sounds on certain chat messages."],
	        type = "group",
			childGroups  = "tab",
			args = {
				cchan = {
					type = "group",
					name = L["Custom Channels"],
					desc = L["Custom Channels"],
					args = {
						custom = {
							type = "input",
							name = L["Add a custom channel"],
							desc = L["Play a sound for a certain channel name (can be a substring)"],
							set = function(i,v) tinsert(module.db.profile.customlist, v) end,
							get = function() return end,
							usage = "",
							order = 3,
						},
						
			            removenick = {
			                name = L["Remove a custom channel"],
			                desc = L["Remove a custom channel"],
			                type = "select",
			                order = 4,
							get = function() return "" end,
							values =function() return  module.db.profile.customlist end,
			                disabled = function() return #module.db.profile.customlist == 0 end,
							set = function(info,v) tremove(module.db.profile.customlist, v) end,
			            },			
						reset = {
							type = "execute",
							name = L["Reset settings"],
							desc = L["Restore default settings and resets custom channel list"],
							func = function() module.db.profile.customlist = { } end,
							order = 10,
						},
					}
				},
				incoming = {
					type = "group",
					name = L["Incoming Sounds"],
					desc = L["Sound selection for incoming chat messages"],
					order = 20,
					args = {
						party = newOptionGroup("party", true),
						raid = newOptionGroup("raid", true),
						guild = newOptionGroup("guild", true),
						officer = newOptionGroup("officer", true),
						whisper = newOptionGroup("whisper", true),
					},
				},
				outgoing = {
					type = "group",
					name = L["Outgoing Sounds"],
					desc = L["Sound selection for outgoing (from you) chat messages"],
					order = 30,
					args = {
						party = newOptionGroup("party"),
						raid = newOptionGroup("raid"),
						guild = newOptionGroup("guild"),
						officer = newOptionGroup("officer"),
						whisper = newOptionGroup("whisper"),
					},
				},
			},
		}
	)	
end

function module:GetChanOptValue(info, ...)
	return self.db.profile[info[#info-1]][info[#info]:upper()]
end

function module:SetChanOptValue(info, val, ...)
	Prat:PlaySound(val)
	self.db.profile[info[#info-1]][info[#info]:upper()] = val
end






--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    if Prat.EVENT_ID and Prat.EVENT_ID == self.lastevent and self.lasteventtype == event then return end
    
	local msgtype = string.sub(event, 10)
	local plr, svr = strsplit("-", (message.PLAYERLINK or ""))
	local outgoing = (plr == UnitName("player")) and true or false
	local sndprof = outgoing and self.db.profile.outgoing or self.db.profile.incoming
    
    if msgtype == "CHANNEL" then 
	    local chan = string.lower(message.ORG.CHANNEL)
		for _,value in pairs(self.db.profile.customlist) do
			if strlen(value) > 0 and string.find(chan, string.lower(value)) then
                self:PlaySound(sndprof["OFFICER"], event)
			end
		end
    else 
		if msgtype == "WHISPER_INFORM" then
		    msgtype = "WHISPER"
		    sndprof = self.db.profile.outgoing
		elseif msgtype == "WHISPER" then
		    sndprof = self.db.profile.incoming
		end
		
		if msgtype == "RAID_LEADER" or msgtype == "BATTLEGROUND" or msgtype == "BATTLEGROUND_LEADER" then
			msgtype = "RAID"
		end
 
		self:PlaySound(sndprof[msgtype], event)
    end
end


function module:PlaySound(sound, event)
    self.lasteventtype = event
    self.lastevent = Prat.EVENT_ID
    Prat:PlaySound(sound)
end

  return
end ) -- Prat:AddModuleToLoad