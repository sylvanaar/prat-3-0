Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("Experimental")

  if PRAT_MODULE == nil then
    return
  end

  PE = Prat:NewModule(PRAT_MODULE)


  function PE:OnModuleEnable()
    self.globalKeys = {}
    self.preMatches = { "/print ", "/dump " }
    for k in pairs(_G) do self.globalKeys[#self.globalKeys + 1] = k end
    table.sort(self.globalKeys)

    self:TabComplete(true)
  end

  function PE:TabComplete(enabled)
    local AceTab = LibStub("AceTab-3.0")

    if enabled then
      if not AceTab:IsTabCompletionRegistered("prat-debug-globals") then
        local foundCache = {}
        AceTab:RegisterTabCompletion("prat-debug-globals", self.preMatches,
          function(t, text, pos)
            if (text:trim():len()<1) then return nil end
            return self:GetPrefilteredCompletions(t, text, pos)
          end,
          function(u, cands, ...)
            local candcount = 0
            for k,v in pairs(cands) do candcount = candcount+1 end
            if candcount <= 50 then
              local text
              for key, cand in pairs(cands) do
                text = text and (text .. ", " .. cand) or cand
              end
              return "   " .. text
            else
              return "   " .. ("Too many matches (%d possible)"):format(candcount)
            end
          end,
          nil,
          nil,
          nil)
      end
    else
      print("NOT IMPLEMENTED")
    end
  end

  function PE:GetPrefilteredCompletions(t, text, pos)
    for i, v in ipairs(self.globalKeys) do
        t[#t+1] = v
    end
  end

  function PE:OnModuleDisable()
  end

  return
end) -- Prat:AddModuleToLoad