---------------------------------------------------------------------------------
--
-- GlobalComplete - A debug tool for World of Warcraft
--
-- Copyright (C) 2006-2011 Jon S Akhtar (Sylvanaar)
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-------------------------------------------------------------------------------
local name, _M = ...
local tabcompleteName
local pairs, ipairs, _G, table, LibStub, wipe, type, loadstring =
      pairs, ipairs, _G, table, LibStub, wipe, type, loadstring

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
  tabcompleteName = overrideName or (name .. "-debug-globals")

  self.maxResults = maxResults or 25
  self.globalKeys = {}
  self.preMatches = prematches or { "/print ", "/dump " }

  self:ReloadGlobals()

  self:GlobalTabComplete()

  self:FieldTabComplete()
end

function _M:GlobalTabComplete()
  if not AceTab:IsTabCompletionRegistered(tabcompleteName) then
    AceTab:RegisterTabCompletion(tabcompleteName, self.preMatches,
      function(t, text, pos)
        if (text:trim():len() < 1) then return nil end
        return self:GetPrefilteredCompletions(t, text, pos)
      end,
      function(u, cands, ...) -- usagefunc
        self:GetResultCompletions(u, cands, ...)
      end,
      nil, -- listenframes
      nil, -- postfunc
      nil) -- pmoverwrite
  end
end

function _M:FieldTabComplete()
  if not AceTab:IsTabCompletionRegistered(tabcompleteName .. "-fields") then
    AceTab:RegisterTabCompletion(tabcompleteName .. "-fields", " .+",
      function(t, text, pos)
        local lastDot = 0
        for m in text:gmatch("()%.") do lastDot = m end
        local s = text:find("%s")
        local m, fs = text:sub(s + 1, lastDot - 1), text:sub(lastDot + 1, -1)
        fs = fs or ""
        if type(m) == "string" then
          local tmp = loadstring("return " .. m)()
          if type(tmp) == "table" then
            for k in pairs(tmp) do
              if fs:len() > 0 then
                if k:lower():find(fs, 1, true) == 1 then
                  t[#t + 1] = m .. "." .. k
                end
              else
                t[#t + 1] = m .. "." .. k
              end
            end
            return t
          end
        end
      end,
      nil, -- usagefunc
      nil, -- listenframes
      nil, -- postfunc
      nil) -- pmoverwrite
  end
end


function _M:GetResultCompletions(u, cands, ...)
  local candcount = 0
  for k, v in pairs(cands) do candcount = candcount + 1
  end
  if candcount <= self.maxResults then
    local text
    for key, cand in pairs(cands) do
      text = text and (text .. ", " .. cand) or cand
    end
    return "   " .. text
  else
    return "   " .. ("Too many matches (%d possible)"):format(candcount)
  end
end

function _M:GetPrefilteredCompletions(t, text, pos)
  for i, v in ipairs(self.globalKeys) do
    t[#t + 1] = v
  end
end

function _M:ReloadGlobals()
  wipe(self.globalKeys)
  for k in pairs(_G) do self.globalKeys[#self.globalKeys + 1] = k
  end
  table.sort(self.globalKeys)
end
