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
  local function dbg(...) end

  --[==[@debug@
  function dbg(...) Prat:PrintLiteral(...) end

  --@end-debug@]==]

  local PRAT_MODULE = Prat:RequestModuleName("Timestamps")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

  -- define localized strings
  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["Timestamps"] = true,
    ["Chat window timestamp options."] = true,
    ["Show Timestamp"] = true,
    ["Toggle showing timestamp for each window."] = true,
    ["show_name"] = "Show Timestamp",
    ["show_desc"] = "Toggle showing timestamp on and off for each window.",
    ["Set the timestamp format"] = true,
    ["Format All Timestamps"] = true,
    ["colortimestamp_name"] = "Color Timestamp",
    ["colortimestamp_desc"] = "Toggle coloring the timestamp on and off.",
    ["Set Timestamp Color"] = true,
    ["Sets the color of the timestamp."] = true,
    ["localtime_name"] = "Use Local Time",
    ["localtime_desc"] = "Toggle using local time on and off.",
    ["space_name"] = "Show Space",
    ["space_desc"] = "Toggle adding space after timestamp on and off.",
    ["twocolumn_name"] = "2 Column Chat",
    ["twocolumn_desc"] = "Place the timestamps in a separate column so the text does not wrap underneath them",
    ["HH:MM:SS AM (12-hour)"] = true,
    ["HH:MM:SS (12-hour)"] = true,
    ["HH:MM:SS (24-hour)"] = true,
    ["HH:MM AM (12-hour)"] = true,
    ["HH:MM (12-hour)"] = true,
    ["HH:MM (24-hour)"] = true,
    ["MM:SS"] = true,
    ["Post-Timestamp"] = true,
    ["Pre-Timestamp"] = true,
    ["Timestamp Text Format"] = true,
    ["Other Formatting Options"] = true,
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --@non-debug@
  do
      local L

  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = true,
		["colortimestamp_desc"] = "Toggle coloring the timestamp on and off.",
		["colortimestamp_name"] = "Color Timestamp",
		["Format All Timestamps"] = true,
		["HH:MM (12-hour)"] = true,
		["HH:MM (24-hour)"] = true,
		["HH:MM AM (12-hour)"] = true,
		["HH:MM:SS (12-hour)"] = true,
		["HH:MM:SS (24-hour)"] = true,
		["HH:MM:SS AM (12-hour)"] = true,
		["localtime_desc"] = "Toggle using local time on and off.",
		["localtime_name"] = "Use Local Time",
		["MM:SS"] = true,
		["Other Formatting Options"] = true,
		["Post-Timestamp"] = true,
		["Pre-Timestamp"] = true,
		["Set the timestamp format"] = true,
		["Set Timestamp Color"] = true,
		["Sets the color of the timestamp."] = true,
		["Show Timestamp"] = true,
		["show_desc"] = "Toggle showing timestamp on and off for each window.",
		["show_name"] = "Show Timestamp",
		["space_desc"] = "Toggle adding space after timestamp on and off.",
		["space_name"] = "Show Space",
		["Timestamp Text Format"] = true,
		["Timestamps"] = true,
		["Toggle showing timestamp for each window."] = true,
		["twocolumn_desc"] = "Place the timestamps in a separate column so the text does not wrap underneath them",
		["twocolumn_name"] = "2 Column Chat",
	}
}


    PL:AddLocale(PRAT_MODULE, "enUS",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "Options de l'heure des messages.",
		["colortimestamp_desc"] = "Active/Désactive la couleur de l'heure des messages.",
		["colortimestamp_name"] = "Couleur de l'heure",
		["Format All Timestamps"] = "Formatage de l'heure",
		["HH:MM (12-hour)"] = "HH:MM (12 heures)",
		["HH:MM (24-hour)"] = "HH:MM (24 heures)",
		--[[Translation missing --]]
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-hour)",
		["HH:MM:SS (12-hour)"] = "HH:MM:SS (12 heures)",
		["HH:MM:SS (24-hour)"] = "HH:MM:SS (24 heures)",
		["HH:MM:SS AM (12-hour)"] = "HH:MM:SS AM (12 heures)",
		["localtime_desc"] = "Active/Désactive l'utilisation de l'heure locale.",
		["localtime_name"] = "Utiliser l'heure locale",
		["MM:SS"] = true,
		--[[Translation missing --]]
		["Other Formatting Options"] = "Other Formatting Options",
		["Post-Timestamp"] = "Après l'heure",
		["Pre-Timestamp"] = "Avant l'heure",
		["Set the timestamp format"] = "Définit le format de l'heure.",
		["Set Timestamp Color"] = "Configurer la couleur",
		["Sets the color of the timestamp."] = "Définit la couleur de l'heure des messages.",
		["Show Timestamp"] = "Montrer l'heure des messages",
		["show_desc"] = "Active/Désactive l'affiche de l'heure pour chaque fenêtre.",
		["show_name"] = "Montrer l'heure des messages",
		["space_desc"] = "Active/Désactive l'ajout d'un espace après l'heure.",
		["space_name"] = "Montrer l'espace",
		--[[Translation missing --]]
		["Timestamp Text Format"] = "Timestamp Text Format",
		["Timestamps"] = "Heure des messages",
		["Toggle showing timestamp for each window."] = "Active/Désactive l'affiche de l'heure des messages pour chaque fenêtre.",
		["twocolumn_desc"] = "Place l'heure dans une colonne séparée de manière à ce qu'aucun texte ne s'écrive en dessous de l'heure.",
		["twocolumn_name"] = "Discussion à 2 colonnes",
	}
}


    PL:AddLocale(PRAT_MODULE, "frFR",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "Optionen für Zeitstempel in Chatfenstern.",
		["colortimestamp_desc"] = "Färbung des Zeitstempels ein- und ausschalten.",
		["colortimestamp_name"] = "Zeitstempel färben",
		["Format All Timestamps"] = "Formatiert alle Zeitstempel",
		["HH:MM (12-hour)"] = "HH:MM (12-Stunden)",
		["HH:MM (24-hour)"] = "HH:MM (24-Stunden)",
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-Stunden)",
		["HH:MM:SS (12-hour)"] = "HH:MM:SS (12-Stunden)",
		["HH:MM:SS (24-hour)"] = "HH:MM:SS (24-Stunden)",
		["HH:MM:SS AM (12-hour)"] = "HH:MM:SS AM (12-Stunden)",
		["localtime_desc"] = "Verwendung der Ortszeit ein- und ausschalten.",
		["localtime_name"] = "Ortszeit verwenden",
		["MM:SS"] = true,
		["Other Formatting Options"] = "Andere Formatierungsoptionen",
		["Post-Timestamp"] = "Nach-Zeitstempel",
		["Pre-Timestamp"] = "Vor-Zeitstempel",
		["Set the timestamp format"] = "Format für Zeitstempel einstellen",
		["Set Timestamp Color"] = "Farbe für Zeitstempel einstellen",
		["Sets the color of the timestamp."] = "Stellt die Farbe des Zeitstempels ein.",
		["Show Timestamp"] = "Zeitstempel anzeigen",
		["show_desc"] = "Anzeige des Zeitstempels für jedes Fenster ein- und ausschalten.",
		["show_name"] = "Zeitstempel anzeigen",
		["space_desc"] = "Das Einfügen eines Leerzeichens nach dem Zeitstempel ein- und ausschalten.",
		["space_name"] = "Leerzeichen anzeigen",
		["Timestamp Text Format"] = "Zeitstempel-Textformat",
		["Timestamps"] = "Zeitstempel",
		["Toggle showing timestamp for each window."] = "Anzeige des Zeitstempels für jedes Fenster umschalten.",
		["twocolumn_desc"] = "Platziere die Zeitstempel in einer getrennten Spalte, so dass der Text nicht unterhalb der Zeitstempel dargestellt wird.",
		["twocolumn_name"] = "2-Spalten-Chat",
	}
}


    PL:AddLocale(PRAT_MODULE, "deDE",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "대화창 대화 시각 옵션입니다.",
		["colortimestamp_desc"] = "대화 시각에 색상을 입히거나 입히지 않습니다.",
		["colortimestamp_name"] = "대화 시각 색상 지정",
		["Format All Timestamps"] = "모든 대화 시각 형식",
		["HH:MM (12-hour)"] = "시:분 (12시간)",
		["HH:MM (24-hour)"] = "시:분 (24시간)",
		["HH:MM AM (12-hour)"] = "시:분 오전 (12시간)",
		["HH:MM:SS (12-hour)"] = "시:분:초 (12시간)",
		["HH:MM:SS (24-hour)"] = "시:분:초 (24시간)",
		["HH:MM:SS AM (12-hour)"] = "시:분:초 오전 (12시간)",
		["localtime_desc"] = "시스템 시간 사용을 켜고 끕니다.",
		["localtime_name"] = "시스템 시간 사용",
		["MM:SS"] = "분:초",
		["Other Formatting Options"] = "다른 형식 옵션",
		["Post-Timestamp"] = "뒤-대화 시각",
		["Pre-Timestamp"] = "앞-대화 시각",
		["Set the timestamp format"] = "대화 시각 형식을 설정합니다.",
		["Set Timestamp Color"] = "대화 시각 색상 설정",
		["Sets the color of the timestamp."] = "대화 시각의 색상을 설정합니다.",
		["Show Timestamp"] = "대화 시각 표시",
		["show_desc"] = "각 창에 대해 대화 시각 표시를 켜고 끕니다.",
		["show_name"] = "대화 시각 표시",
		["space_desc"] = "시간 표시 뒤에 공간을 넣을 지 선택합니다.",
		["space_name"] = "공간 삽입",
		["Timestamp Text Format"] = "대화 시각 문자 형식",
		["Timestamps"] = "대화 시각 [Timestamps]",
		["Toggle showing timestamp for each window."] = "각 창 별로 대화 시각 표시 기능을 켜거나 끕니다.",
		["twocolumn_desc"] = "대화 시각을 분리된 열에 배치시켜 글자가 줄바꿈되지 않도록 합니다.",
		["twocolumn_name"] = "열 분리",
	}
}


    PL:AddLocale(PRAT_MODULE, "koKR",L)


  
L = {
	["Timestamps"] = {
		--[[Translation missing --]]
		["Chat window timestamp options."] = "Chat window timestamp options.",
		--[[Translation missing --]]
		["colortimestamp_desc"] = "Toggle coloring the timestamp on and off.",
		--[[Translation missing --]]
		["colortimestamp_name"] = "Color Timestamp",
		--[[Translation missing --]]
		["Format All Timestamps"] = "Format All Timestamps",
		--[[Translation missing --]]
		["HH:MM (12-hour)"] = "HH:MM (12-hour)",
		--[[Translation missing --]]
		["HH:MM (24-hour)"] = "HH:MM (24-hour)",
		--[[Translation missing --]]
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-hour)",
		--[[Translation missing --]]
		["HH:MM:SS (12-hour)"] = "HH:MM:SS (12-hour)",
		--[[Translation missing --]]
		["HH:MM:SS (24-hour)"] = "HH:MM:SS (24-hour)",
		--[[Translation missing --]]
		["HH:MM:SS AM (12-hour)"] = "HH:MM:SS AM (12-hour)",
		--[[Translation missing --]]
		["localtime_desc"] = "Toggle using local time on and off.",
		--[[Translation missing --]]
		["localtime_name"] = "Use Local Time",
		--[[Translation missing --]]
		["MM:SS"] = "MM:SS",
		--[[Translation missing --]]
		["Other Formatting Options"] = "Other Formatting Options",
		--[[Translation missing --]]
		["Post-Timestamp"] = "Post-Timestamp",
		--[[Translation missing --]]
		["Pre-Timestamp"] = "Pre-Timestamp",
		--[[Translation missing --]]
		["Set the timestamp format"] = "Set the timestamp format",
		--[[Translation missing --]]
		["Set Timestamp Color"] = "Set Timestamp Color",
		--[[Translation missing --]]
		["Sets the color of the timestamp."] = "Sets the color of the timestamp.",
		--[[Translation missing --]]
		["Show Timestamp"] = "Show Timestamp",
		--[[Translation missing --]]
		["show_desc"] = "Toggle showing timestamp on and off for each window.",
		--[[Translation missing --]]
		["show_name"] = "Show Timestamp",
		--[[Translation missing --]]
		["space_desc"] = "Toggle adding space after timestamp on and off.",
		--[[Translation missing --]]
		["space_name"] = "Show Space",
		--[[Translation missing --]]
		["Timestamp Text Format"] = "Timestamp Text Format",
		--[[Translation missing --]]
		["Timestamps"] = "Timestamps",
		--[[Translation missing --]]
		["Toggle showing timestamp for each window."] = "Toggle showing timestamp for each window.",
		--[[Translation missing --]]
		["twocolumn_desc"] = "Place the timestamps in a separate column so the text does not wrap underneath them",
		--[[Translation missing --]]
		["twocolumn_name"] = "2 Column Chat",
	}
}


    PL:AddLocale(PRAT_MODULE, "esMX",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "Настройки времени в окне чата.",
		["colortimestamp_desc"] = "Вкл/Выкл окрасу времени.",
		["colortimestamp_name"] = "Окраска времени",
		["Format All Timestamps"] = "Формат всего времени",
		["HH:MM (12-hour)"] = "HH:MM (12-ч)",
		["HH:MM (24-hour)"] = "HH:MM (24-ч)",
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-ч)",
		["HH:MM:SS (12-hour)"] = "HH:MM:SS (12-ч)",
		["HH:MM:SS (24-hour)"] = "HH:MM:SS (24-ч)",
		["HH:MM:SS AM (12-hour)"] = "HH:MM:SS AM (12-ч)",
		["localtime_desc"] = "Вкл/Выкл использование местного времени.",
		["localtime_name"] = "Местное время",
		["MM:SS"] = true,
		["Other Formatting Options"] = "Другие параметры форматирования",
		["Post-Timestamp"] = "Перед-временем",
		["Pre-Timestamp"] = "После-времени",
		["Set the timestamp format"] = "Установите формат времени ",
		["Set Timestamp Color"] = "Цвет времени",
		["Sets the color of the timestamp."] = "Установка цвета времени.",
		["Show Timestamp"] = "Показывать время",
		["show_desc"] = "Вкл/Выкл отображение времени во всех окнах.",
		["show_name"] = "Показывать время",
		["space_desc"] = "Вкл/Выкл добавление пробела после времени.",
		["space_name"] = "Пробел",
		["Timestamp Text Format"] = "Текстовый формат метки времени",
		["Timestamps"] = "Отображение времени",
		["Toggle showing timestamp for each window."] = "Вкл/Выкл отображение времени во всех окнах.",
		["twocolumn_desc"] = "Помещает время в отдельную колонку, чтобы текст не переносился на строку под ним.",
		["twocolumn_name"] = "Чат в 2 колонки",
	}
}


    PL:AddLocale(PRAT_MODULE, "ruRU",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "聊天窗口时间戳选项",
		["colortimestamp_desc"] = "时间戳着色开关",
		["colortimestamp_name"] = "彩色时间戳",
		["Format All Timestamps"] = "所有时间戳格式",
		["HH:MM (12-hour)"] = "时:分 (12-小时)",
		["HH:MM (24-hour)"] = "时:分 (24-小时)",
		--[[Translation missing --]]
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-hour)",
		["HH:MM:SS (12-hour)"] = "时:分:秒 (12-小时)",
		["HH:MM:SS (24-hour)"] = "时:分:秒 (24-小时)",
		["HH:MM:SS AM (12-hour)"] = "时:分:秒 上午(12-小时)",
		["localtime_desc"] = "本地时间使用开关",
		["localtime_name"] = "使用本地时间",
		["MM:SS"] = "分:秒",
		["Other Formatting Options"] = "其他设置",
		["Post-Timestamp"] = "后缀-时间戳",
		["Pre-Timestamp"] = "前缀-时间戳",
		["Set the timestamp format"] = "设置时间戳格式",
		["Set Timestamp Color"] = "设置时间戳颜色",
		["Sets the color of the timestamp."] = "设置时间戳颜色",
		["Show Timestamp"] = "显示时间戳",
		["show_desc"] = "为各个窗口选取显示时间戳开关",
		["show_name"] = "显示时间戳",
		["space_desc"] = "在时间戳后添加空格",
		["space_name"] = "显示空格",
		["Timestamp Text Format"] = "时间戳格式",
		["Timestamps"] = "时间戳",
		["Toggle showing timestamp for each window."] = "为各个窗口切换显示时间戳",
		["twocolumn_desc"] = "放置时间戳在一个单独的栏，文本不包括其中",
		["twocolumn_name"] = "2栏聊天",
	}
}


    PL:AddLocale(PRAT_MODULE, "zhCN",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "Opciones de MáscaraTiempo de la ventana de chat.",
		["colortimestamp_desc"] = "Alterna activación de colorear máscara de tiempo.",
		["colortimestamp_name"] = "Color Máscara de Tiempo",
		["Format All Timestamps"] = "Formatear Todas las Mascaras de Tiempo",
		["HH:MM (12-hour)"] = "HH:MM (12-horas)",
		["HH:MM (24-hour)"] = "HH:MM (24-horas)",
		--[[Translation missing --]]
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-hour)",
		["HH:MM:SS (12-hour)"] = "HH:MM:SS (12-horas)",
		["HH:MM:SS (24-hour)"] = "HH:MM:SS (24-horas)",
		["HH:MM:SS AM (12-hour)"] = "HH:MM:SS AM (12-horas)",
		["localtime_desc"] = "Activa o desactiva el uso de la hora local.",
		["localtime_name"] = "Utilizar Hora Local",
		["MM:SS"] = true,
		--[[Translation missing --]]
		["Other Formatting Options"] = "Other Formatting Options",
		["Post-Timestamp"] = "Post-MáscaraTiempo",
		["Pre-Timestamp"] = "Pre-MáscaraTiempo",
		["Set the timestamp format"] = "Establecer el formato de la Máscara de Tiempo",
		["Set Timestamp Color"] = "Establecer Color MáscaraTiempo",
		["Sets the color of the timestamp."] = "Establece el Color de la Máscara de Tiempo.",
		["Show Timestamp"] = "Mostrar MáscaraTiempo",
		["show_desc"] = "Alterna activación de mostrar máscara de tiempo para cada ventana.",
		["show_name"] = "Mostrar Máscara de Tiempo",
		["space_desc"] = "Alterna activación de añadir un espacio tras la máscara de tiempo.",
		["space_name"] = "Mostrar Espacio",
		--[[Translation missing --]]
		["Timestamp Text Format"] = "Timestamp Text Format",
		["Timestamps"] = "Máscara de Tiempo",
		["Toggle showing timestamp for each window."] = "Alterna mostrar máscara de tiempo para cada ventana.",
		["twocolumn_desc"] = "Colocar las máscaras de hora en una columna separada por lo que el texto no se ajustará debajo de ellas",
		["twocolumn_name"] = "2 Columnas Chat",
	}
}


    PL:AddLocale(PRAT_MODULE, "esES",L)


  
L = {
	["Timestamps"] = {
		["Chat window timestamp options."] = "聊天視窗時間戳選項",
		["colortimestamp_desc"] = "切換是否為時間戳著色。",
		["colortimestamp_name"] = "時間戳色彩",
		["Format All Timestamps"] = "所有時間戳格式",
		["HH:MM (12-hour)"] = "HH:MM (12時制)",
		["HH:MM (24-hour)"] = "HH:MM (24時制)",
		--[[Translation missing --]]
		["HH:MM AM (12-hour)"] = "HH:MM AM (12-hour)",
		["HH:MM:SS (12-hour)"] = "HH:MM:SS (12時制)",
		["HH:MM:SS (24-hour)"] = "HH:MM:SS (24時制)",
		["HH:MM:SS AM (12-hour)"] = "HH:MM:SS AM (12時制)",
		["localtime_desc"] = "切換是否使用本地時間",
		["localtime_name"] = "使用本地時間",
		["MM:SS"] = true,
		["Other Formatting Options"] = "其他设置",
		["Post-Timestamp"] = "貼出時間戳",
		["Pre-Timestamp"] = "時間標籤",
		["Set the timestamp format"] = "設定時間戳格式",
		["Set Timestamp Color"] = "設定時間戳色彩",
		["Sets the color of the timestamp."] = "設定時間戳色彩。",
		["Show Timestamp"] = "顯示時間戳",
		["show_desc"] = "切換顯示時間標籤",
		["show_name"] = "顯示時間戳",
		--[[Translation missing --]]
		["space_desc"] = "Toggle adding space after timestamp on and off.",
		["space_name"] = "顯示空白",
		["Timestamp Text Format"] = "时间戳格式",
		["Timestamps"] = "時間戳",
		["Toggle showing timestamp for each window."] = "切換是否在個別視窗顯示時間戳。",
		--[[Translation missing --]]
		["twocolumn_desc"] = "Place the timestamps in a separate column so the text does not wrap underneath them",
		["twocolumn_name"] = "兩欄式聊天",
	}
}


    PL:AddLocale(PRAT_MODULE, "zhTW",L)


  end
  --@end-non-debug@

  module.pluginopts = {}

  -- Chatter (Antiarc)
  local FORMATS = {
    ["%I:%M:%S %p"] = PL["HH:MM:SS AM (12-hour)"],
    ["%I:%M:%S"] = PL["HH:MM:SS (12-hour)"],
    ["%X"] = PL["HH:MM:SS (24-hour)"],
    ["%I:%M %p"] = PL["HH:MM AM (12-hour)"],
    ["%I:%M"] = PL["HH:MM (12-hour)"],
    ["%H:%M"] = PL["HH:MM (24-hour)"],
    ["%M:%S"] = PL["MM:SS"],
  }

  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      show = { ["*"] = true },
      formatcode = "%X",
      formatpre = "[",
      formatpost = "]",
      ["timestampcolor"] = {
        ["b"] = 0.592156862745098,
        ["g"] = 0.592156862745098,
        ["r"] = 0.592156862745098,
        a = 1
      },
      colortimestamp = true,
      space = true,
      localtime = true,
      twocolumn = false,
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL["Timestamps"],
    desc = PL["Chat window timestamp options."],
    type = "group",
    plugins = module.pluginopts,
    args = {
      show = {
        name = PL["Show Timestamp"],
        desc = PL["Toggle showing timestamp for each window."],
        type = "multiselect",
        order = 120,
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      },
      helpheader = {
        name = PL["Timestamp Text Format"],
        type = "header",
        order = 129,
      },
      formatpre = {
        name = PL["Pre-Timestamp"],
        desc = PL["Pre-Timestamp"],
        type = "input",
        order = 130,
        usage = "<string>",
      },
      formatcode = {
        name = PL["Format All Timestamps"],
        desc = PL["Set the timestamp format"],
        type = "select",
        order = 131,
        values = FORMATS,
      },
      formatpost = {
        name = PL["Post-Timestamp"],
        desc = PL["Post-Timestamp"],
        type = "input",
        order = 132,
        usage = "<string>",
      },
      colortimestamp = {
        name = PL["colortimestamp_name"],
        desc = PL["colortimestamp_desc"],
        type = "toggle",
        get = function(info) return info.handler:GetValue(info) end,
        order = 171,
      },
      localtime = {
        name = PL["localtime_name"],
        desc = PL["localtime_desc"],
        type = "toggle",
        order = 171,
      },
      space = {
        name = PL["space_name"],
        desc = PL["space_desc"],
        type = "toggle",
        order = 171,
      },
      otherheader = {
        name = PL["Other Formatting Options"],
        type = "header",
        order = 170,
      },
      timestampcolor = {
        name = PL["Set Timestamp Color"],
        desc = PL["Sets the color of the timestamp."],
        type = "color",
        order = 181,
        get = "GetColorValue",
        set = "SetColorValue",
        disabled = "IsTimestampPlain",
      },
    },
  })

  Prat:SetModuleInit(module, function(self)
    -- Disable blizz timestamps if possible
    if issecurevariable("ChatFrame_MessageEventHandler") then
      local proxy = { CHAT_TIMESTAMP_FORMAT = false } -- nil would defer to __index
      local CF_MEH_env = setmetatable(proxy, { __index = _G, __newindex = _G })
      setfenv(ChatFrame_MessageEventHandler, CF_MEH_env)
    else
      -- An addon has modified ChatFrame_MessageEventHandler and likely
      -- replaced / hooked it, so we can't setfenv the original function.
      -- TODO Print a warning
      self:Output("Could not install hook")
    end

    for name, v in pairs(Prat.HookedFrames) do
      self:SecureHook(v, "AddMessage")
    end
  end)

  function module:OnModuleEnable()
    for name, v in pairs(Prat.HookedFrames) do
      if not self:IsHooked(v, "AddMessage") then
        self:SecureHook(v, "AddMessage")
      end
    end
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_REMOVED)
  end

  function module:OnModuleDisable()
    for name, v in pairs(Prat.HookedFrames) do
      if self:IsHooked(v, "AddMessage") then
        self:Unhook(v, "AddMessage")
      end
    end
  end

  function module:GetDescription()
    return PL["Chat window timestamp options."]
  end

  function module:Prat_FramesUpdated(info, name, chatFrame, ...)
    if not self:IsHooked(chatFrame, "AddMessage") then
      self:SecureHook(chatFrame, "AddMessage")
    end
  end

  function module:Prat_FramesRemoved(info, name, chatFrame)
    if self:IsHooked(chatFrame, "AddMessage") then
      self:Unhook(chatFrame, "AddMessage")
    end
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --
  function module:AddMessage(frame, text, ...)
    if self.db.profile.on and self.db.profile.show and self.db.profile.show[frame:GetName()] and not Prat.loading then
      local entry = frame.historyBuffer:GetEntryAtIndex(1)
      if entry and text == entry.message then
        entry.message = self:InsertTimeStamp(entry.message, frame)
      end
    end
  end

  function module:IsTimestampPlain()
    return not self.db.profile.colortimestamp
  end

  local function Timestamp(text)
    if not module:IsTimestampPlain() then
      return Prat.CLR:Colorize(module.db.profile.timestampcolor, text)
    else
      return text
    end
  end

  function module:PlainTimestampNotAllowed()
    return false
  end

  function module:InsertTimeStamp(text, cf)
    if type(text) == "string" then
      local db = self.db.profile
      local space = db.space
      local fmt = db.formatpre .. db.formatcode .. db.formatpost

      if cf and cf:GetJustifyH() == "RIGHT" then
        text = text .. (space and " " or "") .. Timestamp(self:GetTime(fmt))
      else
        text = Timestamp(self:GetTime(fmt)) .. (space and " " or "") .. text
      end
    end

    return text
  end

  function module:GetTime(format)
    if self.db.profile.localtime then
      return date(format)
    else
      return date(format, GetServerTime())
    end
  end

  return
end) -- Prat:AddModuleToLoad
