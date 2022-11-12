---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2022 Prat Development Team
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

local AceGUI = LibStub("AceGUI-3.0")
local addonName, addonTable = ...

Prat:AddModuleToLoad(function()


  local PRAT_MODULE = Prat:RequestModuleName("DebugModules")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceTimer-3.0")

  local PL = module.PL

  --@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["DebugModules"] = true,
    ["Prat Debug Information"] = true,
    ["Copy this text and include it in the issue when requested."] = true,
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@
do
    local L


--@localization(locale="enUS", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "enUS", L)



--@localization(locale="itIT", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "itIT", L)



--@localization(locale="ptBR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "ptBR", L)


--@localization(locale="frFR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "frFR",L)




--@localization(locale="deDE", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "deDE", L)


--@localization(locale="koKR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "koKR",L)

--@localization(locale="esMX", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "esMX",L)

--@localization(locale="ruRU", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "ruRU",L)

--@localization(locale="zhCN", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "zhCN",L)

--@localization(locale="esES", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "esES",L)

--@localization(locale="zhTW", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="DebugModules")@
PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@]===]


  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
    }
  })

  Prat:SetModuleInit(module.name,
    function(module)
      module.frame = AceGUI:Create("Window")
      module.frame:SetTitle(PL["Prat Debug Information"])
      module.frame:SetStatusText(PL["Copy this text and include it in the issue when requested."])
      module.frame:SetPoint("CENTER")
      module.frame:SetLayout("Fill")
      module.frame.editBox = AceGUI:Create("MultiLineEditBox")
      module.frame.editBox:DisableButton(true)
      module.frame.editBox:SetLabel(PL["Copy this text and include it in the issue when requested."])
      module.frame.editBox:SetPoint("CENTER")
      module.frame:AddChild(module.frame.editBox)
      module.frame:DoLayout()
      module.frame:Hide()
    end)

  function module:OnModuleEnable()
  end

  function module:GetDescription()
    return PL["Copy text from the active chat window."]
  end

  function module:GetSortedModules()
    local allModules = {}
    for k, v in pairs(addonTable.Modules) do
      table.insert(allModules, {name = k, state = v})
    end
    table.sort(allModules, function(a, b)
      if a.state == b.state then
        return a.name < b.name
      else
        return a.state < b.state
      end
    end)
    return allModules
  end

  function module:ShowCopyDialog()

    local text = ""
    local prevState = nil

    local allModules = self:GetSortedModules()
    for _, row in ipairs(allModules) do
      if row.state ~= prevState then
        prevState = row.state
        text = text .. "--- " .. row.state .. "---\n"
      end
      text = text .. row.name .. "\n"
    end

    self.frame.editBox:SetText(text)
    self.frame:Show()
  end

  function module:OnModuleDisable()
    module.frame:Hide()
  end

  return
end) -- Prat:AddModuleToLoad
