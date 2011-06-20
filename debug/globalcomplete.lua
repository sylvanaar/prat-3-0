local name, _M = ...
local tabcompleteName
local pairs, ipairs, _G, table, LibStub, wipe = pairs, ipairs, _G, table, LibStub, wipe

if not LibStub then
  error("globalcomplete requires LibStub")
  return
end

local AceTab = LibStub("AceTab-3.0")
if not AceTab then
  error("globalcomplete requires AceTab")
  return
end



function _M:EnableGlobalCompletions(overrideName, maxResults)
  tabcompleteName = overrideName or (name .. "-debug-globals")

  self.maxResults = maxResults or 25
  self.globalKeys = {}
  self.preMatches = { "/print ", "/dump " }

  self:ReloadGlobals()

  self:GlobalTabComplete()
end

function _M:GlobalTabComplete(enabled)
  if not AceTab:IsTabCompletionRegistered(tabcompleteName) then
    local foundCache = {}
    AceTab:RegisterTabCompletion(tabcompleteName, self.preMatches,
      function(t, text, pos)
        if (text:trim():len() < 1) then return nil end
        return self:GetPrefilteredCompletions(t, text, pos)
      end,
      function(u, cands, ...)
        self:GetResultCompletions(u, cands, ...)
      end,
      nil,
      nil,
      nil)
  end
end

function _M:GetResultCompletions(u, cands, ...)
  local candcount = 0
  for k, v in pairs(cands) do candcount = candcount + 1 end
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
  for k in pairs(_G) do self.globalKeys[#self.globalKeys + 1] = k end
  table.sort(self.globalKeys)
end
