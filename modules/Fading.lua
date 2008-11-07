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
Name: PratFading
Revision: $Revision: 80569 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_DisableFade by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Fading
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds text fading options for chat windows (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local Prat = Prat

local PRAT_MODULE = Prat:RequestModuleName("Fading")

if PRAT_MODULE == nil then
    return
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["module_name"] = "Fading",
    ["module_desc"] = "Chat window text fading options.",
    ["textfade_name"] = "Enable Fading",
    ["textfade_desc"] = "Toggle enabling text fading for each chat window.",
    ["duration_name"] = "Set Fading Delay (Seconds)",
    ["duration_desc"] = "Set the number of seconds to wait before before fading text of chat windows.",
} )

L:AddLocale("ruRU", {
    ["module_name"] = "Затухание",
    ["module_desc"] = "Настройки затухания текста в окне чата.",
    ["textfade_name"] = "Включить затухание",
    ["textfade_desc"] = "Вкл/Выкл затухание текста во всех окнах чата.",
    ["duration_name"] = "Задержка затухания (в секундах)",
    ["duration_desc"] = "Задайте значение в секундах для задержки затухания текста в окне чата.",
} )


--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["module_name"] = "淡出",
--	["module_desc"] = "聊天窗口文本淡入淡出选项.",
--    ["Enable ChatFrame%d Fading"] = "聊天窗口 %d 淡出",
--    ["Toggle text fading on and off."] = "切换聊天窗口 %d 文本淡出.",
--    ["duration_name"] = "淡出延迟",
--    ["duration_desc"] = "设置聊天窗口文本淡出延迟.",
-- } end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["module_name"] = "文字淡出",
--    ["module_desc"] = "聊天視窗文字淡出選項。",
--    ["textfade_name"] = "啟用文字淡出",
--    ["textfade_desc"] = "切換是否在各個聊天視窗啟用文字淡出。",
--    ["Enable ChatFrame%d Fading"] = "聊天視窗%d啟用文字淡出",
--    ["Toggle text fading on and off."] = "切換是否啟用文字淡出。",
--    ["duration_name"] = "淡出時間",
--    ["duration_desc"] = "設定聊天視窗文字淡出前的等待時間。",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["module_name"] = "Disparition du texte",
--    ["module_desc"] = "Configure les options de disparition du texte.",
--    ["Enable ChatFrame%d Fading"] = "Fen\195\170tre %d",
--    ["Toggle text fading on and off."] = "Active/d\195\169sactive la disparition du texte pour la fen\195\170tre %d.",
--    ["duration_name"] = "Ajustement du d\195\169lai de disparition",
--    ["duration_desc"] = "R\195\168gle le temps au bout duquel le texte disparait de la fen\195\170tre de chat.",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["module_name"] = "숨김",
--    ["module_desc"] = "대화글 숨김 설정입니다.",
--    ["textfade_name"] = "숨김 사용",
--    ["textfade_desc"] = "각 대화창에 대한 글자 숨김 사용을 전환합니다.",
--    ["Enable ChatFrame%d Fading"] = "%d 대화창 숨김 사용",
--    ["Toggle text fading on and off."] = "글자 숨김 켜고 끄기를 전환합니다.",
--    ["duration_name"] = "숨김 지연시간 설정",
--    ["duration_desc"] = "대화글 숨김까지의 지연시간을 설정합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["module_name"] = "Desvanecimiento",
--    ["module_desc"] = "Opciones de desvanecimiento de texto de la ventana de chat",
--    ["Enable ChatFrame%d Fading"] = "Desvanecimiento en Chat %d",
--    ["Toggle text fading on and off."] = "Determina si se activa o desactiva el desvanecimiento en la ventana de chat %d",
--    ["duration_name"] = "Retraso del Desvanecimiento",
--    ["duration_desc"] = "Establece el tiempo a esperar antes de que se desvanezca el texto de las ventanas de chat",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["module_name"] = "Ausblenden",
--	["module_desc"] = "Chatfenster Text Ausblenden Optionen.",
--	["Enable ChatFrame%d Fading"] = "Chat %d Ausblenden",
--	["Toggle text fading on and off."] = "Schaltet das Text ausblenden an und aus f\195\188r das Chatfenster %d.",
--	["duration_name"] = "Text Ausblenden Verz\195\182gerrung einstellen",
--	["duration_desc"] = "Stellt die Dauer ein bis der Chat in den Chatfenstern ausgeblendet wird.",
--} end)



local mod = Prat:NewModule(PRAT_MODULE)

-- define the default db values
Prat:SetModuleDefaults(mod.name, {
	profile = {
	    on = true,
	    textfade = {["*"]=true},
	    duration = 120
	}
} )

Prat:SetModuleOptions(mod.name, {
        name = L["module_name"],
        desc = L["module_desc"],
        type = "group",
        args = {
			textfade = {
		        name = L["textfade_name"],
		        desc = L["textfade_desc"],
		        type = "multiselect",
				values = Prat.HookedFrameList,
				get = "GetSubValue",
				set = "SetSubValue"
			},
            duration = {
                name = L["duration_name"],
                desc = L["duration_desc"],
                type = "range",
                order = 190,                
				min = 1,
                max = 60,
                step = 1
            },
       }
 })


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function mod:OnModuleEnable()
	self:OnValueChanged()
end

-- things to do when the module is disabled
function mod:OnModuleDisable()
    for k,v in pairs(Prat.HookedFrames) do
        self:Fade(v, true)
    end
end

function mod:OnValueChanged(...)
    for k,v in pairs(Prat.HookedFrames) do
        self:Fade(v, self.db.profile.textfade[k])
    end
end

mod.OnSubValueChanged = mod.OnValueChanged


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--

-- enable/disable fading
function mod:Fade(cf, textfade)
    if textfade then
        cf:SetFading(1)
		cf:SetTimeVisible(mod.db.profile.duration)
    else
        cf:SetFading(0)
    end
end
 

  return
end ) -- Prat:AddModuleToLoad