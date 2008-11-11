---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2008  Prat Development Team
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
Name: PratTimestamps
Revision: $Revision: 80569 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Author(s): Curney (asml8ed@gmail.com)
	   Krtek (krtek4@gmail.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Timestamps
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds configurable timestamps to chat windows (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 


local PRAT_MODULE = Prat:RequestModuleName("Timestamps")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
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
    ["HH:MM (12-hour)"] = true,
    ["HH:MM:SS (24-hour)"] = true,
    ["HH:MM (12-hour)"] = true,
    ["HH:MM (24-hour)"] = true,
    ["MM:SS"] = true,
    ["Post-Timestamp"] = true,
    ["Pre-Timestamp"] = true,
})

L:AddLocale("ruRU", {
	["Timestamps"] = true,
	["Chat window timestamp options."] = "Настройки времени в окне чата.",
	["Show Timestamp"] = "Показывать время",
	["Toggle showing timestamp for each window."] = "Вкл/Выкл отображение времени во всех окнах.",
	["show_name"] = "Показывать время",
	["show_desc"] = "Вкл/Выкл отображение времени во всех окнах.",
	["Set the timestamp format"] = "Установите формат времени (strftime) для всех окон чата. Более подробную информацию вы найдете по этому адрессу: http://fin.instinct.org/prat/timestamps/",
	["Format All Timestamps"] = "Формат всего времени",
	["colortimestamp_name"] = "Окраска времени",
	["colortimestamp_desc"] = "Вкл/Выкл окрасу времени.",
	["Set Timestamp Color"] = "Цвет времени",
	["Sets the color of the timestamp."] = "Установка цвета времени.",
	["localtime_name"] = "Местное время",
	["localtime_desc"] = "Вкл/Выкл использование местного времени.",
	["space_name"] = "Пробел",
	["space_desc"] = "Вкл/Выкл добавление пробела после времени.",
})

----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80569 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["Timestamps"] = "时间标签",
--	["Chat window timestamp options."] = "聊天窗口时间标签选项",
--	["Set Separately"] = "独立设置",
--	["Toggle setting options separately for each chat window."] = "独立设置各聊天窗口的时间标签选项",
--	["Show Timestamp"] = "显示时间标签",
--	["Toggle showing timestamp for each window."] = "启用各窗口的时间标签显示",
--	["Show ChatFrame%d Timestamp"] = "显示聊天窗口 %d 时间标签",
--	["Toggle showing timestamp on and off."] = "切换时间标签显示",
--	["show_name"] = "设置",
--	["show_desc"] = "显示各窗口的时间标签设置",
--	["show_perframename"] = "聊天窗口 %s 时间标签",
--	["show_perframedesc"] = "在聊天窗口 %s 显示时间标签",
--	["Format Timestamp"] = "时间标签格式",
--	["Set timestamp format (strftime) for each chat window. See here for more details: http://fin.instinct.org/prat/timestamps/"] = "设置各窗口的时间标签格式 (strftime 函数格式)。请参考 - http://fin.instinct.org/prat/timestamps/",
--	["Format ChatFrame%d Timestamp"] = "聊天窗口 %d 时间标签格式",
--	["Set format of timestamp (strftime). See here for more details: http://fin.instinct.org/prat/timestamps/"] = "设置聊天窗口 %d 的时间标签格式 (strftime 函数格式)。请参考 - http://fin.instinct.org/prat/timestamps/",
--	["Show All Timestamps"] = "全部显示时间标签",
--	["Toggle showing timestamp for all chat windows."] = "切换全部聊天窗口的时间标签显示",
--	["Format All Timestamps"] = "全部时间标签格式设置",
--	["Set the timestamp format"] = "设置所有聊天窗口的时间标签格式 (strftime 函数格式)。请参考 - http://fin.instinct.org/prat/timestamps/",
--	["colortimestamp_name"] = "颜色",
--	["colortimestamp_desc"] = "时间标签颜色",
--	["Set Timestamp Color"] = "颜色设置",
--	["Sets the color of the timestamp."] = "设置时间标签的颜色",
--	["localtime_name"] = "本地时间",
--	["localtime_desc"] = "使用本地时间",
--	["space_name"] = "空格",
--	["space_desc"] = "在时间标签后显示空格",
--	["Help"] = "帮助",
--    ["How to customize timestamps."] = "怎样自定义时间标签。",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["Timestamps"] = "時間標籤",
--	["Chat window timestamp options."] = "聊天視窗時間標籤選項。",
--	["Set Separately"] = "個別設定",
--	["Toggle setting options separately for each chat window."] = "分別設定各聊天視窗。",
--	["Show Timestamp"] = "顯示時間標籤",
--	["Toggle showing timestamp for each window."] = "切換是否在各個聊天視窗顯示時間標籤。",
--	["Show ChatFrame%d Timestamp"] = "聊天視窗%d顯示時間標籤",
--	["Toggle showing timestamp on and off."] = "切換是否顯示時間標籤。",
--	["show_name"] = "顯示時間標籤",
--	["show_desc"] = "切換是否在各個聊天視窗顯示時間標籤。",
--	["show_perframename"] = "聊天視窗%d顯示時間標籤",
--	["show_perframedesc"] = "切換是否顯示時間標籤。",
--	["Format Timestamp"] = "時間標籤格式",
--	["Set timestamp format (strftime) for each chat window. See here for more details: http://fin.instinct.org/prat/timestamps/"] = "設定各個聊天視窗的時間標籤格式 (依 strftime 函式格式)。請參考 - http://fin.instinct.org/prat/timestamps/",
--	["Format ChatFrame%d Timestamp"] = "聊天視窗%d時間標籤格式",
--	["Set format of timestamp (strftime). See here for more details: http://fin.instinct.org/prat/timestamps/"] = "設定時間標籤格式 (依 strftime 函式格式)。請參考 - http://fin.instinct.org/prat/timestamps/",
--	["Show All Timestamps"] = "顯示全部時間標籤",
--	["Toggle showing timestamp for all chat windows."] = "切換是否在全部的聊天視窗顯示時間標籤。",
--	["Format All Timestamps"] = "全部聊天視窗時間標籤格式",
--	["Set the timestamp format"] = "設定全部聊天視窗時間標籤格式 (依 strftime 函式格式)。請參考 - http://fin.instinct.org/prat/timestamps/",
--	["colortimestamp_name"] = "時間標籤顏色",
--	["colortimestamp_desc"] = "切換是否替時間標籤著色。",
--	["Set Timestamp Color"] = "顏色設定",
--	["Sets the color of the timestamp."] = "設定時間標籤的顏色。",
--	["localtime_name"] = "使用本地時間",
--	["localtime_desc"] = "切換是否使用本地時間。",
--	["space_name"] = "顯示空格",
--	["space_desc"] = "切換是否在時間標籤後顯示空格。",
--    ["Help"] = "幫助",
--    ["How to customize timestamps."] = "怎樣自定時間標籤。",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--	["Timestamps"] = "Affichage de l'heure",
--	["Chat window timestamp options."] = "Options pour l'affichage de l'heure devant les messages",
--	["Set Separately"] = "Régler séparément",
--	["Toggle setting options separately for each chat window."] = "Active/désactive le réglage des options pour chaque fenêtre séparément.",
--	["Show Timestamp"] = "Afficher l'heure",
--	["Toggle showing timestamp for each window."] = "Affiche/masque l'heure devant chaque message pour chaque fenêtre.",
--	["Show ChatFrame%d Timestamp"] = "Fenêtre %d",
--	["Toggle showing timestamp on and off."] = "Affiche/masque l'heure devant les messages.",
--	["show_name"] = "Afficher",
--	["show_desc"] = "Affiche/masque les réglages de l'heure pour chaque fenêtre.",
--	["show_perframename"] = "Fenêtre %s ",
--	["show_perframedesc"] = "Affiche/masque l'heure devant les messages de la fenêtre %s .",
--	["Format Timestamp"] = "Format de l'heure",
--	["Set timestamp format (strftime) for each chat window. See here for more details: http://fin.instinct.org/prat/timestamps/"] = "Règle le format de l'heure (strftime) pour chaque fenêtre de discussion. See here for more details: http://fin.instinct.org/prat/timestamps/",
--	["Format ChatFrame%d Timestamp"] = "Fenêtre %d",
--	["Set format of timestamp (strftime). See here for more details: http://fin.instinct.org/prat/timestamps/"] = "Règle le format de l'heure (strftime) pour la fenêtre %d. See here for more details: http://fin.instinct.org/prat/timestamps/",
--	["Show All Timestamps"] = "Afficher l'heure partout",
--	["Toggle showing timestamp for all chat windows."] = "Afficher l'heure devant les messages de chaque fenêtre",
--	["Format All Timestamps"] = "Format de toutes les heures",
--	["Set the timestamp format"] = "Règle le format de l'heure (strftime) pour l'ensemble des fenêtres de discussion. See here for more details: http://fin.instinct.org/prat/timestamps/",
--	["colortimestamp_name"] = "Coloriser l'heure",
--	["colortimestamp_desc"] = "Active/désactive la colorisation de l'heure.",
--	["Set Timestamp Color"] = "Couleur",
--	["Sets the color of the timestamp."] = "Change la couleur de l'heure.",
--	["localtime_name"] = "Utiliser l'heure locale",
--	["localtime_desc"] = "Utilise ou non l'heure locale.",
--	["space_name"] = "Afficher une espace",
--	["space_desc"] = "Affiche/masque l'espace après l'heure..",
--	["Help"] = "Aide",
--	["How to customize timestamps."] = "La façon de personnaliser l'affichage de l'heure.",
--} end)
--
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["Timestamps"] = "타임스탬프",
--	["Chat window timestamp options."] = "대화창 타임스탬프 설정입니다.",
--	["Set Separately"] = "구분 설정",
--	["Toggle setting options separately for each chat window."] = "각 대화창에 대해 구분 설정을 사용합니다.",
--	["Show Timestamp"] = "타임스탬프 표시",
--	["Toggle showing timestamp for each window."] = "각 창에 대한 타임스탬프를 표시합니다.",
--	["Show ChatFrame%d Timestamp"] = "%d 대화창 타임스탬프 표시",
--	["Toggle showing timestamp on and off."] = "타임스탬프 표시를 켜거나 끕니다.",
--	["show_name"] = "타임스탬프 표시",
--	["show_desc"] = "각 창에 대한 타임스탬프 표시를 켜거나 끕니다.",
--	["show_perframename"] = "대화창%d 타임스탬프 표시",
--	["show_perframedesc"] = "타임스탬프 표시를 켜거나 끕니다.",
--	["Format Timestamp"] = "타임스탬프 형식",
--	["Set timestamp format (strftime) for each chat window. See here for more details: http://fin.instinct.org/prat/timestamps/"] = "각 대화창에 대한 타임스탬프 형식을 설정합니다. 보다 자세한 정보 : http://fin.instinct.org/prat/timestamps/",
--	["Format ChatFrame%d Timestamp"] = "%d 대화창 타임스탬프 형식",
--	["Set format of timestamp (strftime). See here for more details: http://fin.instinct.org/prat/timestamps/"] = "타임스탬프의 형식을 설정합니다. 보다 자세한 정보 : http://fin.instinct.org/prat/timestamps/",
--	["Show All Timestamps"] = "모든 타임스탬프 표시",
--	["Toggle showing timestamp for all chat windows."] = "모든 대화창에 대한 타임스탬프를 표시합니다.",
--	["Format All Timestamps"] = "모든 타임스탬프 형식",
--	["Set the timestamp format"] = "모든 대화창에 대한 타임스탬프 형식을 설정합니다. 보다 자세한 정보 : http://fin.instinct.org/prat/timestamps/",
--	["colortimestamp_name"] = "타임스탬프 색상",
--	["colortimestamp_desc"] = "타임스탬프 색상을 켜거나 끕니다.",
--	["Set Timestamp Color"] = "타임스탬프 색상 설정",
--	["Sets the color of the timestamp."] = "타임스탬프의 색상을 설정합니다.",
--	["localtime_name"] = "로컬 시간 사용",
--	["localtime_desc"] = "로컬 시간 사용을 켜거나 끕니다.",
--	["space_name"] = "공백 표시",
--	["space_desc"] = "타임스탬프 뒤에 공백 추가를 켜거나 끕니다.",
--	["Help"] = "도움말",
--	["How to customize timestamps."] = "사용자 지정 타임스탬프에 대한 사용법입니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["Timestamps"] = "Horas",
--	["Chat window timestamp options."] = "Opciones de hora para la ventana de chat",
--	["Set Separately"] = "Por Separado",
--	["Toggle setting options separately for each chat window."] = "Establecer opciones para cada ventana por separado",
--	["Show Timestamp"] = "Mostrar Hora",
--	["Toggle showing timestamp for each window."] = "Muestra la hora en cada ventana",
--	["Show ChatFrame%d Timestamp"] = "Mostrar hora en chat %d",
--	["Toggle showing timestamp on and off."] = "Muestra/Oculta la hora.",
--	["show_name"] = "Mostrar Hora",
--	["show_desc"] = "Muestra/Oculta la hora en cada ventana.",
--	["show_perframename"] = "Mostrar hora en %s.",
--	["show_perframedesc"] = "Muestra/Oculta la hora en la ventana de %s.",
--	["Format Timestamp"] = "Formatear Hora",
--	["Set the timestamp format"] = "Establece el formato de hora (strftime) para todas las ventanas de chat. Mirar aqu\195\173 para m\195\161s detalles: http://fin.instinct.org/prat/timestamps/",
--	["Format ChatFrame%d Timestamp"] = "Formato de Hora en chat %d",
--	["Set format of timestamp (strftime). See here for more details: http://fin.instinct.org/prat/timestamps/"] = "Establece el formato de hora (strftime) para la ventana de chat %d. Mirar aqu\195\173 para m\195\161s detalles: http://fin.instinct.org/prat/timestamps/",
--	["Show All Timestamps"] = "Mostrar todas las Horas",
--	["Toggle showing timestamp for all chat windows."] = "Muestra la hora en todas las ventanas de chat",
--	["Format All Timestamps"] = "Formatear todas las Horas",
--	["Set the timestamp format"] = "Establece el formato de hora (strftime) para todas las ventanas de chat. Mirar aqu\195\173 para m\195\161s detalles: http://fin.instinct.org/prat/timestamps/",
--	["colortimestamp_name"] = "Colorear Hora",
--	["colortimestamp_desc"] = "Colorea la Hora",
--	["Set Timestamp Color"] = "Color",
--	["Sets the color of the timestamp."] = "Cambia el color de la Hora",
--	["localtime_name"] = "Usar Hora Local",
--	["localtime_desc"] = "Usar Hora Local.",
--	["space_name"] = "Mostrar Espacio",
--	["space_desc"] = "Muestra un espacio tras la Hora.",
--	["Help"] = "Ayuda",
--	["How to customize timestamps."] = "Como personalizar la Hora.",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Timestamps"] = "Zeitstempel",
--	["Chat window timestamp options."] = "Chatfenster Zeitstempel Optionen",
--	["Set Separately"] = "Seperat einstellen",
--	["Toggle setting options separately for each chat window."] = "Schaltet die Einstellungsoptionen seperat f\195\188r jedes einzelne Fenster.",
--	["Show Timestamp"] = "Zeige Zeitstempel",
--	["Toggle showing timestamp for each window."] = "Justiere das Anzeigen der Zeitstempel f\195\188r jedes Fenster.",
--	["Show ChatFrame%d Timestamp"] = "Chat %d Zeitstempel Anzeigen",
--	["Toggle showing timestamp on and off."] = "Schaltet das Anzeigen des Zeitstempels an und aus.",
--	["show_name"] = "Zeige Zeitstempel",
--	["show_desc"] = "Schaltet das Anzeigen der Zeitstempel an und aus f\195\188r jedes Fenster.",
--	["show_perframename"] = "%s Zeitstempel Anzeigen",
--	["show_perframedesc"] = "Schaltet das Anzeigen des Zeitstempels an und aus f\195\188r das %s .",
--	["Format Timestamp"] = "Zeitformat Art",
--	["Set timestamp format (strftime) for each chat window. See here for more details: http://fin.instinct.org/prat/timestamps/"] = "Stellt das Zeitstempelformat (strfzeit format) f\195\188r jedes Chatfenster ein. Nähere Details unter: http://fin.instinct.org/prat/timestamps/",
--	["Format ChatFrame%d Timestamp"] = "Chat %d Zeitstempelformat",
--	["Set format of timestamp (strftime). See here for more details: http://fin.instinct.org/prat/timestamps/"] = "Stellt das Zeitstempelformat (strfzeit format) f\195\188r das Chatfenster %d ein. Nähere Details unter: http://fin.instinct.org/prat/timestamps/",
--	["Show All Timestamps"] = "Zeige Alle Zeitstempel",
--	["Toggle showing timestamp for all chat windows."] = "Aktiviert das Anzeigen des Zeitstempels f\195\188r alle Chatfenster.",
--	["Format All Timestamps"] = "Formatiere Alle Zeitstempel",
--	["Set the timestamp format"] = "Stellt das Zeitstempelformat (strfzeit format) f\195\188r alle Chatfenster ein. Nähere Details unter: http://fin.instinct.org/prat/timestamps/",
--	["colortimestamp_name"] = "F\195\164rbe Zeitstempel",
--	["colortimestamp_desc"] = "Schaltet das einf\195\164rben des Zeitstempels ein und aus.",
--	["Set Timestamp Color"] = "Justiere Zeitstempel Farbe",
--	["Sets the color of the timestamp."] = "Justiere die Farbe des Zeitstempels.",
--	["localtime_name"] = "Benutze Lokale Zeit",
--	["localtime_desc"] = "Schaltet die Benutzung der Lokalen Zeit ein und aus.",
--	["space_name"] = "Zeige Leerstelle",
--	["space_desc"] = "Aktiviere eine Leerstelle nach dem Zeitstempel.",
--    ["Help"] = "Hilfe",
--    ["How to customize timestamps."] = "Wie man Zeitstempel personalisiert.",
--} end)

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")
module.L = L

module.pluginopts = {}

-- Chatter (Antiarc) 
local FORMATS = {
	["%I:%M:%S %p"] = L["HH:MM:SS AM (12-hour)"],
	["%I:%M:S"] = L["HH:MM (12-hour)"],
	["%X"] = L["HH:MM:SS (24-hour)"],
	["%I:%M"] = L["HH:MM (12-hour)"],
	["%H:%M"] = L["HH:MM (24-hour)"],
	["%M:%S"] = L["MM:SS"],
}

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	    show = {["*"]=true},
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
		twocolumn = true,
	}
})

Prat:SetModuleOptions(module.name, {
	name = L["Timestamps"],
	desc = L["Chat window timestamp options."],
	type = "group",
	plugins = module.pluginopts,
	args = {
		show = {
			name = L["Show Timestamp"],
			desc = L["Toggle showing timestamp for each window."],
			type = "multiselect",
			order = 120,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
		},

		helpheader = {
			name = "Timestamp Text Format",
			type = "header",
			order = 129,
        },

		formatpre = {
			name = L["Pre-Timestamp"],
			desc = L["Pre-Timestamp"],
			type = "input",
			order = 130,
			usage = "<string>",		
		},
		formatcode = {
			name = L["Format All Timestamps"],
			desc = L["Set the timestamp format"],
			type = "select",
			order = 131,
            values = FORMATS,
		},
		formatpost = {
			name = L["Post-Timestamp"],
			desc = L["Post-Timestamp"],
			type = "input",
			order = 132,
			usage = "<string>",		
		},
		colortimestamp = {
			name = L["colortimestamp_name"],
			desc = L["colortimestamp_desc"],
			type = "toggle",
			get = function(info) return info.handler:GetValue(info) end,		
			order = 171,
		},
		localtime = {
			name = L["localtime_name"],
			desc = L["localtime_desc"],
			type = "toggle",		
			order = 171,
		},
		space = {
			name = L["space_name"],
			desc = L["space_desc"],
			type = "toggle",		
			order = 171,
		},
		otherheader = {
			name = "Other Formatting Options",
			type = "header",
			order = 170,
        },
		timestampcolor = {
			name = L["Set Timestamp Color"],
			desc = L["Sets the color of the timestamp."],
			type = "color",
			order = 181,
			get = "GetColorValue",
			set = "SetColorValue",
			disabled = "IsTimestampPlain",
		},
	},
})

function module:OnModuleEnable()
	-- For this module to work, it must hook before Prat
    for _,v in pairs(Prat.HookedFrames) do
        self:RawHook(v, "AddMessage", true)
    end

  	self.secondsDifference = 0
	self.lastMinute = select(2, GetGameTime())
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:AddMessage(frame, text, ...)
	if self.db.profile.show[frame:GetName()] and not Prat.loading then
		text = text and self:InsertTimeStamp(text, frame)
	end
	self.hooks[frame].AddMessage(frame, text, ...)
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
        local fmt = db.formatpre..db.formatcode..db.formatpost

        if cf and cf:GetJustifyH() == "RIGHT" then
            text = text..(space and " " or "")..Timestamp(self:GetTime(fmt))
        else
            text = Timestamp(self:GetTime(fmt)).."|c00000000|r"..(space and " " or "")..text
        end
    end

	return text
end

function module:GetTime(format)
	if self.db.profile.localtime then
		return date(format)
	else
		local tempDate = date("*t")
		tempDate["hour"], tempDate["min"] = GetGameTime()
		-- taken from FuBar_ClockFu
		if self.lastMinute ~= tempDate["min"] then
			self.lastMinute = select(2, GetGameTime())
			self.secondsDifference = mod(time(), 60)
		end
		tempDate["sec"] = mod(time() - self.secondsDifference, 60)
		return date(format, time(tempDate))
	end
end




  return
end ) -- Prat:AddModuleToLoad
