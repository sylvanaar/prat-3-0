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

  local PRAT_MODULE = Prat:RequestModuleName("Font")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0")

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["Font"] = true,
    ["Chat window font options."] = true,
    ["Set Separately"] = true,
    ["Toggle setting options separately for each chat window."] = true,
    ["Set Font Face"] = true,
    ["Set the text font face for all chat windows."] = true,
    ["rememberfont_name"] = "Remember Font",
    ["rememberfont_desc"] = "Remember your font choice and restore it at startup.",
    ["Set Font Size"] = true,
    ["Set text font size for each chat window."] = true,
    ["Set ChatFrame%d Font Size"] = true,
    ["Set text font size."] = true,
    ["Auto Restore Font Size"] = true,
    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = true,
    ["outlinemode_name"] = "Set Outline Mode",
    ["outlinemode_desc"] = "Sets mode for the outline around the font.",
    ["None"] = true,
    ["Outline"] = true,
    ["Thick Outline"] = true,
    ["monochrome_name"] = "Toggle Monochrome",
    ["monochrome_desc"] = "Toggles monochrome coloring of the font.",
    ["shadowcolor_name"] = "Set Shadow Color",
    ["shadowcolor_desc"] = "Set the color of the shadow effect.",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Font"] = {
		["Auto Restore Font Size"] = true,
		["Chat window font options."] = true,
		["Font"] = true,
		["monochrome_desc"] = "Toggles monochrome coloring of the font.",
		["monochrome_name"] = "Toggle Monochrome",
		["None"] = true,
		["Outline"] = true,
		["outlinemode_desc"] = "Sets mode for the outline around the font.",
		["outlinemode_name"] = "Set Outline Mode",
		["rememberfont_desc"] = "Remember your font choice and restore it at startup.",
		["rememberfont_name"] = "Remember Font",
		["Set ChatFrame%d Font Size"] = true,
		["Set Font Face"] = true,
		["Set Font Size"] = true,
		["Set Separately"] = true,
		["Set text font size for each chat window."] = true,
		["Set text font size."] = true,
		["Set the text font face for all chat windows."] = true,
		["shadowcolor_desc"] = "Set the color of the shadow effect.",
		["shadowcolor_name"] = "Set Shadow Color",
		["Thick Outline"] = true,
		["Toggle setting options separately for each chat window."] = true,
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["Font"] = {
		--[[Translation missing --]]
		["Auto Restore Font Size"] = "Auto Restore Font Size",
		--[[Translation missing --]]
		["Chat window font options."] = "Chat window font options.",
		--[[Translation missing --]]
		["Font"] = "Font",
		--[[Translation missing --]]
		["monochrome_desc"] = "Toggles monochrome coloring of the font.",
		--[[Translation missing --]]
		["monochrome_name"] = "Toggle Monochrome",
		--[[Translation missing --]]
		["None"] = "None",
		--[[Translation missing --]]
		["Outline"] = "Outline",
		--[[Translation missing --]]
		["outlinemode_desc"] = "Sets mode for the outline around the font.",
		--[[Translation missing --]]
		["outlinemode_name"] = "Set Outline Mode",
		--[[Translation missing --]]
		["rememberfont_desc"] = "Remember your font choice and restore it at startup.",
		--[[Translation missing --]]
		["rememberfont_name"] = "Remember Font",
		--[[Translation missing --]]
		["Set ChatFrame%d Font Size"] = "Set ChatFrame%d Font Size",
		--[[Translation missing --]]
		["Set Font Face"] = "Set Font Face",
		--[[Translation missing --]]
		["Set Font Size"] = "Set Font Size",
		--[[Translation missing --]]
		["Set Separately"] = "Set Separately",
		--[[Translation missing --]]
		["Set text font size for each chat window."] = "Set text font size for each chat window.",
		--[[Translation missing --]]
		["Set text font size."] = "Set text font size.",
		--[[Translation missing --]]
		["Set the text font face for all chat windows."] = "Set the text font face for all chat windows.",
		--[[Translation missing --]]
		["shadowcolor_desc"] = "Set the color of the shadow effect.",
		--[[Translation missing --]]
		["shadowcolor_name"] = "Set Shadow Color",
		--[[Translation missing --]]
		["Thick Outline"] = "Thick Outline",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
		--[[Translation missing --]]
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Workaround a Blizzard bug which changes the font size when you open a system menu.",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["Font"] = {
		--[[Translation missing --]]
		["Auto Restore Font Size"] = "Auto Restore Font Size",
		--[[Translation missing --]]
		["Chat window font options."] = "Chat window font options.",
		--[[Translation missing --]]
		["Font"] = "Font",
		--[[Translation missing --]]
		["monochrome_desc"] = "Toggles monochrome coloring of the font.",
		--[[Translation missing --]]
		["monochrome_name"] = "Toggle Monochrome",
		--[[Translation missing --]]
		["None"] = "None",
		--[[Translation missing --]]
		["Outline"] = "Outline",
		--[[Translation missing --]]
		["outlinemode_desc"] = "Sets mode for the outline around the font.",
		--[[Translation missing --]]
		["outlinemode_name"] = "Set Outline Mode",
		--[[Translation missing --]]
		["rememberfont_desc"] = "Remember your font choice and restore it at startup.",
		--[[Translation missing --]]
		["rememberfont_name"] = "Remember Font",
		--[[Translation missing --]]
		["Set ChatFrame%d Font Size"] = "Set ChatFrame%d Font Size",
		--[[Translation missing --]]
		["Set Font Face"] = "Set Font Face",
		--[[Translation missing --]]
		["Set Font Size"] = "Set Font Size",
		--[[Translation missing --]]
		["Set Separately"] = "Set Separately",
		--[[Translation missing --]]
		["Set text font size for each chat window."] = "Set text font size for each chat window.",
		--[[Translation missing --]]
		["Set text font size."] = "Set text font size.",
		--[[Translation missing --]]
		["Set the text font face for all chat windows."] = "Set the text font face for all chat windows.",
		--[[Translation missing --]]
		["shadowcolor_desc"] = "Set the color of the shadow effect.",
		--[[Translation missing --]]
		["shadowcolor_name"] = "Set Shadow Color",
		--[[Translation missing --]]
		["Thick Outline"] = "Thick Outline",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
		--[[Translation missing --]]
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Workaround a Blizzard bug which changes the font size when you open a system menu.",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)


L = {
	["Font"] = {
		["Auto Restore Font Size"] = "Restauration automatique de la taille du texte",
		["Chat window font options."] = "Options de formatage du texte.",
		["Font"] = "Police",
		["monochrome_desc"] = "Activer/Désactiver la monochromie de la police.",
		["monochrome_name"] = "Monochromie",
		["None"] = "Aucun",
		["Outline"] = "Contour",
		["outlinemode_desc"] = "Définit le contour autour de la police.",
		["outlinemode_name"] = "Contour de la police",
		["rememberfont_desc"] = "Se souvenir de la police du texte et la restaurer au chargement.",
		["rememberfont_name"] = "Mémoriser la police",
		["Set ChatFrame%d Font Size"] = "Définit la taille de la police de la fenêtre de discussion %d",
		["Set Font Face"] = "Police d'écriture",
		["Set Font Size"] = "Taille de la police",
		["Set Separately"] = "Configurer séparément",
		["Set text font size for each chat window."] = "Définir la taille du texte de chaque fenêtre.",
		["Set text font size."] = "Définit la taille du texte.",
		["Set the text font face for all chat windows."] = "Définit la police du texte pour toutes les fenêtres de discussions.",
		["shadowcolor_desc"] = "Définit la couleur de l'ombre.",
		["shadowcolor_name"] = "Couleur de l'ombre",
		["Thick Outline"] = "Contour épais",
		["Toggle setting options separately for each chat window."] = "Activer/Désactiver les options séparées pour chaque fenêtre.",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Contourner un bug de Blizzard qui change la taille de la police quand on ouvre un menu système.",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR",L)




L = {
	["Font"] = {
		["Auto Restore Font Size"] = "Schriftgröße automatisch wiederherstellen",
		["Chat window font options."] = "Optionen für die Schriftart des Chatfensters.",
		["Font"] = "Schrifttyp",
		["monochrome_desc"] = "Einfarbige Einfärbung der Schrift umschalten.",
		["monochrome_name"] = "Einfarbigkeit ein- und ausschalten",
		["None"] = "Keiner",
		["Outline"] = "Umrandung",
		["outlinemode_desc"] = "Stellt Modus für die Umrandung des Schrifttyps ein.",
		["outlinemode_name"] = "Umrandungsmodus einstellen",
		["rememberfont_desc"] = "Deine Wahl des Schrifttyps merken und beim Starten wiederherstellen.",
		["rememberfont_name"] = "Schrifttyp merken",
		["Set ChatFrame%d Font Size"] = "Schriftgröße im Chatfenster %d einstellen",
		["Set Font Face"] = "Schrifttyp einstellen",
		["Set Font Size"] = "Schriftgröße einstellen",
		["Set Separately"] = "Einzeln einstellen",
		["Set text font size for each chat window."] = "Schriftgröße von Text für jedes Chatfenster einstellen.",
		["Set text font size."] = "Schriftgröße von Text einstellen.",
		["Set the text font face for all chat windows."] = "Schriftart von Text für alle Chatfenster einstellen.",
		["shadowcolor_desc"] = "Farbe des Schatteneffekts einstellen.",
		["shadowcolor_name"] = "Schattenfarbe einstellen",
		["Thick Outline"] = "Dicke Umrandung",
		["Toggle setting options separately for each chat window."] = "Optionen einzeln für jedes Chatfenster einstellen umschalten.",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Einen Bug von Blizzard umgehen, welcher die Schriftgröße ändert sobald du ein Systemmenü öffnest.",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)


L = {
	["Font"] = {
		["Auto Restore Font Size"] = "글꼴 크기 자동 복원",
		["Chat window font options."] = "대화창 글꼴 옵션입니다.",
		["Font"] = "글꼴",
		["monochrome_desc"] = "글꼴 그림자 색을 끄고 켭니다.",
		["monochrome_name"] = "그림자 끄고 켜기",
		["None"] = "없음",
		["Outline"] = "외곽선",
		["outlinemode_desc"] = "글꼴의 외곽선을 설정합니다.",
		["outlinemode_name"] = "외곽선 설정",
		["rememberfont_desc"] = "선택한 글꼴을 기억하고 시작할 때 적용합니다.",
		["rememberfont_name"] = "글꼴 기억",
		["Set ChatFrame%d Font Size"] = "대화창%d의 글꼴 크기를 설정합니다.",
		["Set Font Face"] = "글꼴 설정",
		["Set Font Size"] = "글꼴 크기 설정",
		["Set Separately"] = "개별 설정",
		["Set text font size for each chat window."] = "각 대화창 별로 글꼴 크기를 설정합니다.",
		["Set text font size."] = "글꼴 크기를 설정합니다.",
		["Set the text font face for all chat windows."] = "모든 대화창의 글꼴을 설정합니다.",
		["shadowcolor_desc"] = "그림자 색상을 설정합니다.",
		["shadowcolor_name"] = "그림자 색상 설정",
		["Thick Outline"] = "굵은 외곽선",
		["Toggle setting options separately for each chat window."] = "각 대화창 별로 옵션 설정을 끄고 켭니다.",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "시스템 메뉴를 열 때 글꼴 크기를 변경하는 블리자드 버그를 회피합니다.",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",L)

L = {
	["Font"] = {
		--[[Translation missing --]]
		["Auto Restore Font Size"] = "Auto Restore Font Size",
		--[[Translation missing --]]
		["Chat window font options."] = "Chat window font options.",
		--[[Translation missing --]]
		["Font"] = "Font",
		--[[Translation missing --]]
		["monochrome_desc"] = "Toggles monochrome coloring of the font.",
		--[[Translation missing --]]
		["monochrome_name"] = "Toggle Monochrome",
		--[[Translation missing --]]
		["None"] = "None",
		--[[Translation missing --]]
		["Outline"] = "Outline",
		--[[Translation missing --]]
		["outlinemode_desc"] = "Sets mode for the outline around the font.",
		--[[Translation missing --]]
		["outlinemode_name"] = "Set Outline Mode",
		--[[Translation missing --]]
		["rememberfont_desc"] = "Remember your font choice and restore it at startup.",
		--[[Translation missing --]]
		["rememberfont_name"] = "Remember Font",
		--[[Translation missing --]]
		["Set ChatFrame%d Font Size"] = "Set ChatFrame%d Font Size",
		--[[Translation missing --]]
		["Set Font Face"] = "Set Font Face",
		--[[Translation missing --]]
		["Set Font Size"] = "Set Font Size",
		--[[Translation missing --]]
		["Set Separately"] = "Set Separately",
		--[[Translation missing --]]
		["Set text font size for each chat window."] = "Set text font size for each chat window.",
		--[[Translation missing --]]
		["Set text font size."] = "Set text font size.",
		--[[Translation missing --]]
		["Set the text font face for all chat windows."] = "Set the text font face for all chat windows.",
		--[[Translation missing --]]
		["shadowcolor_desc"] = "Set the color of the shadow effect.",
		--[[Translation missing --]]
		["shadowcolor_name"] = "Set Shadow Color",
		--[[Translation missing --]]
		["Thick Outline"] = "Thick Outline",
		--[[Translation missing --]]
		["Toggle setting options separately for each chat window."] = "Toggle setting options separately for each chat window.",
		--[[Translation missing --]]
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Workaround a Blizzard bug which changes the font size when you open a system menu.",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",L)

L = {
	["Font"] = {
		["Auto Restore Font Size"] = "Авто-восстановление размера",
		["Chat window font options."] = "Настройки шрифта окна чата.",
		["Font"] = "Шрифт",
		["monochrome_desc"] = "Вкл/Выкл чёрно-белое окрашивание шрифта.",
		["monochrome_name"] = "Чёрно-белое",
		["None"] = "Нет",
		["Outline"] = "Обычная обводка",
		["outlinemode_desc"] = "Выбор типа обводки вокруг символов.",
		["outlinemode_name"] = "Обводка",
		["rememberfont_desc"] = "Запомнить выбранный шрифт и использовать его при следующей загрузке.",
		["rememberfont_name"] = "Запомнить шрифт",
		["Set ChatFrame%d Font Size"] = "Размер шрифта окна %d",
		["Set Font Face"] = "Основной шрифт",
		["Set Font Size"] = "Размер шрифта",
		["Set Separately"] = "Разделение",
		["Set text font size for each chat window."] = "Установка размера шрифта во всех окнах чата.",
		["Set text font size."] = "Размер шрифта.",
		["Set the text font face for all chat windows."] = "Установка главного шрифта для всех окон чата.",
		["shadowcolor_desc"] = "Установка цвета эффекта тени.",
		["shadowcolor_name"] = "Цвет тени",
		["Thick Outline"] = "Жирная обводка",
		["Toggle setting options separately for each chat window."] = "Вкл/Выкл настройки разделения для всех окон чата.",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Метод обхода ошибки Blizzard, изменяющей размер шрифта при открытии системного меню.",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",L)

L = {
	["Font"] = {
		["Auto Restore Font Size"] = "自动还原字体尺寸",
		["Chat window font options."] = "聊天窗口字体选项",
		["Font"] = "字体",
		["monochrome_desc"] = "单色字体",
		["monochrome_name"] = "单色",
		["None"] = "无",
		["Outline"] = "轮廓",
		["outlinemode_desc"] = "字体轮廓样式设置",
		["outlinemode_name"] = "轮廓样式",
		["rememberfont_desc"] = "记住您的字体选择并在启动时恢复",
		["rememberfont_name"] = "记住字体",
		["Set ChatFrame%d Font Size"] = "聊天框%d字体尺寸",
		["Set Font Face"] = "字体设置",
		["Set Font Size"] = "设置字体大小",
		["Set Separately"] = "个别设置",
		["Set text font size for each chat window."] = "每个聊天窗口的文本字体尺寸",
		["Set text font size."] = "文本字体尺寸",
		["Set the text font face for all chat windows."] = "所有聊天窗口的文本字体",
		["shadowcolor_desc"] = "阴影效果的颜色",
		["shadowcolor_name"] = "阴影色彩",
		["Thick Outline"] = "厚轮廓",
		["Toggle setting options separately for each chat window."] = "每个聊天窗口的个别选项设置",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "当你打开系统菜单时改变暴雪错误提示字体尺寸",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",L)

L = {
	["Font"] = {
		["Auto Restore Font Size"] = "Restaurar Tamaño Fuentes Automáticamente",
		["Chat window font options."] = "Opciones de la fuente de la ventana del chat.",
		["Font"] = "Fuente",
		["monochrome_desc"] = "Alterna el color monocromo de la fuente.",
		["monochrome_name"] = "Alternar Monocromo",
		["None"] = "Ninguna",
		["Outline"] = "Contorno",
		["outlinemode_desc"] = "Estable el modo para el contorno alrededor de la fuente.",
		["outlinemode_name"] = "Establecer Modo de Cotorno",
		["rememberfont_desc"] = "Recordar la elección de la fuente y restaurarla al reiniciar.",
		["rememberfont_name"] = "Recordar Fuente",
		["Set ChatFrame%d Font Size"] = "Establecer Tamaño Fuente de Chat %d",
		["Set Font Face"] = "Establecer Tipo de Fuente",
		["Set Font Size"] = "Establecer Tamaño de Fuente",
		["Set Separately"] = "Establecer por separado",
		["Set text font size for each chat window."] = "Establece el tamaño de la fuente del texto de cada ventana de chat.",
		["Set text font size."] = "Establece el tamaño de la fuente del texto.",
		["Set the text font face for all chat windows."] = "Establece el tipo de fuente de texto para todas las ventanas de chat.",
		["shadowcolor_desc"] = "Establece el color del efecto de sombra.",
		["shadowcolor_name"] = "Establecer Color de la Sombra",
		["Thick Outline"] = "Contorno Grueso",
		["Toggle setting options separately for each chat window."] = "Cambiar opciones de configuración por separado para cada ventana de chat.",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Solución a un error de Blizzard que cambia el tamaño de la fuente cuando se abre un menú de sistema.",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",L)

L = {
	["Font"] = {
		["Auto Restore Font Size"] = "自動還原字型大小",
		["Chat window font options."] = "聊天視窗字型選項。",
		["Font"] = "字型",
		["monochrome_desc"] = "切換字型的灰階色彩。",
		["monochrome_name"] = "切換灰階",
		["None"] = "無",
		["Outline"] = "輪廓",
		["outlinemode_desc"] = "設定字體是否加粗輪廓",
		["outlinemode_name"] = "設定輪廓模式",
		["rememberfont_desc"] = "記住字型設定",
		["rememberfont_name"] = "記憶字型",
		["Set ChatFrame%d Font Size"] = "設定聊天視窗 %d 之字型大小",
		["Set Font Face"] = "設定字體",
		["Set Font Size"] = "設定字型大小",
		["Set Separately"] = "個別設定",
		["Set text font size for each chat window."] = "設定個別聊天視窗字型大小",
		["Set text font size."] = "設定文字字型大小",
		["Set the text font face for all chat windows."] = "設定所有聊天視窗字體",
		["shadowcolor_desc"] = "設定陰影效果色彩",
		["shadowcolor_name"] = "設定陰影色彩",
		["Thick Outline"] = "粗邊",
		["Toggle setting options separately for each chat window."] = "切換設定選項分開地每個聊天視窗。",
		["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "開啟系統選單時變更Blizzard錯誤訊息的字型大小。",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@


  Prat:SetModuleDefaults(module, {
    profile = {
      on = true,
      fontface = "",
      rememberfont = false,
      size = { ["*"] = 12 },
      autorestore = false,
      outlinemode = "",
      monochrome = false,
      shadowcolor = {
        r = 0,
        g = 0,
        b = 0,
        a = 1,
      },
    }
  })

  local frameOption =
  {
    --  name = string.format(PL["Set ChatFrame%d Font Size"], num),
    name = function(info) return Prat.FrameList[info[#info]] or "" end,
    desc = PL["Set text font size."],
    type = "range",
    get = "GetSubValue",
    set = "SetSubValue",
    min = 4,
    max = 100,
    step = 1,
    hidden = function(info) return Prat.FrameList[info[#info]] == nil end,
  }


  Prat:SetModuleOptions(module, {
    name = PL["Font"],
    desc = PL["Chat window font options."],
    type = "group",
    args = {
      fontface = {
        name = PL["Set Font Face"],
        desc = PL["Set the text font face for all chat windows."],
        type = "select",
        dialogControl = 'LSM30_Font',
        values = AceGUIWidgetLSMlists.font,
        order = 110,
      },
      size = {
        name = PL["Set Font Size"],
        desc = PL["Set text font size for each chat window."],
        type = "group",
        inline = true,
        order = 130,
        args = {
          ChatFrame1 = frameOption,
          ChatFrame2 = frameOption,
          ChatFrame3 = frameOption,
          ChatFrame4 = frameOption,
          ChatFrame5 = frameOption,
          ChatFrame6 = frameOption,
          ChatFrame7 = frameOption,
        }
      },
      outlinemode = {
        name = PL["outlinemode_name"],
        desc = PL["outlinemode_desc"],
        type = "select",
        order = 150,
        values = { [""] = PL["None"], ["OUTLINE"] = PL["Outline"], ["THICKOUTLINE"] = PL["Thick Outline"] },
      },
      monochrome = {
        type = "toggle",
        name = PL["monochrome_name"],
        desc = PL["monochrome_desc"],
        order = 160,
      },
      shadowcolor = {
        name = PL["shadowcolor_name"],
        desc = PL["shadowcolor_desc"],
        type = "color",
        order = 170,
        get = "GetColorValue",
        set = "SetColorValue",
      },
      rememberfont = {
        type = "toggle",
        order = 120,
        name = PL["rememberfont_name"],
        desc = PL["rememberfont_desc"],
      },
    }
  })

  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --
  local media, FONT
  function module:OnModuleEnable()
    self:RegisterEvent("PLAYER_ENTERING_WORLD")

    self.oldsize = {}

    for k, cf in pairs(Prat.Frames) do
      local _, s, _ = cf:GetFont()
      self.oldsize[k] = s
    end

    if not self.db.profile.rememberfont then
      self.db.profile.fontface = nil
    end

    self:ConfigureAllChatFrames()

    self:SecureHook("FCF_SetChatWindowFontSize")

    media = Prat.Media
    FONT = media.MediaType.FONT
    media.RegisterCallback(self, "LibSharedMedia_Registered", "SharedMedia_Registered")
    media.RegisterCallback(self, "LibSharedMedia_SetGlobal", "SharedMedia_Registered")

    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
  end

  function module:GetDescription()
    return PL["Chat window font options."]
  end

  function module:SharedMedia_Registered(mediatype, name)
    if mediatype == FONT then
      if name == self.db.profile.fontface then
        self:ConfigureAllChatFrames()
      end
    end
  end

  function module:Prat_FramesUpdated(info, name, chatFrame, ...)
    self:ConfigureAllChatFrames()
  end


  function module:PLAYER_ENTERING_WORLD()
    self:ConfigureAllChatFrames()
    self:UnregisterAllEvents()
  end

  function module:OnModuleDisable()
    self:UnhookAll()
    media.UnregisterAllCallbacks(self)

    for k, cf in pairs(Prat.Frames) do
      self:SetFontSize(cf, self.oldsize[k] or 12)
    end
    self:SetFontMode("")
  end

  function module:GetSubValue(info)
    return self.db.profile[info[#info - 1]][info[#info]]
  end

  function module:SetSubValue(info, b)
    self.db.profile[info[#info - 1]][info[#info]] = b
    self:OnValueChanged(info, b)
  end


  --[[------------------------------------------------
    Core Functions
  ------------------------------------------------]] --

  function module:ConfigureAllChatFrames()
    local db = self.db.profile

    if db.fontface then
      self:SetFont(db.fontface)
    end

    -- aPLy font size settings
    for k, v in pairs(Prat.Frames) do
      self:SetFontSize(v, db.size[k])
    end
    -- aPLy font flag settings
    if not db.monochrome then
      self:SetFontMode(db.outlinemode)
    else
      self:SetFontMode(db.outlinemode .. ", MONOCHROME")
    end
  end

  function module:SetFontSize(cf, size)
    FCF_SetChatWindowFontSize(nil, cf, size)
  end


  function module:SetFont(font)
    local fontfile = Prat.Media:Fetch(Prat.Media.MediaType.FONT, font)
    for k, cf in pairs(Prat.Frames) do
      local f, s, m = cf:GetFont()
      cf:SetFont(fontfile, s, m)
    end
  end

  function module:SetFontMode(mode, monochrome)
    for k, cf in pairs(Prat.Frames) do
      local f, s, m = cf:GetFont()
      cf:SetFont(f, s, mode)

      if monochrome then
        local c = self.db.profile.shadowcolor
        cf:SetShadowColor(c.r, c.g, c.b, c.a)
      end
    end
  end

  function module:GetShadowClr()
    local h = self.db.profile.shadowcolor or {}
    return h.r or 1.0, h.g or 1.0, h.b or 1.0
  end

  function module:SetShadowClr(r, g, b)
    local db = self.db.profile
    db.shadowcolor = db.shadowcolor or {}
    local h = db.shadowcolor
    h.r, h.g, h.b = r, g, b
    self:ConfigureAllChatFrames()
  end

  function module:FCF_SetChatWindowFontSize(fcfself, chatFrame, fontSize)
    if not fcfself then return end

    if (not chatFrame) then
      chatFrame = FCF_GetCurrentChatFrame();
    end
    if (not fontSize) then
      fontSize = fcfself.value;
    end
    if self.db and self.db.profile.on then
      self.db.profile.size[chatFrame:GetName()] = fontSize
    end
  end

  module.OnValueChanged = module.ConfigureAllChatFrames
  module.OnSubValueChanged = module.ConfigureAllChatFrames
  module.OnColorValueChanged = module.ConfigureAllChatFrames

  return
end) -- Prat:AddModuleToLoad