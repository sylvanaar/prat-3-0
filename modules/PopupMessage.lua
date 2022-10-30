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

  local PRAT_MODULE = Prat:RequestModuleName("PopupMessage")

  if PRAT_MODULE == nil then
    return
  end

  -- create prat module
  local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
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
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["PopupMessage"] = {
		["Add Nickname"] = true,
		["Adds an alternate name to show in popups."] = true,
		["Clear Nickname"] = true,
		["Clears alternate name to show in popups."] = true,
		["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
		["framealpha_name"] = "Popup Frame Alpha",
		["Popup"] = true,
		["PopupMessage"] = true,
		["Remove Nickname"] = true,
		["Removes an alternate name to show in popups."] = true,
		["Set Separately"] = true,
		["Show All Popups"] = true,
		["Show Popups"] = true,
		["Show Popups for all chat windows."] = true,
		["Show Popups for each window."] = true,
		["show_desc"] = "Show Popups for each window.",
		["show_name"] = "Show Popups",
		["show_perframedesc"] = "Toggles showing popups on and off.",
		["show_perframename"] = "Show ChatFrame%d Popups",
		["showall_desc"] = "Show Popups for all chat windows.",
		["showall_name"] = "Show All Popups",
		["Shows messages in a popup window."] = true,
		["Shows messages with your name in a popup."] = true,
		["Toggle setting options separately for each chat window."] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["PopupMessage"] = {
		--[[Translation missing --]]
		["Add Nickname"] = "Add Nickname",
		--[[Translation missing --]]
		["Adds an alternate name to show in popups."] = "Adds an alternate name to show in popups.",
		--[[Translation missing --]]
		["Clear Nickname"] = "Clear Nickname",
		--[[Translation missing --]]
		["Clears alternate name to show in popups."] = "Clears alternate name to show in popups.",
		--[[Translation missing --]]
		["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
		--[[Translation missing --]]
		["framealpha_name"] = "Popup Frame Alpha",
		--[[Translation missing --]]
		["Popup"] = "Popup",
		--[[Translation missing --]]
		["PopupMessage"] = "PopupMessage",
		--[[Translation missing --]]
		["Remove Nickname"] = "Remove Nickname",
		--[[Translation missing --]]
		["Removes an alternate name to show in popups."] = "Removes an alternate name to show in popups.",
		--[[Translation missing --]]
		["Set Separately"] = "Set Separately",
		--[[Translation missing --]]
		["Show All Popups"] = "Show All Popups",
		--[[Translation missing --]]
		["Show Popups"] = "Show Popups",
		--[[Translation missing --]]
		["Show Popups for all chat windows."] = "Show Popups for all chat windows.",
		--[[Translation missing --]]
		["Show Popups for each window."] = "Show Popups for each window.",
		--[[Translation missing --]]
		["show_desc"] = "Show Popups for each window.",
		--[[Translation missing --]]
		["show_name"] = "Show Popups",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggles showing popups on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "Show ChatFrame%d Popups",
		--[[Translation missing --]]
		["showall_desc"] = "Show Popups for all chat windows.",
		--[[Translation missing --]]
		["showall_name"] = "Show All Popups",
		--[[Translation missing --]]
		["Shows messages in a popup window."] = "Shows messages in a popup window.",
		--[[Translation missing --]]
		["Shows messages with your name in a popup."] = "Shows messages with your name in a popup.",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["PopupMessage"] = {
		--[[Translation missing --]]
		["Add Nickname"] = "Add Nickname",
		--[[Translation missing --]]
		["Adds an alternate name to show in popups."] = "Adds an alternate name to show in popups.",
		--[[Translation missing --]]
		["Clear Nickname"] = "Clear Nickname",
		--[[Translation missing --]]
		["Clears alternate name to show in popups."] = "Clears alternate name to show in popups.",
		--[[Translation missing --]]
		["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
		--[[Translation missing --]]
		["framealpha_name"] = "Popup Frame Alpha",
		--[[Translation missing --]]
		["Popup"] = "Popup",
		--[[Translation missing --]]
		["PopupMessage"] = "PopupMessage",
		--[[Translation missing --]]
		["Remove Nickname"] = "Remove Nickname",
		--[[Translation missing --]]
		["Removes an alternate name to show in popups."] = "Removes an alternate name to show in popups.",
		--[[Translation missing --]]
		["Set Separately"] = "Set Separately",
		--[[Translation missing --]]
		["Show All Popups"] = "Show All Popups",
		--[[Translation missing --]]
		["Show Popups"] = "Show Popups",
		--[[Translation missing --]]
		["Show Popups for all chat windows."] = "Show Popups for all chat windows.",
		--[[Translation missing --]]
		["Show Popups for each window."] = "Show Popups for each window.",
		--[[Translation missing --]]
		["show_desc"] = "Show Popups for each window.",
		--[[Translation missing --]]
		["show_name"] = "Show Popups",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggles showing popups on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "Show ChatFrame%d Popups",
		--[[Translation missing --]]
		["showall_desc"] = "Show Popups for all chat windows.",
		--[[Translation missing --]]
		["showall_name"] = "Show All Popups",
		--[[Translation missing --]]
		["Shows messages in a popup window."] = "Shows messages in a popup window.",
		--[[Translation missing --]]
		["Shows messages with your name in a popup."] = "Shows messages with your name in a popup.",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)


L = {
	["PopupMessage"] = {
		["Add Nickname"] = "Ajouter un surnom",
		--[[Translation missing --]]
		["Adds an alternate name to show in popups."] = "Adds an alternate name to show in popups.",
		["Clear Nickname"] = "Efface le surnom",
		--[[Translation missing --]]
		["Clears alternate name to show in popups."] = "Clears alternate name to show in popups.",
		["framealpha_desc"] = "Régler la transparence de la popup lorsqu'elle disparait.",
		["framealpha_name"] = "Transparence des popups",
		["Popup"] = true,
		["PopupMessage"] = "Message popup",
		["Remove Nickname"] = "Retirer un surnom",
		--[[Translation missing --]]
		["Removes an alternate name to show in popups."] = "Removes an alternate name to show in popups.",
		["Set Separately"] = "Afficher séparément",
		["Show All Popups"] = "Afficher toutes les popups",
		["Show Popups"] = "Afficher les popups",
		["Show Popups for all chat windows."] = "Afficher les popups pour toutes les fenêtres de discussion.",
		["Show Popups for each window."] = "Afficher les popups pour chaque fenêtre.",
		["show_desc"] = "Afficher les popups pour chaque fenêtre.",
		["show_name"] = "Afficher les popups",
		["show_perframedesc"] = "Active ou désactive l'affichage des popups.",
		["show_perframename"] = "Afficher les popups de la fenêtre de discussion %d",
		["showall_desc"] = "Afficher les popups pour toutes les fenêtres de discussion.",
		["showall_name"] = "Afficher toutes les popups",
		["Shows messages in a popup window."] = "Afficher les messages dans une fenêtre popup.",
		["Shows messages with your name in a popup."] = "Afficher les messages avec votre nom dans une popup.",
		["Toggle setting options separately for each chat window."] = "Activer des préférences différentes pour chaque fenêtre de discussion.",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR",L)




L = {
	["PopupMessage"] = {
		["Add Nickname"] = "Spitzname hinzufügen",
		["Adds an alternate name to show in popups."] = "Fügt einen alternativen Namen hinzu, der in Popups angezeigt werden soll.",
		["Clear Nickname"] = "Spitznamen löschen",
		["Clears alternate name to show in popups."] = "Löscht den alternativen Namen, der in Popups angezeigt werden soll.",
		["framealpha_desc"] = "Den Transparenzwert des Popup-Rahmens bei voller Darstellung einstellen.",
		["framealpha_name"] = "Transparenz der Popup-Rahmens",
		["Popup"] = true,
		["PopupMessage"] = "Popup Nachricht",
		["Remove Nickname"] = "Spitznamen entfernen",
		["Removes an alternate name to show in popups."] = "Entfernt einen alternativen Namen, der in Popups angezeigt werden soll.",
		["Set Separately"] = "Einzeln einstellen",
		["Show All Popups"] = "Alle Popups anzeigen",
		["Show Popups"] = "Popups anzeigen",
		["Show Popups for all chat windows."] = "Popups für alle Chatfenster anzeigen.",
		["Show Popups for each window."] = "Popups für jedes Fenster anzeigen.",
		["show_desc"] = "Popups für jedes Fenster anzeigen.",
		["show_name"] = "Popups anzeigen",
		["show_perframedesc"] = "Anzeige der Popups ein- und ausschalten.",
		["show_perframename"] = "Popups vom Chatfenster%d anzeigen",
		["showall_desc"] = "Popups für alle Chatfenster anzeigen.",
		["showall_name"] = "Alle Popups anzeigen",
		["Shows messages in a popup window."] = "Zeigt Nachrichten in einem Popup-Fenster an.",
		["Shows messages with your name in a popup."] = "Zeigt Nachrichten mit deinem Namen in einem Popup an.",
		["Toggle setting options separately for each chat window."] = "Optionseinstellungen einzeln für jedes Chatfenster umschalten.",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)


L = {
	["PopupMessage"] = {
		["Add Nickname"] = "별명 추가",
		["Adds an alternate name to show in popups."] = "팝업에 표시할 별명을 추가합니다.",
		["Clear Nickname"] = "별명 전체 삭제",
		["Clears alternate name to show in popups."] = "팝업에 표시할 별명을 전체 삭제합니다.",
		["framealpha_desc"] = "가장 밝아졌을 때 팝업 창의 투명도를 설정합니다.",
		["framealpha_name"] = "팝업 창 투명도",
		["Popup"] = "팝업",
		["PopupMessage"] = "팝업 메시지",
		["Remove Nickname"] = "별명 제거",
		["Removes an alternate name to show in popups."] = "팝업에 표시할 별명을 제거합니다.",
		["Set Separately"] = "개별 설정",
		["Show All Popups"] = "모든 팝업 표시",
		["Show Popups"] = "팝업 표시",
		["Show Popups for all chat windows."] = "모든 대화창에 팝업을 표시합니다.",
		["Show Popups for each window."] = "각 대화창 별로 팝업을 표시합니다.",
		["show_desc"] = "각 창 별로 팝업을 표시합니다.",
		["show_name"] = "팝업 표시",
		["show_perframedesc"] = "팝업 표시 여부를 토글합니다.",
		["show_perframename"] = "%d번 대화창 팝업 표시",
		["showall_desc"] = "모든 대화창에 팝업을 표시합니다.",
		["showall_name"] = "모든 팝업 표시",
		["Shows messages in a popup window."] = "팝업창 안에 메시지를 표시합니다.",
		["Shows messages with your name in a popup."] = "팝업 창에 당신의 이름과 메시지를 같이 표시합니다.",
		["Toggle setting options separately for each chat window."] = "각 대화창 별로 설정 옵션을 끄거나 켭니다.",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",L)

L = {
	["PopupMessage"] = {
		--[[Translation missing --]]
		["Add Nickname"] = "Add Nickname",
		--[[Translation missing --]]
		["Adds an alternate name to show in popups."] = "Adds an alternate name to show in popups.",
		--[[Translation missing --]]
		["Clear Nickname"] = "Clear Nickname",
		--[[Translation missing --]]
		["Clears alternate name to show in popups."] = "Clears alternate name to show in popups.",
		--[[Translation missing --]]
		["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
		--[[Translation missing --]]
		["framealpha_name"] = "Popup Frame Alpha",
		--[[Translation missing --]]
		["Popup"] = "Popup",
		--[[Translation missing --]]
		["PopupMessage"] = "PopupMessage",
		--[[Translation missing --]]
		["Remove Nickname"] = "Remove Nickname",
		--[[Translation missing --]]
		["Removes an alternate name to show in popups."] = "Removes an alternate name to show in popups.",
		--[[Translation missing --]]
		["Set Separately"] = "Set Separately",
		--[[Translation missing --]]
		["Show All Popups"] = "Show All Popups",
		--[[Translation missing --]]
		["Show Popups"] = "Show Popups",
		--[[Translation missing --]]
		["Show Popups for all chat windows."] = "Show Popups for all chat windows.",
		--[[Translation missing --]]
		["Show Popups for each window."] = "Show Popups for each window.",
		--[[Translation missing --]]
		["show_desc"] = "Show Popups for each window.",
		--[[Translation missing --]]
		["show_name"] = "Show Popups",
		--[[Translation missing --]]
		["show_perframedesc"] = "Toggles showing popups on and off.",
		--[[Translation missing --]]
		["show_perframename"] = "Show ChatFrame%d Popups",
		--[[Translation missing --]]
		["showall_desc"] = "Show Popups for all chat windows.",
		--[[Translation missing --]]
		["showall_name"] = "Show All Popups",
		--[[Translation missing --]]
		["Shows messages in a popup window."] = "Shows messages in a popup window.",
		--[[Translation missing --]]
		["Shows messages with your name in a popup."] = "Shows messages with your name in a popup.",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",L)

L = {
	["PopupMessage"] = {
		["Add Nickname"] = "Добавить ник",
		["Adds an alternate name to show in popups."] = "Добавить альтернативное имя для отображения при всплывании.",
		["Clear Nickname"] = "Очистить ники",
		["Clears alternate name to show in popups."] = "Очистить альтернативные имена для отображения при всплывании.",
		["framealpha_desc"] = "Установка прозрачности всплывающего окна при полном затухании.",
		["framealpha_name"] = "Прозрачность окна всплывания",
		["Popup"] = "Всплывающий",
		["PopupMessage"] = "Всплывающее окно ",
		["Remove Nickname"] = "Удалить ник",
		["Removes an alternate name to show in popups."] = "Удалить альтернативное имя для отображения при всплывании.",
		["Set Separately"] = "Разделение",
		["Show All Popups"] = "Все всплывающие",
		["Show Popups"] = "Показывать всплывания",
		["Show Popups for all chat windows."] = "Показывать всплывающие окна для всего чата.",
		["Show Popups for each window."] = "Показывать всплывания для всех окон.",
		["show_desc"] = "Отображать всплывние для всех окон чата.",
		["show_name"] = "Показывать всплывание",
		["show_perframedesc"] = "Вкл/Выкл отображение всплывания.",
		["show_perframename"] = "Показать всплывание окна %d",
		["showall_desc"] = "Показывать всплывающие окна для всего чата.",
		["showall_name"] = "Все всплывающие",
		["Shows messages in a popup window."] = "Показывать сообщение во всплывающем окне.",
		["Shows messages with your name in a popup."] = "Показывать сообщение с вашим именем во всплывающем окне.",
		["Toggle setting options separately for each chat window."] = "Вкл/Выкл настройки разделения для всех окон чата.",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",L)

L = {
	["PopupMessage"] = {
		["Add Nickname"] = "添加昵称",
		["Adds an alternate name to show in popups."] = "添加一个显示在弹出中的替换名",
		["Clear Nickname"] = "清除昵称",
		["Clears alternate name to show in popups."] = "弹出显示清除候补名称",
		["framealpha_desc"] = "设置完全消失时弹出框体透明度值",
		["framealpha_name"] = "弹出框体透明度",
		["Popup"] = "弹出",
		["PopupMessage"] = "弹出信息",
		["Remove Nickname"] = "移除昵称",
		["Removes an alternate name to show in popups."] = "移除在弹出里显示的候补名称",
		["Set Separately"] = "个别设置",
		["Show All Popups"] = "显示所有弹出",
		["Show Popups"] = "显示弹出",
		["Show Popups for all chat windows."] = "为所有聊天窗后显示弹出",
		["Show Popups for each window."] = "为每个窗口显示弹出",
		["show_desc"] = "在每个窗口显示弹出",
		["show_name"] = "显示弹出",
		["show_perframedesc"] = "弹出开关",
		["show_perframename"] = "显示聊天框体%d弹出",
		["showall_desc"] = "在所有聊天窗口显示弹出",
		["showall_name"] = "显示所有弹出",
		["Shows messages in a popup window."] = "在弹出窗口显示信息",
		["Shows messages with your name in a popup."] = "在弹出中显示含有你名字的信息",
		["Toggle setting options separately for each chat window."] = "分别为每个聊天窗口设置选项",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",L)

L = {
	["PopupMessage"] = {
		["Add Nickname"] = "Añadir un Apodo",
		["Adds an alternate name to show in popups."] = "Añade un nombre alternativo para mostrar en las ventanas emergentes.",
		["Clear Nickname"] = "Limpiar Apodo",
		["Clears alternate name to show in popups."] = "Limpia el nombre alternativo a mostrar en las ventanas emergentes.",
		["framealpha_desc"] = "Establece el valor de transparencia del marco emergente al desaparecer completamente.",
		["framealpha_name"] = "Transparencia Marco Emergente",
		["Popup"] = "Emergente",
		["PopupMessage"] = "Mensaje Emergente",
		["Remove Nickname"] = "Eliminar Apodo",
		["Removes an alternate name to show in popups."] = "Quita un nombre alternativo para mostrar en las ventanas emergentes.",
		["Set Separately"] = "Establecer por Separado",
		["Show All Popups"] = "Mostrar Todas las Emergentes",
		["Show Popups"] = "Mostrar Emergentes",
		["Show Popups for all chat windows."] = "Mostrar Emergentes para todas las ventanas de chat.",
		["Show Popups for each window."] = "Mostrar Emergentes para cada ventana.",
		["show_desc"] = "Muestra Emergentes para cada ventana.",
		["show_name"] = "Mostar Emergentes",
		["show_perframedesc"] = "Alterna activación de mostrar ventanas emergentes.",
		["show_perframename"] = "Mostrar Marcos Emergentes de Chat %d",
		["showall_desc"] = "Mostrar Ventanas Emergentes para todas las ventanas de chat.",
		["showall_name"] = "Mostrar Todas las Emergentes",
		["Shows messages in a popup window."] = "Muestra mensajes en una ventana emergente.",
		["Shows messages with your name in a popup."] = "Muestra mensajes con tu nombre en una ventana emergente.",
		["Toggle setting options separately for each chat window."] = "Cambiar opciones de configuración por separado para cada ventana de chat.",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",L)

L = {
	["PopupMessage"] = {
		["Add Nickname"] = "新增暱稱",
		--[[Translation missing --]]
		["Adds an alternate name to show in popups."] = "Adds an alternate name to show in popups.",
		["Clear Nickname"] = "清除暱稱",
		--[[Translation missing --]]
		["Clears alternate name to show in popups."] = "Clears alternate name to show in popups.",
		["framealpha_desc"] = "設定彈出視窗完全淡入時的透明度值",
		["framealpha_name"] = "彈出視窗透明度",
		["Popup"] = "彈出",
		["PopupMessage"] = "彈出訊息",
		["Remove Nickname"] = "移除暱稱",
		--[[Translation missing --]]
		["Removes an alternate name to show in popups."] = "Removes an alternate name to show in popups.",
		["Set Separately"] = "單獨設定",
		["Show All Popups"] = "顯示所有彈出視窗",
		["Show Popups"] = "顯示彈出視窗",
		["Show Popups for all chat windows."] = "顯示彈出全部聊天視窗。",
		["Show Popups for each window."] = "顯示彈出每個視窗。",
		["show_desc"] = "顯示彈出每個視窗。",
		["show_name"] = "顯示彈出",
		["show_perframedesc"] = "換顯示彈出開動和關閉。",
		["show_perframename"] = "顯示 ChatFrame%d 彈出",
		["showall_desc"] = "顯示彈出全部聊天視窗。",
		["showall_name"] = "顯示全部彈出",
		["Shows messages in a popup window."] = "顯示在彈出視窗訊息。",
		--[[Translation missing --]]
		["Shows messages with your name in a popup."] = "Shows messages with your name in a popup.",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@



  --

  --

  --
  --- -[[
  -- Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
  -- CWDG site: http://Cwowaddon.com
  -- $Rev: 80460 $
  -- ]]
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



  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
      separate = true,
      show = { ChatFrame1 = true },
      framealpha = 1.0,
      nickname = {},
      sinkoptions = { ["sink20OutputSink"] = "Popup" },
    }
  })

  local pluginOptions = { sink = {} }

  Prat:SetModuleOptions(module, {
    name = PL["PopupMessage"],
    desc = PL["Shows messages with your name in a popup."],
    type = "group",
    plugins = pluginOptions,
    args = {
      helpheader = {
        name = "Settings",
        type = "header",
        order = 105,
      },
      show = {
        name = PL["Show Popups"],
        desc = PL["Show Popups for each window."],
        type = "multiselect",
        order = 110,
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      },
      addnick = {
        name = PL["Add Nickname"],
        desc = PL["Adds an alternate name to show in popups."],
        type = "input",
        order = 140,
        usage = "<string>",
        get = false,
        set = function(info, name) info.handler:AddNickname(name) end
      },
      removenick = {
        name = PL["Remove Nickname"],
        desc = PL["Removes an alternate name to show in popups."],
        type = "select",
        order = 150,
        get = function(info) return "" end,
        values = function(info) return info.handler.db.profile.nickname end,
        disabled = function(info) return #info.handler.db.profile.nickname == 0 end,
        set = function(info, value) info.handler:RemoveNickname(value) end
      },
      clearnick = {
        name = PL["Clear Nickname"],
        desc = PL["Clears alternate name to show in popups."],
        type = "execute",
        order = 160,
        disabled = function(info) return (#info.handler.db.profile.nickname == 0) end,
        func = "ClearNickname",
      },
    },
  })

  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --
  Prat:SetModuleInit(module,
    function(self)
      self:RegisterSink(PL["Popup"],
        PL["PopupMessage"],
        PL["Shows messages in a popup window."],
        "Popup")
      self:SetSinkStorage(self.db.profile.sinkoptions)

      pluginOptions.sink["output"] = self:GetSinkAce3OptionsDataTable()
      pluginOptions.sink["output"].inline = true

      self.db.profile.show = self.db.profile.show or {}
    end)

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
  ------------------------------------------------]] --
  function module:GetDescription()
    return PL["Shows messages with your name in a popup."]
  end

  -- /dump module.moduleOptions.args.output.get():find("Default")
  -- /script module.moduleOptions.args.output.set("PopupMessage")
  -- /dump module.db.profile
  -- /script module.db.profile.sink10OutputSink = nil
  function module:Popup(source, text, r, g, b, ...)
    if Prat_PopupFrame.anim then
      Prat_PopupFrame.anim:Stop()
    else
      Prat_PopupFrame.anim = Prat_PopupFrame:CreateAnimationGroup()
      Prat_PopupFrame.anim:SetScript("OnFinished", function() Prat_PopupFrameText:Hide() end)

      local fade1 = Prat_PopupFrame.anim:CreateAnimation("Alpha")
      fade1:SetDuration(1)
      fade1:SetToAlpha(module.db.profile.framealpha or 1)
      fade1:SetEndDelay(4)
      fade1:SetOrder(1)

      local fade2 = Prat_PopupFrame.anim:CreateAnimation("Alpha")
      fade2:SetDuration(5)
      fade2:SetToAlpha(0)
      fade2:SetOrder(2)
    end

    Prat_PopupFrameText:SetTextColor(r, g, b)
    Prat_PopupFrameText:SetText(text)

    local font, _, style = ChatFrame1:GetFont()
    local _, fontsize = GameFontNormal:GetFont()
    Prat_PopupFrameText:SetFont(font, fontsize, style)
    Prat_PopupFrameText:SetNonSpaceWrap(false)
    Prat_PopupFrame:SetWidth(math.min(math.max(64, Prat_PopupFrameText:GetStringWidth() + 20), 520))
    Prat_PopupFrame:SetHeight(64)
    Prat_PopupFrame:SetBackdropBorderColor(r, g, b)

    Prat_PopupFrameText:ClearAllPoints()
    Prat_PopupFrameText:SetPoint("TOPLEFT", Prat_PopupFrame, "TOPLEFT", 10, 10)
    Prat_PopupFrameText:SetPoint("BOTTOMRIGHT", Prat_PopupFrame, "BOTTOMRIGHT", -10, -10)
    Prat_PopupFrameText:Show()

    Prat_PopupFrame:SetAlpha(0)
    Prat_PopupFrame:Show()
    Prat_PopupFrame.anim:Play()
  end

  local DEBUG
  --[==[@debug@
  DEBUG = true
  --@end-debug@]==]

  function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    if self.pouring then return end
    if message.LINE_ID and
      message.LINE_ID == self.lastevent and
      self.lasteventtype == event then
      return
    end

    if not (EVENTS_EMOTES[event] or EVENTS_IGNORE[event]) then
      if self.db.profile.showall or self.db.profile.show[frame:GetName()] then
        if DEBUG or not (message.ORG.PLAYER and self.playerName and message.ORG.PLAYER:match(self.playerName)) then
          self:CheckText(message.ORG.MESSAGE, message.OUTPUT, event, r, g, b, message.LINE_ID)
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

  function module:CheckText(text, display_text, event, r, g, b, eventId)
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
      self.lastevent = eventId
      self.pouring = true
      self:Pour(display_text or text, r, g, b)
      Prat:PlaySound("popup");
      self.pouring = nil
    end
  end




  return
end) -- Prat:AddModuleToLoad