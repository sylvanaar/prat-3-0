---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2020  Prat Development Team
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
  local function dbg(...) end

  --@debug@
  function dbg(...) Prat:PrintLiteral(...) end

  --@end-debug@

  local PRAT_MODULE = Prat:RequestModuleName("Memory")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0")

  -- define localized strings
  local PL = module.PL


  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
      frames = { ["*"] = {} },
      types = {}
    }
  })

  --@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "Memory",
    ["module_desc"] = "Support saveing the Blizzard chat settings to your profile so they can be synced accross all your charactaers",
    module_info = "THIS MODULE IS EXPERIMENTAL= It allows you to sync your chat settings across all your accounts",
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@
do
    local L


--@localization(locale="enUS", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "enUS", L)



--@localization(locale="itIT", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "itIT", L)



--@localization(locale="ptBR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "ptBR", L)



--@localization(locale="frFR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "frFR", L)



--@localization(locale="deDE", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "deDE", L)



--@localization(locale="koKR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "koKR",  L)


--@localization(locale="esMX", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "esMX",  L)


--@localization(locale="ruRU", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "ruRU",  L)


--@localization(locale="zhCN", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "zhCN",  L)


--@localization(locale="esES", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "esES",  L)


--@localization(locale="zhTW", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Memory")@
PL:AddLocale(PRAT_MODULE, "zhTW",  L)
end
--@end-non-debug@]===]

  local toggleOption = {
    name = function(info) return info.handler.PL[info[#info] .. "_name"] end,
    desc = function(info) return info.handler.PL[info[#info] .. "_desc"] end,
    type = "toggle",
  }

  Prat:SetModuleOptions(module.name, {
    name = PL.module_name,
    desc = PL.module_desc,
    type = "group",
    args = {
      info = {
        name = PL.module_info,
        type = "description",
      }
    }
  })

  function module:OnModuleEnable()
    self:RegisterEvent("UPDATE_CHAT_COLOR")
  end

  function module:SaveSettings()
    local db = self.db.profile

    for k,v in pairs(Prat.Frames) do
      if not v.isTemporary then
        self:SaveSettingsForFrame(v)
      end
    end

    db.types = getmetatable(ChatTypeInfo).__index
  end


  function module:SaveSettingsForFrame(frame)
    local db = self.db.profile.frames[frame:GetID()]

    local name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable = GetChatWindowInfo(frame:GetID())
    db.name, db.fontSize, db.r, db.g, db.b, db.alpha, db.shown, db.locked, db.docked, db.uninteractable =
      name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable

    db.messages = { GetChatWindowMessages(frame:GetID())}
    db.channels = { GetChatWindowChannels(frame:GetID())}
  end

  function module:LoadSettingsForFrame(frameId)
    local db = self.db.profile.frames[frameId]
    local f = _G["ChatFrame" .. frameId]

    FCF_SetWindowName(f, db.name)
    SetChatWindowSize(frameId, db.fontSize)
    FCF_SetWindowColor(f, db.r, db.g, db.b)
    FCF_SetWindowAlpha(f, db.alpha)

    FCF_SetExpandedUninteractable(f, db.uninteractable)

    ChatFrame_RegisterForMessages(f, unpack(db.messages));
    ChatFrame_RegisterForChannels(f, unpack(db.channels));

    if (db.docked) then
      FCF_DockFrame(f, db.docked)
    else
      FCF_UnDockFrame(f)
      FCF_SetLocked(f, db.locked)
    end

    if (db.shown) then f:Show() else f:Hide() end
  end

  function module:SaveChatTypes()
    for k,v in pairs(self.db.profile.types) do
      ChatTypeInfo[k] = v
    end
  end

  function module:LoadSettings()
    local db = self.db.profile

    for k,v in pairs(db.frames) do
      self:LoadSettingsForFrame(k)
    end

    for k,v in pairs(ChatTypeInfo) do
      ChangeChatColor(k, v.r, v.g, v.b)
    end
  end
end)
