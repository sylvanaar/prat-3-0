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

  local PRAT_MODULE = Prat:RequestModuleName("AddonMsgs")

  if PRAT_MODULE == nil then
    return
  end

  local mod = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")

  -- define localized strings
  local PL = mod.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["AddonMsgs"] = true,
    ["Addon message options."] = true,
    ["show_name"] = "Show Addon Messages",
    ["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
    ["show_perframename"] = "ChatFrame%d AddonMsgsShow",
    ["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["AddonMsgs"] = {
		["Addon message options."] = true,
		["AddonMsgs"] = true,
		["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
		["show_name"] = "Show Addon Messages",
		["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
		["show_perframename"] = "ChatFrame%d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)




L = {
	["AddonMsgs"] = {
		--[[Translation missing --]]
		["Addon message options."] = "Addon message options.",
		--[[Translation missing --]]
		["AddonMsgs"] = "AddonMsgs",
		--[[Translation missing --]]
		["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
		--[[Translation missing --]]
		["show_name"] = "Show Addon Messages",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "ChatFrame%d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)




L = {
	["AddonMsgs"] = {
		--[[Translation missing --]]
		["Addon message options."] = "Addon message options.",
		--[[Translation missing --]]
		["AddonMsgs"] = "AddonMsgs",
		--[[Translation missing --]]
		["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
		--[[Translation missing --]]
		["show_name"] = "Show Addon Messages",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "ChatFrame%d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)




L = {
	["AddonMsgs"] = {
		--[[Translation missing --]]
		["Addon message options."] = "Addon message options.",
		--[[Translation missing --]]
		["AddonMsgs"] = "AddonMsgs",
		--[[Translation missing --]]
		["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
		--[[Translation missing --]]
		["show_name"] = "Show Addon Messages",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "ChatFrame%d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR", L)




L = {
	["AddonMsgs"] = {
		["Addon message options."] = "Addon-Nachrichtenoptionen.",
		["AddonMsgs"] = "Addon-Nachrichten",
		["show_desc"] = "Anzeige versteckter AddOn-Meldungen in jedem Chatfenster ein-/ausschalten.",
		["show_name"] = "AddOn-Meldungen anzeigen",
		["show_perframedesc"] = "Anzeige versteckter AddOn-Meldungen ein-/ausschalten.",
		["show_perframename"] = "Addon-Meldungen in Chatfenster %d anzeigen",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)




L = {
	["AddonMsgs"] = {
		["Addon message options."] = "애드온 메시지 옵션입니다.",
		["AddonMsgs"] = "애드온 메시지",
		["show_desc"] = "각 대화창에 숨겨진 애드온 메시지 표시를 켜거나 끕니다.",
		["show_name"] = "애드온 메시지 표시",
		["show_perframedesc"] = "숨겨진 애드온 메시지 표시를 켜거나 끕니다.",
		["show_perframename"] = "대화창%d 애드온 메시지 표시",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR", L)




L = {
	["AddonMsgs"] = {
		--[[Translation missing --]]
		["Addon message options."] = "Addon message options.",
		--[[Translation missing --]]
		["AddonMsgs"] = "AddonMsgs",
		--[[Translation missing --]]
		["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
		--[[Translation missing --]]
		["show_name"] = "Show Addon Messages",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "ChatFrame%d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX", L)




L = {
	["AddonMsgs"] = {
		["Addon message options."] = "Настройки сообщений модификаций.",
		["AddonMsgs"] = "Сообщения аддонов",
		["show_desc"] = "Включить отображение сообщений аддонов в каждой закладке чата.",
		["show_name"] = "Показывать сообщения аддонов",
		["show_perframedesc"] = "Вкл/Выкл отображение сообщений аддонов.",
		["show_perframename"] = "ChatFrame%d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU", L)




L = {
	["AddonMsgs"] = {
		["Addon message options."] = "插件信息选项",
		["AddonMsgs"] = "插件信息",
		["show_desc"] = "在各自聊天窗口中显示隐藏的插件消息",
		["show_name"] = "显示插件信息",
		["show_perframedesc"] = "显示隐藏的插件消息",
		["show_perframename"] = "聊天框体%d插件消息显示",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN", L)




L = {
	["AddonMsgs"] = {
		["Addon message options."] = "Opciones de mensaje del Addon.",
		["AddonMsgs"] = "MensajesAddon",
		["show_desc"] = "Alterna el mostrar mensajes ocultos del addon en cada ventana de chat.",
		["show_name"] = "Mostrar Mensajes de Addons",
		["show_perframedesc"] = "Alterna la activación de mostrar mensajes ocultos del addon.",
		["show_perframename"] = "MarchoChat %d AddonMsgsShow",
	}
}

PL:AddLocale(PRAT_MODULE, "esES", L)




L = {
	["AddonMsgs"] = {
		["Addon message options."] = "插件訊息選項",
		["AddonMsgs"] = "插件訊息",
		["show_desc"] = "切換是否在每個聊天視窗顯示隱藏的插件訊息。",
		["show_name"] = "顯示插件訊息",
		["show_perframedesc"] = "切換是否顯示隱藏的插件訊息",
		["show_perframename"] = "聊天框架%d 插件訊息顯示",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW", L)


end
--@end-non-debug@




  Prat:SetModuleDefaults(mod.name, {
    profile = {
      on = false,
      show = {},
    }
  })

  Prat:SetModuleOptions(mod.name, {
    name = PL["AddonMsgs"],
    desc = PL["Addon message options."],
    type = "group",
    args = {
      show = {
        name = PL["show_name"],
        desc = PL["show_desc"],
        type = "multiselect",
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      }
    }
  })

  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --
  function mod:OnModuleEnable()
    self:RegisterEvent("CHAT_MSG_ADDON")
  end

  function mod:OnModuleDisable()
    self:UnregisterEvent("CHAT_MSG_ADDON")
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  function mod:GetDescription()
    return PL["Addon message options."]
  end

  local CLR = Prat.CLR

  -- add a splash of color to text
  local function c1(text) return CLR:Colorize("ffff40", text) end

  local function c2(text) return CLR:Colorize("a0a0a0", text) end

  local function c3(text) return CLR:Colorize("40ff40", text) end

  local function c4(text) return CLR:Colorize("4040ff", text) end

  -- show hidden addon channel messages
  function mod:CHAT_MSG_ADDON(arg1, arg2, arg3, arg4)
    for k, v in pairs(Prat.HookedFrames) do
      if self.db.profile.show[k] then
        v:AddMessage("[" .. c1(arg1) .. "][" .. c2(arg2) .. "][" .. c3(arg3) .. "][" .. c4(arg4) .. "]")
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad