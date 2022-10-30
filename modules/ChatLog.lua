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

  local PRAT_MODULE = Prat:RequestModuleName("ChatLog")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE)

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
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
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = true,
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = true,
		["Chat Log: Disabled"] = true,
		["Chat Log: Enabled"] = true,
		["ChatLog"] = true,
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = true,
		["Combat Log: Disabled"] = true,
		["Combat Log: Enabled"] = true,
		["quiet_desc"] = "Dont display any messages when this mod is enabled, or when it changes the log settings.",
		["quiet_name"] = "Suppress Feedback Messages",
		["Toggle Chat Log"] = true,
		["Toggle chat log on and off."] = true,
		["Toggle Combat Log"] = true,
		["Toggle combat log on and off."] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["ChatLog"] = {
		--[[Translation missing --]]
		["A module to automaticaly enable chat and combat logging."] = "A module to automaticaly enable chat and combat logging.",
		--[[Translation missing --]]
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout.",
		--[[Translation missing --]]
		["Chat Log: Disabled"] = "Chat Log: Disabled",
		--[[Translation missing --]]
		["Chat Log: Enabled"] = "Chat Log: Enabled",
		--[[Translation missing --]]
		["ChatLog"] = "ChatLog",
		--[[Translation missing --]]
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout.",
		--[[Translation missing --]]
		["Combat Log: Disabled"] = "Combat Log: Disabled",
		--[[Translation missing --]]
		["Combat Log: Enabled"] = "Combat Log: Enabled",
		--[[Translation missing --]]
		["quiet_desc"] = "Dont display any messages when this mod is enabled, or when it changes the log settings.",
		--[[Translation missing --]]
		["quiet_name"] = "Suppress Feedback Messages",
		--[[Translation missing --]]
		["Toggle Chat Log"] = "Toggle Chat Log",
		--[[Translation missing --]]
		["Toggle chat log on and off."] = "Toggle chat log on and off.",
		--[[Translation missing --]]
		["Toggle Combat Log"] = "Toggle Combat Log",
		--[[Translation missing --]]
		["Toggle combat log on and off."] = "Toggle combat log on and off.",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["ChatLog"] = {
		--[[Translation missing --]]
		["A module to automaticaly enable chat and combat logging."] = "A module to automaticaly enable chat and combat logging.",
		--[[Translation missing --]]
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout.",
		--[[Translation missing --]]
		["Chat Log: Disabled"] = "Chat Log: Disabled",
		--[[Translation missing --]]
		["Chat Log: Enabled"] = "Chat Log: Enabled",
		--[[Translation missing --]]
		["ChatLog"] = "ChatLog",
		--[[Translation missing --]]
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout.",
		--[[Translation missing --]]
		["Combat Log: Disabled"] = "Combat Log: Disabled",
		--[[Translation missing --]]
		["Combat Log: Enabled"] = "Combat Log: Enabled",
		--[[Translation missing --]]
		["quiet_desc"] = "Dont display any messages when this mod is enabled, or when it changes the log settings.",
		--[[Translation missing --]]
		["quiet_name"] = "Suppress Feedback Messages",
		--[[Translation missing --]]
		["Toggle Chat Log"] = "Toggle Chat Log",
		--[[Translation missing --]]
		["Toggle chat log on and off."] = "Toggle chat log on and off.",
		--[[Translation missing --]]
		["Toggle Combat Log"] = "Toggle Combat Log",
		--[[Translation missing --]]
		["Toggle combat log on and off."] = "Toggle combat log on and off.",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)


L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "Un module pour activer automatiquement la journalisation du chat et des combats",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Journalisation du chat enregistré dans <WoW Installation>\\Logs\\WoWChatLog.txt jusqu'à la prochaine déconnexion",
		["Chat Log: Disabled"] = "Journalisation Chat : Désactivé",
		["Chat Log: Enabled"] = "Journalisation Chat : Activé",
		["ChatLog"] = true,
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Journalisation des combats enregistré dans <WoW Installation>\\Logs\\WoWChatLog.txt jusqu'à la prochaine déconnexion",
		["Combat Log: Disabled"] = "Journalisation des combats : Désactivé",
		["Combat Log: Enabled"] = "Journalisation des combats : Activé",
		["quiet_desc"] = "N'afficher aucun messages quand ce mod est activé ou quand il change les paramètres de journalisation",
		["quiet_name"] = "Supprimer les messages de feedback",
		["Toggle Chat Log"] = "Activer la journalisation du chat",
		["Toggle chat log on and off."] = "Activer/Désactiver la journalisation du chat",
		["Toggle Combat Log"] = "Activer la journalisation des combat",
		["Toggle combat log on and off."] = "Activer/Désactiver la journalisation des combats",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR",L)




L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "Ein Modul zum automatischen Aktivieren der Chat- und Kampfprotokollierung.",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Speicherung des Chat-Logs in <WoW Installation>\\Logs\\WoWChatLog.txt nur während des Ausloggens.",
		["Chat Log: Disabled"] = "Chat-Protokoll: Deaktiviert",
		["Chat Log: Enabled"] = "Chat-Protokoll: Aktiviert",
		["ChatLog"] = "Chat-Protokoll",
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Das aufgezeichnete Kampfprotokoll in <WoW Installation>\\Logs\\WoWCombatLog.txt wird erst beim Abmelden aufgezeichnet.",
		["Combat Log: Disabled"] = "Kampfprotokoll: Deaktiviert",
		["Combat Log: Enabled"] = "Kampfprotokoll: Aktiviert",
		["quiet_desc"] = "Zeigt keinerlei Mitteilungen an, wenn dieser Modus aktiv ist, oder wenn es die Log-Einstellungen verändert.",
		["quiet_name"] = "Feedback-Mitteilungen unterdrücken",
		["Toggle Chat Log"] = "Chat-Log umschalten",
		["Toggle chat log on and off."] = "Chat-Log ein- und ausschalten.",
		["Toggle Combat Log"] = "Kampflog umschalten",
		["Toggle combat log on and off."] = "Kampflog ein- und ausschalten.",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)


L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "대화 기록과 전투 기록을 자동으로 켜는 모듈입니다.",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "대화 기록은 접속종료 후, <와우폴더>\\Logs\\WoWChatLog.txt 에 저장됩니다.",
		["Chat Log: Disabled"] = "대화 기록: 꺼짐",
		["Chat Log: Enabled"] = "대화 기록: 켜짐",
		["ChatLog"] = "대화 기록 [ChatLog]",
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "전투 기록은 접속종료 후, <와우폴더>\\Logs\\WoWCombatLog.txt 에 저장됩니다.",
		["Combat Log: Disabled"] = "전투 기록: 꺼짐",
		["Combat Log: Enabled"] = "전투 기록: 켜짐",
		["quiet_desc"] = "이 모듈이 켜지거나 설정이 변경될 때 알림 메시지를 표시하지 않습니다.",
		["quiet_name"] = "알림 메시지 끄기",
		["Toggle Chat Log"] = "대화 기록 끄고 켜기",
		["Toggle chat log on and off."] = "대화 기록을 끄거나 켭니다.",
		["Toggle Combat Log"] = "전투 기록 끄고 켜기",
		["Toggle combat log on and off."] = "전투 기록을 끄거나 켭니다.",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",L)

L = {
	["ChatLog"] = {
		--[[Translation missing --]]
		["A module to automaticaly enable chat and combat logging."] = "A module to automaticaly enable chat and combat logging.",
		--[[Translation missing --]]
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout.",
		--[[Translation missing --]]
		["Chat Log: Disabled"] = "Chat Log: Disabled",
		--[[Translation missing --]]
		["Chat Log: Enabled"] = "Chat Log: Enabled",
		--[[Translation missing --]]
		["ChatLog"] = "ChatLog",
		--[[Translation missing --]]
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout.",
		--[[Translation missing --]]
		["Combat Log: Disabled"] = "Combat Log: Disabled",
		--[[Translation missing --]]
		["Combat Log: Enabled"] = "Combat Log: Enabled",
		--[[Translation missing --]]
		["quiet_desc"] = "Dont display any messages when this mod is enabled, or when it changes the log settings.",
		--[[Translation missing --]]
		["quiet_name"] = "Suppress Feedback Messages",
		--[[Translation missing --]]
		["Toggle Chat Log"] = "Toggle Chat Log",
		--[[Translation missing --]]
		["Toggle chat log on and off."] = "Toggle chat log on and off.",
		--[[Translation missing --]]
		["Toggle Combat Log"] = "Toggle Combat Log",
		--[[Translation missing --]]
		["Toggle combat log on and off."] = "Toggle combat log on and off.",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",L)

L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "Модуль автоматического включения записи чата и журнала боя.",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Запись чата, записано в <директория инсталляции WoW>\\Logs\\WoWChatLog.txt  (только после выхода из игры).",
		["Chat Log: Disabled"] = "Запись чатa: выключена",
		["Chat Log: Enabled"] = "Запись чатa: включена",
		["ChatLog"] = "Логи чата",
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Журнал боя записывается в <директория инсталляции WoW>\\Logs\\WoWCombatLog.txt только до выхода из игры.",
		["Combat Log: Disabled"] = "Запись журнала боя: выключена",
		["Combat Log: Enabled"] = "Запись журнала боя: включена",
		["quiet_desc"] = "Не отображать никаких сообщений, если данный модуль включен, или при изменении им настроек записи.",
		["quiet_name"] = "Подавлять инфо сообщения",
		["Toggle Chat Log"] = "Запись чата",
		["Toggle chat log on and off."] = "Вкл/Выкл запись чата.",
		["Toggle Combat Log"] = "Запись журнала боя",
		["Toggle combat log on and off."] = "Вкл/Выкл запись журнала боя.",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",L)

L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "自动启用聊天和战斗记录的模块",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "退出游戏时保存聊天记录在<魔兽世界安装目录>\\Logs\\WoWChatLog.txt",
		["Chat Log: Disabled"] = "聊天记录：禁用",
		["Chat Log: Enabled"] = "聊天记录：启用",
		["ChatLog"] = "聊天记录",
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "退出游戏后保存战斗记录在<魔兽世界安装目录>\\Logs\\WoWCombatLog.txt",
		["Combat Log: Disabled"] = "战斗记录：禁用",
		["Combat Log: Enabled"] = "战斗记录：启用",
		["quiet_desc"] = "模块启用或改变记录设置时不显示任何信息",
		["quiet_name"] = "禁止反馈信息",
		["Toggle Chat Log"] = "聊天记录",
		["Toggle chat log on and off."] = "切换聊天记录开关",
		["Toggle Combat Log"] = "战斗记录",
		["Toggle combat log on and off."] = "切换战斗记录开关",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",L)

L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "Un módulo que automáticamente activa el chat y el registro de combate.",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Registro del chat guardado en <Instalación WoW>\\Logs\\WoWChatLog.txt sólo al cierre de la sesión.",
		["Chat Log: Disabled"] = "Registro del Chat: Desactivado",
		["Chat Log: Enabled"] = "Registro del Chat: Activado",
		["ChatLog"] = "Registro del Chat",
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Registro del combate guardado en <Instalación WoW>\\Logs\\WoWCombatLog.txt sólo al cierre de la sesión.",
		["Combat Log: Disabled"] = "Registro de Combate: Desactivado",
		["Combat Log: Enabled"] = "Registro de Combate: Activado",
		["quiet_desc"] = "No mostrar algún mensaje cuando este mod esté activdo, o cuando cambie la configuración del registro.",
		["quiet_name"] = "Suprimir Mensaje de Respuesta",
		["Toggle Chat Log"] = "Alternar Registro del Chat",
		["Toggle chat log on and off."] = "Alterna la activación del registro del chat.",
		["Toggle Combat Log"] = "Alternar Registro de Combate",
		["Toggle combat log on and off."] = "Alterna la activación del registro de combate.",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",L)

L = {
	["ChatLog"] = {
		["A module to automaticaly enable chat and combat logging."] = "模組：自動啟用聊天以及戰鬥紀錄。",
		["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "聊天紀錄至 <WoW Installation>\\Logs\\WoWChatLog.txt 僅於遊戲登出時。",
		["Chat Log: Disabled"] = "聊天記錄：已停用",
		["Chat Log: Enabled"] = "聊天記錄：已啟用",
		["ChatLog"] = "聊天記錄",
		["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "戰鬥紀錄至 <WoW Installation>\\Logs\\WoWChatLog.txt 僅於遊戲登出時。",
		["Combat Log: Disabled"] = "戰鬥記錄：已停用",
		["Combat Log: Enabled"] = "戰鬥記錄：已啟用",
		["quiet_desc"] = "禁止顯示任何訊息當插件啟用時的訊息或者插件改變紀錄設定時。",
		["quiet_name"] = "禁止回饋訊息",
		["Toggle Chat Log"] = "切換聊天記錄",
		["Toggle chat log on and off."] = "切換聊天記錄啟用",
		["Toggle Combat Log"] = "切換戰鬥記錄",
		["Toggle combat log on and off."] = "切換戰鬥記錄啟用",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@




  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
      chat = false,
      combat = false,
      quiet = true,
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL["ChatLog"],
    desc = PL["A module to automaticaly enable chat and combat logging."],
    type = "group",
    args = {
      chat = {
        name = PL["Toggle Chat Log"],
        desc = PL["Toggle chat log on and off."],
        type = "toggle",
        set = "SetChatLog",
      },
      combat = {
        name = PL["Toggle Combat Log"],
        desc = PL["Toggle combat log on and off."],
        type = "toggle",
        set = "SetCombatLog",
      },
      quiet = {
        name = PL["quiet_name"],
        desc = PL["quiet_desc"],
        type = "toggle",
      }
    }
  })


  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    self:SetChatLog(nil, self.db.profile.chat)
    self:SetCombatLog(nil, self.db.profile.combat)
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  function module:GetDescription()
    return PL["A module to automaticaly enable chat and combat logging."]
  end

  -- enable or disable the chat log
  function module:SetChatLog(info, val)
    self.db.profile.chat = val
    if self.db.profile.chat then
      self:Print(PL["Chat Log: Enabled"])
      self:Print(PL["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."])
      LoggingChat(true)
    else
      LoggingChat(false)
      self:Print(PL["Chat Log: Disabled"])
    end
  end

  -- enable or disable the combat log
  function module:SetCombatLog(info, val)
    self.db.profile.combat = val
    if self.db.profile.combat then
      self:Print(PL["Combat Log: Enabled"])
      self:Print(PL["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."])
      LoggingCombat(true)
    end
  end

  function module:Print(str)
    if self.db.profile.quiet then return end

    Prat:Print(str)
  end



  return
end) -- Prat:AddModuleToLoad