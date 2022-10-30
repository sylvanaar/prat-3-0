---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
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


--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local SVC_NAMESPACE = select(2, ...)
local type = type
local strsub = strsub

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]] --

local eventMap = {
  CHAT_MSG_CHANNEL = true,
  CHAT_MSG_SAY = true,
  CHAT_MSG_GUILD = true,
  CHAT_MSG_WHISPER = true,
  CHAT_MSG_WHISPER_INFORM = true,
  CHAT_MSG_YELL = true,
  CHAT_MSG_PARTY = true,
  CHAT_MSG_PARTY_LEADER = true,
  CHAT_MSG_OFFICER = true,
  CHAT_MSG_RAID = true,
  CHAT_MSG_RAID_LEADER = true,
  CHAT_MSG_RAID_WARNING = true,
  CHAT_MSG_INSTANCE_CHAT = true,
  CHAT_MSG_INSTANCE_CHAT_LEADER = true,
  CHAT_MSG_SYSTEM = true,
  CHAT_MSG_DND = true,
  CHAT_MSG_AFK = true,
  CHAT_MSG_BN_WHISPER = true,
  CHAT_MSG_BN_WHISPER_INFORM = true,
  CHAT_MSG_BN_CONVERSATION = true,
  CHAT_MSG_COMMUNITIES_CHANNEL = true
}

function EnableProcessingForEvent(event, flag)
  if flag == nil or flag == true then
    eventMap[event] = true
  else
    eventMap[event] = nil
  end
end

function EventIsProcessed(event)
  return eventMap[event] or false
end
