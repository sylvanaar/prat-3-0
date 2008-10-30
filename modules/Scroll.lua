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
Name: module
Revision: $Revision: 82149 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_PlayerNames by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Scroll
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that enables mousewheel scrolling and TheDownLow for chat windows (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Scroll")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["Scroll"] = true,
    ["Chat window scrolling options."] = true,
    ["mousewheel_name"] = "Enable MouseWheel",
    ["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
    ["Set MouseWheel Speed"] = true,
    ["Set number of lines mousewheel will scroll."] = true,
    ["Set Ctrl+MouseWheel Speed"] = true,
    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = true,
    ["lowdown_name"] = "Enable TheLowDown",
    ["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
    ["Set TheLowDown Delay"] = true,
    ["Set time to wait before jumping to the bottom of chat windows."] = true,
	["Text scroll direction"] = true,
	["Control whether text is added to the frame at the top or the bottom."] = true,
	["Top"] = "Top to bottom",
	["Bottom"] = "Bottom to top",
})

L:AddLocale("ruRU", {
    ["Scroll"] = true,
    ["Chat window scrolling options."] = "Настройки прокрутки окна чата.",
    ["mousewheel_name"] = "Включить КолесоМыши",
    ["mousewheel_desc"] = "Вкл/Выкл поддержку колесика мыши во всех оконах чата.",
    ["Set MouseWheel Speed"] = "Скорость КолесаМыши",
    ["Set number of lines mousewheel will scroll."] = "Устанавите число строк прокручиваемых колёсиком мыши за раз.",
    ["Set Ctrl+MouseWheel Speed"] = "Задать скорость Ctrl+КолесоМыши",
    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Установите число строк прокручиваемых колёсиком мыши при удерживании ctrl.",
    ["lowdown_name"] = "Включить спад в низ",
    ["lowdown_desc"] = "Вкл/Выкл авто прокрутку в низ для во всех окнах чата.",
    ["Set TheLowDown Delay"] = "Задержка спада в низ",
    ["Set time to wait before jumping to the bottom of chat windows."] = "Установите время ожидания перед прокруткой в низ окна чата.",
	["Text scroll direction"] = "Направление текста прокрутки",
	["Control whether text is added to the frame at the top or the bottom."] = "Регулировка текста добавленного в окно в вверх или низ.",
	["Top"] = "С верху вниз",
	["Bottom"] = "Снизу вверх",
})

----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 82149 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["Scroll"] = "滚动",
--    ["Chat window scrolling options."] = "聊天窗口滚动选项.",
--    ["mousewheel_name"] = "开启鼠标滚轮",
--    ["mousewheel_desc"] = "切换每个聊天窗口鼠标滚轮支持.",
--    ["mousewheel_perframename"] = "%s 鼠标滚轮",
--    ["mousewheel_perframedesc"] = "切换鼠标滚轮支持",
--    ["Set MouseWheel Speed"] = "滚轮速度",
--    ["Set number of lines mousewheel will scroll."] = "设置每次鼠标滚动行数.",
--    ["Set Ctrl+MouseWheel Speed"] = "<Ctrl+鼠标滚轮> 速度",
--    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = "设置按下 Ctrl 键时每次鼠标滚动行数.",
--    ["lowdown_name"] = "开启跳至底部",
--    ["lowdown_desc"] = "切换每个窗口跳至底部功能.",
--    ["lowdown_perframename"] = "%s 跳底",
--    ["lowdown_perframedesc"] = "切换跳至底部功能",
--    ["Set TheLowDown Delay"] = "跳至底部延迟",
--    ["Set time to wait before jumping to the bottom of chat windows."] = "设置向上滚动后, 聊天窗口自动跳至底部的延迟.",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["Scroll"] = "스크롤",
--    ["Chat window scrolling options."] = "대화창 스크롤에 관한 설정입니다.",
--    ["mousewheel_name"] = "마우스휠 사용",
--    ["mousewheel_desc"] = "각각의 대화창에 대한 마우스휠 기능을 사용합니다.",
--    ["mousewheel_perframename"] = "대화창%d 마우스휠 사용",
--    ["mousewheel_perframedesc"] = "마우스휠 기능을 사용합니다.",
--    ["Set MouseWheel Speed"] = "마우스휠 속도 설정",
--    ["Set number of lines mousewheel will scroll."] = "스크롤 할 라인 수를 설정합니다.",
--    ["Set Ctrl+MouseWheel Speed"] = "CTRL+마우스휠 속도 설정",
--    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = "CTRL키를 눌렀을 때 스크롤 할 라인 수를 설정합니다.",
--    ["lowdown_name"] = "자동하단 사용",
--    ["lowdown_desc"] = "각각의 대화창에 대한 자동하단 기능을 사용합니다.",
--    ["lowdown_perframename"] = "대화창%d 자동하단 사용",
--    ["lowdown_perframedesc"] = "자동하단 기능을 사용합니다.",
--    ["Set TheLowDown Delay"] = "자동하단 지연시간 설정",
--    ["Set time to wait before jumping to the bottom of chat windows."] = "대화창의 하단으로 이동할 시간을 설정합니다.",
--	["Text scroll direction"] = "텍스트 스크롤 방향",
--	["Control whether text is added to the frame at the top or the bottom."] = "텍스트를 창의 상단 혹은 하단에 추가할지 여부를 조절합니다.",
--	["Top"] = "위에서 아래로",
--	["Bottom"] = "아래에서 위로",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Scroll"] = "捲動",
--    ["Chat window scrolling options."] = "聊天視窗捲動選項。",
--    ["mousewheel_name"] = "啟用滑鼠滾輪",
--    ["mousewheel_desc"] = "切換是否在各個聊天視窗啟用滑鼠滾輪。",
--    ["mousewheel_perframename"] = "聊天視窗%d啟用滑鼠滾輪",
--    ["mousewheel_perframedesc"] = "切換是否啟用滑鼠滾輪。",
--    ["Set MouseWheel Speed"] = "設定滾輪速度",
--    ["Set number of lines mousewheel will scroll."] = "設定滾輪將會捲動多少行。",
--    ["Set Ctrl+MouseWheel Speed"] = "設定Ctrl-滑鼠滾輪速度",
--    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = "設定Ctrl-滾輪將會捲動多少行。",
--    ["lowdown_name"] = "啟用自動跳至最底端",
--    ["lowdown_desc"] = "切換是否在各個聊天視窗啟用自動跳至最底端。",
--    ["lowdown_perframename"] = "聊天視窗%d啟用自動跳至最底端",
--    ["lowdown_perframedesc"] = "切換是否啟用自動跳至最底端。",
--    ["Set TheLowDown Delay"] = "設定自動跳至最底端延遲時間",
--    ["Set time to wait before jumping to the bottom of chat windows."] = "設定自動跳至最底端的延遲時間。",
--	["Text scroll direction"] = "文字加入方向",
--	["Control whether text is added to the frame at the top or the bottom."] = "控制文字加入聊天視窗的頂部/底部。",
--	["Top"] = "頂部到底部",
--	["Bottom"] = "底部到頂部",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["Scroll"] = "Desplazamiento Vertical",
--    ["Chat window scrolling options."] = "Opciones de desplazamiento vertical de las ventanas de chat",
--    ["mousewheel_name"] = "Activar Rueda del Rat\195\179n",
--    ["mousewheel_desc"] = "Determina si se activa el soporte para la rueda del rat\195\179n en cada ventana de chat",
--    ["mousewheel_perframename"] = "Rueda de rat\195\179n en %s ",
--    ["mousewheel_perframedesc"] = "Determina si se activa el soporte para la rueda del rat\195\179n",
--    ["Set MouseWheel Speed"] = "Velocidad de la rueda del rat\195\179n",
--    ["Set number of lines mousewheel will scroll."] = "N\195\186mero de l\195\173neas que la rueda del rat\195\179n desplazar\195\161 verticalmente",
--    ["Set Ctrl+MouseWheel Speed"] = "Velocidad de Ctrl+Rueda del Rat\195\179n",
--    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = "N\195\186mero de l\195\173neas que la rueda del rat\195\179n desplazar\195\161 verticalmente cuando se presione la tecla Control",
--    ["lowdown_name"] = "Saltar Abajo",
--    ["lowdown_desc"] = "Determina si se activa el salto a la parte inferior de cada ventana de chat.",
--    ["lowdown_perframename"] = "Salto Abajo en %s ",
--    ["lowdown_perframedesc"] = "Determina si se activa el salto abajo",
--    ["Set TheLowDown Delay"] = "Retraso de Salto Abajo",
--    ["Set time to wait before jumping to the bottom of chat windows."] = "Establece el tiempo tras el que quieres saltar abajo",
--} end)
-- 
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Scroll"] = "Scrollen",
--	["Chat window scrolling options."] = "Chatfenster Scrollen Optionen",
--	["mousewheel_name"] = "Aktiviere Mausrad",
--	["mousewheel_desc"] = "Schaltet Mausrad Unterst\195\188tzung an und aus f\195\188r jedes Chatfenster.",
--	["mousewheel_perframename"] = "%s Mausrad",
--	["mousewheel_perframedesc"] = "Schaltet Mauserad Unterst\195\188tzung an und aus.",
--	["Set MouseWheel Speed"] = "Mausrad Geschwindigkeit einstellen",
--	["Set number of lines mousewheel will scroll."] = "Stellt die Anzahl an Zeilen ein die mit dem Mausrad gescrollt werden.",
--	["Set Ctrl+MouseWheel Speed"] = "Strg+Mausrad Geschwindigkeit einstellen",
--	["Set number of lines mousewheel will scroll when ctrl is pressed."] = "stellt ein wieviele Zeilen gescrollt werden wenn Strg gedr\195\188ckt gehalten wird.",
--	["lowdown_name"] = "Aktiviere Ganz runter",
--	["lowdown_desc"] = "Schaltet das springen zum Ende des Chattextes an und aus f\195\188r jedes Chatfenster.",
--	["lowdown_perframename"] = "%s Ganz runter",
--	["lowdown_perframedesc"] = "Schaltet das springen zum Ende an und aus.",
--	["Set TheLowDown Delay"] = "Ganz runter verz\195\182gerrung einstellen",
--	["Set time to wait before jumping to the bottom of chat windows."] = "Stellt ein nach welcher Zeit der Chattext in den chatfenstern zu seinem Ende springen soll.",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["Scroll"] = "D\195\169filement",
--    ["Chat window scrolling options."] = "Options de d\195\169filement.",
--    ["mousewheel_name"] = "D\195\169filement avec la molette",
--    ["mousewheel_desc"] = "Active le d\195\169filement du texte avec la molette.",
--    ["mousewheel_perframename"] = "Fen\195\170tre %s ",
--    ["mousewheel_perframedesc"] = "Activer/d\195\169sactiver le support de la molette.",
--    ["Set MouseWheel Speed"] = "Vitesse de d\195\169filement - Molette",
--    ["Set number of lines mousewheel will scroll."] = "Règle le nombre de lignes que fait d\195\169filer la molette.",
--    ["Set Ctrl+MouseWheel Speed"] = "Vitesse de d\195\169filement - Ctrl+Molette",
--    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = "R\195\168gle le nombre de lignes que fait d\195\169filer Ctrl+molette.",
--    ["lowdown_name"] = "Retour automatique en bas",
--    ["lowdown_desc"] = "Active/d\195\169sactive le retour automatique en bas de la fen\195\170tre au bout d'un d\195\169lai pour chaque fen\195\170tre.",
--    ["lowdown_perframename"] = "Fen\195\170tre %s ",
--    ["lowdown_perframedesc"] = "Active/d\195\169sactive le retour automatique en bas de la fen\195\170tre au bout d'un d\195\169lai.",
--    ["Set TheLowDown Delay"] = "D\195\169lai de retour automatique",
--    ["Set time to wait before jumping to the bottom of chat windows."] = "R\195\168gle le d\195\169lai avant de revenir en bas de la fen\195\170tre.",
--} end)


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")


Prat:SetModuleDefaults(module.name, {
	profile = {
        on = true,
        mousewheel = { ["*"] = true },
        normscrollspeed = 1,
        ctrlscrollspeed = 3,
        lowdown = { ["*"] = true },
        lowdowndelay = 20,
		scrolldirection = "BOTTOM"     
	}
} )


---- build the options menu using prat templates
--module.toggleOptions = {
--    mousewheel_handler = {},
--    sep135_sep = 135,
--    lowdown_handler = {}
--}


Prat:SetModuleOptions(module.name, {
    name = L["Scroll"],
    desc = L["Chat window scrolling options."],
    type = "group",
    args = {
		 mousewheel = {
			name = L["mousewheel_name"],
			desc = L["mousewheel_desc"],
			type = "multiselect",
			order = 110,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
		 },
         normscrollspeed = {
            name = L["Set MouseWheel Speed"],
            desc = L["Set number of lines mousewheel will scroll."],
            type = "range",
            order = 120,
            min = 1,
            max = 21,
            step = 1,
        },
		scrolldirection = {
			type = "select", 
            name = L["Text scroll direction"],
            desc = L["Control whether text is added to the frame at the top or the bottom."],
			values = { ["TOP"] = L["Top"], ["BOTTOM"] = L["Bottom"] },
		},
        ctrlscrollspeed = {
            name = L["Set Ctrl+MouseWheel Speed"],
            desc = L["Set number of lines mousewheel will scroll when ctrl is pressed."],
            type = "range",
            order = 130,
            min = 3,
            max = 21,
            step = 3,
        },
--		lowdown = {
--			name = L["lowdown_name"],
--			desc = L["lowdown_desc"],
--			type = "multiselect",
--			order = 110,
--			values = Prat.HookedFrameList,
--			get = "GetSubValue",
--			set = "SetSubValue"
--		},		
--        lowdowndelay = {
--            name = L["Set TheLowDown Delay"],
--            desc = L["Set time to wait before jumping to the bottom of chat windows."],
--            type = "range",
--            order = 220,
--            min = 1,
--            max = 60,
--            step = 1,
--        },
    }
})

module.OnSubValueChanged = module.ConfigureAllFrames


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
	self:ConfigureAllFrames()	
end



-- things to do when the module is disabled
function module:OnModuleDisable()
    for k, v in pairs(Prat.Frames) do
        self:MouseWheel(v,false)
--       	self:LowDown(v,false)
    end

	self:SetScrollDirection("BOTTOM")
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function module:ConfigureAllFrames()
    for k, v in pairs(Prat.Frames) do
        self:MouseWheel(v, self.db.profile.mousewheel[k])
--       	self:LowDown(v, self.db.profile.lowdown[k])
    end

	self:SetScrollDirection(self.db.profile.scrolldirection)
end

do
	local function scrollFrame(cf, up)
		if IsShiftKeyDown() then
	        if up then cf:ScrollToTop() else cf:ScrollToBottom() end
		else
		    if IsControlKeyDown() then
		        for i = 1,module.db.profile.ctrlscrollspeed do
		            if up then cf:ScrollUp() else cf:ScrollDown() end
		        end
		    else
		        for i = 1,module.db.profile.normscrollspeed do
		            if up then cf:ScrollUp() else cf:ScrollDown() end
		        end
		    end
		end
	end
	
	function module:MouseWheel(cf, enabled)
	    if enabled then
	        cf:SetScript("OnMouseWheel", function(cf, arg1) scrollFrame(cf, arg1 > 0) end)
	        cf:EnableMouseWheel(true)
	    else
	        cf:SetScript("OnMouseWheel", nil)
	        cf:EnableMouseWheel(false)
	    end
	end
end

--function module:LowDown(cf, enabled)
--	local name = cf:GetName()
--	local funcs = {"ScrollUp", "ScrollDown", "ScrollToTop", "PageUp", "PageDown"}
--
--    if enabled then
--		for _,func in ipairs(funcs) do
--			local f = function(cf)
--				if self:IsEventScheduled(name.."DownTimeout") then self:CancelScheduledEvent(name.."DownTimeout") end
--				self:ScheduleEvent(name.."DownTimeout", self.ResetFrame, self.db.profile.lowdowndelay, self, cf)
--			end
--			self:SecureHook(cf, func, f)
--		end
--	else
--		for _,func in ipairs(funcs) do
--			if self:IsHooked(cf, func) then self:Unhook(cf, func) end
--		end
--	end
--end

function module:ResetFrame(cf)
	if not cf:AtBottom() then
		cf:ScrollToBottom()
	end
end

function module:SetScrollDirection(direction)
    for k, v in pairs(Prat.HookedFrames) do
		self:ScrollDirection(v, direction)
    end

	self.db.profile.scrolldirection = direction
end

function module:ScrollDirection(cf, direction)
	if cf:GetInsertMode() ~= direction then 
		cf:SetMaxLines(cf:GetMaxLines())
		cf:SetInsertMode(direction)
	end
end



  return
end ) -- Prat:AddModuleToLoad