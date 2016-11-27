---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2011  Prat Development Team
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
Prat:AddModuleToLoad(function()

  local Prat = Prat

  local PRAT_MODULE = Prat:RequestModuleName("Fading")

  if PRAT_MODULE == nil then
    return
  end

  local PL = Prat:GetLocalizer({})

  --@debug@
  PL:AddLocale("enUS", {
    ["module_name"] = "Fading",
    ["module_desc"] = "Chat window text fading options.",
    ["textfade_name"] = "Enable Fading",
    ["textfade_desc"] = "Toggle enabling text fading for each chat window.",
    ["duration_name"] = "Set Fading Delay (Seconds)",
    ["duration_desc"] = "Set the number of seconds to wait before before fading text of chat windows.",
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@

--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("enUS",L)


--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("frFR",L)


--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("deDE",L)


--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("koKR",L)


--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("esMX",L)


--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("ruRU",L)


--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("zhCN",L)


--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("esES",L)


--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Fading")@

  PL:AddLocale("zhTW",L)

  --@end-non-debug@]===]


  local mod = Prat:NewModule(PRAT_MODULE)

  -- define the default db values
  Prat:SetModuleDefaults(mod.name, {
    profile = {
      on = true,
      textfade = { ["*"] = true },
      duration = 120
    }
  })

  Prat:SetModuleOptions(mod.name, {
    name = PL["module_name"],
    desc = PL["module_desc"],
    type = "group",
    args = {
      textfade = {
        name = PL["textfade_name"],
        desc = PL["textfade_desc"],
        type = "multiselect",
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      },
      duration = {
        name = PL["duration_name"],
        desc = PL["duration_desc"],
        type = "range",
        order = 190,
        min = 1,
        max = 240,
        step = 1,
      },
    }
  })


  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  -- things to do when the module is enabled
  function mod:OnModuleEnable()
    self:OnValueChanged()
  end

  -- things to do when the module is disabled
  function mod:OnModuleDisable()
    for k, v in pairs(Prat.HookedFrames) do
      self:Fade(v, true)
    end
  end

  function mod:OnValueChanged(...)
    for k, v in pairs(Prat.HookedFrames) do
      self:Fade(v, self.db.profile.textfade[k])
    end
  end

  mod.OnSubValueChanged = mod.OnValueChanged


  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  -- enable/disable fading
  function mod:Fade(cf, textfade)
    if textfade then
      cf:SetFading(true)
      cf:SetTimeVisible(mod.db.profile.duration)
    else
      cf:SetFading(false)
    end
  end


  return
end) -- Prat:AddModuleToLoad