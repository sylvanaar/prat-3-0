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

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

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
    module_info = "|cffff8888THIS MODULE IS EXPERIMENTAL|r \n\n This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters",
    autoload_name =  "Load Settings Automaticallys",
    autoload_desc = "Automatically load the saved settings when you log in",
    load_name = "Load Settings",
    load_desc = "Load tthe chat frame/tabs from the last save",
    save_name = "Save Settings",
    save_desc = "Save the currect chat frame/tab configuration",
    msg_nosettings = "No stored settings",
    msg_settingsloaded = "Settings Loaded",
    command_header_name = "Commands",
    options_header_name = "Options"
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
      command_header = {
        name = PL.command_header_name,
        type = "header",
        order = 190,
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
      options_header = {
        name = PL.options_header_name,
        type = "header",
        order = 195,
      },
      autoload = {
        name = PL.autoload_name,
        desc = PL.autoload_desc,
        type = "toggle",
        order = 200,
      }
    }
  })

  Prat:SetModuleInit(module.name,
    function(self)
      self:RegisterEvent("PLAYER_ENTERING_WORLD")
    end)

  function module:PLAYER_ENTERING_WORLD()
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    self.ready = true
    if self.needsLoading then
      self:ScheduleTimer("LoadSettings", 0)
    end
  end

  function module:OnModuleEnable()
    self.db.RegisterCallback(self, "OnProfileShutdown")

    if not self.working and self.db.profile.autoload and next(self.db.profile.frames) then
      if not self.ready then
        self.needsLoading = true
      else
        self:ScheduleTimer("LoadSettings", 0)
      end
    end

    Prat.RegisterChatEvent(self, Prat.Events.PRE_ADDMESSAGE)
  end

  function module:OnProfileShutdown()
    -- Some blizzard tables were connected to the profile, but now we need to give the profile its own copy
    if self.db.profile.types == getmetatable(ChatTypeInfo).__index then
      self.db.profile.types = CopyTable(self.db.profile.types)
    end
  end

  function module:SaveSettings()
    local db = self.db.profile

    for i = 1,NUM_CHAT_WINDOWS do
      self:SaveSettingsForFrame(i)
    end

    db.types = getmetatable(ChatTypeInfo).__index
    db.channels = { GetChannelList() }

    self:Output("Settings Saved")
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
    local success = true

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
    for i=1,#db.channels,2 do
      local chan = ChatFrame_AddChannel(f, db.channels[i])
      if not chan or (Prat.IsClassic and chan == 0) then
        dbg("failed to load", db.channels[i], chan)
        success = false
      end
    end

    ChatFrame_ReceiveAllPrivateMessages(f)

    return success
  end

  function module:LeaveChannels(...)
    for i=1, select("#", ...), 3 do
      local num = select(i, ...);
      LeaveChannelByName(num)
    end
  end

  function module:LeavePlaceholderChannels(...)
    for i=1, select("#", ...), 3 do
      local num, name = select(i, ...);
      if name:match("^LeaveMe") then
        dbg("leave", num, name)
        LeaveChannelByName(num)
      end
    end

    self:ScheduleTimer(function() module:CheckChannels(GetChannelList()) end, 3)
  end

    function module:CheckChannels(...)
      local corrent = true
      if  select("#", ...) ~= select("#", unpack(self.db.profile.channels)) then
        corrent = false
      else
        for i=1, select("#", ...), 3 do
          local snum, sname = select(i, ...);
          local num, name = self.db.profile.channels[i],self.db.profile.channels[i+1];
          if snum ~= num or sname ~= name then
            corrent = false
          end
        end
      end

      dbg("channels corrent", corrent)
      if corrent then
        self:ScheduleTimer("LoadSettings", 2)
      else
        self:LeaveChannels(GetChannelList())
        self:ScheduleTimer(function() module:RestoreChannels(unpack(self.db.profile.channels)) end, 3)
      end
  end

  if Prat.IsClassic then
    function module:RestoreChannels(...)
      local index = 1
      for i=1, select("#", ...), 3 do
        local num, name = select(i, ...);
        while index < num do
          JoinTemporaryChannel("LeaveMe"..index)
          index = index + 1
        end

        JoinChannelByName(name)
        index = index + 1
      end

      self:ScheduleTimer(function() module:LeavePlaceholderChannels(GetChannelList()) end, 3)
    end
  else
    function module:RestoreChannels(...)
      local index = 1
      for i=1, select("#", ...), 3 do
        local num, name = select(i, ...);
        dbg("restore", name, num)
        while index < num do
          JoinTemporaryChannel("LeaveMe"..index)
        dbg("join", "LeaveMe"..index)
          index = index + 1
        end
        local clubId, streamId = ChatFrame_GetCommunityAndStreamFromChannel(name);
        if not clubId or not streamId then
          dbg("join", name)

          JoinChannelByName(name)
        else
          C_Club.AddClubStreamChatChannel(clubId, streamId)
        end
        index = index + 1
      end
      self:ScheduleTimer(function() module:LeavePlaceholderChannels(GetChannelList()) end, 3)
    end
  end
  function module:LoadSettings()
    local db = self.db.profile
    local success = true

    if not next(db.frames) then
      self:Output(PL.msg_nosettings)
      self.needsLoading = nil
      return
    end

    if not self.working and db.channels and #db.channels > 0 then
      self.working = true
      if GetChannelList() then
        self:LeaveChannels(GetChannelList())
      end
      self:ScheduleTimer(function() self:RestoreChannels(unpack(db.channels)) end, 3)
      return
    end

    for k,v in pairs(db.frames) do
      if not self:LoadSettingsForFrame(k) then
        success = false
      end
    end

    for k,v in pairs(db.types) do
      ChangeChatColor(k, v.r, v.g, v.b)
    end

    if success then
      self.needsLoading = nil
      self.working = nil
      self:Output(PL.msg_settingsloaded)
    else
      self.needsLoading = type(self.needsLoading) == "boolean" and 1 or self.needsLoading
      self.needsLoading = self.needsLoading and self.needsLoading + 1 or 1

      if self.needsLoading > 10 then
        self.working = nil
        self:Output("Could not load settings")
        return
      end
      self:ScheduleTimer("LoadSettings", 2)
    end
  end

  function module:Prat_PreAddMessage(arg, message, frame, event, t, r, g, b)
    if false and ("YOU_CHANGED" == message.NOTICE or "YOU_LEFT" == message.NOTICE) then
      message.DONOTPROCESS = true
    end
  end

end)

