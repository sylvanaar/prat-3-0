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
Revision: $Revision: 80392 $
Author(s): Krtek (krtek4@gmail.com); Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#History
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that adds chat history options.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

--[[
	2007-06-24: added option to save cmd history - fin
]]

local PRAT_MODULE = Prat:RequestModuleName("History")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["History"] = true,
	["Chat history options."] = true,
	["Set Chat Lines"] = true,
	["Set the number of lines of chat history for each window."] = true,
	["Set Command History"] = true,
	["Maximum number of lines of command history to save."] = true,
	["Save Command History"] = true,
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = true,
})

L:AddLocale("ruRU", {
	["History"] = true,
	["Chat history options."] = "Настройки истории чата.",
	["Set Chat Lines"] = "Задать число строк чата",
	["Set the number of lines of chat history for each window."] = "Установите число строк истории чата для всех окон чата.",
	["Set Command History"] = "История команд",
	["Maximum number of lines of command history to save."] = "Максимальное число строк сохранённых в истории команд.",
	["Save Command History"] = "Сохранять историю команд",
	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "Сохранять историю команд между сеансами (для использования используйте alt+ стрелка вверх или просто стрелку вверх)",
})
--
----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80392 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["History"] = "历史",
--	["Chat history options."] = "聊天历史选项.",
--	["Set Chat Lines"] = "设置",
--	["Set the number of lines of chat history for each window."] = "为每个聊天窗口设置历史记录行数.",
--    ["Set ChatFrame%d Chat Lines"] = "聊天窗口 %d 历史",
--    ["Sets the number of lines of chat history to save."] = "设置聊天窗口 %d 聊天历史记录",
--	["Save Command History"] = "保存命令历史",
--	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "保存进程命令历史 (使用 <Alt+上> 或 <上> 键可搜索的)",
--	["Set Command History"] = "命令历史数",
--	["Maximum number of lines of command history to save."] = "保存命令历史最大条目",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["History"] = "이력",
--	["Chat history options."] = "대화 이력 설정입니다.",
--	["Set Chat Lines"] = "대화 라인 설정",
--	["Set the number of lines of chat history for each window."] = "각 대화창에 대한 대화 이력의 라인 수를 설정합니다.",
--	["Set ChatFrame%d Chat Lines"] = "%d 대화창 대화 라인 설정",
--	["Sets the number of lines of chat history to save."] = "저장할 대화 이력의 라인 수를 설정합니다.",
--	["Set Command History"] = "명령어 이력 설정",
--	["Maximum number of lines of command history to save."] = "저장할 명령어 이력의 최대 라인의 수입니다.",
--	["Save Command History"] = "명령어 이력 저장",
--	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "접속간 명령어 이력을 저장합니다. (ALT+위 방향키 혹은 위 방향키 사용)",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["History"] = "歷史",
--	["Chat history options."] = "聊天歷史選項。",
--	["Set Chat Lines"] = "聊天行數",
--	["Set the number of lines of chat history for each window."] = "設定各個聊天視窗的聊天行數。",
--	["Set ChatFrame%d Chat Lines"] = "聊天視窗%d聊天行數",
--	["Sets the number of lines of chat history to save."] = "設定儲存的聊天歷史行數。",
--	["Set Command History"] = "指令歷史",
--	["Maximum number of lines of command history to save."] = "設定最多儲存多少行指令。",
--	["Save Command History"] = "儲存指令歷史",
--	["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = "儲存指令歷史 (Alt-上或上鍵使用)。",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["History"] = "Historial",
--    ["Chat history options."] = "Opciones del historial de chat",
--    ["Set Chat Lines"] = "Establecer",
--    ["Set the number of lines of chat history for each window."] = "Establece el n\195\186mero de l\195\173neas de historial para cada ventana",
--    ["Set ChatFrame%d Chat Lines"] = "Historial del Chat %d",
--    ["Sets the number of lines of chat history to save."] = "Establece el historial para la ventana de chat %d",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["History"] = "Verlauf",
--    ["Chat history options."] = "Chat Verlauf Optionen.",
--    ["Set Chat Lines"] = "Setze",
--    ["Set the number of lines of chat history for each window."] = "Setze die Anzahl der Verlauf Zeilen f\195\188r jedes Fenster.",
--    ["Set ChatFrame%d Chat Lines"] = "Chat %d Verlauf",
--    ["Sets the number of lines of chat history to save."] = "Setze Verlauf f\195\188r Chatfenster %d.",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["History"] = "Historique",
--    ["Chat history options."] = "Options de l'historique des chats",
--    ["Set Chat Lines"] = "Nombre de lignes",
--    ["Set the number of lines of chat history for each window."] = "R195\168gle le nombre de lignes d'historique à garder pour chaque fen\195\170tre.",
--    ["Set ChatFrame%d Chat Lines"] = "Historique fen\195\170tre %d",
--    ["Sets the number of lines of chat history to save."] = "R195\168gle l'historique pour la fen\195\170tre %d.",
--} end)



-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
		on = true,
		chatlinesframes = {} ,
		chatlines = 384,
		maxlines = 50,
		savehistory = false,
		cmdhistory = {},
	}
})


Prat:SetModuleOptions(module.name, {
	name = L["History"],
	desc = L["Chat history options."],
	type = "group",
	args = {
		chatlinesframes = {
			name = L["Set Chat Lines"],
			desc = L["Set the number of lines of chat history for each window."],
			type = "multiselect",
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
        },
		chatlines = {
			name	= L["Set Chat Lines"],
			desc	= L["Set the number of lines of chat history for each window."],
			type	= "range",
			order	= 120,			min	= 300,
			max	= 5000,
			step	= 10,
			bigStep	= 50,
        },
		maxlines = {
			name	= L["Set Command History"],
			desc	= L["Maximum number of lines of command history to save."],
			type	= "range",
			order	= 120,			min	= 50,
			max	= 5000,
			step	= 10,
			bigStep	= 50,
        },
		savehistory = {
			name	= L["Save Command History"],
			desc	= L["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"],
			type	= "toggle",
			order	= 130,		},
	}
})

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
	self:ConfigureAllChatFrames()

	if self.db.profile.saveHistory then
		if not self.db.profile.cmdhistory then
			self.db.profile.cmdhistory = {}
		end

		self:SecureHook(ChatFrameEditBox, "AddHistoryLine")
		self:addSavedHistory()
	end
end

-- things to do when the module is enabled
function module:OnModuleDisable()
	self:ConfigureAllChatFrames(384)

	self.db.profile.cmdhistory = {}
end

function module:ConfigureAllChatFrames(lines)
	local lines = lines or self.db.profile.chatlines

	for k,v in pairs(self.db.profile.chatlinesframes) do
		self:SetHistory(_G[k], lines)
	end
end

function module:OnSubvalueChanged()
	self:ConfigureAllChatFrames()
end
function module:OnValueChanged()
	self:ConfigureAllChatFrames()
end


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
local aquire, reclaim
do
	local cache = setmetatable({}, {__mode='k'})
	acquire = function()
		local t = next(cache) or {}
		cache[t] = nil
		return t
	end
	reclaim = function (t)
		for k in pairs(t) do
			t[k] = nil
		end
		cache[t] = true
	end
end


function module:SetHistory(f, lines)   
	if f:GetMaxLines() ~= lines then
	    local chatlines = acquire()
        for i=f:GetNumRegions(),1,-1 do
            local x = select(i, f:GetRegions())
            if x:GetObjectType() == "FontString" then
                table.insert(chatlines, { x:GetText(), x:GetTextColor() })
            end
        end
	
		f:SetMaxLines(lines)

        Prat.loading = true
	    for i,v in ipairs(chatlines) do
            f:AddMessage(unpack(v))
        end	        
        Prat.loading = false
        
        reclaim(chatlines)
	end
end

function module:addSavedHistory(cmdhistory)
	local cmdhistory	= self.db.profile.cmdhistory
	local cmdindex		= #cmdhistory

	-- where there"s a while, there"s a way
	while cmdindex > 0 do
		ChatFrameEditBox:AddHistoryLine(cmdhistory[cmdindex])
		cmdindex = cmdindex - 1
		-- way
	end
end

function module:saveLine(text)
	if not text or (text == "") then
		return false
	end

	local maxlines		= self.db.profile.maxlines
	local cmdhistory	= self.db.profile.cmdhistory

	table.insert(cmdhistory, 1, text)

	if #cmdhistory > maxlines then
		for x = 1, (#cmdhistory - maxlines) do
			table.remove(cmdhistory)
		end
	end

	self.db.profile.cmdhistory = cmdhistory
end

function module:AddHistoryLine(editBox)
	editBox = editBox or {}

	-- following code mostly ripped off from Blizzard, but at least I understand it now
    local text	= ""
    local type	= editBox:GetAttribute("chatType")
    local header	= getglobal("SLASH_" .. type .. "1")

	if (header) then
		text = header
	end

    if (type == "WHISPER") then
            text = text .. " " .. editBox:GetAttribute("tellTarget")
    elseif (type == "CHANNEL") then
            text = "/" .. editBox:GetAttribute("channelTarget")
    end

    local editBoxText = editBox:GetText();
    if (strlen(editBoxText) > 0) then
            text = text.." "..editBox:GetText();
    self:saveLine(text)
    end
end


  return
end ) -- Prat:AddModuleToLoad