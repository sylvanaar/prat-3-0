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

  local PRAT_MODULE = Prat:RequestModuleName("OriginalButtons")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

  -- define localized strings
  local PL = module.PL



  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["ChannelNames"] = true,
    ["Original Buttons"] = true,
    ["Chat window button options."] = true,
    ["chatmenu_name"] = "Show Chat Menu",
    ["chatmenu_desc"] = "Toggles chat menu on and off.",
    ["Show Arrows"] = true,
    ["Toggle showing chat arrows for each chat window."] = true,
    ["Show Chat%d Arrows"] = true,
    ["Toggles navigation arrows on and off."] = true,
    ["reminder_name"] = "Show ScrollDown Reminder",
    ["reminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
    ["Set Position"] = true,
    ["Sets position of chat menu and arrows for all chat windows."] = true,
    ["Default"] = true,
    ["Right, Inside Frame"] = true,
    ["Right, Outside Frame"] = true,
    ["alpha_name"] = "Set Alpha",
    ["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
    ["reflow_name"] = "Text Flows Around",
    ["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
    buttonframe_desc = "Toggles the button frame menu on and off.",
    buttonframe_name = "Show Button Frame",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
		["alpha_name"] = "Set Alpha",
		["buttonframe_desc"] = "Toggles the button frame menu on and off.",
		["buttonframe_name"] = "Show Button Frame",
		["ChannelNames"] = true,
		["Chat window button options."] = true,
		["chatmenu_desc"] = "Toggles chat menu on and off.",
		["chatmenu_name"] = "Show Chat Menu",
		["Default"] = true,
		["Original Buttons"] = true,
		["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
		["reflow_name"] = "Text Flows Around",
		["reminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
		["reminder_name"] = "Show ScrollDown Reminder",
		["Right, Inside Frame"] = true,
		["Right, Outside Frame"] = true,
		["Set Position"] = true,
		["Sets position of chat menu and arrows for all chat windows."] = true,
		["Show Arrows"] = true,
		["Show Chat%d Arrows"] = true,
		["Toggle showing chat arrows for each chat window."] = true,
		["Toggles navigation arrows on and off."] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["OriginalButtons"] = {
		--[[Translation missing --]]
		["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
		--[[Translation missing --]]
		["alpha_name"] = "Set Alpha",
		--[[Translation missing --]]
		["buttonframe_desc"] = "Toggles the button frame menu on and off.",
		--[[Translation missing --]]
		["buttonframe_name"] = "Show Button Frame",
		--[[Translation missing --]]
		["ChannelNames"] = "ChannelNames",
		--[[Translation missing --]]
		["Chat window button options."] = "Chat window button options.",
		--[[Translation missing --]]
		["chatmenu_desc"] = "Toggles chat menu on and off.",
		--[[Translation missing --]]
		["chatmenu_name"] = "Show Chat Menu",
		--[[Translation missing --]]
		["Default"] = "Default",
		--[[Translation missing --]]
		["Original Buttons"] = "Original Buttons",
		--[[Translation missing --]]
		["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
		--[[Translation missing --]]
		["reflow_name"] = "Text Flows Around",
		--[[Translation missing --]]
		["reminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
		--[[Translation missing --]]
		["reminder_name"] = "Show ScrollDown Reminder",
		--[[Translation missing --]]
		["Right, Inside Frame"] = "Right, Inside Frame",
		--[[Translation missing --]]
		["Right, Outside Frame"] = "Right, Outside Frame",
		--[[Translation missing --]]
		["Set Position"] = "Set Position",
		--[[Translation missing --]]
		["Sets position of chat menu and arrows for all chat windows."] = "Sets position of chat menu and arrows for all chat windows.",
		--[[Translation missing --]]
		["Show Arrows"] = "Show Arrows",
		--[[Translation missing --]]
		["Show Chat%d Arrows"] = "Show Chat%d Arrows",
		--[[Translation missing --]]
		["Toggle showing chat arrows for each chat window."] = "Toggle showing chat arrows for each chat window.",
		--[[Translation missing --]]
		["Toggles navigation arrows on and off."] = "Toggles navigation arrows on and off.",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["OriginalButtons"] = {
		--[[Translation missing --]]
		["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
		--[[Translation missing --]]
		["alpha_name"] = "Set Alpha",
		--[[Translation missing --]]
		["buttonframe_desc"] = "Toggles the button frame menu on and off.",
		--[[Translation missing --]]
		["buttonframe_name"] = "Show Button Frame",
		["ChannelNames"] = true,
		--[[Translation missing --]]
		["Chat window button options."] = "Chat window button options.",
		--[[Translation missing --]]
		["chatmenu_desc"] = "Toggles chat menu on and off.",
		--[[Translation missing --]]
		["chatmenu_name"] = "Show Chat Menu",
		["Default"] = "Padrão",
		["Original Buttons"] = "Botões Originais",
		--[[Translation missing --]]
		["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
		--[[Translation missing --]]
		["reflow_name"] = "Text Flows Around",
		--[[Translation missing --]]
		["reminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
		--[[Translation missing --]]
		["reminder_name"] = "Show ScrollDown Reminder",
		["Right, Inside Frame"] = "Direito, Dentro do Frame",
		--[[Translation missing --]]
		["Right, Outside Frame"] = "Right, Outside Frame",
		["Set Position"] = "Definir Posição",
		--[[Translation missing --]]
		["Sets position of chat menu and arrows for all chat windows."] = "Sets position of chat menu and arrows for all chat windows.",
		["Show Arrows"] = "Mostrar Setas",
		--[[Translation missing --]]
		["Show Chat%d Arrows"] = "Show Chat%d Arrows",
		--[[Translation missing --]]
		["Toggle showing chat arrows for each chat window."] = "Toggle showing chat arrows for each chat window.",
		--[[Translation missing --]]
		["Toggles navigation arrows on and off."] = "Toggles navigation arrows on and off.",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)


L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "Définir l'alpha du menu du chat et des flèches pour toutes les fenêtres.",
		["alpha_name"] = "Définir l'alpha",
		--[[Translation missing --]]
		["buttonframe_desc"] = "Toggles the button frame menu on and off.",
		--[[Translation missing --]]
		["buttonframe_name"] = "Show Button Frame",
		["ChannelNames"] = "Noms-des-Canaux",
		["Chat window button options."] = "Bouton d'options de la fenêtre de chat.",
		["chatmenu_desc"] = "Activer et désactiver le menu du chat",
		["chatmenu_name"] = "Afficher le menu de chat",
		["Default"] = "Défaut",
		["Original Buttons"] = "Boutons d'origine",
		--[[Translation missing --]]
		["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
		--[[Translation missing --]]
		["reflow_name"] = "Text Flows Around",
		["reminder_desc"] = "Montrer une icône de rappel lorsque vous n'êtes pas en bas de la fenêtre de chat",
		["reminder_name"] = "Montrer un rappel pour le défilement vers le bas",
		["Right, Inside Frame"] = "Droite, Dans le cadre",
		["Right, Outside Frame"] = "Droite, En dehors du cadre",
		["Set Position"] = "Définir la position",
		["Sets position of chat menu and arrows for all chat windows."] = "Définir la position du menu de chat et des flèches pour toute les fenêtres.",
		["Show Arrows"] = "Afficher les flèches",
		["Show Chat%d Arrows"] = "Montrer les flèches du Chat%d",
		["Toggle showing chat arrows for each chat window."] = "Activer les flèches de chat pour chaque fenêtre de chat",
		["Toggles navigation arrows on and off."] = "Activer et désactiver les flèches de navigation",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR",L)




L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "Transparenz des Chatmenüs sowie der Navigationspfeile für alle Chatfenster einstellen.",
		["alpha_name"] = "Transparenz einstellen",
		["buttonframe_desc"] = "Schaltfächenrahmen-Menü anzeigen/verbergen",
		["buttonframe_name"] = "Schaltfächenrahmen anzeigen",
		["ChannelNames"] = "Kanalnamen",
		["Chat window button options."] = "Optionen für Schaltflächen im Chatfenster.",
		["chatmenu_desc"] = "Ein-/Ausschalten des Chatmenüs",
		["chatmenu_name"] = "Chatmenü anzeigen",
		["Default"] = "Standard",
		["Original Buttons"] = "Standardschaltflächen",
		["reflow_desc"] = "Chatfenster-Text soll um die Schaltflächen herum fließen, nicht unter sie.",
		["reflow_name"] = "Umfließungstext",
		["reminder_desc"] = "Erinnerungsschaltfläche anzeigen, wenn du dich nicht am unteren Rand eines Chatfensters befindest.",
		["reminder_name"] = "Runterscrollen-Erinnerung anzeigen",
		["Right, Inside Frame"] = "Rechts, innerhalb des Rahmens",
		["Right, Outside Frame"] = "Rechts, außerhalb des Rahmens",
		["Set Position"] = "Position festlegen",
		["Sets position of chat menu and arrows for all chat windows."] = "Position von Chatmenü und -pfeilen für alle Fenster festlegen.",
		["Show Arrows"] = "Scrollsymbole anzeigen",
		["Show Chat%d Arrows"] = "%d -Chat-Pfeile anzeigen",
		["Toggle showing chat arrows for each chat window."] = "Ein-/Ausschalten der Chatpfeile für jedes Chatfenster.",
		["Toggles navigation arrows on and off."] = "Ein-/Ausschalten der Navigationspfeile",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)


L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "모든 대화창의 대화 메뉴와 화살표의 투명도를 설정합니다.",
		["alpha_name"] = "투명도 설정",
		["buttonframe_desc"] = "버튼 프레임 메뉴를 켜거나 끕니다.",
		["buttonframe_name"] = "버튼 프레임 표시",
		["ChannelNames"] = "채널 이름",
		["Chat window button options."] = "대화창 버튼 옵션입니다.",
		["chatmenu_desc"] = "대화 메뉴를 표시하거나 숨깁니다.",
		["chatmenu_name"] = "대화 메뉴 표시",
		["Default"] = "기본값",
		["Original Buttons"] = "오리지날 버튼",
		["reflow_desc"] = "대화창 문자를 버튼과 겹치지 않게 합니다.",
		["reflow_name"] = "문자 겹침 방지",
		["reminder_desc"] = "대화창이 최하단이 아닐 때 맨 아래로 버튼을 표시합니다.",
		["reminder_name"] = "맨 아래로 버튼 표시",
		["Right, Inside Frame"] = "오른쪽, 프레임 내부",
		["Right, Outside Frame"] = "오른쪽, 프레임 외부",
		["Set Position"] = "위치 설정",
		["Sets position of chat menu and arrows for all chat windows."] = "모든 대화창에서 대화 메뉴와 화살표의 위치를 설정합니다.",
		["Show Arrows"] = "화살표 표시",
		["Show Chat%d Arrows"] = "대화창%d 화살표 표시",
		["Toggle showing chat arrows for each chat window."] = "각 대화창 별로 화살표 표시 기능을 켜거나 끕니다.",
		["Toggles navigation arrows on and off."] = "탐색 화살표를 켜거나 끕니다.",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",L)

L = {
	["OriginalButtons"] = {
		--[[Translation missing --]]
		["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
		--[[Translation missing --]]
		["alpha_name"] = "Set Alpha",
		--[[Translation missing --]]
		["buttonframe_desc"] = "Toggles the button frame menu on and off.",
		--[[Translation missing --]]
		["buttonframe_name"] = "Show Button Frame",
		--[[Translation missing --]]
		["ChannelNames"] = "ChannelNames",
		--[[Translation missing --]]
		["Chat window button options."] = "Chat window button options.",
		--[[Translation missing --]]
		["chatmenu_desc"] = "Toggles chat menu on and off.",
		--[[Translation missing --]]
		["chatmenu_name"] = "Show Chat Menu",
		--[[Translation missing --]]
		["Default"] = "Default",
		--[[Translation missing --]]
		["Original Buttons"] = "Original Buttons",
		--[[Translation missing --]]
		["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
		--[[Translation missing --]]
		["reflow_name"] = "Text Flows Around",
		--[[Translation missing --]]
		["reminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
		--[[Translation missing --]]
		["reminder_name"] = "Show ScrollDown Reminder",
		--[[Translation missing --]]
		["Right, Inside Frame"] = "Right, Inside Frame",
		--[[Translation missing --]]
		["Right, Outside Frame"] = "Right, Outside Frame",
		--[[Translation missing --]]
		["Set Position"] = "Set Position",
		--[[Translation missing --]]
		["Sets position of chat menu and arrows for all chat windows."] = "Sets position of chat menu and arrows for all chat windows.",
		--[[Translation missing --]]
		["Show Arrows"] = "Show Arrows",
		--[[Translation missing --]]
		["Show Chat%d Arrows"] = "Show Chat%d Arrows",
		--[[Translation missing --]]
		["Toggle showing chat arrows for each chat window."] = "Toggle showing chat arrows for each chat window.",
		--[[Translation missing --]]
		["Toggles navigation arrows on and off."] = "Toggles navigation arrows on and off.",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",L)

L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "Установить прозрачность меню чата, а также стрелок для всех окон чата.",
		["alpha_name"] = "Прозрачность",
		["buttonframe_desc"] = "Включить или выключить меню Окна кнопок.",
		["buttonframe_name"] = "Показать Окно кнопок",
		["ChannelNames"] = "Названия каналов",
		["Chat window button options."] = "Опции кнопок чата.",
		["chatmenu_desc"] = "Вкл/выкл меню чата.",
		["chatmenu_name"] = "Показать меню чата",
		["Default"] = "По умолчанию",
		["Original Buttons"] = "Обычные кнопки",
		["reflow_desc"] = "Текст в окне чата должен обтекать кнопки, а не уходить под них.",
		["reflow_name"] = "Текст обтекает кнопки",
		["reminder_desc"] = "Показать кнопку прокрутки чата вниз, когда последнее сообщение не в нижней части окна чата.",
		["reminder_name"] = "Показать прокрутку вниз",
		["Right, Inside Frame"] = "Справа, внутри рамки",
		["Right, Outside Frame"] = "Справа, вне рамки",
		["Set Position"] = "Установить позицию",
		["Sets position of chat menu and arrows for all chat windows."] = "Устанавливает позицию меню чата и стрелок для всех окон чата",
		["Show Arrows"] = "Отображать стрелки",
		["Show Chat%d Arrows"] = "Отображает стрелки чата %d",
		["Toggle showing chat arrows for each chat window."] = "Вкл/Откл отображение стрелок для всех окон чата.",
		["Toggles navigation arrows on and off."] = "Вкл/Откл отображение стрелок прокрутки чата",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",L)

L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "设置所有聊天窗口里聊天菜单和聊天箭头的透明度。",
		["alpha_name"] = "设置透明度",
		["buttonframe_desc"] = "切换框架菜单按钮开关.",
		["buttonframe_name"] = "显示框架按钮",
		["ChannelNames"] = "频道名字",
		["Chat window button options."] = "聊天窗口按钮选项.",
		["chatmenu_desc"] = "开启或关闭聊天菜单。",
		["chatmenu_name"] = "显示聊天菜单",
		["Default"] = "默认",
		["Original Buttons"] = "初始按钮",
		["reflow_desc"] = "聊天框文字应该此按钮而非位于其下方",
		["reflow_name"] = "文字环绕",
		["reminder_desc"] = "当不在聊天窗口底部时显示提醒按钮。",
		["reminder_name"] = "显示鼠标滚动提醒器",
		["Right, Inside Frame"] = "右边,框体内",
		["Right, Outside Frame"] = "右边,框体外",
		["Set Position"] = "设置位置",
		["Sets position of chat menu and arrows for all chat windows."] = "设置所有聊天窗口的聊天菜单和箭头的位置.",
		["Show Arrows"] = "显示箭头",
		["Show Chat%d Arrows"] = "显示 聊天框%d 箭头",
		["Toggle showing chat arrows for each chat window."] = "在每个聊天窗口显示聊天箭头。",
		["Toggles navigation arrows on and off."] = "开启或关闭导航箭头。",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",L)

L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "Establece la transparencia del menú y de las flechas en todas las ventanas de chat.",
		["alpha_name"] = "Establecer Transparencia",
		--[[Translation missing --]]
		["buttonframe_desc"] = "Toggles the button frame menu on and off.",
		--[[Translation missing --]]
		["buttonframe_name"] = "Show Button Frame",
		["ChannelNames"] = "NombreCanales",
		["Chat window button options."] = "Opciones de los botones de la ventana de chat.",
		["chatmenu_desc"] = "Alterna activación del menú de chat.",
		["chatmenu_name"] = "Mostrar Ménu de Chat",
		["Default"] = "Predeterminado",
		["Original Buttons"] = "Botones Originales",
		["reflow_desc"] = "Flujo del texto del marco de chat alrededor de los botones no por debajo de ellos.",
		["reflow_name"] = "Flujo Texto Alrededor",
		["reminder_desc"] = "Muestra el botón de recordatorio cuando no se está en la parte inferior de la ventana de chat.",
		["reminder_name"] = "Mostrar Recordatorio de Desplazamiento Abajo",
		["Right, Inside Frame"] = "Derecha, Interior del Marco",
		["Right, Outside Frame"] = "Derecha, Exterior del Marco",
		["Set Position"] = "Establecer Posición",
		["Sets position of chat menu and arrows for all chat windows."] = "Establece la posición del menú y de las flechas para todas las ventanas de chat.",
		["Show Arrows"] = "Mostrar Flechas",
		["Show Chat%d Arrows"] = "Mostrar Flechas del Chat %d",
		["Toggle showing chat arrows for each chat window."] = "Alterna mostrar las flechas en cada ventana de chat.",
		["Toggles navigation arrows on and off."] = "Alterna activación de flechas de navegación.",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",L)

L = {
	["OriginalButtons"] = {
		["alpha_desc"] = "為所有聊天視窗選單以及箭頭設定透明度",
		["alpha_name"] = "設定透明度",
		["buttonframe_desc"] = "切換按鍵框架選項",
		["buttonframe_name"] = "顯示按鍵框架",
		["ChannelNames"] = "頻道名稱",
		["Chat window button options."] = "聊天視窗按鈕選項。",
		["chatmenu_desc"] = "切換聊天選單開啟/關閉",
		["chatmenu_name"] = "顯示聊天選單",
		["Default"] = "預設值",
		["Original Buttons"] = "預設按鈕",
		--[[Translation missing --]]
		["reflow_desc"] = "Chatframe text should flow around the buttons not under them.",
		["reflow_name"] = "文字流動環繞",
		["reminder_desc"] = "顯示按鈕提醒當聊天視窗未在最底層時",
		["reminder_name"] = "顯示下方箭頭提示",
		["Right, Inside Frame"] = "右側，視窗內部",
		["Right, Outside Frame"] = "左側，視窗外部",
		["Set Position"] = "設置位置",
		["Sets position of chat menu and arrows for all chat windows."] = "為所有聊天視窗設定聊天選單以及箭頭位置",
		["Show Arrows"] = "顯示箭頭",
		["Show Chat%d Arrows"] = "顯示聊天 %d 箭頭",
		["Toggle showing chat arrows for each chat window."] = "為所有聊天視窗啟用聊天箭頭。",
		["Toggles navigation arrows on and off."] = "切換是否啟用導覽箭頭",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@


  --module.moduleName = PL["Buttons"]
  --module.moduleDesc = PL["Chat window button options."]
  --module.consoleName = "buttons"
  --module.guiName = PL["Buttons"]
  --module.Categories = { cat.BUTTON, cat.FRAME }

  -- define the default db values
  --module.defaultDB = {
  --    on = true,
  --    chatmenu = false,
  --    chatbutton = {false, false, false, false, false, false, false},
  --    position = "DEFAULT",
  --    reminder = false,
  --    alpha = 1.0,
  --}

  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
      chatmenu = false,
      chatarrows = { ["*"] = true },
      position = "RIGHTINSIDE",
      reminder = true,
      reflow = false,
      alpha = 1.0,
      buttonframe = false,
      friendsbutton = false,
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL["Original Buttons"],
    desc = PL["Chat window button options."],
    type = "group",
    args = {
      chatarrows = {
        name = PL["Show Arrows"],
        desc = PL["Toggle showing chat arrows for each chat window."],
        order = 120,
        get = "GetSubValue",
        set = "SetSubValue",
        type = "multiselect",
        values = Prat.FrameList,
      },
      chatmenu = {
        type = "toggle",
        order = 110,
        name = PL["chatmenu_name"],
        desc = PL["chatmenu_desc"],
        get = function(info) return module.db.profile.chatmenu end,
        set = function(info, v) module.db.profile.chatmenu = v module:ChatMenu(v) end,
      },
      buttonframe = {
        type = "toggle",
        order = 110,
        name = PL["buttonframe_name"],
        desc = PL["buttonframe_desc"],
        get = function(info) return module.db.profile.buttonframe end,
        set = function(info, v) module.db.profile.buttonframe = v module:ConfigureAllFrames() end,
      },
      reminder = {
        type = "toggle",
        name = PL["reminder_name"],
        desc = PL["reminder_desc"],
        get = function(info) return module.db.profile.reminder end,
        set = function(info, v) module.db.profile.reminder = v end,
      },
      reflow = {
        type = "toggle",
        name = PL["reflow_name"],
        desc = PL["reflow_desc"],
        get = function(info) return module.db.profile.reflow end,
        set = function(info, v) module.db.profile.reflow = v if v then Prat.Addon:GetModule("SMFHax", true):Enable() end end,
        hidden = function(info) return Prat.Addon:GetModule("SMFHax", true) == nil end,
      },
      alpha = {
        name = PL["alpha_name"],
        desc = PL["alpha_desc"],
        type = "range",
        set = function(info, v) module.db.profile.alpha = v; module:ConfigureAllFrames() end,
        min = 0.1,
        max = 1,
        step = 0.1,
        order = 150,
        get = function(info) return module.db.profile.alpha end,
      },
      position = {
        name = PL["Set Position"],
        desc = PL["Sets position of chat menu and arrows for all chat windows."],
        type = "select",
        order = 140,
        get = function(info) return module.db.profile.position end,
        set = function(info, v) module.db.profile.position = v; module:ConfigureAllFrames() end,
        values = { ["DEFAULT"] = PL["Default"], ["RIGHTINSIDE"] = PL["Right, Inside Frame"], ["RIGHTOUTSIDE"] = PL["Right, Outside Frame"] }
      }
    }
  })

  local function hide(self)
    self:Hide()
  end

  function module:OnSubValueChanged(info, val, b)
    self:chatbutton(_G[val]:GetID(), b)
  end


  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    local buttons3 = Prat.Addon:GetModule("Buttons", true)
    if buttons3 and buttons3:IsEnabled() then
      self.disabledB3 = true
      buttons3.db.profile.on = false
      buttons3:Disable()
      LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")
    end
    -- stub variables for frame handling
    self.frames = {}
    self.reminders = {}
    for i = 1, 10 do
      table.insert(self.reminders, self:MakeReminder(i))
      self:chatbutton(i, self.db.profile.chatarrows["ChatFrame" .. i])
      self:ButtonFrame(i, self.db.profile.buttonframe)
    end
    self:ChatMenu(self.db.profile.chatmenu)
    if QuickJoinToastButton then QuickJoinToastButton:Hide() end

    -- set OnUpdateInterval, if they are profiling, update less
    --    if GetCVar("scriptProfile") == "1" then
    --        self.OnUpdateInterval = 0.5
    --    else
    --        self.OnUpdateInterval = 0.05
    --    end

    --    local smfhax = Prat.Addon:GetModule("SMFHax", true)
    --    if self.db.profile.reflow and smfhax then
    --        smfhax:Enable()
    --    end

    self.OnUpdateInterval = 0.05
    self.lastupdate = 0
    -- hook functions
    self:SecureHook("ChatFrame_OnUpdate", "ChatFrame_OnUpdateHook")
    self:SecureHook("FCF_SetTemporaryWindowType")
  end

  -- things to do when the module is disabled
  function module:OnModuleDisable()
    -- show chatmenu
    self:ChatMenu(true)
    -- show all the chatbuttons
    for i = 1, NUM_CHAT_WINDOWS do
      self:chatbutton(i, true)
    end
    -- unhook functions
    self:UnhookAll()
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  function module:GetDescription()
    return PL["Original Buttons"]
  end

  function module:FCF_SetTemporaryWindowType(chatFrame, ...)
    local i = chatFrame:GetID()

    self:chatbutton(i, self.db.profile.chatarrows[chatFrame:GetName()])
    self:ButtonFrame(i, self.db.profile.buttonframe)
  end

  function module:ConfigureAllFrames()
    for name, frame in pairs(Prat.Frames) do
      local i = frame:GetID()
      self:chatbutton(i, self.db.profile.chatarrows[name])
      self:ButtonFrame(i, self.db.profile.buttonframe)
    end
    self:ChatMenu(self.db.profile.chatmenu)

    if QuickJoinToastButton then QuickJoinToastButton:Hide() end
  end

  function module:ChatFrame_OnUpdateHook(this, elapsed)
    if not this:IsVisible() and not this:IsShown() then return end
    self.lastupdate = self.lastupdate + elapsed

    while (self.lastupdate > self.OnUpdateInterval) do
      self:ChatFrame_OnUpdate(this, elapsed)
      self.lastupdate = self.lastupdate - self.OnUpdateInterval;
    end
  end


  do
    local anims = nil
    function module:ChatFrame_OnUpdate(this, elapsed)
      if (not this:IsShown()) then
        return;
      end

      local id = this:GetID()
      local prof = self.db.profile
      local show = prof.chatarrows[this:GetName()]

      self:chatbutton(id, show)
      --self:ChatFrame_OnUpdateTextFlow(this, elapsed)

      -- This is all code for the 'reminder' from here on
      if show then
        return
      end
      if not prof.reminder then
        return
      end
      local remind = _G[this:GetName() .. "ScrollDownReminder"];
      local flash = _G[this:GetName() .. "ScrollDownReminderFlash"];
      if (not flash) then
        return
      end
      if not anims then anims = {} end
      if not anims[flash] then
        anims[flash] = flash:CreateAnimationGroup()

        local fade1 = anims[flash]:CreateAnimation("Alpha")
        fade1:SetDuration(0.1)
        fade1:SetToAlpha(1)
        fade1:SetEndDelay(0.5)
        fade1:SetOrder(1)

        local fade2 = anims[flash]:CreateAnimation("Alpha")
        fade2:SetDuration(0.1)
        fade2:SetToAlpha(-1)
        fade2:SetEndDelay(0.5)
        fade2:SetOrder(2)
      end
      if (this:AtBottom()) then
        if (remind:IsShown()) then
          remind:Hide();
          anims[flash]:Stop()
        end
        return;
      else
        if (remind:IsShown()) then
          return
        end
        remind:Show()
        flash:Show()
        flash:SetAlpha(0)
        anims[flash]:SetLooping("REPEAT")
        anims[flash]:Play()
      end
    end
  end

  function module:ButtonFrame(id, visible)
    if not Prat.BN_CHAT then return end

    local f = _G["ChatFrame" .. id .. "ButtonFrame"]
    local cf = _G["ChatFrame" .. id]

    if visible then
      f:SetScript("OnShow", nil)
      f:Show()
      f:SetWidth(29)
      --        cf:AddMessage("Show Button Frame")
    else
      f:SetScript("OnShow", hide)
      f:Hide()

      f:SetWidth(0.1)
      --        cf:AddMessage("Hide Button Frame")
    end
  end

  -- manipulate chatframe menu button
  function module:ChatMenu(visible)
    local ChatFrameMenuButton = ChatFrameMenuButton
    -- define variables used
    local f = self.frames[1]
    if not f then
      self.frames[1] = {}
      f = self.frames[1]
    end
    f.cfScrl = f.cfScrl or {}
    f.cfScrl.up = _G["ChatFrame1ButtonFrameUpButton"]
    -- chatmenu position:
    -- position chatmenu under the UpButton for chatframe1 if button position is set to "RIGHTINSIDE"
    -- otherwise position chatmenu above the UpButton for chatframe1
    ChatFrameMenuButton:ClearAllPoints()
    if self.db.profile.position == "RIGHTINSIDE" then
      ChatFrameMenuButton:SetPoint("TOP", f.cfScrl.up, "BOTTOM")
    else
      ChatFrameMenuButton:SetPoint("BOTTOM", f.cfScrl.up, "TOP")
    end
    -- chatmenu alpha:
    -- set alpha of the chatmenu based on the alpha setting
    ChatFrameMenuButton:SetAlpha(self.db.profile.alpha)
    -- chatmenu visibility
    -- show buttons based on show settings
    if visible then
      ChatFrameMenuButton:SetScript("OnShow", nil)
      ChatFrameMenuButton:Show()
    else
      ChatFrameMenuButton:Hide()
      ChatFrameMenuButton:SetScript("OnShow", hide)
    end
  end



  -- manipulate chatframe scrolling and reminder buttons
  function module:chatbutton(id, visible)
    -- define variables used
    local f = self.frames[id]
    --local id = this:GetID()
    if not f then
      self.frames[id] = {}
      f = self.frames[id]
    end

    f.cfScrl = f.cfScrl or {}
    f.cf = f.cf or _G["ChatFrame" .. id]
    if Prat.BN_CHAT then
      f.cfScrl.up = f.cfScrl.up or _G["ChatFrame" .. id .. "ButtonFrameUpButton"]
      f.cfScrl.down = f.cfScrl.down or _G["ChatFrame" .. id .. "ButtonFrameDownButton"]
      f.cfScrl.bottom = f.cfScrl.bottom or _G["ChatFrame" .. id .. "ButtonFrameBottomButton"]
      f.cfScrl.min = f.cfScrl.min or _G["ChatFrame" .. id .. "ButtonFrameMinimizeButton"]

      if f.cfScrl.up then
        f.cfScrl.up:SetParent(f.cf)
        f.cfScrl.down:SetParent(f.cf)
        f.cfScrl.bottom:SetParent(f.cf)
        f.cfScrl.min:SetParent(_G[f.cf:GetName() .. "Tab"])

        f.cfScrl.min:SetScript("OnShow",
          function(self)
            if f.cf.isDocked then
              self:Hide()
            end
          end)

        f.cfScrl.min:SetScript("OnClick",
          function(self)
            FCF_MinimizeFrame(f.cf, strupper(f.cf.buttonSide))
          end)

        f.cfScrl.up:SetScript("OnClick", function() PlaySound(SOUNDKIT.IG_CHAT_SCROLL_UP); f.cf:ScrollUp() end)
        f.cfScrl.down:SetScript("OnClick", function() PlaySound(SOUNDKIT.IG_CHAT_SCROLL_DOWN); f.cf:ScrollDown() end)
        f.cfScrl.bottom:SetScript("OnClick", function() PlaySound(SOUNDKIT.IG_CHAT_BOTTOM); f.cf:ScrollToBottom() end)
      end
    else
      f.cfScrl.up = f.cfScrl.up or _G["ChatFrame" .. id .. "UpButton"]
      f.cfScrl.down = f.cfScrl.down or _G["ChatFrame" .. id .. "DownButton"]
      f.cfScrl.bottom = f.cfScrl.bottom or _G["ChatFrame" .. id .. "BottomButton"]
    end

    f.cfScrlheight = (f.cfScrlheight and f.cfScrlheight > 0) and f.cfScrlheight or ((f.cfScrl.up and f.cfScrl.down and f.cfScrl.bottom) and
      (f.cfScrl.up:GetHeight() + f.cfScrl.down:GetHeight() + f.cfScrl.bottom:GetHeight()) or 0)
    f.cfreminder = f.cfreminder or self:MakeReminder(id)
    f.cfreminderflash = f.cfreminderflash or _G["ChatFrame" .. id .. "ScrollDownReminderFlash"]

    -- chatbuttons position:
    -- position of the chatbuttons based on position setting
    if f.cfScrl.bottom and f.cfScrl.up then
      f.cfScrl.bottom:ClearAllPoints()
      f.cfScrl.up:ClearAllPoints()
      if self.db.profile.position == "RIGHTINSIDE" then
        f.cfScrl.bottom:SetPoint("BOTTOMRIGHT", f.cf, "BOTTOMRIGHT", 0, -4)
        f.cfScrl.up:SetPoint("TOPRIGHT", f.cf, "TOPRIGHT", 0, -4)
      elseif self.db.profile.position == "RIGHTOUTSIDE" then
        f.cfScrl.bottom:SetPoint("BOTTOMLEFT", f.cf, "BOTTOMRIGHT", 0, -4)
        f.cfScrl.up:SetPoint("BOTTOM", f.cfScrl.down, "TOP", 0, -2)
      else
        f.cfScrl.bottom:SetPoint("BOTTOMLEFT", f.cf, "BOTTOMLEFT", -32, -4)
        f.cfScrl.up:SetPoint("BOTTOM", f.cfScrl.down, "TOP", 0, -2)
      end
    end

    -- chatbuttons alpha:
    -- set alpha of the chatbuttons based on the alpha setting
    for _, v in pairs(f.cfScrl) do
      v:SetAlpha(self.db.profile.alpha)
    end
    -- chatbuttons visibility:
    -- show buttons based on visible value passed to function
    if f.cf then
      if visible and (f.cf:GetHeight() > f.cfScrlheight) then
        for k, v in pairs(f.cfScrl) do
          f.cfScrl[k]:Show()
        end
      else
        for k, v in pairs(f.cfScrl) do
          f.cfScrl[k]:Hide()
        end
        -- reminder visibility:
        -- show the reminder button (if enabled) when not at the bottom of the chatframe
        if (not f.cf:AtBottom()) and self.db.profile.reminder and (f.cf:GetHeight() > f.cfreminder:GetHeight()) then
          local b = f.cfreminder
          b:ClearAllPoints()
          if f.cf:GetJustifyH() == "RIGHT" then
            b:SetPoint("LEFT", f.cf, "LEFT", 0, 0)
            b:SetPoint("RIGHT", f.cf, "LEFT", 32, 0)
            b:SetPoint("TOP", f.cf, "BOTTOM", 0, 28)
            b:SetPoint("BOTTOM", f.cf, "BOTTOM", 0, 0)
          elseif f.cf:GetJustifyH() == "LEFT" then
            b:SetPoint("RIGHT", f.cf, "RIGHT", 0, 0)
            b:SetPoint("LEFT", f.cf, "RIGHT", -32, 0)
            b:SetPoint("TOP", f.cf, "BOTTOM", 0, 28)
            b:SetPoint("BOTTOM", f.cf, "BOTTOM", 0, 0)
          end

          f.cfreminder:Show()
          f.cfreminderflash:Show()
        else
          f.cfreminder:Hide()
          f.cfreminderflash:Hide()
        end
      end
    end
  end

  -- create a "reminder" button
  function module:MakeReminder(id)
    -- define variables used
    local cf = _G["ChatFrame" .. id]
    local b = _G["ChatFrame" .. id .. "ScrollDownReminder"]
    if b then return b end
    b = CreateFrame("Button", "ChatFrame" .. id .. "ScrollDownReminder", cf)
    -- define the parameters for the button
    b:SetFrameStrata("BACKGROUND")
    b:SetWidth(24)
    b:SetHeight(24)
    b:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
    b:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
    b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
    b:SetPoint("RIGHT", cf, "RIGHT", 0, 0)
    b:SetPoint("LEFT", cf, "RIGHT", -32, 0)
    b:SetPoint("TOP", cf, "BOTTOM", 0, 28)
    b:SetPoint("BOTTOM", cf, "BOTTOM", 0, 0)
    b:SetScript("OnClick", function() PlaySound(SOUNDKIT.IG_CHAT_BOTTOM); cf:ScrollToBottom() end)
    -- hide the button by default
    b:Hide()
    -- add a flash texture for the reminder button
    self:AddFlashTexture(b)

    return b
  end

  -- create a "flash" texture
  function module:AddFlashTexture(frame)
    -- define variables used
    local t = frame:CreateTexture(frame:GetName() .. "Flash", "OVERLAY")
    -- define the parameters for the texture
    t:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
    t:SetPoint("CENTER", frame, "CENTER", 0, 1)
    t:SetBlendMode("ADD")
    t:SetAlpha(0.5)
    -- hide the texture by default
    t:Hide()
  end

  return
end) -- Prat:AddModuleToLoad