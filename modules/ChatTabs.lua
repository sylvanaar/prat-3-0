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
Name: PratChatTabs
Revision: $Revision: 80499 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Tabs
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that adds chat window tab options (default = hidden).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("ChatTabs")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["Tabs"] = true,
    ["Chat window tab options."] = true,
    ["Set Display Mode"] = true,
    ["Set tab display mode for each chat window."] = "Set tab display mode for each chat window. Checked (on), Unchecked (off), Greyed Check (default)",
    ["Set ChatFrame%d Display Mode"] = true,
    ["Set tab display to always, hidden or the Blizzard default."] = true,
    ["Active Alpha"] = true,
    ["Sets alpha of chat tab for active chat frame."] = true,
    ["Not Active Alpha"] = true,
    ["Sets alpha of chat tab for not active chat frame."] = true,
    ["All"] = true,
    ["Individual"] = true,
    ["Always"] = true,
    ["Hidden"] = true,
    ["Default"] = true,
    ["disableflash_name"] =  "Disable Flashing",
    ["disableflash_desc"] =  "Disable flashing of the chat tabs.",
    ["preventdrag_name"] =  "Prevent Dragging",
    ["preventdrag_desc"] =  "Prevent dragging chat tabs with mouse",
})

L:AddLocale("ruRU", {
    ["Tabs"] = true,
    ["Chat window tab options."] = "Настройки закладок чата.",
    ["Set Display Mode"] = "Режим отображения",
    ["Set tab display mode for each chat window."] = "Установить режим отображения каждой закладки окна чата.",
    ["Set ChatFrame%d Display Mode"] = "Установить режим отображения %d закладки",
    ["Set tab display to always, hidden or the Blizzard default."] = "Установить режим отображения закладки на 'всегда показывать', 'скрывать' или 'поведение по умолчанию, как у Blizzard'.",
    ["Active Alpha"] = "Прозрачность активной",
    ["Sets alpha of chat tab for active chat frame."] = "Прозрачность активной закладки чата.",
    ["Not Active Alpha"] = "Прозрачность неактивных",
    ["Sets alpha of chat tab for not active chat frame."] = "Прозрачность неактивных закладок чата.",
    ["All"] = "Все",
    ["Individual"] = "Индивидуально",
    ["Always"] = "Всегда показывать",
    ["Hidden"] = "Скрывать",
    ["Default"] = "По умолчанию",
    ["disableflash_name"] =  "Отключить мигание",
    ["disableflash_desc"] =  "Отключить мигание закладок чата.",
    ["preventdrag_name"] =  "Отключить перетаскивание",
    ["preventdrag_desc"] =  "Отключить перетаскивание закладок чата с помощью мыши.",
})

--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["Tabs"] = "Chat Karteikartentasten",
--    ["Chat window tab options."] = "Chatfenster Karteikartentasten Optionen",
--    ["Set Display Mode"] = "Justiere Anzeigeart",
--    ["Set tab display mode for each chat window."] = "Justiere Karteikartentasten Anzeigeart f\195\188r jedes chatfenster.",
--    ["Set ChatFrame%d Display Mode"] = "Justiere Chatfenster %d Anzeigeart",
--    ["Set tab display to always, hidden or the Blizzard default."] = "Justiere Karteikartentasten Anzeige zu immer, versteckt oder der Blizzard's vorgabe.",
--    ["Active Alpha"] = "Aktive Helligkeit",
--    ["Sets alpha of chat tab for active chat frame."] = "Justiert die Helligkeit der Karteikartentasten f\195\188r aktive Fenster ein.",
--    ["Not Active Alpha"] = "Keine Aktive Helligkeit",
--    ["Sets alpha of chat tab for not active chat frame."] = "Justiert die Helligkeit der Karteikartentasten f\195\188r nicht aktive Fenster ein.",
--    ["All"] = "Alle",
--    ["Individual"] = "Individuell",
--    ["Always"] = "Immer sichtbar",
--    ["Hidden"] = "Versteckt",
--    ["Default"] = "Grundeinstellung",
--    ["disableflash_name"] =  "Deaktiviere Aufblinken",
--    ["disableflash_desc"] =  "Deaktiviert das aufblinken der Karteikartentasten."
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["Tabs"] = "Pesta\195\177as de Chat",
--    ["Chat window tab options."] = "Opciones de las pesta\195\177as de chat",
--    ["Set ChatFrame%d Display Mode"] = "Pesta\195\177a de Chat %d",
--    ["Set tab display to always, hidden or the Blizzard default."] = "Determina las opciones de la pesta\195\177a de chat de la ventana de chat %d",
--    ["Active Alpha"] = "Transparencia Activos",
--    ["Sets alpha of chat tab for active chat frame."] = "Establece el \195\173ndice de transparencia de la pesta\195\177a de chat para los marcos de chat activos.",
--    ["Not Active Alpha"] = "Transparencia No Activos",
--    ["Sets alpha of chat tab for not active chat frame."] = "Establece el \195\173ndice de transparencia de la pesta\195\177a de chat para los marcos de chat no activos.",
--    ["All"] = "Todos",
--    ["Individual"] = "Individual",
--    ["Always"] = "Siempre Visible",
--    ["Hidden"] = "Oculto",
--    ["Default"] = "Por Defecto",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["Tabs"] = "대화탭",
--    ["Chat window tab options."] = "대화탭 설정",
--    ["Set Display Mode"] = "표시 모드 설정",
--    ["Set tab display mode for each chat window."] = "각 대화창에 대한 탭 표시 모드를 설정합니다.",
--    ["Set ChatFrame%d Display Mode"] = "%d 대화창 표시 모드 설정",
--    ["Set tab display to always, hidden or the Blizzard default."] = "항상, 숨김 혹은 블리자드 기본값으로 탭 표시를 설정합니다.",
--    ["Active Alpha"] = "활성화 투명도",
--    ["Sets alpha of chat tab for active chat frame."] = "활성화된 대화창에 대한 대화탭의 투명도를 설정합니다.",
--    ["Not Active Alpha"] = "비활성화 투명도",
--    ["Sets alpha of chat tab for not active chat frame."] = "비활성화 대화창에 대한 대화탭의 투명도를 설정합니다.",
--    ["All"] = "모두",
--    ["Individual"] = "개별",
--    ["Always"] = "항상",
--    ["Hidden"] = "숨김",
--    ["Default"] = "기본값",
--    ["disableflash_name"] =  "번쩍임 미사용",
--    ["disableflash_desc"] =  "대화탭의 번쩍임을 사용하지 않습니다.",
--    ["preventdrag_name"] =  "움직임 방지",
--    ["preventdrag_desc"] =  "마우스로 대화탭을 움직이지 않게 합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["Tabs"] = "Onglets",
--    ["Chat window tab options."] = "Options des onglets.",
--    ["Set ChatFrame%d Display Mode"] = "Onglets de la fen\195\170tre %d",
--    ["Set tab display to always, hidden or the Blizzard default."] = "Change les options d'onglet de la fen\195\170tre %d.",
--    ["Active Alpha"] = "Transparence lorsque actif",
--    ["Sets alpha of chat tab for active chat frame."] = "R\195\168gle la transparence des onglets de la fen\195\170tre active.",
--    ["Not Active Alpha"] = "Transparence lorsque inactif",
--    ["Sets alpha of chat tab for not active chat frame."] = "R\195\168gle la transparence des onglets des fen\195\170tres inactives.",
--    ["All"] = "Toutes les fen\195\170tres",
--    ["Individual"] = "Fen\195\170tre par fen\195\170tre",
--    ["Always"] = "Toujours visible",
--    ["Hidden"] = "Cach\195\169s",
--    ["Default"] = "Par d\195\169faut",
--} end)
--
----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80499 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["Tabs"] = "聊天标签",
--    ["Chat window tab options."] = "聊天窗口标签选项",
--    ["Set ChatFrame%d Display Mode"] = "聊天窗口 %d 标签",
--    ["Set tab display to always, hidden or the Blizzard default."] = "切换聊天窗口 %d 标签选项",
--    ["Active Alpha"] = "激活透明度",
--    ["Sets alpha of chat tab for active chat frame."] = "设置激活的聊天窗口标签透明度",
--    ["Not Active Alpha"] = "未激活透明度",
--    ["Sets alpha of chat tab for not active chat frame."] = "设置未激活的聊天窗口标签透明度",
--    ["All"] = "全部",
--    ["Individual"] = "独立",
--    ["Always"] = "永远可见",
--    ["Hidden"] = "隐藏",
--    ["Default"] = "默认",
--    ["disableflash_name"] =  "取消闪光",
--    ["disableflash_desc"] =  "取消聊天标签闪光"
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Tabs"] = "聊天視窗標籤",
--    ["Chat window tab options."] = "聊天視窗的標籤選項。",
--    ["Set Display Mode"] = "顯示模式",
--    ["Set tab display mode for each chat window."] = "設定各個聊天視窗的顯示模式。",
--    ["Set ChatFrame%d Display Mode"] = "聊天視窗%d顯示模式",
--    ["Set tab display to always, hidden or the Blizzard default."] = "設定顯示模式。",
--    ["Active Alpha"] = "使用中透明度",
--    ["Sets alpha of chat tab for active chat frame."] = "設定使用中的聊天視窗的標籤透明度。",
--    ["Not Active Alpha"] = "待命中透明度",
--    ["Sets alpha of chat tab for not active chat frame."] = "設定待命中的聊天視窗的標籤透明度。",
---- no use anymore    ["All"] = true,
---- no use anymore    ["Individual"] = true,
--    ["Always"] = "永遠可見",
--    ["Hidden"] = "隱藏",
--    ["Default"] = "預設",
--    ["disableflash_name"] =  "停用閃爍",
--    ["disableflash_desc"] =  "停用聊天視窗的標籤閃爍。",
--    ["preventdrag_name"] =  "防止拖曳",
--    ["preventdrag_desc"] =  "防止用滑鼠拖曳聊天視窗的標籤。",
--} end)


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
        on = false,
        displaymode = { },
        disableflash = false,
        notactivealpha = 0.5,
        activealpha = 1,
		preventdrag = false,
	}
} )

--module.toggleOptions = { sep115_sep = 115, disableflash = 120, preventdrag = 125 }

Prat:SetModuleOptions(module.name, {
        name = L["Tabs"],
        desc = L["Chat window tab options."],
        type = "group",
        args = {
            displaymode = {
                name = L["Set Display Mode"],
                desc = L["Set tab display mode for each chat window."],
                type = "multiselect",
				tristate = true,
                order = 110,
				values = Prat.FrameList,
				get = "GetSubValue",
				set = "SetSubValue",
			},
			disableflash = {
				name = L["disableflash_name"],
				desc = L["disableflash_desc"],
				type = "toggle",
				order = 120
			},
			preventdrag = {
				name = L["preventdrag_name"],
				desc = L["preventdrag_desc"],
				type = "toggle",
				order = 120
			},
            activealpha = {
                name = L["Active Alpha"],
                desc = L["Sets alpha of chat tab for active chat frame."],
                type = "range",
                order = 130,
                min = 0.1,
                max = 1,
                step = 0.1,
            },
            notactivealpha = {
                name = L["Not Active Alpha"],
                desc = L["Sets alpha of chat tab for not active chat frame."],
                type = "range",
                order = 140,
                min = 0.1,
                max = 1,
                step = 0.1,
            },
        }
    }
)

--local tabmode = { ["true"] = "ALWAYS", ["false"] = "HIDDEN", ["nil"] = "DEFAULT" }

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
    self:SecureHook("FCF_FlashTab")
    self:InstallHooks()
    self:UpdateAllTabs()
end

-- things to do when the module is enabled
function module:OnModuleDisable()
    self:RemoveHooks()
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function module:InstallHooks()
    for k, v in pairs(Prat.Frames) do
        local cftab = getglobal(k.."Tab")
        cftab:SetScript("OnShow", function(this, ...) module:OnTabShow(this, ...) end)
        cftab:SetScript("OnHide", function(this, ...) module:OnTabHide(this, ...) end)
		self:HookScript(cftab,"OnDragStart", "OnTabDragStart")
    end
end

function module:RemoveHooks()
	for k, v in pairs(Prat.Frames) do
        local cftab = getglobal(k.."Tab")
        cftab:SetScript("OnShow", function() return end)
        cftab:SetScript("OnHide", function() return end)
    end
    -- unhook functions
    self:UnhookAll()
end

function module:OnValueChanged(info, b)
--	if info[#info]:find("alpha") then
--		
--		return
--	end
	
	self:UpdateAllTabs()
end

function module:OnSubValueChanged(info, b)
	self:UpdateAllTabs()
end


function module:UpdateAllTabs()
    for k,v in pairs(Prat.Frames) do 
        local chatTab = _G[k.."Tab"]
        chatTab:Show()
        chatTab:Hide()
        FloatingChatFrame_Update(v:GetID()) 
    end
end

function module:OnTabShow(tab, ...)
    if self.db.profile.displaymode["ChatFrame"..tab:GetID()] == false then
       tab:Hide()
    end  
end

function module:OnTabHide(tab, ...)

    
    local p = self.db.profile
    local i = tab:GetID()   
    
	if self.db.profile.displaymode["ChatFrame"..tab:GetID()] == true then
        tab:Show()
        if SELECTED_CHAT_FRAME:GetID() == i then
            tab:SetAlpha(p.activealpha)
        else
            tab:SetAlpha(p.notactivealpha)
        end
    end      
end

function module:OnTabDragStart(this, ...)  
    local p = self.db.profile
    
    if p.preventdrag and p.on then return end
    
    self.hooks[this].OnDragStart(this, ...)
end


function module:FCF_FlashTab(this)
	local this = Prat.WOTLK and this or _G.this	
    local i = this:GetName()
    local p = self.db.profile
    
    if p.disableflash or p.displaymode["ChatFrame"..i] == false then        
        UIFrameFlashStop(getglobal(i.."TabFlash"))
    end
end


  return
end ) -- Prat:AddModuleToLoad