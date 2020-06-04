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
      on = true,
      frames = { ["*"] = {} },
      types = {},
      autoload = false
    }
  })

  --@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "Memory",
    ["module_desc"] = "Support saveing the Blizzard chat settings to your profile so they can be synced accross all your charactaers",
    module_info = "THIS MODULE IS EXPERIMENTAL= It allows you to sync your chat settings across your account",
    autoload_name =  "Load Settings Automaticallys",
    autoload_desc = "Automatically load the saved settings when you log in",
    load_name = "Load Settings",
    load_desc = "Load tthe chat frame/tabs from the last save",
    save_name = "Save Settings",
    save_desc = "Save the currect chat frame/tab configuration",
    msg_nosettings = "No stored settings",
    msg_settingsloaded = "Settings Loaded",
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
      },
      save = {
        name = PL.save_name,
        desc = PL.save_desc,
        type = "execute",
        order = 191,
        func = "SaveSettings"
      },
      load = {
        name = PL.load_name,
        desc = PL.load_desc,
        type = "execute",
        order = 190,
        func = "LoadSettings"
      },
      autoload = {
        name = PL.autoload_name,
        desc = PL.autoload_desc,
        type = "toggle",
        order = 192,
      }
    }
  })

  function module:OnModuleEnable()
    self.db.RegisterCallback(self, "OnProfileShutdown")

    if self.db.profile.autoload and next(self.db.profile.frames) then
      self:LoadSettings()
    end
  end

  function module:OnProfileShutdown()
    -- Some blizzard tables were connected to the profile, but now we need to give the profile its own copy
    if self.db.profile.types == getmetatable(ChatTypeInfo).__index then
      self.db.profile.types = CopyTable(self.db.profile.types)
    end
  end


  local function out(text)
    DEFAULT_CHAT_FRAME:AddMessage(text)
  end

  function module:SaveSettings()
    local db = self.db.profile

    for i = 1,NUM_CHAT_WINDOWS do
        self:SaveSettingsForFrame(i)
    end

    db.types = getmetatable(ChatTypeInfo).__index

    out("Settings Saved")
  end

  function module:SaveSettingsForFrame(frameId)
    local db = self.db.profile.frames[frameId]

    local name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable = GetChatWindowInfo(frameId)
    db.name, db.fontSize, db.r, db.g, db.b, db.alpha, db.shown, db.locked, db.docked, db.uninteractable =
      name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable

    db.messages = { GetChatWindowMessages(frameId) }
    db.channels = { GetChatWindowChannels(frameId) }

    local width, height = GetChatWindowSavedDimensions(frameId);
    local point, xOffset, yOffset = GetChatWindowSavedPosition(frameId)

    db.point, db.xOffset, db.yOffset, db.width, db.height =
      point, xOffset, yOffset, width, height
  end

  function module:LoadSettingsForFrame(frameId)
    local db = self.db.profile.frames[frameId]

    -- Restore FloatingChatFrame
    SetChatWindowName(frameId, db.name)
    SetChatWindowSize(frameId, db.fontSize)
    SetChatWindowColor(frameId, db.r, db.g, db.b)
    SetChatWindowAlpha(frameId, db.alpha)
    SetChatWindowDocked(frameId, db.docked)
    SetChatWindowLocked(frameId, db.locked)
    SetChatWindowUninteractable(frameId, db.uninteractable)
    SetChatWindowSavedDimensions(frameId, db.width, db.height)
    if db.point then
      SetChatWindowSavedPosition(frameId, db.point, db.xOffset, db.yOffset)
    end
    SetChatWindowShown(frameId, db.shown)
    FloatingChatFrame_Update(frameId, 1)

    -- Restore ChatFrame
    local f = Chat_GetChatFrame(frameId)
    ChatFrame_RemoveAllMessageGroups(f)
    for _, v in ipairs(db.messages) do
      ChatFrame_AddMessageGroup(f, v);
    end

    ChatFrame_RemoveAllChannels(f)
    for _, v in ipairs(db.channels) do
      ChatFrame_AddChannel(f, v)
    end

    ChatFrame_ReceiveAllPrivateMessages(f)
  end

  function module:LoadSettings()
    local db = self.db.profile

    if not next(db.frames) then
      out(PL.msg_nosettings)
    end

    for k,v in pairs(db.frames) do
      self:LoadSettingsForFrame(k)
    end

    for k,v in pairs(db.types) do
      ChangeChatColor(k, v.r, v.g, v.b)
    end

    out(PL.msg_settingsloaded)
  end
end)

