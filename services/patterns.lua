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

local table = table
local pairs, ipairs = pairs, ipairs
local tinsert, tremove, tconcat = table.insert, table.remove, table.concat
local wipe = wipe
local type = type
local setmetatable = setmetatable
local rawset, rawget = rawset, rawget
local tostring = tostring

local LibStub = LibStub

-- Isolate the environment
setfenv(1, select(2, ...))

--[[ END STANDARD HEADER ]] --


local PatternRegistry = {}



local debug = function(...)
--  _G.ChatFrame1:print(...)
end

-- Register a pattern with the pattern matching engine
-- You can supply a priority 1 - 100. Default is 50
-- 1 = highest, 100 = lowest.
-- pattern = { pattern, matchfunc, priority, type}
--
-- Priorities arent used currently, they are to help with
-- collisions later on if there are alot of patterns
--
do
  local PatternOwners = {}

  function RegisterPattern(pattern, who)
    tinsert(PatternRegistry, pattern)
    local idx = #PatternRegistry
    pattern.idx = idx

    debug("RegisterPattern", who, pattern)

    PatternOwners[#PatternRegistry] = who

    return idx
  end

  function UnregisterAllPatterns(who)
    debug("UnregisterAllPatterns", who)

    local owner
    for k,owner in pairs(PatternOwners) do
      if owner == who then
        UnregisterPattern(k)
      end
    end
  end
end

function GetPattern(idx)
  return PatternRegistry[idx]
end

function UnregisterPattern(idx)
  tremove(PatternRegistry, idx)
end

do
  local tokennum = 1

  MatchTable = setmetatable({}, {
    __index = function(self, key)
      if type(rawget(self, key)) ~= "table" then
        rawset(self, key, {})
      end
      return rawget(self, key)
    end
  })


  function RegisterMatch(self, text, ptype)
    tokennum = tokennum + 1

    local token = "@##" .. tokennum .. "##@"

    debug("RegisterMatch", text, token)

    local mt = MatchTable[ptype or "FRAME"]
    mt[token] = text

    --   return text
    return token
  end

  local sortedRegistry = {}
  function MatchPatterns(text, ptype)
    ptype = ptype or "FRAME"

    tokennum = 0

    for i,v in ipairs(PatternRegistry) do
      sortedRegistry[i] = v
    end

    table.sort(sortedRegistry, function(a, b)
      local ap = a.priority or 50
      local bp = b.priority or 50

      return ap > bp
    end)


    debug("MatchPatterns -->", text, tokennum)
    -- Match and remove strings
    for _,v in ipairs(sortedRegistry) do
      if text and ptype == (v.type or "FRAME") then

        if type(v.pattern) == "string" and (v.pattern):len() > 0 then
          debug("MatchPatterns :", v.pattern)

          if v.deformat then
            text = v.matchfunc(text)
          else
            if v.matchfunc ~= nil then
              text = text:gsub(v.pattern, v.matchfunc)
            else
              debug("ERROR", v.pattern)
            end
          end
        end
      end
    end

    wipe(sortedRegistry)

    debug("MatchPatterns <--", text, tokennum)

    return text
  end

  function ReplaceMatches(text, ptype)
  --if true then return text end


  -- Substitute them (or something else) back in
    local mt = MatchTable[ptype or "FRAME"]


    debug("ReplaceMatches -->", text)

    local k
    for t=tokennum,1,-1 do
      k = "@##" .. tostring(t) .. "##@"

      if (mt[k]) then
        text = text:gsub(k, mt[k])
      else
        debug("ERROR", k)
      end
      mt[k] = nil
    end

    --	    for k,v in pairs(mt) do
    --	        text = text:gsub(k, v)
    --	        mt[k] = nil
    --	    end

    debug("ReplaceMatches <--", text)

    return text
  end
end







