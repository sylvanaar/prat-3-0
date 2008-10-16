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
Name: PratEventNames
Revision: $Revision: 82149 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#EventNames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that toggles showing hidden addon messages on and off (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("EventNames")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["EventNames"] = true,
    ["Chat window event name options."] = true,
	["Show"] = true,
	["Show events on chatframes"] = true, 
    ["show_name"] = "Show Event Names",
    ["show_desc"] = "Toggle showing event names in each window.",
})

L:AddLocale("ruRU", {
    ["EventNames"] = true,
    ["Chat window event name options."] = true,
	["Show"] = true,
	["Show events on chatframes"] = true, 
    ["show_name"] = "Show Event Names",
    ["show_desc"] = "Toggle showing event names in each window.",
})

----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 82149 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--     ["EventNames"] = "事件名称",
--     ["Chat window event name options."] = "聊天窗口事件名称选项。",
--     ["show_name"] = "显示事件",
--     ["show_desc"] = "切换显示各个窗口的事件名称",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["EventNames"] = "Noms des \195\169venements",
--    ["Chat window event name options."] = "Options d'affichage des \195\169v\195\168nements des fen\195\170tres.",
--    ["show_name"] = "Afficher les \195\169v\195\168nements",
--    ["show_desc"] = "Activer/d\195\169sactiver l'affichage des noms d'\195\169v\195\168nements pour chaque fen\195\170tre.",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["EventNames"] = "事件名稱",
--    ["Chat window event name options."] = "聊天視窗事件名稱選項。",
--    ["show_name"] = "顯示事件名稱",
--    ["show_desc"] = "切換是否在各個聊天視窗顯示事件名稱。",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["EventNames"] = "이벤트명",
--    ["Chat window event name options."] = "대화창 이벤트명 설정입니다.",
--    ["show_name"] = "이벤트명 표시",
--    ["show_desc"] = "각각의 대화창에 이벤트명을 표시합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["EventNames"] = "Nombres de Evento",
--    ["Chat window event name options."] = "Opciones de nombres de evento",
--    ["show_name"] = "Mostrar Eventos",
--    ["show_desc"] = "Determina si se muestran los nombres de evento para cada ventana",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["EventNames"] = "Event Namen",
--	["Chat window event name options."] = "Chatfenster Event Namen Optionen.",
--	["show_name"] = "Zeige Name",
--	["show_desc"] = "Aktiviert das Anzeigen von Event Namen in jedem Fenster.",
--} end)


local mod = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(mod.name, {
	profile = {
	    on = true,
	    show = {},
	}
} )

Prat:SetModuleOptions(mod.name, {
        name = L["EventNames"],
        desc = L["Chat window event name options."],
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

function mod:OnModuleEnable()
	Prat.RegisterChatEvent(self,"Prat_PreAddMessage","Prat_PreAddMessage")
end

function mod:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
do
	local CLR = Prat.CLR
	local function EventBrackets(text) return CLR:Colorize("ffffff", text) end
	local function EventName(text, c)  return CLR:Colorize(c, text) end
	local desat = 192*0.7+63
	local c
	function mod:Prat_PreAddMessage(arg, message, frame, event, t, r, g, b)		
		if self.db.profile.show[frame:GetName()] then
			c = ("%02x%02x%02x"):format((r or 1.0)*desat, (g or 1.0)*desat, (b or 1.0)*desat)
			message.POST =  "  "..EventBrackets("(")..EventName(tostring(event), c)..EventBrackets(")")
		end
	end
end

  return
end ) -- Prat:AddModuleToLoad