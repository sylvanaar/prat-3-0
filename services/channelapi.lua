---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2008  Prat Development Team
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
Name: Prat 3.0 (events.lua)
Revision: $Revision: 80213 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat
Forum: http://www.wowace.com/forums/index.php?topic=6243.0
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: The chat event service
]]

--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local type = type
local strsub = strsub
local wipe = table.wipe
local tostring = tostring

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]]--

ServerChannels = { _G.EnumerateServerChannels() }

do
    local chanTable = {}
    local function buildChanTable(t, name, num, ...)
        if name and num then
            t[num] = name
            t[name] = num
            return buildChanTable(t, ...)
        end
    
        return t
    end
    
    function GetChannelTable(t)
        if not t then 
            t = chanTable 
        end
        
        wipe(t)
    
        return buildChanTable(t, _G.GetChannelList())
    end
end

function GetChannelNumber(channel)
    if not channel then return end

    local num = _G.GetChannelName(channel)

    if num then return num end

    return GetChannelTable()[channel]
end

-- "CHANNEL_CATEGORY_CUSTOM", "CHANNEL_CATEGORY_WORLD", "CHANNEL_CATEGORY_GROUP"
local name, header, collapsed, channelNumber, active, count, category, voiceEnabled, voiceActive;
function GetChannelCategory(num)
    num = GetChannelNumber(num)
    for i=1, _G.GetNumDisplayChannels(), 1 do
        name, header, collapsed, channelNumber, count, active, category, voiceEnabled, voiceActive = _G.GetChannelDisplayInfo(i)

        if channelNumber == num then
            return category
        end
    end
end

local name, t
function IsPrivateChannel(num)
      return tostring(GetChannelCategory(num)) == "CHANNEL_CATEGORY_CUSTOM"
end

--    t = GetChannelTable()



--    -- 3 Cases: 1,  "Trade", and "Trade - Ironforge"
--    local c_num, c_name  = _G.GetChannelName(num) -- "Trade - Ironforge" -> 1, 1 ->  1
--
--    if c_num then
--        num = c_num 
--    else
--        num = t[num] -- "Trade" -> 1
--    end
--
--    name = t[num]  -- 1 --> Trade
--
--    
--
----    -- Is this a server channel
----    if type(num) == "string" then 
----        local tmp        
----        for k in pairs(ServerChannels) do
----            if k == name then tmp = k end
----        end
----        name = tmp 
----    end
----
----    -- If it is a server channel, is it the trade channel
----    if type(name) == "string" then
----        return (name ~= _G.TRADE)
----    end
--    
--    if name then
--        return true
--
--    return name and false or true
--end



