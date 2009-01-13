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
Name: PratPopupMessage
Revision: $Revision: 80460 $
Author(s): Sylvanaar
Inspired by: CleanChat
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#PopupMessage
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that displays chat with your name in a pop up window
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("PopupMessage")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
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

L:AddLocale("ruRU", {
    ["PopupMessage"] = true,
    ["Shows messages with your name in a popup."] = "Отображать сообщение с вашим именем в всплывающем окне.",
    ["Set Separately"] = "Разделение",
    ["Toggle setting options separately for each chat window."] = "Вкл/Выкл настройки разделения для всех окон чата.",
    ["show_name"] = "Показывать всплывание",
    ["show_desc"] = "Отображать всплывние для всех окон чата.",
    ["Show Popups"] = "Показывать всплывание",
    ["Show Popups for each window."] = "Отображать всплывние для всех окон чата.",
    ["show_perframename"] = "Показать всплывание окна%d",
    ["show_perframedesc"] = "Вкл/Выкл отображение всплывания.",
    ["showall_name"] = "Все всплывающие",
    ["showall_desc"] = "Показывать всплывающие окна для всего чата.",
    ["Show All Popups"] ="Все всплывающие",
    ["Show Popups for all chat windows."] = "Показывать всплывающие окна для всего чата.",
    ["Add Nickname"] = "Добавить ник",
    ["Adds an alternate name to show in popups."] = "Добавить альтернативное имя для отображения при всплывании",
    ["Remove Nickname"] = "Удалить ник",
    ["Removes an alternate name to show in popups."] = "Удалить альтернативное имя для отображения при всплывании",
    ["Clear Nickname"] = "Очистить ники",
    ["Clears alternate name to show in popups."] = "Очистить альтернативные имена для отображения при всплывании",
    ["framealpha_name"] = "Прозрачность окна всплывания",
    ["framealpha_desc"] = "Установка прозрачности всплывающего окна при полном затухании.",
    ["Popup"] = "Всплывающий", 
    ["Shows messages in a popup window."] = "Отображать сообщение в всплввающем окне.",
-- 	["Use SCT Message"] = true,
--	["Show the text as an SCT message instead of in its own frame"] = true,
})
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--	["PopupMessage"] = "Alerte pseudo",
--	["Shows messages with your name in a popup."] = "Affiche dans une fenêtre les messages qui contiennent votre nom.",
--	["Set Separately"] = "Régler séparément",
--	["Toggle setting options separately for each chat window."] = "Règle les options séparément pour chaque fenêtre de chat.",
--	["Show Popups"] = "Fenêtre flottante",
--	["Show Popups for each window."] = "Afficher les fenêtres flottantes pour chaque fenêtre de discussion.",
--	["Show All Popups"] = "Afficher toutes les fenêtres flottantes",
--	["Show Popups for all chat windows."] = "Afficher les fenêtres flottantes pour toutes les fenêtres de chat.",
--	["Adds an alternate name to show in popups."] = "Ajoute un nom secondaire pour lequel afficher les alertes.",
--	["Add Nickname"] = "Ajouter un pseudo",
--	["Remove Nickname"] = "Supprimer un pseudo",
--	["Clear Nickname"] = "Vider les pseudos",
----	["Use SCT Message"] = "Utiliser les messages de SCT",
----	["Show the text as an SCT message instead of in its own frame"] = "Affiche le texte comme un message SCT",
--	["show_name"] = "Afficher",
--	["show_desc"] = "Afficher l'heure pour chaque fenêtre.",
--	["show_perframename"] = "Fenêtre %s ",
--	["show_perframedesc"] = "Affiche/masque les fenêtres flottantes pour la fenêtre %s .",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["PopupMessage"] = "메세지 팝업",
--    ["Shows messages with your name in a popup."] = "당신의 이름을 포함한 메세지를 팝업으로 표시합니다.",
--    ["Set Separately"] = "구분 설정",
--    ["Toggle setting options separately for each chat window."] = "각각의 대화창에 구분 설정을 사용합니다.",
--    ["show_name"] = "팝업 표시",
--    ["show_desc"] = "각 대화창에 대한 팝업을 표시합니다.",
--    ["Show Popups"] = "팝업 표시",
--    ["Show Popups for each window."] = "각 대화창에 대한 팝업을 표시합니다.",
--    ["show_perframename"] = "대화창%d 팝업 표시",
--    ["show_perframedesc"] = "팝업 표시를 켜거나 끕니다.Toggles showing popups on and off.",
--    ["showall_name"] = "모든 팝업 표시",
--    ["showall_desc"] = "모든 대화창에 대한 팝업을 표시합니다.",
--    ["Show All Popups"] = "모든 팝업 표시",
--    ["Show Popups for all chat windows."] = "모든 대화창에 대한 팝업을 표시합니다.",
--    ["Add Nickname"] = "별명 추가",
--    ["Adds an alternate name to show in popups."] = "팝업에 표시할 별명을 추가합니다.",
--    ["Remove Nickname"] = "별명 삭제",
--    ["Removes an alternate name to show in popups."] = "팝업에 표시할 별명을 제거합니다.",
--    ["Clear Nickname"] = "별명 초기화",
--    ["Clears alternate name to show in popups."] = "팝업에 표시할 별명을 초기화합니다.",
--    ["framealpha_name"] = "팝업창 투명도",
--    ["framealpha_desc"] = "팝업창의 투명도를 설정합니다.",
--    ["Popup"] = "팝업", 
--    ["Shows messages in a popup window."] = "팝업창에 메세지를 표시합니다.",
----    ["Use SCT Message"] = "SCT 메세지 사용",
----    ["Show the text as an SCT message instead of in its own frame"] = "SCT 메세지로 팝업을 표시합니다.",
--} end)
--
----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80460 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["PopupMessage"] = "弹出信息",
--    ["Shows messages with your name in a popup."] = "弹出显示包含本人姓名的信息.",
--    ["Set Separately"] = "独立设置",
--    ["Toggle setting options separately for each chat window."] = "独立设置每个窗口的选项",
--    ["show_name"] = "显示",
--    ["show_desc"] = "切换每个窗口显示时间标签.",
--    ["Show Popups"] = "弹出显示",
--    ["Show Popups for each window."] = "弹出显示每个窗口信息.",
--    ["show_perframename"] = "窗口 %s 弹出",
--    ["show_perframedesc"] = "切换聊天窗口 %s 弹出显示.",
--    ["showall_name"] = "全部弹出",
--    ["showall_desc"] = "全部聊天窗口均弹出显示.",
--    ["Show All Popups"] = "全部弹出",
--    ["Show Popups for all chat windows."] = "全部聊天窗口均弹出显示",
--    ["Add Nickname"] = "添加昵称",
--    ["Remove Nickname"] = "移除昵称",
--    ["Clear Nickname"] = "清除昵称",
--    ["framealpha_name"] = "弹出窗口透明度",
--    ["framealpha_desc"] = "设置弹出信息窗口的透明度",
---- 	["Use SCT Message"] = "使用 SCT 信息",
----	["Show the text as an SCT message instead of in its own frame"] = "使用 SCT 模式显示弹出信息替代自身框架",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["PopupMessage"] = "彈出訊息",
--    ["Shows messages with your name in a popup."] = "將有你的名字的訊息顯示在彈出訊息中。",
--    ["Set Separately"] = "個別設定",
--    ["Toggle setting options separately for each chat window."] = "分別設定各聊天視窗。",
--    ["show_name"] = "顯示彈出訊息",
--    ["show_desc"] = "切換是否為各個聊天視窗顯示彈出訊息。",
--    ["Show Popups"] = "顯示彈出訊息",
--    ["Show Popups for each window."] = "切換是否為各個聊天視窗顯示彈出訊息。",
--    ["show_perframename"] = "顯示聊天視窗%d彈出訊息",
--    ["show_perframedesc"] = "切換是否顯示彈出訊息。",
--    ["showall_name"] = "顯示全部彈出訊息",
--    ["showall_desc"] = "為全部聊天視窗顯示彈出訊息。",
--    ["Show All Popups"] = "顯示全部彈出訊息",
--    ["Show Popups for all chat windows."] = "為全部聊天視窗顯示彈出訊息。",
--    ["Add Nickname"] = "增加暱稱",
--    ["Adds an alternate name to show in popups."] = "增加顯示在彈出訊息中的暱稱。",
--    ["Remove Nickname"] = "移除暱稱",
--    ["Removes an alternate name to show in popups."] = "移除顯示在彈出訊息中的暱稱。",
--    ["Clear Nickname"] = "清除暱稱",
--    ["Clears alternate name to show in popups."] = "清除全部顯示在彈出訊息中的暱稱。",
--    ["framealpha_name"] = "彈出視窗透明度",
--    ["framealpha_desc"] = "設定彈出視窗透明度。",
--    ["Popup"] = "彈出視窗", 
--    ["Shows messages in a popup window."] = "在彈出視窗中顯示訊息。",
---- 	["Use SCT Message"] = "使用 SCT 訊息",
----	["Show the text as an SCT message instead of in its own frame"] = "將訊息以 SCT 訊息顯示而不顯示在自己的視窗中。",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["PopupMessage"] = "Mensaje en Ventana Emergente",
--    ["Shows messages with your name in a popup."] = "Muestras los mensajes con tu nombre en una ventana emergente",
--    ["Set Separately"] = "Por Separado",
--    ["Toggle setting options separately for each chat window."] = "Establece las opciones para cada ventana de chat por separado",
--    ["show_name"] = "Mostrar",
--    ["show_desc"] = "Muestra los ajustes de sello de tiempo para cada ventana.",
--    ["Show Popups"] = "Mostrar ventanas emergentes",
--    ["Show Popups for each window."] = "Muestra ventanas emergentes para cada ventana",
--    ["show_perframename"] = "Mostrar Ventana Emergente en %s ",
--    ["show_perframedesc"] = "Muestra las ventanas emergentes para la ventana de %s ",
--    ["showall_name"] = "Mostrar Todas las Ventanas Emergentes",
--    ["showall_desc"] = "Muestra las ventanas emergentes para todas las ventanas de chat",
--    ["Show All Popups"] = "Mostrar Todas las Ventanas Emergentes",
--    ["Show Popups for all chat windows."] = "Muestra las ventanas emergentes para todas las ventanas de chat",
--    ["Add Nickname"] = "A\195\177adir Pseud\195\179nimmo",
--    ["Adds an alternate name to show in popups."] = "A\195\177ade un nombre alternativo para mostrar en las ventanas emergentes",
--    ["Remove Nickname"] = "Eliminar Pseud\195\179nimo",
--    ["Removes an alternate name to show in popups."] = "Elimina un nombre alternativo para mostrar en las ventanas emergentes",
--    ["Clear Nickname"] = "Borrar Pseud\195\179nimo",
--    ["Clears alternate name to show in popups."] = "Limpia nombre alternativos a mostrar en ventanas emergentes.",
--    ["framealpha_name"] = "Transparencia de Ventana Emergente",
--    ["framealpha_desc"] = "Establece la transparencia de la ventana emergente cuando es mostrada",
--    ["Popup"] = "Ventana Emergente",
--    ["Shows messages in a popup window."] = "Muestra mensajes en una ventana emergente.",
---- 	["Use SCT Message"] = "Usar Mensaje SCT",
----	["Show the text as an SCT message instead of in its own frame"] = "Muestra el texto como un mensaje de SCT en vez de en su propio marco",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["PopupMessage"] = "Popup Nachrichten",
--	["Shows messages with your name in a popup."] = "Zeige Nachrichten mit deinem Namen in einem Popup.",
--	["Set Separately"] = "Seperat einstellen",
--	["Toggle setting options separately for each chat window."] = "Aktiviert das seperate Einstellen der Optionen für jedes Chatfenster.",
--	["show_name"] = "Zeige Namen",
--	["show_desc"] = "Zeige Namen f\195\188r jedes Fenster.",
--	["Show Popups"] = "Zeige Popups",
--	["Show Popups for each window."] = "Zeige Popups f\195\188r jedes Fenster.",
--	["show_perframename"] = "%s Popups Anzeigen",
--	["show_perframedesc"] = "Schaltet Popups an und aus f\195\188r %s .",
--	["showall_name"] = "Zeige alle Popups",
--	["showall_desc"] = "Zeige Popups f\195\188r alle Chatfenster.",
--	["Show All Popups"] = "Zeige alle Popups",
--	["Show Popups for all chat windows."] = "Zeige Popups f\195\188r alle Chatfenster.",
--	["Add Nickname"] = "Nicknamen hinzuf\195\188gen",
--	["Adds an alternate name to show in popups."] = "F\195\188gt einen alternativen Namen hinzu der in den Popup's anzeigt wird.",
--	["Remove Nickname"] = "Entferne Nicknamen",
--	["Removes an alternate name to show in popups."] = "Entfernt einen der alternativen Nicknamen die in den Popup's angezeigt werden.",
--	["Clear Nickname"] = "L\195\182sche Nicknamen",
--	["Clears alternate name to show in popups."] = "L\195\182sche alternativen Namen der in den Popup's angezeigt wird.",
--	["framealpha_name"] = "Popup Fenster Transparenz",
--	["framealpha_desc"] = "Justiere die Transparenz des Popup Fensters wenn es voll eingeblendet ist.",
--	["Popup"] = "Popup", 
--	["Shows messages in a popup window."] = "Zeigt Nachrichten in einem Popup Fenster.",
----	["Use SCT Message"] = "Benutze SCT Nachrichtenfenster",
---- 	["Show the text as an SCT message instead of in its own frame"] = "Zeige die Texte als eine SCT Nachricht anstatt im eigenen Fenster.",
--} end)

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

-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	    separate = true,
	    show = {},
	    framealpha = 1.0,
	    nickname = {},
		sinkoptions = { ["sink20OutputSink"] = "Popup" },
	}
} )

local pluginOptions =  { sink = {} }

Prat:SetModuleOptions(module, {
    name = L["PopupMessage"],
    desc = L["Shows messages with your name in a popup."],
    type = "group",
	plugins = pluginOptions,
    args = {
		helpheader = {
			name = "Settings",
			type = "header",
			order = 105,
		},
        show = {
            name = L["Show Popups"],
            desc = L["Show Popups for each window."],
	        type = "multiselect",
            order = 110,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
        },
        addnick = {
            name = L["Add Nickname"],
            desc = L["Adds an alternate name to show in popups."],
            type = "input",
            order = 140,
            usage = "<string>",
            get = false,
			set = function(info, name) info.handler:AddNickname(name) end
        },
        removenick = {
            name = L["Remove Nickname"],
            desc = L["Removes an alternate name to show in popups."],
            type = "select",
            order = 150,
			get = function(info) return "" end,
			values = function(info) return info.handler.db.profile.nickname end,
            disabled = function(info) return #info.handler.db.profile.nickname == 0 end,
			set = function(info, value) info.handler:RemoveNickname(value) end
        },
        clearnick = {
            name = L["Clear Nickname"],
            desc = L["Clears alternate name to show in popups."],
			type = "execute",
            order = 160,
            disabled = function(info) return (#info.handler.db.profile.nickname == 0) end,
			func = "ClearNickname",
        },
    },
})

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
Prat:SetModuleInit(module, 
	function(self)
    	self:RegisterSink(
    	    L["Popup"], 
    	    L["PopupMessage"], 
    	    L["Shows messages in a popup window."],
    	    "Popup"
    	)		
		self:SetSinkStorage(self.db.profile.sinkoptions)
		
		pluginOptions.sink["output"] = self:GetSinkAce3OptionsDataTable()
		pluginOptions.sink["output"].inline = true
		
		self.db.profile.show = self.db.profile.show or {}
	end
)

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
------------------------------------------------]]--

-- /dump module.moduleOptions.args.output.get():find("Default")
-- /script module.moduleOptions.args.output.set("PopupMessage")
-- /dump module.db.profile
-- /script module.db.profile.sink10OutputSink = nil
function module:Popup(source, text, r,g,b, ...)   
    if UIFrameIsFlashing(Prat_PopupFrame) then  
        UIFrameFlashRemoveFrame(Prat_PopupFrame)
    end
    
	Prat_PopupFrame.fadeOut = 5;
	Prat_PopupFrame:SetAlpha(module.db.profile.framealpha or 1.0);
	Prat_PopupFrameText:SetTextColor(r,g,b)
	Prat_PopupFrameText:SetText(text);
	
	local font, _, style = ChatFrame1:GetFont()
	local _, fontsize = GameFontNormal:GetFont()
	Prat_PopupFrameText:SetFont( font, fontsize, style )   
    Prat_PopupFrameText:SetNonSpaceWrap(false)
	Prat_PopupFrame:SetWidth(math.min(math.max(64, Prat_PopupFrameText:GetStringWidth()+20), 520))
    Prat_PopupFrame:SetHeight(64)
	Prat_PopupFrame:SetBackdropBorderColor(r,g,b) 	

    Prat_PopupFrameText:ClearAllPoints()
    Prat_PopupFrameText:SetPoint("TOPLEFT", Prat_PopupFrame, "TOPLEFT", 10, 10)
    Prat_PopupFrameText:SetPoint("BOTTOMRIGHT", Prat_PopupFrame, "BOTTOMRIGHT", -10, -10)
	Prat_PopupFrameText:Show()
	
	local inTime, outTime, holdTime = 1, Prat_PopupFrame.fadeOut, 4   
	    
	local fadeInfo = {}
	fadeInfo.timeToFade = inTime
	fadeInfo.mode = "IN"
	fadeInfo.fadeHoldTime = holdTime
	fadeInfo.startAlpha = 0
	fadeInfo.endAlpha = module.db.profile.framealpha or 1.0

	fadeInfo.finishedFunc = UIFrameFadeOut
	fadeInfo.finishedArg1 = Prat_PopupFrame
	fadeInfo.finishedArg2 = outTime
	fadeInfo.finishedArg3 = module.db.profile.framealpha or 1.0
	fadeInfo.finishedArg4 = 0
	UIFrameFade(Prat_PopupFrame, fadeInfo)	    	    
end

local DEBUG 
--@debug@ 
DEBUG = true
--@end-debug@

function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    if Prat.EVENT_ID and 
       Prat.EVENT_ID == self.lastevent and 
       self.lasteventtype == event then 
       return 
    end
    
	if not (EVENTS_EMOTES[event] or EVENTS_IGNORE[event]) then
		if self.db.profile.showall or self.db.profile.show[frame:GetName()] then
			if DEBUG or message.PLAYERLINK and not message.PLAYERLINK:match(self.playerName) then
				self:CheckText(message.ORG.MESSAGE, message.OUTPUT, event, r, g, b)
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
function module:CheckText(text, display_text, event, r, g, b)
--	local textL = safestr(text):lower()

    local show = false
    
    print(text, event)
    print(text:match(self.playerName))

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
        self.lastevent = Prat.EVENT_ID
		self:Pour(display_text or text, r,g,b)
		Prat:PlaySound("popup");
	end	
end




  return
end ) -- Prat:AddModuleToLoad