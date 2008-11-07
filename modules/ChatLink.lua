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
Name: ChatLink
Revision: $Revision: 81459 $
Author(s): Krtek (krtek4@gmail.com)
           Sylvanaar (sylvanaar@mindspring.com)
Inspired by: ChatLink by Yrys
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatLink
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that shows item links in chat channels.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("ChatLink")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["module_name"] = "ChannelLinks",
    ["module_desc"] = "Chat channel item link options.",
--    ["gem_name"] = "GEM Compatibility",
--    ["gem_desc"] = "Enable GEM Compatiblity Mode",
    ["Trade"] = true

})

L:AddLocale("ruRU", {
    ["module_name"] = "ChannelLinks",
    ["module_desc"] = "Настройки ссылок в каналах чата.",
--    ["gem_name"] = "GEM Compatibility",
--    ["gem_desc"] = "Enable GEM Compatiblity Mode",
    ["Trade"] = "Торговля"

})

L:AddLocale("deDE", {
    ["module_name"] = "ChatLink",
    ["module_desc"] = "Chat Kanal Item Link Optionen.",
--    ["gem_name"] = "GEM Kompatibilität",
--    ["gem_desc"] = "Aktiviere den GEM Kompatibilitätsmodus",
    ["Trade"] = "Handel"
})

--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["ChannelLinks"] = "Enlace de Chat",
--    ["Chat channel item link options."] = "Opciones de enlace de objeto en un canal de chat",
--    ["cm_name"] = "ChatManager",
--    ["cm_desc"] = "Determina si se envian los objetos en el formato Cirk\" ChatManager",
--    ["clink_name"] = "Enlace de Chat",
--    ["clink_desc"] = "Activa y desactiva los objetos en formato Enlace de Chat.",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["ChannelLinks"] = "채널링크",
--    ["Chat channel item link options."] = "대화 채널 아이템 링크 설정입니다.",
--    ["cm_name"] = "ChatManager",
--    ["cm_desc"] = "Cirk\" Chatmanager 형식으로 아이템을 전송합니다.",
--    ["clink_name"] = "ChatLink",
--    ["clink_desc"] = "ChatLink 형식으로 아이템을 전송합니다.",
--    ["gem_name"] = "GEM 호환",
--    ["gem_desc"] = "GEM 호환 모드를 사용합니다.",
--    ["Trade"] = "거래"
--} end)
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["ChannelLinks"] = "聊天链接",
--    ["Chat channel item link options."] = "聊天频道物品链接选项。",
--    ["cm_name"] = "聊天管理",
--    ["cm_desc"] = "切换以 Cirk\" 聊天管理模式发送物品。",
--    ["clink_name"] = "聊天链接",
--    ["clink_desc"] = "切换聊天链接物品发送格式。",
--    ["Trade"] = "交易"
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["ChannelLinks"] = "聊天連結",
--    ["Chat channel item link options."] = "聊天頻道物品連結選項。",
--    ["cm_name"] = "ChatManager",
--    ["cm_desc"] = "切換為 Cirk's ChatManager 格式。",
--    ["clink_name"] = "ChatLink",
--    ["clink_desc"] = "切換為 ChatLink 格式。",
--    ["gem_name"] = "兼容 GEM",
--    ["gem_desc"] = "啟用 GEM 兼容模式。",
--    ["Trade"] = "交易"
--
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["ChannelLinks"] = "Liens",
--    ["Chat channel item link options."] = "Options des liens d'objets dans les chats.",
--    ["cm_name"] = "ChatManager",
--    ["cm_desc"] = "Active l'envoi des liens d'objet au format de Cirk\" ChatManager.",
--    ["clink_name"] = "ChatLink",
--    ["clink_desc"] = "Active l'envoi des liens d'objets au format ChatLink.",
--} end)



local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module, {
	profile = {
	    on = false,
	}
} )

Prat:SetModuleOptions(module, {
        name = L["module_name"],
        desc = L["module_desc"],
        type = "group",
        args = {
			info = {
				name = "This module allows you to link items into non-trade chat channels ie. General, or private channels such as your class channel. To users without an addon capable of decoding it, it will look like spam, so be courteous",
				type = "description",
			}
        }
    }
)

local function linkedInTrade()
	local _, name 
	
	if Prat.CurrentMsg.CHANNEL then
		_, name = GetChannelName(Prat.CurrentMsg.CHANNEL)
	end

	if Prat.CurrentMsg.CTYPE ~= "CHANNEL" or name:find(L["Trade"]) then 	
		return true
	end
end

local function getQuestColor(level)
	local dc = GetDifficultyColor(level)
	
	if dc.font == QuestDifficulty_Impossible then
		return "ff2020"
	end

	return Prat.CLR:GetHexColor(dc)
end

-- CREDIT TO: Yrys - Hellscream, author of ChatLink (Adapted for the Prat 3.0 Framework
local function ComposeItem(a1, a2, a3) 
	if linkedInTrade() then return end 
	return Prat:RegisterMatch(("{CLINK:item:%s:%s:%s}"):format(a1, a2, a3), "OUTBOUND") 
end
local function ComposeEnchant(a1, a2, a3, a4) if linkedInTrade() then return end return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s}"):format(a2, a1, a3, a4),"OUTBOUND") end
local function ComposeQuest(a1, a2, a3, a4, a5) if linkedInTrade() then return end return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s:%s}"):format(a2, a1, a3, a4, a5), "OUTBOUND") end
local function ComposeSpell(a1, a2, a3, a4) if linkedInTrade() then return end return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s}"):format(a2, a1, a3, a4), "OUTBOUND") end

local function DecomposeItem(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Hitem:%s|h[%s]|h|r"):format(a1, a2, a3), "FRAME") end
local function DecomposeEnchant(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Henchant:%s|h[%s]|h|r"):format(a1, a2, a3),"FRAME") end
local function DecomposeQuest(a1, a2, a3, a4, a5) return Prat:RegisterMatch(("|cff%s|Hquest:%s:%s|h[%s]|h|r"):format(getQuestColor(tonumber(a3)), a2, a3, a4), "FRAME") end
local function DecomposeSpell(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Hspell:%s|h[%s]|h|r"):format(a1, a2, a3), "FRAME") end

local function GEM() return Prat:RegisterMatch("|") end

--   |cffff2020|Hquest:13294:80|h[Against the Giants]|h|r GetQuestLink(13294) {CLINK:quest:13294:80:test}
-- /print ("||cff0070dd||Hitem:35570:2669:0:0:0:0:0:1385174015:78||h[Keleseth's Blade of Evocation]||h||r"):match("||c(%x+)||Hitem:(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)||h%[([^%]]-)%]||h||r")
--  |cff0070dd|Hitem:35570:2669:0:0:0:0:0:1385174015:78|h[Keleseth's Blade of Evocation]|h|r
Prat:SetModulePatterns(module, {
		{ pattern = "|c(%x+)|Hitem:(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeItem, type = "OUTBOUND"},
		{ pattern = "|c(%x+)|H(enchant):(%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeEnchant,  type = "OUTBOUND"},
		{ pattern = "|c(%x+)|H(quest):(%-?%d-):(%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeQuest,  type = "OUTBOUND"},
		{ pattern = "|c(%x+)|H(spell):(%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeSpell,  type = "OUTBOUND"},


		{ pattern =  "{CLINK:item:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}",  matchfunc=DecomposeItem },
		{ pattern = "{CLINK:enchant:(%x+):(%-?%d-):([^}]-)}",  matchfunc=DecomposeEnchant },
		{ pattern = "{CLINK:quest:(%x+):(%-?%d-):(%-?%d-):([^}]-)}",  matchfunc=DecomposeQuest},
		{ pattern = "{CLINK:spell:(%x+):(%-?%d-):([^}]-)}",  matchfunc=DecomposeSpell },
		--{ pattern = "{CLINK:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}",  matchfunc=DecomposeItem },

		{ pattern = "\127p", matchfunc=GEM, type="FRAME" }
})
  return
end ) -- Prat:AddModuleToLoad