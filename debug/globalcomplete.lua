---------------------------------------------------------------------------------
--
-- GlobalComplete - A debug tool for World of Warcraft
--
-- Copyright (C) 2006-2018 Jon S Akhtar (Sylvanaar)
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
--
-------------------------------------------------------------------------------
local name, _M = ...

local pairs, ipairs, _G, table, LibStub, wipe, type, loadstring =
pairs, ipairs, _G, table, LibStub, wipe, type, loadstring

local setfenv, tostring, getmetatable, error =
setfenv, tostring, getmetatable, error

if not LibStub then
  error("globalcomplete requires LibStub")
  return
end

local AceTab = LibStub("AceTab-3.0")
if not AceTab then
  error("globalcomplete requires AceTab")
  return
end

function _M:EnableGlobalCompletions(overrideName, maxResults, prematches)
  self.tabcompleteName = overrideName or (name .. "-debug-globals")

  self.maxResults = maxResults or 25
  self.globalKeys = {}
  self.preMatches = prematches or { "/print%s+", "/dump%s+", "/script%s+", "/run%s+" }

  self:ReloadGlobals()

  self:GlobalTabComplete()

--  self:FieldTabComplete()
end

function _M:GlobalTabComplete()
  if not AceTab:IsTabCompletionRegistered(self.tabcompleteName) then
    AceTab:RegisterTabCompletion(self.tabcompleteName, self.preMatches,
      function(t, text, pos)
        if (text:trim():len() < 1) then return nil end

        if (text:find("%.")) then
          self:GetPrefilteredFieldCompletions(t, text, pos)
        else
          return self:GetPrefilteredCompletions(t, text, pos)
        end
      end,
      function(...) return self:GetResultCompletions(...) end,
      nil, -- listenframes
      nil, -- postfunc
      nil) -- pmoverwrite
  end
end


function _M:FieldTabComplete()
  if not AceTab:IsTabCompletionRegistered(self.tabcompleteName .. "-fields") then
    AceTab:RegisterTabCompletion(self.tabcompleteName .. "-fields", "%S+%.",
      function(t, text, pos, textToCursor)
        self:GetPrefilteredFieldCompletions(t, text, pos)
      end,
      function(...) return self:GetResultCompletions(...) end,
      nil, -- listenframes
      nil, -- postfunc
      nil) -- pmoverwrite
  end
end


function _M:GetResultCompletions(u, cands, gcss, prematch)
  local candcount = 0
  for k, v in pairs(cands) do
    candcount = candcount + 1
  end
  if candcount <= self.maxResults then
    local t = {}
    for key, cand in pairs(cands) do
      t[#t + 1] = key
    end
    table.sort(t)
    for i, v in ipairs(t) do
      local common = "|cffffffff" .. v:sub(1, gcss:len()) .. "|r"
      DEFAULT_CHAT_FRAME:AddMessage("   " .. common .. v:sub(gcss:len() + 1), 0.1, 0.8, 0.1)
    end
    return
  else
    return "   " .. ("Too many matches (%d possible)"):format(candcount)
  end

  return "error in usage function"
end

function _M:GetPrefilteredCompletions(t, text, pos)
  for i, v in ipairs(self.globalKeys) do
    t[#t + 1] = v
  end
end

function _M:GetPrefilteredFieldCompletions(t, text, pos)
  local globalPrematches = self.prematches
  if type(globalPrematches) == "string" then
    if tostring(text):lower():find(globalPrematches:lower(), 1, true) ~= 1 then return end
  elseif type(globalPrematches) == "table" then
    local result = false
    for i, v in ipairs(globalPrematches) do
      if text:lower():find(tostring(v):lower(), 1, true) == 1 then
        result = true
      end
      if not result then return end
    end
  end

  local lastDot = 0
  for m in text:gmatch("()[:.]") do lastDot = m end
  local s = text:find("%s")
  if lastDot == 0 then return end
  if not s then return end
  local m, dot, fs = text:sub(s + 1, lastDot - 1), text:sub(lastDot, lastDot), text:sub(lastDot + 1, -1)
  fs = fs or ""
  if type(m) == "string" then
    local tmp = setfenv(loadstring("return " .. m), _G)()
    if type(tmp) == "table" then
      if dot == ":" then
        tmp = getmetatable(tmp) and getmetatable(tmp).__index or tmp
      end
      for k in pairs(tmp) do
        local candidate = m .. dot .. k
        if dot == ":" then
          if type(setfenv(loadstring("return " .. candidate:gsub(":", ".")), _G)()) ~= "function" then
            candidate = nil
          else
            candidate = candidate .. "()"
          end
        end
        if fs:len() > 0 then
          if tostring(k):lower():find(fs:lower(), 1, true) == 1 then
            t[#t + 1] = candidate
          end
        else
          t[#t + 1] = candidate
        end
      end
      return t
    end
  end
end

function _M:ReloadGlobals()
  wipe(self.globalKeys)
  for k in pairs(_G) do self.globalKeys[#self.globalKeys + 1] = k
  end
end
