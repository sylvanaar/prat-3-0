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
Revision: $Revision: r24999 $
Author(s): Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Clear
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Adds /clear (or /cls) and /clearall (or /clsall) commands for clearing chat frames (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Clear")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["Clear"] = true,
	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = true,
	["Clears the current chat frame."] = true,
	["Clearall"] = true,
	["Clears all chat frames."] = true,
})

L:AddLocale("ruRU", {
	["Clear"] = true,
	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Добавляет слаш команды очистки текста (/clear)(/cls)(/clearall)(/clsall).",
	["Clears the current chat frame."] = "Очистить текущее окно чата.",
	["Clearall"] = "Очистить все",
	["Clears all chat frames."] = "Очистить все окна чата.",
})

--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Clear"] = "Leeren",
--	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "F\195\188gt /clear (oder /cls) und /clearall (oder /clsall) Befehle f\195\188rs Leeren der Chatfenster hinzu.",
--	["Clears the current chat frame."] = "Leert das gegenw\195\164rtige Chatfenster.",
--	["Clearall"] = "Leere alles",
--	["Clears all chat frames."] = "Leert alle Chatfenster.",
--} end)
--
----[[
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--	["Clear"] = "",
--	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "",
--	["Clears the current chat frame."] = "",
--	["Clearall"] = "",
--	["Clears all chat frames."] = "",
--} end)
--]]
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["Clear"] = "Borrar",
--	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Añade los comandos /clear (o /cls) y /clearall (o /clsall) para borrar el contenido de las ventanas de chat",
--	["Clears the current chat frame."] = "Borra el contenido de la ventana de chat actual",
--	["Clearall"] = "'Borrartodo'",
--	["Clears all chat frames."] = "Borra el contenido de todas las ventanas de chat",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["Clear"] = "클리어",
--	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "클리어 명령어 (/clear)(/cls)(/clearall)(/clsall)을 추가합니다.",
--	["Clears the current chat frame."] = "현재 대화창을 클리어 합니다.",
--	["Clearall"] = "전체클리어",
--	["Clears all chat frames."] = "모든 대화창을 클리어 합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["Clear"] = "清除視窗指令",
--	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "增加 /clear (或 /cls) 以及 /clearall (或 /clsall) 指令以清除聊天視窗。",
--	["Clears the current chat frame."] = "清除目前聊天視窗。",
--	["Clearall"] = "全部清除",
--	["Clears all chat frames."] = "清除所有聊天視窗。",
--} end)
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["Clear"] = "清除",
--	["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "增加/clear (或/cls)以及/clearall (或 /clsall)命令清除聊天窗口",
--	["Clears the current chat frame."] = "清除当前聊天窗信息",
--	["Clearall"] = "全部清除",
--	["Clears all chat frames."] = "清除所有聊天窗信息",
--} end)


local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = false,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["Clear"],
        desc = L["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."],
        type = "group",
        args = {
        }
    }
)

--[[------------------------------------------------
	Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
	Prat.RegisterChatCommand("clear", function() module:clear(SELECTED_CHAT_FRAME) end )
	Prat.RegisterChatCommand("cls", function() module:clear(SELECTED_CHAT_FRAME) end )
	Prat.RegisterChatCommand("clearall", function() module:clearAll() end )
	Prat.RegisterChatCommand("clsall", function() module:clearAll() end )

--	local slashcmds, cmdopts
--
--	-- clear
--	cmdopts_clear = {
--		name	= L["Clear"],
--		desc	= L["Clears the current chat frame."],
--		type	= "execute",
--		func	= function() module:clear(SELECTED_CHAT_FRAME) end,
--		}
--
--	-- cleartastic
--	cmdopts_clearall = {
--		name	= L["Clearall"],
--		desc	= L["Clears all chat frames."],
--		type	= "execute",
--		func	= function() module:clearAll() end,
--		}

-- TODO - need to find call equivalent to RCC in Ace2
--	Prat.Addon:RegisterChatCommand({ '/clear', '/cls' }, cmdopts_clear)
--	Prat.Addon:RegisterChatCommand({ '/clearall', '/clsall' }, cmdopts_clearall)
end

function module:OnModuleDisable()
end

--[[ - - ------------------------------------------------
	Core Functions
--------------------------------------------- - ]]--

function module:clear(chatframe)
	local vartype = type(chatframe)
	local type = chatframe:GetFrameType() or nil

	if self.db.profile.on and type == 'ScrollingMessageFrame' then
		chatframe:Clear()
	end
end

function module:clearAll()
	for i = 1, NUM_CHAT_WINDOWS do
		self:clear(getglobal('ChatFrame' .. i))
	end
end


  return
end ) -- Prat:AddModuleToLoad