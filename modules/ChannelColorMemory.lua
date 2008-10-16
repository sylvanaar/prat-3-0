---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat modules
--
-- Copyright (C) 2006-2007  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- moduleify it under the terms of the GNU General Public License
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
Name: PratChannelColorMemory
Revision: $Revision: 82095 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
Inspired by: ConsisTint By Karl Isenberg (AnduinLothar)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Moduleules#ChannelColorMemory
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Moduleule for Prat that remembers the colors of channels by channel name (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("ChannelColorMemory")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["ChannelColorMemory"] = true,
    ["Remembers the colors of each channel name."] = true,
    ["(%w+)%s?(.*)"] = true,
})

L:AddLocale("ruRU", {
    ["ChannelColorMemory"] = true,
    ["Remembers the colors of each channel name."] = true,
    ["(%w+)%s?(.*)"] = true,
})

--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["ChannelColorMemory"] = "Mémorisation des couleurs des canaux",
--    ["Remembers the colors of each channel name."] = "M\195\169moriser les couleurs de chaque canal.",
--    ["(%w+)%s?(.*)"] = "(%w+)%s?(.*)",
--} end)
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["ChannelColorMemory"] = "频道颜色储存",
--    ["Remembers the colors of each channel name."] = "还原频道名称的颜色设置",
--     ["(%w+)%s?(.*)"] = "(.+)%s?(.*)",
-- } end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["ChannelColorMemory"] = "채널색상기억",
--    ["Remembers the colors of each channel name."] = "각 채널명의 색상을 기억합니다.",
--    ["(%w+)%s?(.*)"] = "(.+)%s?(.*)",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["ChannelColorMemory"] = "頻道顏色記憶",
--    ["Remembers the colors of each channel name."] = "記住每個頻道的顏色設定。",
--    ["(%w+)%s?(.*)"] = "(.+)%s?(.*)",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["ChannelColorMemory"] = "Memoria de Color de Canal",
--    ["Remembers the colors of each channel name."] = "Recuerda los colores de los canales por nombre de canal.",
--    ["(%w+)%s?(.*)"] = "(%w+)%s?(.*)",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["ChannelColorMemory"] = "Kanal Farben Merken",
--    ["Remembers the colors of each channel name."] = "Merkt sich die Farben von jedem Kanal Namen.",
--    ["(%w+)%s?(.*)"] = "(%w+)%s?(.*)",
--} end)

local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	    colors = {},
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["ChannelColorMemory"],
        desc = L["Remembers the colors of each channel name."],
        type = "group",
        args = {
			info = {
				name = "This module remembers what color you give to a channel with a particular name, so that if you rejoin the channel, no matter what number it is, it will always have the same color.",
				type = "description",
			}
        }
    }
)

--[[------------------------------------------------
    Moduleule Event Functions
------------------------------------------------]]--

-- things to do when the moduleule is enabled
function module:OnModuleEnable()
    self:RegisterEvent("UPDATE_CHAT_COLOR")
    self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function module:UPDATE_CHAT_COLOR(evt, ChatType, cr,cg,cb)
    if (ChatType) then
        local number = ChatType:match("CHANNEL(%d+)")
        if ( number ) then
            local _, name = GetChannelName(number);
            if ( name ) then
                local name, zoneSuffix = name:match(L["(%w+)%s?(.*)"]);
                local color = self.db.profile.colors[name];
                if (not color) then
                    self.db.profile.colors[name] = {r=cr, g=cg, b=cb};
                else
                    color.r=cr
                    color.g=cg
                    color.b=cb
                end
            end
        end
    end
end

function module:CHAT_MSG_CHANNEL_NOTICE(evt, NoticeType, Sender, Language, LongName, Target, Flags, Unknown, number, cname, unknown, counter)
	if number == nil then 
		return
    elseif (NoticeType == "YOU_JOINED") then
        local color = self.db.profile.colors[cname];
        if (color) then
            ChangeChatColor("CHANNEL"..number, color.r, color.g, color.b);
        else
            color = ChatTypeInfo["CHANNEL"..number];
            self.db.profile.colors[cname] = {r=color.r, g=color.g, b=color.b};
        end
	elseif (NoticeType == "YOU_LEFT") then
        local color = self.db.profile.colors[cname];
        if (color) then
            ChangeChatColor("CHANNEL"..number, 1.0, 0.75, 0.75);
		end
    end
end

  return
end ) -- Prat:AddModuleToLoad