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
Name: PratAddonMsgs
Revision: $Revision: 80330 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#AddonMsgs
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that toggles showing hidden addon messages on and off (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("AddonMsgs")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["AddonMsgs"] = true,
    ["Addon message options."] = true,
    ["show_name"] = "Show Addon Messages",
    ["show_desc"] = "Toggle showing hidden addon messages in each chat window.",
    ["show_perframename"] = "ChatFrame%d AddonMsgsShow",
    ["show_perframedesc"] = "Toggle showing hidden addon messages on and off.",
} )
-- Translated by StingerSoft
L:AddLocale("ruRU", {
    ["AddonMsgs"] = "Сообщения аддонов",
    ["Addon message options."] = "Настройки сообщений аддонов",
    ["show_name"] = "Показывать сообщения аддонов",
    ["show_desc"] = "Включить отображение сообщений аддонов в каждой закладке чата.",
    ["show_perframename"] = "ChatFrame%d AddonMsgsShow",
    ["show_perframedesc"] = "Вкл/Выкл отображение сообщений аддонов.",
} )

--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["AddonMsgs"] = "Addon Nachrichten",
--    ["Addon message options."] = "Chatfenster Addon Nachrichten Optionen.",
--    ["show_name"] = "Zeige Addon Nachrichten",
--    ["show_desc"] = "Schaltet das Anzeigen von verborgenen Addon Nachrichten an und aus f\195\188r jedes Fenster.",
--    ["show_perframename"] = "%s Addon Nachricht Anzeigen",
--    ["show_perframedesc"] = "Schaltet das Anzeigen von verborgenen Addon Nachrichten ein und aus  f\195\188r %s .",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["AddonMsgs"] = "Messages des Addons",
--    ["Addon message options."] = "Options des messages d'addon.",
--    ["show_name"] = "Afficher les messages des addons",
--    ["show_desc"] = "Active/d\195\169sactive les messages des addons pour chaque fen\195\170tre.",
--    ["show_perframename"] = "%s : Afficher les messages des addons",
--    ["show_perframedesc"] = "Active/d\195\169sactive les messages des addons dans la fen\195\170tre %s .",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["AddonMsgs"] = "Mensajes de Accesorio",
--    ["Addon message options."] = "Opciones de Mensajes de Accesorio",
--    ["show_name"] = "Mostrar",
--    ["show_desc"] = "Determina si se muestran los mensajes ocultos de accesorio para cada ventana.",
--    ["show_perframename"] = "Mostrar Mensajes en %s ",
--    ["show_perframedesc"] = "Determina si se muestran los mensajes de accesorio para la ventana de %s ."
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["AddonMsgs"] = "애드온 메세지",
--    ["Addon message options."] = "애드온 메세지 설정입니다.",
--    ["show_name"] = "애드온 메세지 표시",
--    ["show_desc"] = "각각의 대화창에 숨겨진 애드온 메세지를 표시합니다.",
--    ["show_perframename"] = "대화창%d 애드온 메세지 표시",
--    ["show_perframedesc"] = "숨겨진 애드온 메세지를 표시합니다.",
--} end)

--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["AddonMsgs"] = "插件訊息",
--    ["Addon message options."] = "插件訊息選項。",
--    ["show_name"] = "顯示插件訊息",
--    ["show_desc"] = "切換是否在各個聊天視窗顯示插件訊息。",
--    ["show_perframename"] = "聊天視窗%d顯示插件訊息",
--    ["show_perframedesc"] = "切換是否顯示插件訊息。"
--} end)
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["AddonMsgs"] = "插件信息",
--    ["Addon message options."] = "插件信息设置",
--    ["show_name"] = "显示插件信息",
--    ["show_desc"] = "选择是否在每个窗口显示插件信息",
--    ["show_perframename"] = "在窗口%s显示插件信息",
--     ["show_perframedesc"] = "选择是否在聊天窗口%s显示隐藏的插件信息."
-- } end)



local mod = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")

Prat:SetModuleDefaults(mod.name, {
	profile = {
	    on = false,
	    show = {},
	}
} )

Prat:SetModuleOptions(mod.name, {
        name = L["AddonMsgs"],
        desc = L["Addon message options."],
        type = "group",
        args = {
			show = {
		        name = L["show_name"],
		        desc = L["show_desc"],
		        type = "multiselect",
				values = Prat.HookedFrameList,
				get = "GetSubValue",
				set = "SetSubValue"
			}
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
function mod:OnModuleEnable()
	self:RegisterEvent("CHAT_MSG_ADDON")
end
function mod:OnModuleDisable()
	self:UnregisterEvent("CHAT_MSG_ADDON")
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

local CLR = Prat.CLR

-- add a splash of color to text
local function c1(text) return CLR:Colorize("ffff40", text) end
local function c2(text) return CLR:Colorize("a0a0a0", text) end
local function c3(text) return CLR:Colorize("40ff40", text) end
local function c4(text) return CLR:Colorize("4040ff", text) end

-- show hidden addon channel messages
function mod:CHAT_MSG_ADDON(arg1, arg2, arg3, arg4)
    for k,v in pairs(Prat.HookedFrames) do
        if self.db.profile.show[k] then
            v:AddMessage("["..c1(arg1).."]["..c2(arg2).."]["..c3(arg3).."]["..c4(arg4).."]")
        end
    end
end

  return
end ) -- Prat:AddModuleToLoad