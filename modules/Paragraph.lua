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
Name: PratParagraph
Revision: $Revision: 80705 $
Author(s): Curney (asml8ed@gmail.com)
Thanks to: Wubin for helping me understand variables better
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Paragraph
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that gives options for paragraphs in chat windows (defaults=left-aligned text, linespacing=0).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

-- Get Utility Libraries
local PRAT_MODULE = Prat:RequestModuleName("Paragraph")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["Paragraph"] = true,
    ["Chat window paragraph options."] = true,
    ["justification_name"] = "Set Alignment",
    ["justification_desc"] = "Set horizontal alignment for each chat window",
    ["Line Spacing"] = true,
    ["Set the line spacing for all chat windows."] = true,
    ["adjustlinks_name"] = "Fix placement of player/item links",
    ["adjustlinks_desc"] = "Adjust links to restore clickability on centered or right-aligned text.",    
	["Center"] = true,
	["Right"] = true,
	["Left"] = true,
})

L:AddLocale("ruRU", {
    ["Paragraph"] = true,
    ["Chat window paragraph options."] = true,
    ["justification_name"] = "Set Alignment",
    ["justification_desc"] = "Set horizontal alignment for each chat window",
    ["Line Spacing"] = true,
    ["Set the line spacing for all chat windows."] = true,
    ["adjustlinks_name"] = "Fix placement of player/item links",
    ["adjustlinks_desc"] = "Adjust links to restore clickability on centered or right-aligned text.",    
	["Center"] = true,
	["Right"] = true,
	["Left"] = true,
})

----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80705 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
-- 	["Paragraph"] = "段落",
-- 	["Chat window paragraph options."] = "聊天窗口段落选项.",
--    ["justification_name"] = "设置对齐",
--    ["justification_desc"] = "设置每个聊天窗口对齐格式.",
--    ["Set ChatFrame%d Alignment"] = "聊天窗口 %d 对齐",
--    ["Set horizontal alignment to left, right, or center."] = "给聊天窗口 %d 设置对齐",
--    ["Line Spacing"] = "行间距",
--    ["Set the line spacing for all chat windows."] = "为全部聊天窗口设置行间距",
--    ["adjustlinks_name"] = "修正玩家/物品链接位置",
--    ["adjustlinks_desc"] = "右对齐或置中时调整链接保持点击功能.",
--	["Center"] = "置中",
--	["Right"] = "右",
--	["Left"] = "左",
-- } end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Paragraph"] = "段落",
--    ["Chat window paragraph options."] = "聊天視窗段落選項。",
--    ["justification_name"] = "設定對齊",
--    ["justification_desc"] = "設定各個聊天視窗的對齊。",
--    ["Set ChatFrame%d Alignment"] = "聊天視窗%d對齊",
--    ["Set horizontal alignment to left, right, or center."] = "設定聊天視窗的對齊選項。",
--    ["Line Spacing"] = "行距",
--    ["Set the line spacing for all chat windows."] = "設定全部聊天視窗的行距。",
--    ["adjustlinks_name"] = "修正玩家/物品連結位置",
--    ["adjustlinks_desc"] = "使連結在靠右或置中對齊時依然可以點擊。",    
--	["Center"] = "置中",
--	["Right"] = "靠右",
--	["Left"] = "靠左",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--	["Paragraph"] = "Justification",
--	["Chat window paragraph options."] = "Options concernant la justification.",
--	["justification_name"] = "Justification",
--	["justification_desc"] = "Règle la justification pour toutes les fenêtres.",
--	["Set ChatFrame%d Alignment"] = "Fenêtre %d",
--	["Set horizontal alignment to left, right, or center."] = "R\195\168gle la justification pour la fenêtre %d.",
--	["adjustlinks_name"] = "Corrige le placement des liens",
--	["adjustlinks_desc"] = "Corrige le placement des liens lorsque la justification est sur Centrée ou Droite.",    
--	["Center"] = "Centré",
--	["Right"] = "Aligné à droite",
--	["Left"] = "Aligné à gauche",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["Paragraph"] = "단락",
--    ["Chat window paragraph options."] = "대화창 단락 설정입니다.",
--    ["justification_name"] = "정렬 설정",
--    ["justification_desc"] = "각 대화창에 대한 수평 정렬을 설정합니다.",
--    ["Set ChatFrame%d Alignment"] = "%d 대화창 정렬 설정",
--    ["Set horizontal alignment to left, right, or center."] = "왼쪽, 오른쪽, 혹은 가운데 수평 정렬을 설정합니다.",
--    ["Line Spacing"] = "줄 간격",
--    ["Set the line spacing for all chat windows."] = "모든 대화창에 대한 줄 간력을 설정합니다.",
--    ["adjustlinks_name"] = "플레이어/아이템 링크 위치 수정",
--    ["adjustlinks_desc"] = "우측 혹은 가운데 정렬일 때 클릭가능한 것들을 복원하기 위내 링크를 조절합니다.",
--	["Center"] = "가운데",
--	["Right"] = "우측",
--	["Left"] = "좌측",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["Paragraph"] = "Justificar",
--    ["Chat window paragraph options."] = "Opciones de parrafo para la ventana de chat.",
--    ["justification_name"] = "Establecer Justificaci\195\179n",
--    ["justification_desc"] = "Establece la justificaci\195\179n para cada ventana",
--    ["Set ChatFrame%d Alignment"] = "Justificaci\195\179n del Chat %d",
--    ["Set horizontal alignment to left, right, or center."] = "Establece la justificaci\195\179n para la ventana de chat %d",
--    ["Line Spacing"] = "Espaciado de L\195\173nea",
--    ["Set the line spacing for all chat windows."] = "Establece el espaciado de l\195\173nea para todas las ventanas del chat",
--    ["adjustlinks_name"] = "Arreglar la posici\195\179n de los enlaces de jugador/objeto",
--    ["adjustlinks_desc"] = "Permite volver a hacer clic sobre los enlaces cuando la justificaci\195\179n es derecha o centro.",
--	["Center"] = "Centro",
--	["Right"] = "Derecha",
--	["Left"] = "Izquierda",
--} end)
-- 
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Paragraph"] = "Absatz",
--	["Chat window paragraph options."] = "Chatfenster Absatz Optionen",
--	["justification_name"] = "B\195\188ndigkeit einstellen",
--	["justification_desc"] = "Setze horizontale B\195\188ndigkeit f\195\188r jedes Fenster.",
--	["Set ChatFrame%d Alignment"] = "Chat %d B\195\188ndigkeit",
--	["Set horizontal alignment to left, right, or center."] = "Setze horizontale B\195\188ndigkeit auf Links, Rechts oder Mitte.",
--	["Line Spacing"] = "Zeilenabstand",
--	["Set the line spacing for all chat windows."] = "Justiere den Zeilenabstand f\195\188r alle chatfenster.",
--	["adjustlinks_name"] = "Fixiere Plazierung von Spieler/Item Links",
--	["adjustlinks_desc"] = "Justiere Links um ihre anklickbarkeit zu gew\195\164rleisten wenn die B\195\188ndigkeit auf rechts oder mitte eingestellt ist.",
--	["Center"] = "Mitte",
--	["Right"] = "Rechts",
--	["Left"] = "Links",    
--} end)
--


-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")




Prat:SetModuleDefaults(module, {
	profile = {
	    on = false,
	    justification = { ["*"] = "LEFT" },
	    adjustlinks = false,
	}
} )

do
	local justifyoption = {
			name = function(info) return Prat.HookedFrameList[info[#info]] or "" end,
			desc = L["justification_name"],
			type="select",
			values = { ["RIGHT"] = L["Right"], ["CENTER"] = L["Center"], ["LEFT"] =  L["Left"]},
			hidden = function(info) return Prat.HookedFrameList[info[#info]] == nil end,
		}
	
	Prat:SetModuleOptions(module, {
	        name = L["Paragraph"],
	        desc = L["Chat window paragraph options."],
	        type = "group",
	        args = {
	            justification = {
	                name = L["justification_name"],
	                desc = L["justification_desc"],
	                type = "group",
					inline = true,
					args = {
						ChatFrame1 = justifyoption,
						ChatFrame3 = justifyoption,
						ChatFrame4 = justifyoption,
						ChatFrame5 = justifyoption,
						ChatFrame6 = justifyoption,
						ChatFrame7 = justifyoption,
					}
				},

				info = {
					name = "Note: Playerlinks, itemlinks, and any other link type will not work when justification is set to anything other than 'Left'",
					type = "description",
					order = 110
				}
	        }
	    }
	)
end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function module:OnModuleEnable()
    self:ConfigureAllChatFrames(true)
end

function module:OnModuleDisable()
    self:ConfigureAllChatFrames(false)
	self:UnhookAll()
end

function module:OnSubValueChanged()
	self:ConfigureAllChatFrames(true)
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:ConfigureAllChatFrames(enable)
	local prof = self.db.profile
	for k,v in pairs(Prat.HookedFrames) do
        v:SetJustifyH(enable and prof.justification[k] or "LEFT")
	end
end

  return
end ) -- Prat:AddModuleToLoad