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
           Reknaw
Inspired by: ChatLink by Yrys
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
    ["gem_name"] = "GEM Compatibility",
    ["gem_desc"] = "Enable GEM Compatiblity Mode",
    ["Trade"] = true

})

L:AddLocale("ruRU", {
    ["module_name"] = "ChannelLinks",
    ["module_desc"] = "Настройки ссылок в каналах чата.",
    ["gem_name"] = "GEM Compatibility",
    ["gem_desc"] = "Enable GEM Compatiblity Mode",
    ["Trade"] = "Торговля"

})

L:AddLocale("deDE", {
    ["module_name"] = "ChatLink",
    ["module_desc"] = "Chat Kanal Item Link Optionen.",
    ["gem_name"] = "GEM Kompatibilität",
    ["gem_desc"] = "Aktiviere den GEM Kompatibilitätsmodus",
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
        gem = false,
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
			},
            gem = {
                name = L["gem_name"],
                desc = L["gem_desc"],
                type = "toggle",
                order = 130,                
            },
        }
    }
)

local function encodedLinksNotAllowedWrap()
	if Prat.CurrentMsg.CTYPE ~= "CHANNEL" then 	
		return true
	end

    return not Prat.IsPrivateChannel(Prat.CurrentMsg.CHANNEL)
end

local function encodedLinksNotAllowed()
    local rc = encodedLinksNotAllowedWrap()

--@debug@ 
    Prat.Print("encodedLinksNotAllowed: "..tostring(rc))
--@end-debug@
    return rc
end
local function getQuestColor(level)
	local dc = GetDifficultyColor(level)
	
	if dc.font == QuestDifficulty_Impossible then
		return "ff2020"
	end

	return Prat.CLR:GetHexColor(dc)
end

---- CREDIT TO: Yrys - Hellscream, author of ChatLink (Adapted for the Prat 3.0 Framework
--local function ComposeItem(a1, a2, a3) 
--	if encodedLinksNotAllowed() then return end 
--	return Prat:RegisterMatch(("{CLINK:item:%s:%s:%s}"):format(a1, a2, a3), "OUTBOUND") 
--end
--local function ComposeEnchant(a1, a2, a3, a4) if encodedLinksNotAllowed() then return end return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s}"):format(a2, a1, a3, a4),"OUTBOUND") end
--local function ComposeQuest(a1, a2, a3, a4, a5) if encodedLinksNotAllowed() then return end return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s:%s}"):format(a2, a1, a3, a4, a5), "OUTBOUND") end
--local function ComposeSpell(a1, a2, a3, a4) if encodedLinksNotAllowed() then return end return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s}"):format(a2, a1, a3, a4), "OUTBOUND") end
--
--local function ComposeTrade(a1, a2, a3, a4, a5) if encodedLinksNotAllowed() then return end return Prat:RegisterMatch(("{CLINK:%2:%1:%3:%4}"):format(a2, a1, a3, a4), "OUTBOUND") end
--local function ComposeAchievmemt(a1, a2, a3, a4) if encodedLinksNotAllowed() then return end return Prat:RegisterMatch(("{CLINK:%2:%1:%3:%4}"):format(a2, a1, a3, a4), "OUTBOUND") end
--
--
--local function DecomposeItem(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Hitem:%s|h[%s]|h|r"):format(a1, a2, a3), "FRAME") end
--local function DecomposeEnchant(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Henchant:%s|h[%s]|h|r"):format(a1, a2, a3),"FRAME") end
--local function DecomposeQuest(a1, a2, a3, a4, a5) return Prat:RegisterMatch(("|cff%s|Hquest:%s:%s|h[%s]|h|r"):format(getQuestColor(tonumber(a3)), a2, a3, a4), "FRAME") end
--local function DecomposeSpell(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Hspell:%s|h[%s]|h|r"):format(a1, a2, a3), "FRAME") end
--
--local function DecomposeTrade(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Htrade:%s|h[%s]|h|r"):format(a1, a2, a3), "FRAME") end
--local function DecomposeAchievement(a1, a2, a3) return Prat:RegisterMatch(("|c%s|Hachievement:%s|h[%s]|h|r"):format(a1, a2, a3), "FRAME") end
--
--
--local function GEM() return module.db.profile.gem and Prat:RegisterMatch("|") or nil end
--
--
--Prat:SetModulePatterns(module, {
--		{ pattern = "|c(%x+)|Hitem:(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeItem, type = "OUTBOUND"},
--		{ pattern = "|c(%x+)|H(enchant):(%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeEnchant,  type = "OUTBOUND"},
--		{ pattern = "|c(%x+)|H(quest):(%-?%d-):(%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeQuest,  type = "OUTBOUND"},
--		{ pattern = "|c(%x+)|H(spell):(%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeSpell,  type = "OUTBOUND"},
--
--		{ pattern = "|c(%x+)|H(achievement):(%-?%d-:%x-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)|h%[([^%]]-)%]|h|r", matchfunc=ComposeAchievmemt,  type = "OUTBOUND"},
--		{ pattern = "|c(%x+)|H(trade):(%-?%d-:%-?%d-:%-?%d-:%x-:[\060-\123]+)|h%[([^%]]-)%]|h|r", matchfunc=ComposeTrade,  type = "OUTBOUND"},
--
--		{ pattern = "\127p", matchfunc=GEM, type="FRAME" },
--
--		{ pattern = "{CLINK:item:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}",  matchfunc=DecomposeItem, type="FRAME" },
--		{ pattern = "{CLINK:enchant:(%x+):(%-?%d-):([^}]-)}",  matchfunc=DecomposeEnchant, type="FRAME" },
--		{ pattern = "{CLINK:quest:(%x+):(%-?%d-):(%-?%d-):([^}]-)}",  matchfunc=DecomposeQuest, type="FRAME"},
--		{ pattern = "{CLINK:spell:(%x+):(%-?%d-):([^}]-)}",  matchfunc=DecomposeSpell, type="FRAME" },
--		{ pattern = "{CLINK:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}",  matchfunc=DecomposeItem, type="FRAME" },
--
--		{ pattern = "{CLINK:achievement:(%x+):(%-?%d-:%x-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}",  matchfunc=DecomposeAchievement, type="FRAME" },
--		{ pattern = "{CLINK:trade:(%x+):(%-?%d-:%-?%d-:%-?%d-:%x-:[\060-\123]+):([^}]-)}",  matchfunc=DecomposeTrade, type="FRAME" },
--})
----
---- {CLINK:ffffffff:13352:0:0:0:0:0:0:1664486749:70:Vosh'gajin's Snakestone}
---- {CLINK:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}
---- {CLINK:(%x+):(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}
----   |cffff2020|Hquest:13294:80|h[Against the Giants]|h|r GetQuestLink(13294) {CLINK:quest:13294:80:test}
---- /print ("||cff0070dd||Hitem:35570:2669:0:0:0:0:0:1385174015:78||h[Keleseth's Blade of Evocation]||h||r"):match("||c(%x+)||Hitem:(%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)||h%[([^%]]-)%]||h||r")
----  |cff0070dd|Hitem:35570:2669:0:0:0:0:0:1385174015:78|h[Keleseth's Blade of Evocation]|h|r
---- 
----13  {CLINK:%s:%s:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s}
----" |c(%x+)|H(achievement):(%d+):(%x+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)|h%[([^%]]-)%]|h|r"
----
--
----		chatstring = string.gsub (chatstring, "{CLINK:achievement:(%x+):(%-?%d-:%x-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-):([^}]-)}", "|c%1|Hachievement:%2|h[%3]|h|r")
----		chatstring = string.gsub (chatstring, "{CLINK:trade:(%x+):(%-?%d-:%-?%d-:%-?%d-:%x-:[^}:]+):([^}]-)}","|c%1|Htrade:%2|h[%3]|h|r")
----		chatstring = string.gsub (chatstring, "|c(%x+)|H(achievement):(%-?%d-:%x-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-:%-?%d-)|h%[([^%]]-)%]|h|r", "{CLINK:%2:%1:%3:%4}")
----		chatstring = string.gsub (chatstring, "|c(%x+)|H(trade):(%-?%d-:%-?%d-:%-?%d-:%x-:[^|:]+)|h%[([^%]]-)%]|h|r", "{CLINK:%2:%1:%3:%4}")
---- (" |c(%x+)|Htrade:51313:386:450:95F6FF:t{{{{{{{{{{w{{{{{{{{{{[{{{rvKx{cw{{[{A`<<==dz<<<|h[Enchanting]|h|r"):gsub("|", "\124")
--
----         { pattern = "("|cffffd000|Htrade:45542:446:450:21EFBE6:xG[{yK|h[First Aid]|h|r"):match("|cff(%x+)|H(trade):(%d+):(%d+):(%d+):(%x+):([\060-\123]+)|h(.-)|h|r")", matchfunc=
--
----("|cffffd000|Htrade:45542:446:450:21EFBE6:xG[{yK|h[First Aid]|h|"):match("|cff(%x+)|H(trade):(%d+):(%d+):(%d+):(%x+):([\060-\123]+)|h%[([^%]]-)%]|h|r")
--
--
--
--  return
--end ) -- Prat:AddModuleToLoad
--
 

-- CREDIT TO: Yrys - Hellscream, author of ChatLink (Adapted for the Prat 3.0 Framework
-- Code refatored by Reknaw
local function ComposeLink(a1, a2, a3, a4)
if encodedLinksNotAllowed() then return end
--@debug@ 
Prat.Print(("ComposeLink: Color=%q; Type=%q; ID=%q; Name=%q"):format(a1, a2, a3, a4))
--@end-debug@
return Prat:RegisterMatch(("{CLINK:%s:%s:%s:%s}"):format(a2, a1, a3, a4), "OUTBOUND")
end

local function DecomposeLink(a)
local _, _, a1, a2, a3, a4 = a:find("^(.-):(.-):(.+):(.-)$")
--@debug@ 
Prat.Print(("DecomposeLink: C|c%solor|r=%q; Type=%q; ID=%q; Name=%q"):format(a2, a2, a1, a3, a4))
--@end-debug@
-- Check to see if a4 should have contained one or more colons. (First char will be SPACE if there was)
while a4:sub(1, 1) == " " do
local _, _, t1, t2 = a3:find("^(.+):(.-)$")
a3, a4 = t1, t2..":"..a4
--@debug@ 
Prat.Print(("DecomposeLink - Value Changed: ID=%q; Name=%q"):format(a3, a4))
--@end-debug@
end

-- It's simple enough to perform specific code for each link type by checking the value of a1.
if a1 == "quest" then
a2 = "ff"..getQuestColor(select(3, a3:find(":(%d-)$")))
--@debug@ 
Prat.Print(("DecomposeLink - Value Changed:  C|c%solor|r=%q"):format(a2,a2))
--@end-debug@
end

return Prat:RegisterMatch(("|c%s|H%s:%s|h[%s]|h|r"):format(a2, a1, a3, a4), "FRAME")
end

local function GEM() return module.db.profile.gem and Prat:RegisterMatch("|") or nil end

Prat:SetModulePatterns(module, {
{ pattern = "|c(.-)|H(.-):(.-)|h.(.-).|h|r", matchfunc=ComposeLink, type = "OUTBOUND" },
{ pattern = "{CLINK:(.-)}", matchfunc=DecomposeLink },
{ pattern = "\127p", matchfunc=GEM, type="FRAME" }
})

return
end ) -- Prat:AddModuleToLoad
