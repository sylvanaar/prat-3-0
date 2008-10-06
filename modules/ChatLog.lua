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
Name: PratChatLog
Revision: $Revision: 80298 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatLog
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that controls toggling the chat and combat logs on and off (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("ChatLog")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["ChatLog"] = true,
    ["A module to automaticaly enable chat and combat logging."] = true,
    ["Toggle Chat Log"] = true,
    ["Toggle chat log on and off."] = true,
    ["Toggle Combat Log"] = true,
    ["Toggle combat log on and off."] = true,
    ["Combat Log: Enabled"] = true,
    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = true,
    ["Combat Log: Disabled"] = true,
    ["Chat Log: Enabled"] = true,
    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = true,
    ["Chat Log: Disabled"] = true,
    ["quiet_name"] = "Suppress Feedback Messages",
    ["quiet_desc"] = "Dont display any messages when this mod is enabled, or when it changes the log settings.",
})

--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["ChatLog"] = "Chat Aufzeichnung",
--    ["A module to automaticaly enable chat and combat logging."] = "Ein Modul um automatisch die Chat und Kampfaufzeichnung (Chatlog) zu aktivieren.",
--    ["Toggle Chat Log"] = "Aktiviere Chat Log",
--    ["Toggle chat log on and off."] = "Schalte Chat Log an und aus.",
--    ["Toggle Combat Log"] = "Aktiviere Kampf Log",
--    ["Toggle combat log on and off."] = "Schalte Kampf Log an und aus.",
--    ["Combat Log: Enabled"] = "Kampf Log: Aktiviert",
--    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Kampf Log gespeichert in <WoW Verzeichnis>\\Logs\\WoWCombatLog.txt nur beim Logut aus dem Spiel.",
--    ["Combat Log: Disabled"] = "Kampf Log: Deaktiviert",
--    ["Chat Log: Enabled"] = "Chat Log: Aktiviert",
--    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "Chat Log gespeichert in <WoW Verzeichnis>\\Logs\\WoWChatLog.txt nur beim Logut aus dem Spiel.",
--    ["Chat Log: Disabled"] = "Chat Log: Deaktiviert"
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["ChatLog"] = "Enregistrement des chats",
--    ["A module to automaticaly enable chat and combat logging."] = "Un module pour activer automatiquement l'enregistrement des logs des discussions et du journal de combat.",
--    ["Toggle Chat Log"] = "Active/d\195\169sactive l'enregistrement des discussions",
--    ["Toggle chat log on and off."] = "Active/d\195\169sactive l'enregistrement des discussions",
--    ["Toggle Combat Log"] = "Active/d\195\169sactive l'enregistrement du journal de combat",
--    ["Toggle combat log on and off."] = "Active/d\195\169sactive l'enregistrement du journal de combat",
--    ["Combat Log: Enabled"] = "Journal de combat : activ\195\169",
--    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "Journal de combat enregistr\195\169 \195\160 <WoW Installation>\\Logs\\WoWCombatLog.txt quand vous vous d\195\169connectez.",
--    ["Combat Log: Disabled"] = "Journal de combat : activ\195\169",
--    ["Chat Log: Enabled"] = "Enregistrement des discussions : activ\195\169",
--    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "discussions enregistr\195\169es \195\160 <WoW Installation>\\Logs\\WoWChatLog.txt quand vous vous d\195\169connectez.",
--    ["Chat Log: Disabled"] = "Enregistrement des discussions : d\195\169sactiv\195\169",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["ChatLog"] = "Registro de Chat",
--    ["A module to automaticaly enable chat and combat logging."] = "Un m\195\179dulo que activa el registro de chat y combate de forma autom\195\161tica",
--    ["Toggle Chat Log"] = "Activar Registro de Chat",
--    ["Toggle chat log on and off."] = "Activa el registro de chat.",
--    ["Toggle Combat Log"] = "Activar Registro de Combate",
--    ["Toggle combat log on and off."] = "Activa el registro de combate.",
--    ["Combat Log: Enabled"] = "Registro de Combate: Activado",
--    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "El registro de combate se guardar\195\161 en <Carpeta del WoW>\\Logs\\WoWCombatLog.txt cuando desconectes",
--    ["Combat Log: Disabled"] = "Registro de Combate: Desactivado",
--    ["Chat Log: Enabled"] = "Registro de Chat: Activado",
--    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "El registro de chat se guardar\195\161 en <Carpeta del WoW>\\Logs\\WoWChatLog.txt cuando desconectes",
--    ["Chat Log: Disabled"] = "Registro de Chat: Desactivado",
--    ["quiet_name"] = "No mostrar mensajes",
--    ["quiet_desc"] = "No se mostrarán los mensajes cuando se activa este módulo, o cuando cambia los ajustes del registro.",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["ChatLog"] = "대화로그",
--    ["A module to automaticaly enable chat and combat logging."] = "대화와 전투를 자동으로 기록하는 기능입니다.",
--    ["Toggle Chat Log"] = "대화 로그 사용",
--    ["Toggle chat log on and off."] = "대화 로그를 사용합니다.",
--    ["Toggle Combat Log"] = "전투 로그 사용",
--    ["Toggle combat log on and off."] = "전투 로그를 사용합니다.",
--    ["Combat Log: Enabled"] = "전투 로그: 사용중",
--    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "전투 로그는 접속 종료 시 <WoW 설치폴더>\\Logs\\WoWCombatLog.txt 에 기록됩니다.",
--    ["Combat Log: Disabled"] = "전투 로그: 사용 하지 않음",
--    ["Chat Log: Enabled"] = "대화 로그: 사용중",
--    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "대화 로그는 접속 종료 시 <WoW 설치폴더>\\Logs\\WoWChatLog.txt 에 기록됩니다.",
--    ["Chat Log: Disabled"] = "대화 로그: 사용 하지 않음",
--    ["quiet_name"] = "피드백 메세지 차단",
--    ["quiet_desc"] = "이 모듈이 활성화 되거나 로그 설정이 변경되었을 때 어떠한 메세지도 표시 하지 않도록 합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["ChatLog"] = "聊天紀錄",
--    ["A module to automaticaly enable chat and combat logging."] = "可自動紀錄聊天訊息與戰鬥日誌的模組。",
--    ["Toggle Chat Log"] = "啟用聊天紀錄",
--    ["Toggle chat log on and off."] = "切換是否啟用聊天訊息紀錄。",
--    ["Toggle Combat Log"] = "啟用戰鬥記錄",
--    ["Toggle combat log on and off."] = "切換是否啟用戰鬥日誌記錄。",
--    ["Combat Log: Enabled"] = "戰鬥日誌紀錄: 已啟用",
--    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "戰鬥日誌紀錄僅會在登出時儲存於<WoW Installation>\\Logs\\WoWCombatLog.txt。",
--    ["Combat Log: Disabled"] = "戰鬥日誌紀錄: 已停用",
--    ["Chat Log: Enabled"] = "聊天訊息紀錄: 已啟用",
--    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "聊天訊息紀錄僅會在登出時儲存於<WoW Installation>\\Logs\\WoWChatLog.txt。",
--    ["Chat Log: Disabled"] = "聊天訊息紀錄: 已停用",
--    ["quiet_name"] = "禁用反饋資訊",
--    ["quiet_desc"] = "當此模組啟用或更改任何紀錄設定時也不顯示訊息。",
--} end)
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["ChatLog"] = "聊天记录",
--    ["A module to automaticaly enable chat and combat logging."] = "可自动记录聊天信息及战斗日志的模块",
--    ["Toggle Chat Log"] = "启用聊天记录",
--    ["Toggle chat log on and off."] = "切换是否启用聊天记录",
--    ["Toggle Combat Log"] = "启用战斗日志",
--    ["Toggle combat log on and off."] = "切换是否启用战斗日志",
--    ["Combat Log: Enabled"] = "战斗日志: 启用",
--    ["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."] = "战斗日至记录保存于<WoW 安装目录>\\Logs\\WoWCombatLog.txt only upon logout.",
--    ["Combat Log: Disabled"] = "战斗日志: 禁用",
--    ["Chat Log: Enabled"] = "聊天记录启用",
--    ["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."] = "聊天记录保存于<WoW 安装目录>\\Logs\\WoWChatLog.txt only upon logout.",
--    ["Chat Log: Disabled"] = "聊天记录: 禁用",
--    ["quiet_name"] = "禁用反馈信息",
--    ["quiet_desc"] = "当次模块启用或更改任何记录设定时将不显示信息.",
--} end)



local module = Prat:NewModule(PRAT_MODULE)


Prat:SetModuleDefaults(module.name, {
	profile = {
        on = false,
        chat = false,
        combat = false,
        quiet = true,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["ChatLog"],
        desc = L["A module to automaticaly enable chat and combat logging."],
        type = "group",
        args = {
            chat = {
                name = L["Toggle Chat Log"],
                desc = L["Toggle chat log on and off."],
                type = "toggle",
                get = "GetValue",
                set = "SetChatLog",
            },
            combat = {
                name = L["Toggle Combat Log"],
                desc = L["Toggle combat log on and off."],
                type = "toggle",
                get = "GetValue",
                set = "SetCombatLog",
            }
        }
    })


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
    self:SetChatLog(self.db.profile.chat)
    self:SetCombatLog(self.db.profile.combat)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- enable or disable the chat log
function module:SetChatLog(info, val)
    self.db.profile.chat = val
    if self.db.profile.chat then
        self:Print(L["Chat Log: Enabled"])
        self:Print(L["Chat log recorded to <WoW Installation>\\Logs\\WoWChatLog.txt only upon logout."])
        LoggingChat(1)
    else
        LoggingChat(0)
        self:Print(L["Chat Log: Disabled"])
    end
end

-- enable or disable the combat log
function module:SetCombatLog(info, val)
    self.db.profile.combat = val
    if self.db.profile.combat then
        self:Print(L["Combat Log: Enabled"])
        self:Print(L["Combat log recorded to <WoW Installation>\\Logs\\WoWCombatLog.txt only upon logout."])
        LoggingCombat(1)
    else
        LoggingCombat(0)
        self:Print(L["Combat Log: Disabled"])
    end
end

function module:Print(str)
    if self.db.profile.quiet then return end
    
    Prat:Print(str)
end



  return
end ) -- Prat:AddModuleToLoad