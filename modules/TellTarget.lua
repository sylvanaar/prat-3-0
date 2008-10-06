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
Revision: $Revision: 80703 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_TellTarget by Industrial
             ChatFrameExtender by Satrina
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#TellTarget
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds a slash command (/tt) to send a message to your target (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("TellTarget")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["TellTarget"] = true,
    ["Adds telltarget slash command (/tt)."] = true,
    ["Target does not exist."] = true,
    ["Target is not a player."] = true,
    ["No target selected."] = true,
    ["NoTarget"] = true,
	["/tt"] = true,
})

----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80703 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--		["TellTarget"] = "通知目标",
--		["Adds telltarget slash command (/tt)."] = "添加通知目标命令 (/tt).",
--		["Target does not exist."] = "目标不存在.",
--		["Target is not a player."] = "目标非玩家.",
--		["No target selected."] = "无目标选定.",
--		["NoTarget"] = "无目标",
--	["/tt"] = "/tt",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["TellTarget"] = "通知目標",
--    ["Adds telltarget slash command (/tt)."] = "增加通知目標指令 (/tt)。",
---- no use anymore    ["Target does not exist."] = true,
--    ["Target is not a player."] = "目標非玩家。",
--    ["No target selected."] = "無選定目標。",
--    ["NoTarget"] = "無目標",
---- no need to translate	["/tt"] = true,
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["TellTarget"] = "대상대화",
--    ["Adds telltarget slash command (/tt)."] = "대상대화를 위한 (/tt) 명령을 추가합니다.",
--    ["Target does not exist."] = "대상이 없습니다.",
--    ["Target is not a player."] = "올바른 대상이 아닙니다.",
--    ["No target selected."] = "선택된 대상이 없습니다.",
--    ["NoTarget"] = "대상없음",
--	["/tt"] = "/ㅅㅅ",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["TellTarget"] = "Susurrar a Objetivo",
--    ["Adds telltarget slash command (/tt)."] = "A\195\177ade el comando susurrar a objetivo (/tt)",
--    ["Target does not exist."] = "El objetivo no existe",
--    ["Target is not a player."] = "El objetivo no es un jugador",
--    ["No target selected."] = "No se a seleccionado un objetivo",
--    ["NoTarget"] = "Sin Objetivo",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["TellTarget"] = "Sage Ziel",
--    ["Adds telltarget slash command (/tt)."] = "F\195\188gt das Ziel Fl\195\188stern (TellTarget) Slash Kommando (/tt) hinzu.",
--    ["Target does not exist."] = "Ziel existiert nicht.",
--    ["Target is not a player."] = "Ziel ist kein Spieler.",
--    ["No target selected."] = "Kein Ziel ausgew\195\164hlt.",
--    ["NoTarget"] = "Kein Ziel",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["TellTarget"] = "Chuchoter à la cible",
--    ["Adds telltarget slash command (/tt)."] = "Ajoute la commande Chuchoter à la cible (TellTarget) /tt",
--    ["Target does not exist."] = "La cible n'existe pas.",
--    ["Target is not a player."] = "La cible n'est pas un joueur.",
--    ["No target selected."] = "Pas de cible sélectionnée.",
--    ["NoTarget"] = "Pas de cible",
--} end)



-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["TellTarget"],
        desc = L["Adds telltarget slash command (/tt)."],
        type = "group",
        args = {
			info = {
				name = L["Adds telltarget slash command (/tt)."],
				type = "description",
			}
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
function module:OnModuleEnable()
    self:HookScript(ChatFrameEditBox, "OnTextChanged")
end

function module:OnModuleDisable()
	self:UnhookAll()
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:OnTextChanged(editBox, ...)
    local command, msg = editBox:GetText():match("^(/%S+)%s(.*)$")
    if command == "/tt" or command == L["/tt"] then
        self:SendTellToTarget(editBox.chatFrame, msg)
    end
    self.hooks[editBox].OnTextChanged(editBox, ...)
end

function module:SendTellToTarget(frame, text)
	if frame == nil then frame = DEFAULT_CHAT_FRAME end

	local unitname, realm, fullname
    if UnitIsPlayer("target") then
        unitname, realm = UnitName("target")
        if unitname then 
            if realm and not UnitIsSameServer("player", "target") then
                fullname = unitname.."-"..realm
            else
                fullname = unitname
            end
        end
    end
	ChatFrame_SendTell((fullname and fullname:gsub(" ", "") or L["NoTarget"]), frame)
    ChatFrameEditBox:SetText(text)
end

local function TellTarget(msg)
	module:SendTellToTarget(SELECTED_CHAT_FRAME, msg)
end


-- TODO: set slash command
--SlashCmdList["module"] = TellTarget
--SLASH_module1 = "/tt"
--SLASH_module2 = L["/tt"]


  return
end ) -- Prat:AddModuleToLoad