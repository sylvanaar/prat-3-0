﻿---------------------------------------------------------------------------------
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

  local PRAT_MODULE = Prat:RequestModuleName("EventNames")

  if PRAT_MODULE == nil then
    return
  end

  local L = Prat:GetLocalizer({})

  --@debug@
  L:AddLocale("enUS", {
    ["EventNames"] = true,
    ["Chat window event name options."] = true,
    ["Show"] = true,
    ["Show events on chatframes"] = true,
    ["show_name"] = "Show Event Names",
    ["show_desc"] = "Toggle showing event names in each window.",
    ["allevents_name"] = "Process all events",
    ["allevents_desc"] = "Enable Prat processing for all chat events.",
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@
--@localization(locale="enUS", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("enUS",T)
--@localization(locale="frFR", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("frFR",T)
--@localization(locale="deDE", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("deDE",T)
--@localization(locale="koKR", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("koKR",T)
--@localization(locale="esMX", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("esMX",T)
--@localization(locale="ruRU", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("ruRU",T)
--@localization(locale="zhCN", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("zhCN",T)
--@localization(locale="esES", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("esES",T)
--@localization(locale="zhTW", format="lua_table", field-table-name="T", same-key-is-true=true, namespace="EventNames")@

  L:AddLocale("zhTW",T)
  --@end-non-debug@]===]

  local mod = Prat:NewModule(PRAT_MODULE)

  Prat:SetModuleDefaults(mod.name, {
    profile = {
      on = true,
      show = {},
      allevents = false,
    }
  })

  Prat:SetModuleOptions(mod.name, {
    name = L["EventNames"],
    desc = L["Chat window event name options."],
    type = "group",
    args = {
      show = {
        name = L["show_name"],
        desc = L["show_desc"],
        type = "multiselect",
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      },
      allevents = {
        name = function(info) return L[info[#info].."_name"] end,
        desc = function(info) return L[info[#info].."_desc"] end,
        type = "toggle"
      }
    }
  })

  function mod:OnModuleEnable()
    Prat.RegisterChatEvent(self, "Prat_PreAddMessage", "Prat_PreAddMessage")
    self:SetAllEvents(self.db.profile.allevents)
  end

  function mod:OnModuleDisable()
    self:SetAllEvents(false)
    Prat.UnregisterAllChatEvents(self)
  end

  --[[------------------------------------------------
    Core Functions
  ------------------------------------------------]] --
  function mod:OnValueChanged(...)
    self:SetAllEvents(self.db.profile.allevents)
  end

  local function allEventsEnabled() return true end

  function mod:SetAllEvents(allevents)
    if not allevents then
      Prat.EventIsProcessed = self.origEventIsProcessed or Prat.EventIsProcessed
      self.origEventIsProcessed = nil
    elseif not self.origEventIsProcessed and allevents then
      self.origEventIsProcessed = Prat.EventIsProcessed
      Prat.EventIsProcessed = allEventsEnabled
    end
  end

  do
    local CLR = Prat.CLR
    local function EventBrackets(text) return CLR:Colorize("ffffff", text) end

    local function EventName(text, c) return CLR:Colorize(c, text) end

    local desat = 192 * 0.7 + 63
    local c
    function mod:Prat_PreAddMessage(arg, message, frame, event, t, r, g, b)
      if self.db.profile.show[frame:GetName()] then
        c = ("%02x%02x%02x"):format((r or 1.0) * desat, (g or 1.0) * desat, (b or 1.0) * desat)
        message.POST = "  " .. EventBrackets("(") .. EventName(tostring(event), c) .. EventBrackets(")")
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad