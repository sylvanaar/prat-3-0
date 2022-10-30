---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
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

  local PRAT_MODULE = Prat:RequestModuleName("ChannelSticky")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0", "AceTimer-3.0", "AceHook-3.0")

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["ChannelSticky"] = true,
    ["Chat channel sticky options."] = true,
    ["ChatType"] = true,
    ["Per chat type options."] = true,
    ["Channel"] = true,
    ["Sticky %s"] = true,
    ["Toggles sticky on and off for %s."] = true,
    ["smartgroup_name"] = "Smart Groups",
    ["smartgroup_desc"] = "Adds a /smart or /smrt command which automatically picks the correct type of chat, RAID, PARTY, or INSTANCE_CHAT",
    ["Sticky Per Chat Frame"] = true,
    ["Toggle remembering the chat type last used per chat frame."] = true,
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["ChannelSticky"] = {
		["Channel"] = true,
		["ChannelSticky"] = true,
		["Chat channel sticky options."] = true,
		["ChatType"] = true,
		["Per chat type options."] = true,
		["smartgroup_desc"] = "Adds a /smart or /smrt command which automatically picks the correct type of chat, RAID, PARTY, or INSTANCE_CHAT",
		["smartgroup_name"] = "Smart Groups",
		["Sticky %s"] = true,
		["Sticky Per Chat Frame"] = true,
		["Toggle remembering the chat type last used per chat frame."] = true,
		["Toggles sticky on and off for %s."] = true,
	}
}


PL:AddLocale(PRAT_MODULE, "enUS",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "Canal",
		--[[Translation missing --]]
		["ChannelSticky"] = "ChannelSticky",
		--[[Translation missing --]]
		["Chat channel sticky options."] = "Chat channel sticky options.",
		--[[Translation missing --]]
		["ChatType"] = "ChatType",
		--[[Translation missing --]]
		["Per chat type options."] = "Per chat type options.",
		["smartgroup_desc"] = "Ajouter une commande /gr qui sélectionne automatiquement le bon type de chat : raid, groupe, champ de bataille",
		["smartgroup_name"] = "Groupes intelligents",
		--[[Translation missing --]]
		["Sticky %s"] = "Sticky %s",
		--[[Translation missing --]]
		["Sticky Per Chat Frame"] = "Sticky Per Chat Frame",
		--[[Translation missing --]]
		["Toggle remembering the chat type last used per chat frame."] = "Toggle remembering the chat type last used per chat frame.",
		--[[Translation missing --]]
		["Toggles sticky on and off for %s."] = "Toggles sticky on and off for %s.",
	}
}


PL:AddLocale(PRAT_MODULE, "frFR",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "Kanal",
		["ChannelSticky"] = "Kanal Sticky",
		["Chat channel sticky options."] = "Sticky-Optionen für Chat-Kanäle.",
		["ChatType"] = "Chat-Typ",
		["Per chat type options."] = "Optionen per Chat-Typ.",
		["smartgroup_desc"] = "Fügt einen Befehl /gr hinzu, der automatisch den richtigen Chat-Typ aufnimmt - RAID, PARTY, oder BATTLEGROUND",
		["smartgroup_name"] = "Intelligente Gruppen",
		["Sticky %s"] = true,
		["Sticky Per Chat Frame"] = "Sticky per Chat-Rahmen",
		["Toggle remembering the chat type last used per chat frame."] = "Das Merken des Chat-Typs, der zuletzt im Chatfenster aktiviert war, umschalten.",
		["Toggles sticky on and off for %s."] = "Schaltet den Sticky für %s ein und aus.",
	}
}


PL:AddLocale(PRAT_MODULE, "deDE",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "채널",
		["ChannelSticky"] = "채널 고정 [ChannelSticky]",
		["Chat channel sticky options."] = "대화 채널 고정 옵션입니다.",
		["ChatType"] = "대화 형식",
		["Per chat type options."] = "대화 형식 별 옵션",
		["smartgroup_desc"] = "공격대, 파티 또는 인스턴스 대화 중 자동으로 유효한 대화 유형을 선택하는 /smart와 /smrt 명령어를 추가합니다",
		["smartgroup_name"] = "스마트 그룹",
		["Sticky %s"] = "%s 고정",
		["Sticky Per Chat Frame"] = "대화창 별 고정",
		["Toggle remembering the chat type last used per chat frame."] = "대화창 별로 마지막으로 사용한 대화 형식 기억 기능을 켜거나 끕니다.",
		["Toggles sticky on and off for %s."] = "%s의 입력 고정을 켜거나 끕니다.",
	}
}


PL:AddLocale(PRAT_MODULE, "koKR",L)



L = {
	["ChannelSticky"] = {
		--[[Translation missing --]]
		["Channel"] = "Channel",
		--[[Translation missing --]]
		["ChannelSticky"] = "ChannelSticky",
		--[[Translation missing --]]
		["Chat channel sticky options."] = "Chat channel sticky options.",
		--[[Translation missing --]]
		["ChatType"] = "ChatType",
		--[[Translation missing --]]
		["Per chat type options."] = "Per chat type options.",
		--[[Translation missing --]]
		["smartgroup_desc"] = "Adds a /smart or /smrt command which automatically picks the correct type of chat, RAID, PARTY, or INSTANCE_CHAT",
		--[[Translation missing --]]
		["smartgroup_name"] = "Smart Groups",
		--[[Translation missing --]]
		["Sticky %s"] = "Sticky %s",
		--[[Translation missing --]]
		["Sticky Per Chat Frame"] = "Sticky Per Chat Frame",
		--[[Translation missing --]]
		["Toggle remembering the chat type last used per chat frame."] = "Toggle remembering the chat type last used per chat frame.",
		--[[Translation missing --]]
		["Toggles sticky on and off for %s."] = "Toggles sticky on and off for %s.",
	}
}


PL:AddLocale(PRAT_MODULE, "esMX",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "Канал",
		["ChannelSticky"] = "Совмещение каналов",
		["Chat channel sticky options."] = "Настройки прилипания каналов чата.",
		["ChatType"] = "Тип чата",
		["Per chat type options."] = "Настройки по типу чата.",
		["smartgroup_desc"] = "Добавляет команду /gr , автоматически выбирающую корректный тип чата, РЕЙД, ГРУППА, или ПОЛЕ БОЯ",
		["smartgroup_name"] = "Быстрая сортировка",
		["Sticky %s"] = "Прилепить к %s",
		["Sticky Per Chat Frame"] = "Прилипать к окнам чата",
		["Toggle remembering the chat type last used per chat frame."] = "Вкл/Выкл запоминание тип чата при последнем использовании чата.",
		["Toggles sticky on and off for %s."] = "Вкл/Выкл прилипание для %s.",
	}
}


PL:AddLocale(PRAT_MODULE, "ruRU",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "频道",
		["ChannelSticky"] = "频道粘连",
		["Chat channel sticky options."] = "聊天频道粘连选项",
		["ChatType"] = "聊天分类",
		["Per chat type options."] = "每个聊天分类选项",
		["smartgroup_desc"] = "添加一个/gr命令用来自动选择正确的聊天分类,比如团队,小队或战场",
		["smartgroup_name"] = "智能分组",
		["Sticky %s"] = "粘连 %s",
		["Sticky Per Chat Frame"] = "粘连每个聊天框",
		["Toggle remembering the chat type last used per chat frame."] = "记住每个聊天框上一次使用的聊天分类",
		["Toggles sticky on and off for %s."] = "切换%s的粘连开关",
	}
}


PL:AddLocale(PRAT_MODULE, "zhCN",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "Canal",
		["ChannelSticky"] = "CanalAdhesivo",
		["Chat channel sticky options."] = "Opciones de canal adhesivo de chat.",
		["ChatType"] = "TipoChat",
		["Per chat type options."] = "Opciones por tipo de chat.",
		["smartgroup_desc"] = "Agrega un comando /gr que escoge automáticamente el tipo correcto de chat, BANDA, GRUPO, o CAMPO DE BATALLA",
		["smartgroup_name"] = "Grupos Inteligentes",
		["Sticky %s"] = "Adhesivo %s",
		["Sticky Per Chat Frame"] = "Adhesivo Por Marco de Chat",
		["Toggle remembering the chat type last used per chat frame."] = "Alternar recordar el último tipo de chat utilizado por el marco de chat.",
		["Toggles sticky on and off for %s."] = "Alterna activar adhesivo para %s.",
	}
}


PL:AddLocale(PRAT_MODULE, "esES",L)



L = {
	["ChannelSticky"] = {
		["Channel"] = "頻道",
		["ChannelSticky"] = "固定頻道",
		["Chat channel sticky options."] = "聊天頻道固定選項",
		["ChatType"] = "聊天類型",
		["Per chat type options."] = "每聊天類型選項。",
		--[[Translation missing --]]
		["smartgroup_desc"] = "Adds a /smart or /smrt command which automatically picks the correct type of chat, RAID, PARTY, or INSTANCE_CHAT",
		["smartgroup_name"] = "智慧化群組",
		["Sticky %s"] = "固定 %s",
		["Sticky Per Chat Frame"] = "個別聊天視窗固定",
		--[[Translation missing --]]
		["Toggle remembering the chat type last used per chat frame."] = "Toggle remembering the chat type last used per chat frame.",
		--[[Translation missing --]]
		["Toggles sticky on and off for %s."] = "Toggles sticky on and off for %s.",
	}
}


PL:AddLocale(PRAT_MODULE, "zhTW",L)


end
--@end-non-debug@


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
    "INSTANCE_CHAT",
    "CHANNEL",
    "EMOTE",
    "BN_WHISPER",
    "BN_CONVERSATION",
  }


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
      instance_chat = true,
      channel = true,
      emote = true,
      perframe = false,
      smartgroup = true,
      bn_whisper = true,
      bn_conversation = true,
    }
  })

  local chatTypePlugins = { ctype = {} }

  Prat:SetModuleOptions(module, {
    name = PL["ChannelSticky"],
    desc = PL["Chat channel sticky options."],
    type = "group",
    plugins = chatTypePlugins,
    args = {
      smartgroup = {
        name = PL["smartgroup_name"],
        desc = PL["smartgroup_desc"],
        type = "toggle",
      }
    }
  })

  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  function module:OnModuleEnable()
    self:BuildChannelList()

    self:RegisterEvent("UPDATE_CHAT_COLOR")

    local prof = self.db.profile

    -- sticky each channel based on db settings
    self:Stickum("SAY", prof.say)
    self:Stickum("WHISPER", prof.whisper)
    self:Stickum("YELL", prof.yell)
    self:Stickum("PARTY", prof.party)
    self:Stickum("GUILD", prof.guild)
    self:Stickum("OFFICER", prof.officer)
    self:Stickum("RAID", prof.raid)
    self:Stickum("RAID_WARNING", prof.raid_warning)
    self:Stickum("INSTANCE_CHAT", prof.instance_chat)
    self:Stickum("CHANNEL", prof.channel)
    self:Stickum("EMOTE", prof.emote)

    self:Stickum("BN_WHISPER", prof.bn_whisper)
    self:Stickum("BN_CONVERSATION", prof.bn_conversation)



    if prof.smartgroup then
      self:RegisterSmartGroup(true)
    end
  end

  function module:OnModuleDisable()
    -- dont sticky no mo!
    self:Stickum("SAY", false)
    self:Stickum("WHISPER", false)
    self:Stickum("YELL", false)
    self:Stickum("PARTY", false)
    self:Stickum("GUILD", false)
    self:Stickum("OFFICER", false)
    self:Stickum("RAID", false)
    self:Stickum("RAID_WARNING", false)
    self:Stickum("INSTANCE_CHAT", false)
    self:Stickum("CHANNEL", false)
    self:Stickum("EMOTE", false)
    -- unregister events
    self:UnregisterAllEvents()

    self:RegisterSmartGroup(false)
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  function module:GetDescription()
    return PL["Chat channel sticky options."]
  end

  -- rebuild options menu is chat colors change
  function module:UPDATE_CHAT_COLOR()
    self:ScheduleTimer("BuildChannelList", 1)
  end

  function module:ChatFrame_OpenChat(text, chatFrame)
    if (not chatFrame) then
      chatFrame = SELECTED_CHAT_FRAME
    end

    local eb = chatFrame.editBox

    if eb == nil then
      return
    end

    local chatFrameN = chatFrame:GetName()

    Prat:Print(eb:GetAttribute("chatType"))

    if eb:GetAttribute("chatType") == "WHISPER" then
      --	 NADA
    elseif eb:GetAttribute("chatType") == "SMARTGROUP" then
      eb:SetAttribute("origchatType", "SMARTGROUP");
    end
  end

  function module:Stickum(channel, stickied)
    local cti = ChatTypeInfo[channel:upper()]
    if cti then
      cti.sticky = stickied and 1 or 0
    end
  end

  --[[------------------------------------------------
      Menu Builder Functions
  ------------------------------------------------]] --

  local CLR = Prat.CLR
  local function StkyChatType(text, type) return CLR:Colorize(module:GetChatCLR(type), text) end

  function module:BuildChannelList()
    local o = chatTypePlugins["ctype"]

    for _, va in ipairs(chatList) do
      local val = va:lower()
      local chan
      if va == "INSTANCE_CHAT" then
        chan = _G["INSTANCE_CHAT"]
      elseif va ~= "CHANNEL" then
        chan = _G["CHAT_MSG_" .. va]
      else
        chan = PL["Channel"]
      end

      o[val] = o[val] or {
        type = "toggle",
      }

      o[val].name = (PL["Sticky %s"]):format(StkyChatType(chan:gsub(" ", ""), va))
      o[val].desc = (PL["Toggles sticky on and off for %s."]):format(chan)
    end
  end

  function module:OnValueChanged(info, b)
    local o = info[#info]

    if o == "smartgroup" then
      self:RegisterSmartGroup(b)
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



  function module:RegisterSmartGroup(on)
    if not self.smart_group and on then
      Prat.RegisterChatEvent(self, "Prat_OutboundChat")
      self:SecureHook("ChatEdit_SendText", function(this) if self.groupsay then this:SetAttribute("chatType", "SMARTGROUP") self.groupsay = nil end end)

      self.smart_group = true


      SLASH_SMARTGROUP1 = "/smart"
      SLASH_SMARTGROUP2 = "/smrt"
      ChatTypeInfo["SMARTGROUP"] = { r = 0.5, g = 0.9, b = 0.9, sticky = 1 }
      CHAT_SMARTGROUP_SEND = "SmartGroup:\32 "
      CHAT_SMARTGROUP_GET = "SmartGroup: %1\32 "
    else
      self:Unhook("ChatEdit_SendText")
      SLASH_SMARTGROUP1 = nil
      SLASH_SMARTGROUP2 = nil
      ChatTypeInfo["SMARTGROUP"] = nil
      CHAT_SMARTGROUP_SEND = nil
      CHAT_SMARTGROUP_GET = nil
      self.smart_group = false
      Prat.UnregisterAllChatEvents(self)
    end
  end


  function module:SmartGroupChatType()
    local _, instanceType = IsInInstance()

    if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
      if instanceType == "arena" then
        return "PARTY"
      else
        return "INSTANCE_CHAT"
      end
    elseif IsInRaid() then
      return "RAID"
    elseif IsInGroup() then
      return "PARTY"
    else return "SAY"
    end
  end

  function module:Prat_OutboundChat(arg, m)
    if m.CTYPE == "SMARTGROUP" then
      self.groupsay = true
      m.CTYPE = self:SmartGroupChatType()
    end
  end

  return
end) -- Prat:AddModuleToLoad
