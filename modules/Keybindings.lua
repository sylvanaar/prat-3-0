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

  -- Get Utility Libraries
  local PRAT_MODULE = Prat:RequestModuleName("KeyBindings")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE)

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    module_desc = "Adds chat related keybindings",
    ["Prat Keybindings"] = true,
    ["Officer Channel"] = true,
    ["Guild Channel"] = true,
    ["Party Channel"] = true,
    ["Raid Channel"] = true,
    ["Raid Warning Channel"] = true,
    ["Instance Channel"] = true,
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
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --@non-debug@
 do
     local L

 
L = {
	["KeyBindings"] = {
		["Channel %d"] = true,
		["Copy Selected Chat Frame"] = true,
		["Guild Channel"] = true,
		["Instance Channel"] = true,
		["module_desc"] = "Adds chat related keybindings",
		["Next Chat Tab"] = true,
		["Officer Channel"] = true,
		["Party Channel"] = true,
		["Prat CopyChat"] = true,
		["Prat Keybindings"] = true,
		["Prat TellTarget"] = true,
		["Raid Channel"] = true,
		["Raid Warning Channel"] = true,
		["Say"] = true,
		["Smart Group Channel"] = true,
		["TellTarget"] = true,
		["Whisper"] = true,
		["Yell"] = true,
	}
}


   PL:AddLocale(PRAT_MODULE, "enUS",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "Canal %d",
		["Copy Selected Chat Frame"] = "Copier la fenêtre de chat sélectionné",
		["Guild Channel"] = "Canal de Guilde",
		["Instance Channel"] = "Canal d'Instance",
		--[[Translation missing --]]
		["module_desc"] = "Adds chat related keybindings",
		--[[Translation missing --]]
		["Next Chat Tab"] = "Next Chat Tab",
		["Officer Channel"] = "Canal Officier",
		["Party Channel"] = "Canal de Groupe",
		["Prat CopyChat"] = "Prat Copier-le-Chat",
		["Prat Keybindings"] = "Prat Association-de-touche",
		["Prat TellTarget"] = "Prat Dire-à-la-cible",
		["Raid Channel"] = "Canal Raid",
		["Raid Warning Channel"] = "Canal Avertissement",
		["Say"] = "Dire",
		--[[Translation missing --]]
		["Smart Group Channel"] = "Smart Group Channel",
		["TellTarget"] = "Chuchoter à la cible",
		["Whisper"] = "Chuchoter",
		["Yell"] = "Crier",
	}
}


   PL:AddLocale(PRAT_MODULE, "frFR",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "Kanal %d",
		["Copy Selected Chat Frame"] = "Ausgewähltes Chatfenster kopieren",
		["Guild Channel"] = "Gildenkanal",
		["Instance Channel"] = "Instanzkanal",
		["module_desc"] = "Fügt chatbezogene Tastenkombinationen hinzu",
		["Next Chat Tab"] = "Nächster Chatreiter",
		["Officer Channel"] = "Offizierskanal",
		["Party Channel"] = "Gruppenkanal",
		["Prat CopyChat"] = "Prat Chat kopieren",
		["Prat Keybindings"] = true,
		["Prat TellTarget"] = true,
		["Raid Channel"] = "Schlachtzugskanal",
		["Raid Warning Channel"] = "Schlachtzugswarnkanal",
		["Say"] = true,
		["Smart Group Channel"] = "Intelligenter Gruppenkanal",
		["TellTarget"] = true,
		["Whisper"] = true,
		["Yell"] = true,
	}
}


   PL:AddLocale(PRAT_MODULE, "deDE",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "채널 %d",
		["Copy Selected Chat Frame"] = "선택한 대화창 복사",
		["Guild Channel"] = "길드 채널",
		["Instance Channel"] = "인스턴스 채널",
		["module_desc"] = "채팅 관련 단축키 추가",
		["Next Chat Tab"] = "다음 대화 탭",
		["Officer Channel"] = "관리자 채널",
		["Party Channel"] = "파티 채널",
		["Prat CopyChat"] = "Prat 대화 복사",
		["Prat Keybindings"] = "Prat 단축키",
		["Prat TellTarget"] = "Prat 대상 대화",
		["Raid Channel"] = "공격대 채널",
		["Raid Warning Channel"] = "공격대 경보 채널",
		["Say"] = "일반 대화",
		["Smart Group Channel"] = "스마트 그룹 채널",
		["TellTarget"] = "대상 대화",
		["Whisper"] = "귓속말",
		["Yell"] = "외침",
	}
}


   PL:AddLocale(PRAT_MODULE, "koKR",L)


 
L = {
	["KeyBindings"] = {
		--[[Translation missing --]]
		["Channel %d"] = "Channel %d",
		--[[Translation missing --]]
		["Copy Selected Chat Frame"] = "Copy Selected Chat Frame",
		--[[Translation missing --]]
		["Guild Channel"] = "Guild Channel",
		--[[Translation missing --]]
		["Instance Channel"] = "Instance Channel",
		--[[Translation missing --]]
		["module_desc"] = "Adds chat related keybindings",
		--[[Translation missing --]]
		["Next Chat Tab"] = "Next Chat Tab",
		--[[Translation missing --]]
		["Officer Channel"] = "Officer Channel",
		--[[Translation missing --]]
		["Party Channel"] = "Party Channel",
		--[[Translation missing --]]
		["Prat CopyChat"] = "Prat CopyChat",
		--[[Translation missing --]]
		["Prat Keybindings"] = "Prat Keybindings",
		--[[Translation missing --]]
		["Prat TellTarget"] = "Prat TellTarget",
		--[[Translation missing --]]
		["Raid Channel"] = "Raid Channel",
		--[[Translation missing --]]
		["Raid Warning Channel"] = "Raid Warning Channel",
		--[[Translation missing --]]
		["Say"] = "Say",
		--[[Translation missing --]]
		["Smart Group Channel"] = "Smart Group Channel",
		--[[Translation missing --]]
		["TellTarget"] = "TellTarget",
		--[[Translation missing --]]
		["Whisper"] = "Whisper",
		--[[Translation missing --]]
		["Yell"] = "Yell",
	}
}


   PL:AddLocale(PRAT_MODULE, "esMX",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "Канал %d",
		["Copy Selected Chat Frame"] = "Копирование выбранного окна чата",
		["Guild Channel"] = "Канал Гильдии",
		["Instance Channel"] = "Канал Подземелий",
		["module_desc"] = "Добавляет привязки к чату ",
		["Next Chat Tab"] = "Следующее окно чата",
		["Officer Channel"] = "Офицерский Канал",
		["Party Channel"] = "Канал Группы",
		["Prat CopyChat"] = "Копирование чата Prat",
		["Prat Keybindings"] = true,
		["Prat TellTarget"] = "Prat Сказать обьекту",
		["Raid Channel"] = "Канал Рейда",
		["Raid Warning Channel"] = "Канал объявлений рейду",
		["Say"] = "Сказать",
		["Smart Group Channel"] = "Групирование каналов",
		["TellTarget"] = "Сказать обьекту",
		["Whisper"] = "Шепнуть",
		["Yell"] = "Крикнуть",
	}
}


   PL:AddLocale(PRAT_MODULE, "ruRU",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "频道 %d",
		["Copy Selected Chat Frame"] = "复制选定的聊天框体",
		["Guild Channel"] = "公会频道",
		["Instance Channel"] = "战场频道",
		["module_desc"] = "添加聊天关联的按键绑定",
		["Next Chat Tab"] = "下一个聊天标签",
		["Officer Channel"] = "官员频道",
		["Party Channel"] = "小队频道",
		["Prat CopyChat"] = "Prat聊天复制",
		["Prat Keybindings"] = "Prat键位绑定",
		["Prat TellTarget"] = "Prat目标告知",
		["Raid Channel"] = "团队频道",
		["Raid Warning Channel"] = "团队警告频道",
		["Say"] = "说",
		["Smart Group Channel"] = "频道智能分组",
		["TellTarget"] = "目标告知",
		["Whisper"] = "密语",
		["Yell"] = "喊话",
	}
}


   PL:AddLocale(PRAT_MODULE, "zhCN",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "Canal %d",
		["Copy Selected Chat Frame"] = "Copiar el Marco de Chat Seleccionado",
		["Guild Channel"] = "Canal de Hermandad",
		["Instance Channel"] = "Canal Campo de Batalla",
		--[[Translation missing --]]
		["module_desc"] = "Adds chat related keybindings",
		["Next Chat Tab"] = "Siguiente Pestaña de Chat",
		["Officer Channel"] = "Canal Oficial",
		["Party Channel"] = "Canal del Grupo",
		["Prat CopyChat"] = "Prat ChatCopiar",
		["Prat Keybindings"] = "Combinaciones de teclas Prat",
		["Prat TellTarget"] = "Prat DecirObjetivo",
		["Raid Channel"] = "Canal de Banda",
		["Raid Warning Channel"] = "Canal Aviso de Banda",
		["Say"] = "Decir",
		["Smart Group Channel"] = "Canal de Grupo Inteligente",
		["TellTarget"] = "DecirObjetivo",
		["Whisper"] = "Susurrar",
		["Yell"] = "Gritar",
	}
}


   PL:AddLocale(PRAT_MODULE, "esES",L)


 
L = {
	["KeyBindings"] = {
		["Channel %d"] = "頻道 %d",
		["Copy Selected Chat Frame"] = "複製選取的聊天視窗",
		["Guild Channel"] = "公會頻道",
		["Instance Channel"] = "戰場頻道",
		--[[Translation missing --]]
		["module_desc"] = "Adds chat related keybindings",
		["Next Chat Tab"] = "次個聊天標籤",
		["Officer Channel"] = "幹部頻道",
		["Party Channel"] = "小隊頻道",
		["Prat CopyChat"] = "Prat 聊天複製",
		["Prat Keybindings"] = "Prat按鍵綁定",
		["Prat TellTarget"] = true,
		["Raid Channel"] = "團隊頻道",
		["Raid Warning Channel"] = "團隊警告頻道",
		["Say"] = "說",
		["Smart Group Channel"] = "按鍵綁定",
		["TellTarget"] = true,
		["Whisper"] = "密語",
		["Yell"] = "大喊",
	}
}


   PL:AddLocale(PRAT_MODULE, "zhTW",L)


 end
 --@end-non-debug@


  Prat:SetModuleInit(module,
    function(self)
      BINDING_HEADER_Prat = PL["Prat Keybindings"]
      BINDING_NAME_officer = PL["Officer Channel"]
      BINDING_NAME_guild = PL["Guild Channel"]
      BINDING_NAME_party = PL["Party Channel"]
      BINDING_NAME_raid = PL["Raid Channel"]
      BINDING_NAME_raidwarn = PL["Raid Warning Channel"]
      BINDING_NAME_instance = PL["Instance Channel"]
      BINDING_NAME_say = PL["Say"]
      BINDING_NAME_yell = PL["Yell"]
      BINDING_NAME_whisper = PL["Whisper"]
      BINDING_NAME_one = (PL["Channel %d"]):format(1)
      BINDING_NAME_two = (PL["Channel %d"]):format(2)
      BINDING_NAME_three = (PL["Channel %d"]):format(3)
      BINDING_NAME_four = (PL["Channel %d"]):format(4)
      BINDING_NAME_five = (PL["Channel %d"]):format(5)
      BINDING_NAME_six = (PL["Channel %d"]):format(6)
      BINDING_NAME_seven = (PL["Channel %d"]):format(7)
      BINDING_NAME_eight = (PL["Channel %d"]):format(8)
      BINDING_NAME_nine = (PL["Channel %d"]):format(9)
      BINDING_NAME_SmartGroup = PL["Smart Group Channel"]
      --	    BINDING_HEADER_Prat_TellTarget = PL["Prat TellTarget"]
      --	    BINDING_HEADER_Prat_CopyChat = PL["Prat CopyChat"]
      BINDING_NAME_NextTab = PL["Next Chat Tab"]
      BINDING_NAME_CopySelected = PL["Copy Selected Chat Frame"]
    end)

  -- /script keybindings:CycleChatTabs()
  function module:CycleChatTabs()
    local current = FCFDock_GetSelectedWindow(GENERAL_CHAT_DOCK)
    local idx
    local dockedFrames = FCFDock_GetChatFrames(GENERAL_CHAT_DOCK)

    for i, v in ipairs(dockedFrames) do
      if v == current then
        idx = i
      end
    end

    if idx == nil then return end

    idx = idx + 1
    if dockedFrames[idx] == nil then
      idx = 1
    end

    FCFDock_SelectWindow(GENERAL_CHAT_DOCK, dockedFrames[idx])
  end

  return
end) -- Prat:AddModuleToLoad