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
Name: PratFiltering
Revision: $Revision: 81859 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Filtering
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: A module to provide basic chat filtering. (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Filtering")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["Filtering"] = true,
	["A module to provide basic chat filtering."] = true,
    ["leavejoin_name"] = "Filter Channel Leave/Join",
    ["leavejoin_desc"] = "Filter out channel leave/join spam",
    ["notices_name"] = "Filter Channel Notices",
    ["notices_desc"] = "Filter out other custom channel notification messages, e.g. moderator changes.",
    ["bgjoin_name"] = "Filter BG Leave/Join",
    ["bgjoin_desc"] = "Filter out channel Battleground leave/join spam",
--    ["tradespam_name"] = "tradespam",
--    ["tradespam_desc"] = "tradespam",
})

L:AddLocale("ruRU", {
	["Filtering"] = true,
	["A module to provide basic chat filtering."] = "Модуль для обеспечения базовый фильтрации чата.",
    ["leavejoin_name"] = "Вход/выход на/из канала",
    ["leavejoin_desc"] = "Отфильтровывать сообщения входа и выхода на/из канала",
    ["notices_name"] = "Извещения в канале",
    ["notices_desc"] = "Отфильтровывать извещения в каналах (такие как смета модератора и т.п.)",
    ["bgjoin_name"] = "Отфильтровывать вход/выход на ПС",
    ["bgjoin_desc"] = "Отфильтровывать сообщения входа и выхода на/из Поля Сражения (БГ)",
--    ["tradespam_name"] = "tradespam",
--    ["tradespam_desc"] = "tradespam",
})
----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 81859 $
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["Filtering"] = "信息过滤",
--    ["A module to provide basic chat filtering."] = "提供基本聊天过滤功能.",
--    ["leavejoin_name"] = "过滤频道离开/加入",
--    ["leavejoin_desc"] = "过滤离开/加入频道的讯息",
--    ["notices_name"] = "过滤频道通知",
--    ["notices_desc"] = "过滤其他频道通知讯息, 例如频道修改权限变化.",
--    ["bgjoin_name"] = "过滤战场离开/加入",
--    ["bgjoin_desc"] = "过滤离开/加入战场频道的讯息",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Filtering"] = "訊息過濾",
--    ["A module to provide basic chat filtering."] = "提供基本過濾功能的模組。",
--    ["leavejoin_name"] = "過濾離開/加入頻道",
--    ["leavejoin_desc"] = "過濾離開/加入頻道的訊息。",
--    ["notices_name"] = "過濾頻道通知",
--    ["notices_desc"] = "過濾其他頻道通知訊息，例如頻道修改權變更。",
--    ["bgjoin_name"] = "過濾戰場離開/加入",
--    ["bgjoin_desc"] = "過濾戰場離開/加入的頻道訊息。",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["Filtering"] = "필터링",
--	["A module to provide basic chat filtering."] = "기본 대화 필터링을 제공하는 모듈입니다.",
--	["leavejoin_name"] = "채널 참가/떠남 필터",
--	["leavejoin_desc"] = "채널 참가/떠남 스팸을 제거합니다.",
--	["notices_name"] = "채널 알림 필터링",
--	["notices_desc"] = "다른 사용자 지정 채널 알림 메세지를 필터링합니다, 예. moderator changes.",
--	["bgjoin_name"] = "전장 떠남/참가 필터링",
--	["bgjoin_desc"] = "전장 떠남/참가 스팸을 필터링합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Filtering"] = "Filterrung",
--	["A module to provide basic chat filtering."] = "Ein Modul das einen grundlegenden Chatfilter bietet.",
--    ["leavejoin_name"] = "Filtere Kanal Verlassen/Betreten",
--    ["leavejoin_desc"] = "Rausfiltern von Kanal verlassen/betreten Spam.",
--    ["notices_name"] = "Filtere Kanal Benachrichtigungen",
--    ["notices_desc"] = "Rausfiltern von vorgegeben Kanal Benachrichtigunsmeldungen, z.B: Moderator änderrungen.",
--    ["bgjoin_name"] = "Filtere BG Verlassen/Betreten",
--    ["bgjoin_desc"] = "Rausfiltern des Schlachtfeld Verlassen/Betreten Spam.",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["Filtering"] = "Filtrado",
--	["A module to provide basic chat filtering."] = "Un módulo que permite un filtrado de chat básico",
--    ["leavejoin_name"] = "Filtrar Unión/Abandono de canal",
--    ["leavejoin_desc"] = "Filtra los mensajes que aparecen cuando alguien se une o abandona un canal",
--    ["notices_name"] = "Filtrar Noticias de Canal",
--    ["notices_desc"] = "Filtra los mensajes de notificación de los canales, ej: cambios de moderador.",
--} end)



local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module, {
	profile = {
		on	= false,
	    leavejoin = true,
	    notices = true,
--	    bgjoin = false,
		tradespam = true,
	}
} )

Prat:SetModuleOptions(module, {
        name = L["Filtering"] ,
        desc = L["A module to provide basic chat filtering."],
        type = "group",
        args = {
--		    leavejoin = { 
--				name = L["leavejoin_name"],
--				desc = L["leavejoin_desc"],
--				type = "toggle",
--				order = 100 
--			},
		    notices = { 
				name = L["notices_name"],
				desc = L["notices_desc"],
				type = "toggle",
				order = 110 
			},
--		    tradespam = { 
--				name = L["tradespam_name"],
--				desc = L["tradespam_desc"],
--				type = "toggle",
--				order = 110 
--			},


--		    bgjoin = { 
--				name = L["bgjoin_name"],
--				desc = L["bgjoin_desc"],
--				type = "toggle",
--				order = 111 
--			},	
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
local deformat

function module:OnModuleEnable()
	Prat.RegisterChatEvent(self, "Prat_FrameMessage")

--	Prat.RegisterLinkType(  { linkid="tradespam", linkfunc=module.TradeSpam, handler=module }, module.name)
end

-- things to do when the module is disabled
function module:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

--
-- Prat Event Implementation
--

--function module:TradeSpam(link, text, button, ...)
--	local realtext = strsub(link, 11)
--
--	ShowUIPanel(ItemRefTooltip)
--	if (not ItemRefTooltip:IsVisible()) then
--		ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
--	end
--	
--	ItemRefTooltip:ClearLines()
--	ItemRefTooltip:AddLine(realtext:gsub("@@", "|"), 1,1,1,1)
--	ItemRefTooltip:Show()
--
--	return false
--end
--
-----BuildLink(linktype, data, text, color, link_start, link_end)
--local function buildSpamLink(text)
--	return Prat.BuildLink("tradespam", text:gsub("|", "@@"),  text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", ""):sub(1, 20).."...", "8080ff")
--end


function module:Prat_FrameMessage(arg, message, frame, event)
--    if self.db.profile.leavejoin then 
--    	if  event == "CHAT_MSG_CHANNEL_JOIN" or event == "CHAT_MSG_CHANNEL_LEAVE"  then
--    		message.DONOTPROCESS = true
--    	end
--    end
    
        	
    if self.db.profile.notices then 
    	if  event == "CHAT_MSG_CHANNEL_NOTICE_USER" or event == "CHAT_MSG_CHANNEL_NOTICE"  then
    		message.DONOTPROCESS = true
    	end
    end
    
--	if self.db.profile.tradespam then
--		if message.ORG.CHANNEL and message.ORG.CHANNEL:find("Trade") and message.MESSAGE:len() > 40 then -- Temp implementation, todo: options?
--			message.MESSAGE = buildSpamLink(message.MESSAGE)
--		end
--	end


--    if self.db.profile.bgjoin and event == "CHAT_MSG_SYSTEM" then 
--        if MiniMapBattlefieldFrame.status == "active" then
--		    deformat = deformat or PRAT_LIBRARY(LIB.PARSING)
--
--            if deformat:Deformat(message.ORG.MESSAGE, ERR_BG_PLAYER_JOINED_SS) then
--                self:Debug("bgjoin", message.ORG)
--                message.DONOTPROCESS = true
--            elseif deformat:Deformat(message.ORG.MESSAGE,  ERR_BG_PLAYER_LEFT_S) then
--                message.DONOTPROCESS = true
--                self:Debug("bgleave", message.ORG)
--            end   
--        end
--   end        
end

  return
end ) -- Prat:AddModuleToLoad