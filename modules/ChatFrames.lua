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
Name: PratChatFrames
Revision: $Revision: 80703 $
Author(s): Curney (asml8ed@gmail.com)
           Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatFrames
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that adds options for changing chat window parameters.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local Prat = Prat

local PRAT_MODULE = Prat:RequestModuleName("Frames")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat.GetLocalizer({})

L:AddLocale("enUS", {
    ["Frames"] = true,
    ["Chat window frame parameter options"] = true,
    ["minchatwidth_name"] = "Set Minimum Width",
    ["minchatwidth_desc"] = "Sets the minimum width for all chat windows.",
    ["maxchatwidth_name"] = "Set Maximum Width",
    ["maxchatwidth_desc"] = "Sets the maximum width for all chat windows.",
    ["minchatheight_name"] = "Set Minimum Height",
    ["minchatheight_desc"] = "Sets the minimum height for all chat windows.",
    ["maxchatheight_name"] = "Set Maximum Height",
    ["maxchatheight_desc"] = "Sets the maximum height for all chat windows.",
    ["mainchatonload_name"] = "Force Main Chat Frame On Load",
    ["mainchatonload_desc"] = "Automatically select the first chat frame and make it active on load.",
	["framealpha_name"] = "Set Chatframe Alpha",
	["framealpha_desc"] = "Conrols the transparency of the chatframe when you hover over it with your mouse.",
} )

L:AddLocale("ruRU", {
    ["Frames"] = true,
    ["Chat window frame parameter options"] = "Настройки параметров окна чата.",
    ["minchatwidth_name"] = "Минимальная ширина",
    ["minchatwidth_desc"] = "Установка минимальной ширины во всех окнах чата.",
    ["maxchatwidth_name"] = "Максимальная ширина",
    ["maxchatwidth_desc"] = "Установка максимальной ширины во всех окнах чата.",
    ["minchatheight_name"] = "Минимальная высота",
    ["minchatheight_desc"] = "Установка минимальной высоты во всех окнах чата.",
    ["maxchatheight_name"] = "Максимальная высота",
    ["maxchatheight_desc"] = "Установка максимальной высоты во всех окнах чата.",
    ["mainchatonload_name"] = "Главное окно чата при загрузке",
    ["mainchatonload_desc"] = "Автоматически выберает первое окно чата и делает его активным.",
	["framealpha_name"] = "Прозрачность окна чата",
	["framealpha_desc"] = "Регулировка прозрачности окна чата при наведении/удалении курсора мыши с окна чата.",
} )

--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["Frames"] = "Chatfenster",
--    ["Chat window frame parameter options."] = "Chatfenster Optionen.",
--    ["minchatwidth_name"] = "Minimum Breite einstellen",
--    ["minchatwidth_desc"] = "Setzt die minimum Breite f\195\188r alle Chatfenster fest.",
--    ["maxchatwidth_name"] = "Maximum Breite einstellen",
--    ["maxchatwidth_desc"] = "Setzt die maximum Breite f\195\188r alle  Chatfenster fest.",
--    ["minchatheight_name"] = "Minimum H\195\182he einstellen",
--    ["minchatheight_desc"] = "Setzt die minimum H\195\182he f\195\188r alle Chatfenster fest.",
--    ["maxchatheight_name"] = "Maximum H\195\182he einstellen",
--    ["maxchatheight_desc"] = "Setzt die maximum H\195\182he f\195\188r alle Chatfenster fest.",
--    ["mainchatonload_name"] = "W\195\164hle Allgemein Chatfenster beim Laden",
--    ["mainchatonload_desc"] = "Automatisch das erste Chatfenster beim Laden  ausw\195\164hlen und es als aktives setzen.",
--    ["Lock the Pet Action Bar"] = "Sperre die Begleiter Tastenleiste",
--    ["Lock the Pet Action Bar and show it if not in combat. THIS SETTING IS NOT SAVED"] = "Sperre die Begleiter Tastenleiste und zeige sie wenn man nicht im Kampf ist. DIESE EINSTELLUNG WIRD NICHT GESPEICHERT",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["Frames"] = "Fen\195\170tres",
--    ["Chat window frame parameter options."] = "Options des fen\195\170tres de chat.",
--    ["minchatwidth_name"] = "D\195\169finir la largeur minimum",
--    ["minchatwidth_desc"] = "D\195\169finit la largeur minimale de toutes les fen\195\170tres de chat.",
--    ["maxchatwidth_name"] = "D\195\169finir la largeur maximum",
--    ["maxchatwidth_desc"] = "D\195\169finit la largeur maximale de toutes les fen\195\170tres de chat.",
--    ["minchatheight_name"] = "D\195\169finir la largeur minimum",
--    ["minchatheight_desc"] = "D\195\169finit la hauteur minimale de toutes les fen\195\170tres de chat.",
--    ["maxchatheight_name"] = "D\195\169finir la largeur maximum",
--    ["maxchatheight_desc"] = "D\195\169finit la hauteur maximale de toutes les fen\195\170tres de chat.",
--    ["mainchatonload_name"] = "Forcer la fen\195\170tre principale au chargement",
--    ["mainchatonload_desc"] = "S\195\169lectionne automatiquement le premier onglet et le rend actif au chargement.",
--    ["Lock the Pet Action Bar"] = "Verrouiller la barre d'action du familier",
--    ["Lock the Pet Action Bar and show it if not in combat. THIS SETTING IS NOT SAVED"] = "Verrouille la barre d'action du familier et l'affiche si hors combat. CE REGLAGE N'EST PAS SAUVE",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["Frames"] = "Ventanas de Chat",
--    ["Chat window frame parameter options."] = "Opciones de los par\195\161metros de las ventanas de chat",
--    ["minchatwidth_name"] = "Anchura m\195\173nima",
--    ["minchatwidth_desc"] = "Establece la anchura m\195\173nima de las ventanas de chat",
--    ["maxchatwidth_name"] = "Anchura m\195\161xima",
--    ["maxchatwidth_desc"] = "Establece la anchura m\195\161xima de las ventanas de chat",
--    ["minchatheight_name"] = "Altura m\195\173nima",
--    ["minchatheight_desc"] = "Establece la altura m\195\173nima de las ventanas de chat",
--    ["maxchatheight_name"] = "Altura m\195\161xima",
--    ["maxchatheight_desc"] = "Establece la altura m\195\161xima de las ventanas de chat",
--    ["mainchatonload_name"] = "Forzar Ventana de Chat Principal al Cargar",
--    ["mainchatonload_desc"] = "Elige autom\195\161ticamente la primera ventana de chat y la hace activa al cargar",
--    ["Lock the Pet Action Bar"] = "Bloquear la barra de acciones de la mascota",
--    ["Lock the Pet Action Bar and show it if not in combat. THIS SETTING IS NOT SAVED"] = "Bloquea la barra de acciones de la mascota y la muestra si no est\195\161s en combate. ESTA OPCI\195\147N NO SER\195\129 GUARDADA",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["Frames"] = "대화창",
--    ["Chat window frame parameter options."] = "대화창 제한 설정입니다.",
--    ["minchatwidth_name"] = "최소 넓이 설정",
--    ["minchatwidth_desc"] = "대화창의 최소 넓이를 설정합니다.",
--    ["maxchatwidth_name"] = "최대 넓이 설정",
--    ["maxchatwidth_desc"] = "대화창의 최대 넓이를 설정합니다.",
--    ["minchatheight_name"] = "최소 높이 설정",
--    ["minchatheight_desc"] = "대화창의 최소 높이를 설정합니다.",
--    ["maxchatheight_name"] = "최대 높이 설정",
--    ["maxchatheight_desc"] = "대화창의 최대 높이를 설정합니다.",
--    ["mainchatonload_name"] = "접속 시 주 대화창 강제 지정",
--    ["mainchatonload_desc"] = "접속 시 첫번째 대화창을 주 대화창으로 자동으로 선택합니다.",
--    ["framealpha_name"] = "투명도 제한선",
--    ["framealpha_desc"] = "모든 대화창의 '페이드-인' 투명도를 설정합니다. 만약 현재 대화창이 낮은 투명도로 설정되어 있다면, 마우스를 올렸을 때 '페이드-인' 될 것 입니다.",
--    ["Lock the Pet Action Bar"] = "소황수 행동 바 고정",
--    ["Lock the Pet Action Bar and show it if not in combat. THIS SETTING IS NOT SAVED"] = "소환수 행동바를 고정하고 전투 중이 아닐 때 표시합니다. 이 설정은 저장되지 않습니다.",
--    ["WARNING: "] = "경고: ",
--    ["Your pet action bar has become tainted. Enable the "] = "Your pet action bar has become tainted. Enable the ",
--    ["'Lock the Pet Action Bar'"] = "'Lock the Pet Action Bar'",
--    [" option in the "] = " option in the ",
--    ["ChatFrames"] = "대화창",
--    [" module, or "] = " module, or ",
--    ["/rl"] = "/rl",
--    [" to reload your UI"] = " to reload your UI",
--} end)
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["Frames"] = "聊天框架",
--    ["Chat window frame parameter options."] = "聊天框架设置选项.",
--    ["minchatwidth_name"] = "设定最小宽度值",
--    ["minchatwidth_desc"] = "对所有聊天窗口设定最小宽度值",
--    ["maxchatwidth_name"] = "设定最大宽度值",
--    ["maxchatwidth_desc"] = "对所有聊天窗口设定最大宽度值",
--    ["minchatheight_name"] = "设定最小高度值",
--    ["minchatheight_desc"] = "对所有聊天窗口设定最小高度值",
--    ["maxchatheight_name"] = "设定最大高度值",
--    ["maxchatheight_desc"] = "对所有聊天窗口设定最大高度值",
--    ["mainchatonload_name"] = "强制使用主聊天窗口",
--    ["mainchatonload_desc"] = "自动选择第一聊天窗口并加载.",
--    ["framealpha_name"] = "透明度",
--    ["framealpha_desc"] = "设置所有聊天窗口‘淡入’的透明度。若当前的聊天窗口本有较低的透明度值，鼠标停留时会有‘淡入’效果",    
--    ["Lock the Pet Action Bar"] = "锁定宠物动作条",
--    ["Lock the Pet Action Bar and show it if not in combat. THIS SETTING IS NOT SAVED"] = "锁定宠物动作条并在非战斗装都显示. !!此设置不能保存!!",
--    ["WARNING: "] = "警告: ",
--    ["Your pet action bar has become tainted. Enable the "] = "宠物动作条有问题。请启用。",
--    ["'Lock the Pet Action Bar'"] = "「锁定宠物动作条」",
--    [" option in the "] = "选项 (在",
--    ["ChatFrames"] = "聊天窗口",
--    [" module, or "] = "模块)，或 ",
--    ["/rl"] = "/rl",
--    [" to reload your UI"] = " 重载你的使用界面。",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Frames"] = "聊天視窗",
--    ["Chat window frame parameter options."] = "聊天視窗設定選項。",
--    ["minchatwidth_name"] = "設定寬度最小值",
--    ["minchatwidth_desc"] = "設定全部聊天視窗的寬度最小值。",
--    ["maxchatwidth_name"] = "設定寬度最大值",
--    ["maxchatwidth_desc"] = "設定全部聊天視窗的寬度最大值。",
--    ["minchatheight_name"] = "設定高度最小值",
--    ["minchatheight_desc"] = "設定全部聊天視窗的高度最小值。",
--    ["maxchatheight_name"] = "設定高度最大值",
--    ["maxchatheight_desc"] = "設定全部聊天視窗的高度最大值。",
--    ["mainchatonload_name"] = "載入時強制啟用聊天視窗1",
--    ["mainchatonload_desc"] = "自動選擇聊天視窗1並啟用。",
--    ["framealpha_name"] = "透明度",
--    ["framealpha_desc"] = "設定所有聊天視窗的「淡入」透明度。若當前的聊天視窗有較低的透明度值，滑鼠停留時會有「淡入」效果。",    
--    ["Lock the Pet Action Bar"] = "鎖定寵物動作條",
--    ["Lock the Pet Action Bar and show it if not in combat. THIS SETTING IS NOT SAVED"] = "鎖定寵物動作條並在非戰鬥狀態時顯示。不會儲存此設定!",
--    ["WARNING: "] = "警告: ",
--    ["Your pet action bar has become tainted. Enable the "] = "寵物動作條有問題。請啟用",
--    ["'Lock the Pet Action Bar'"] = "「鎖定寵物動作條」",
--    [" option in the "] = "選項 (在",
--    ["ChatFrames"] = "聊天視窗",
--    [" module, or "] = "模組)，或 ",
--    ["/rl"] = "/rl",
--    [" to reload your UI"] = " 重載你的使用者介面。",
--} end)

local mod = Prat:NewModule(PRAT_MODULE)


Prat:SetModuleDefaults(mod.name, {
	profile = {
        on = true,
        minchatwidth = 160,
        minchatwidthdefault = 160,
        maxchatwidth = 800,
        maxchatwidthdefault = 800,
        minchatheight = 120,
        minchatheightdefault = 120,
        maxchatheight = 600,
        maxchatheightdefault = 600,
        mainchatonload = true,
        framealpha = DEFAULT_CHATFRAME_ALPHA
	}
})

do
	local frameoption = {
		name = function(info) return L[info[#info].."_name"] end,
		desc = function(info) return L[info[#info].."_desc"] end,
		type="range", min=25, max=1024, step=1
	}
	
	Prat:SetModuleOptions(mod.name, {
	        name = L["Frames"],
	        desc = L["Chat window frame parameter options"],
	        type = "group",
	        args = {
	    		minchatwidth = frameoption,
			    maxchatwidth = frameoption,
			    minchatheight = frameoption,
			    maxchatheight = frameoption,
			    framealpha = {
					name = L["framealpha_name"],
					desc = L["framealpha_desc"],
					type="range", min=0.0, max=1.0, step=.01, order=190,
				},
	--		    mainchatonload = 200,
	        }
	    }
	)
end


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

Prat:SetModuleInit(mod, function(self) mod:GetDefaults() end)

function mod:OnModuleEnable()
    self:ConfigureAllChatFrames(true)
end

function mod:OnModuleDisable()
    self:ConfigureAllChatFrames(false)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- make ChatFrame1 the selected chat frame
function mod:AceEvent_FullyInitialized()
    if self.db.profile.mainchatonload then
        FCF_SelectDockFrame(ChatFrame1)
    end
end

-- set parameters for each chatframe
function mod:ConfigureAllChatFrames(enabled)
    for _,v in pairs(Prat.Frames) do
        self:SetParameters(v, enabled)
    end
    
    DEFAULT_CHATFRAME_ALPHA = self.db.profile.framealpha
end

-- get the defaults for chat frame1 max/min width/height for use when disabling the module
function mod:GetDefaults()
    local cf = _G["ChatFrame1"]
	local prof = self.db.profile

    local minwidthdefault, minheightdefault = cf:GetMinResize()
    local maxwidthdefault, maxheightdefault = cf:GetMaxResize()

    prof.minchatwidthdefault = minwidthdefault
    prof.maxchatwidthdefault = maxwidthdefault
    prof.minchatheightdefault = minheightdefault
    prof.maxchatheightdefault = maxheightdefault

    prof.initialized = true
end

-- set the max/min width/height for a chatframe
function mod:SetParameters(cf, enabled)
	local prof = self.db.profile
    if enabled then
        cf:SetMinResize(prof.minchatwidth, prof.minchatheight)
        cf:SetMaxResize(prof.maxchatwidth, prof.maxchatheight)
    else
        cf:SetMinResize(prof.minchatwidthdefault, prof.minchatheightdefault)
        cf:SetMaxResize(prof.maxchatwidthdefault, prof.maxchatheightdefault)
    end
end


function mod:OnValueChanged()
	self:ConfigureAllChatFrames(true)
end

  return
end ) -- Prat:AddModuleToLoad