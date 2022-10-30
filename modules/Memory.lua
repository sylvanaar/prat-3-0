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

  --[==[@debug@
--  function dbg(...) Prat:PrintLiteral(...) end

  --@end-debug@]==]

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
      cvars = {},
      autoload = false
    }
  })

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "Memory",
    ["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
    module_info = "|cffff8888THIS MODULE IS EXPERIMENTAL|r \n\n This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters",
    autoload_name = "Load Settings Automatically",
    autoload_desc = "Automatically load the saved settings when you log in",
    load_name = "Load Settings",
    load_desc = "Load the chat frame/tabs from the last save",
    save_name = "Save Settings",
    save_desc = "Save the current chat frame/tab configuration",
    msg_nosettings = "No stored settings",
    msg_settingsloaded = "Settings Loaded",
    command_header_name = "Commands",
    options_header_name = "Options",
    msg_loadfailed = "Could not fully restore the chat settings"
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Memory"] = {
		["autoload_desc"] = "Automatically load the saved settings when you log in",
		["autoload_name"] = "Load Settings Automatically",
		["command_header_name"] = "Commands",
		["load_desc"] = "Load the chat frame/tabs from the last save",
		["load_name"] = "Load Settings",
		["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
		["module_info"] = [=[|cffff8888THIS MODULE IS EXPERIMENTAL|r 

 This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters]=],
		["module_name"] = "Memory",
		["msg_loadfailed"] = "Could not fully restore the chat settings",
		["msg_nosettings"] = "No stored settings",
		["msg_settingsloaded"] = "Settings Loaded",
		["options_header_name"] = "Options",
		["save_desc"] = "Save the current chat frame/tab configuration",
		["save_name"] = "Save Settings",
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["Memory"] = {
		--[[Translation missing --]]
		["autoload_desc"] = "Automatically load the saved settings when you log in",
		--[[Translation missing --]]
		["autoload_name"] = "Load Settings Automatically",
		--[[Translation missing --]]
		["command_header_name"] = "Commands",
		--[[Translation missing --]]
		["load_desc"] = "Load the chat frame/tabs from the last save",
		--[[Translation missing --]]
		["load_name"] = "Load Settings",
		--[[Translation missing --]]
		["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
		--[[Translation missing --]]
		["module_info"] = [=[|cffff8888THIS MODULE IS EXPERIMENTAL|r 

 This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters]=],
		--[[Translation missing --]]
		["module_name"] = "Memory",
		--[[Translation missing --]]
		["msg_loadfailed"] = "Could not fully restore the chat settings",
		--[[Translation missing --]]
		["msg_nosettings"] = "No stored settings",
		--[[Translation missing --]]
		["msg_settingsloaded"] = "Settings Loaded",
		--[[Translation missing --]]
		["options_header_name"] = "Options",
		--[[Translation missing --]]
		["save_desc"] = "Save the current chat frame/tab configuration",
		--[[Translation missing --]]
		["save_name"] = "Save Settings",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["Memory"] = {
		--[[Translation missing --]]
		["autoload_desc"] = "Automatically load the saved settings when you log in",
		--[[Translation missing --]]
		["autoload_name"] = "Load Settings Automatically",
		--[[Translation missing --]]
		["command_header_name"] = "Commands",
		--[[Translation missing --]]
		["load_desc"] = "Load the chat frame/tabs from the last save",
		--[[Translation missing --]]
		["load_name"] = "Load Settings",
		--[[Translation missing --]]
		["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
		--[[Translation missing --]]
		["module_info"] = [=[|cffff8888THIS MODULE IS EXPERIMENTAL|r 

 This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters]=],
		--[[Translation missing --]]
		["module_name"] = "Memory",
		--[[Translation missing --]]
		["msg_loadfailed"] = "Could not fully restore the chat settings",
		--[[Translation missing --]]
		["msg_nosettings"] = "No stored settings",
		--[[Translation missing --]]
		["msg_settingsloaded"] = "Settings Loaded",
		--[[Translation missing --]]
		["options_header_name"] = "Options",
		--[[Translation missing --]]
		["save_desc"] = "Save the current chat frame/tab configuration",
		--[[Translation missing --]]
		["save_name"] = "Save Settings",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)



L = {
	["Memory"] = {
		--[[Translation missing --]]
		["autoload_desc"] = "Automatically load the saved settings when you log in",
		--[[Translation missing --]]
		["autoload_name"] = "Load Settings Automatically",
		--[[Translation missing --]]
		["command_header_name"] = "Commands",
		--[[Translation missing --]]
		["load_desc"] = "Load the chat frame/tabs from the last save",
		--[[Translation missing --]]
		["load_name"] = "Load Settings",
		--[[Translation missing --]]
		["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
		--[[Translation missing --]]
		["module_info"] = [=[|cffff8888THIS MODULE IS EXPERIMENTAL|r 

 This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters]=],
		--[[Translation missing --]]
		["module_name"] = "Memory",
		--[[Translation missing --]]
		["msg_loadfailed"] = "Could not fully restore the chat settings",
		--[[Translation missing --]]
		["msg_nosettings"] = "No stored settings",
		--[[Translation missing --]]
		["msg_settingsloaded"] = "Settings Loaded",
		--[[Translation missing --]]
		["options_header_name"] = "Options",
		--[[Translation missing --]]
		["save_desc"] = "Save the current chat frame/tab configuration",
		--[[Translation missing --]]
		["save_name"] = "Save Settings",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR", L)



L = {
	["Memory"] = {
		["autoload_desc"] = "Ladet die gespeicherten Einstellungen automatisch, wenn du dich anmeldest",
		["autoload_name"] = "Einstellungen automatisch laden",
		["command_header_name"] = "Befehle",
		["load_desc"] = "Ladet den Chat-Rahmen/Registerkarten aus der letzten Speicherung",
		["load_name"] = "Einstellungen laden",
		["module_desc"] = "Unterstützt das Speichern der Blizzard-Chat Einstellungen in deinem Profil, damit sie für alle deine Charaktere synchronisiert werden können",
		["module_info"] = "DIESES MODUL IST EXPERIMENTELL = Du kannst deine Chat-Einstellungen in deinem Konto synchronisieren",
		["module_name"] = "Erinnerung",
		["msg_loadfailed"] = "Die Chat-Einstellungen konnten nicht vollständig wiederhergestellt werden",
		["msg_nosettings"] = "Keine gespeicherten Einstellungen",
		["msg_settingsloaded"] = "Einstellungen geladen",
		["options_header_name"] = "Optionen",
		["save_desc"] = "Speichert die aktuelle Konfiguration des Chat-Rahmens/Registerkarte",
		["save_name"] = "Einstellungen speichern",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)



L = {
	["Memory"] = {
		["autoload_desc"] = "로그인시 저장된 설정을 자동으로 불러옵니다.",
		["autoload_name"] = "자동 설정 불러오기",
		["command_header_name"] = "명령어",
		["load_desc"] = "마지막 저장에서 대화창/탭을 불러옴",
		["load_name"] = "불러오기 설정",
		["module_desc"] = "블리자드 채팅 설정을 프로필에 저장하여 모든 캐릭터와 동기화 할 수 있도록 지원",
		["module_info"] = "|cffff8888이 모듈은 실험적입니다.|r 이 모듈을 사용하면 모든 채팅 설정 및 프레임 모양을 불러오기/저장할 수 있습니다. 이 설정은 모든 캐릭터에서 불러오기 할 수 있습니다.",
		["module_name"] = "메모리 [Memory]",
		["msg_loadfailed"] = "대화 설정을 완전히 복구하지 못했습니다",
		["msg_nosettings"] = "저장된 설정 없음",
		["msg_settingsloaded"] = "설정 불러옴",
		["options_header_name"] = "옵션",
		["save_desc"] = "정확한 대화창/탭 구성을 저장",
		["save_name"] = "저장 설정",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",  L)


L = {
	["Memory"] = {
		--[[Translation missing --]]
		["autoload_desc"] = "Automatically load the saved settings when you log in",
		--[[Translation missing --]]
		["autoload_name"] = "Load Settings Automatically",
		--[[Translation missing --]]
		["command_header_name"] = "Commands",
		--[[Translation missing --]]
		["load_desc"] = "Load the chat frame/tabs from the last save",
		--[[Translation missing --]]
		["load_name"] = "Load Settings",
		--[[Translation missing --]]
		["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
		--[[Translation missing --]]
		["module_info"] = [=[|cffff8888THIS MODULE IS EXPERIMENTAL|r 

 This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters]=],
		--[[Translation missing --]]
		["module_name"] = "Memory",
		--[[Translation missing --]]
		["msg_loadfailed"] = "Could not fully restore the chat settings",
		--[[Translation missing --]]
		["msg_nosettings"] = "No stored settings",
		--[[Translation missing --]]
		["msg_settingsloaded"] = "Settings Loaded",
		--[[Translation missing --]]
		["options_header_name"] = "Options",
		--[[Translation missing --]]
		["save_desc"] = "Save the current chat frame/tab configuration",
		--[[Translation missing --]]
		["save_name"] = "Save Settings",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",  L)


L = {
	["Memory"] = {
		["autoload_desc"] = "Автоматически загружать сохраненные настройки при входе в систему",
		["autoload_name"] = "Загружать настройки автоматически",
		["command_header_name"] = "Команды ",
		["load_desc"] = "Загрузить фрейм/вкладки чата из последнего сохранения",
		["load_name"] = "Загрузить настройки",
		["module_desc"] = "Поддержите сохранение настроек чата Blizzard в вашем профиле, чтобы их можно было синхронизировать со всеми вашими персонажами.",
		["module_info"] = "|cffff8888 ЭТОТ МОДУЛЬ ЯВЛЯЕТСЯ ЭКСПЕРИМЕНТАЛЬНЫМ|r Этот модуль позволяет загружать/сохранять все настройки чата и разметки. Эти настройки можно загрузить на любого из ваших персонажей.",
		["module_name"] = "Память",
		["msg_loadfailed"] = "Не удалось полностью восстановить настройки чата",
		["msg_nosettings"] = "Нет сохраненных настроек",
		["msg_settingsloaded"] = "Настройки загружены",
		["options_header_name"] = "Параметры ",
		["save_desc"] = "Сохраните текущую конфигурацию фрейма/вкладки чата",
		["save_name"] = "Сохранить настройки",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",  L)


L = {
	["Memory"] = {
		["autoload_desc"] = "登录时自动加载保存过的设置",
		["autoload_name"] = "自动加载设置",
		["command_header_name"] = "命令",
		["load_desc"] = "加载上次保存的聊天框/标签",
		["load_name"] = "加载设置",
		["module_desc"] = "支持将官方聊天设置保存到你的个人设置中，以便你可以在所有角色之间进行同步。",
		["module_info"] = [=[|cffff8888此模块是实验性的|r 
 该模块允许你加载/保存所有的聊天设置和框体布局。这些设置可以导入到你的其他账号内]=],
		["module_name"] = "内存",
		["msg_loadfailed"] = "无法完全恢复聊天设置",
		["msg_nosettings"] = "没有保存的设置",
		["msg_settingsloaded"] = "设置已加载",
		["options_header_name"] = "选项",
		["save_desc"] = "保存当前的聊天框/标签设置",
		["save_name"] = "保存设置",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",  L)


L = {
	["Memory"] = {
		--[[Translation missing --]]
		["autoload_desc"] = "Automatically load the saved settings when you log in",
		--[[Translation missing --]]
		["autoload_name"] = "Load Settings Automatically",
		--[[Translation missing --]]
		["command_header_name"] = "Commands",
		--[[Translation missing --]]
		["load_desc"] = "Load the chat frame/tabs from the last save",
		--[[Translation missing --]]
		["load_name"] = "Load Settings",
		--[[Translation missing --]]
		["module_desc"] = "Support saving the Blizzard chat settings to your profile so they can be synced across all your characters",
		--[[Translation missing --]]
		["module_info"] = [=[|cffff8888THIS MODULE IS EXPERIMENTAL|r 

 This module allows you to load/save all your chat settings and frame layout. These settings can be loaded on any of your characters]=],
		--[[Translation missing --]]
		["module_name"] = "Memory",
		--[[Translation missing --]]
		["msg_loadfailed"] = "Could not fully restore the chat settings",
		--[[Translation missing --]]
		["msg_nosettings"] = "No stored settings",
		--[[Translation missing --]]
		["msg_settingsloaded"] = "Settings Loaded",
		--[[Translation missing --]]
		["options_header_name"] = "Options",
		--[[Translation missing --]]
		["save_desc"] = "Save the current chat frame/tab configuration",
		--[[Translation missing --]]
		["save_name"] = "Save Settings",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",  L)


L = {
	["Memory"] = {
		["autoload_desc"] = "登录时自动加载保存过的设置",
		["autoload_name"] = "自动加载设置",
		["command_header_name"] = "命令",
		["load_desc"] = "加载上次保存的聊天框/标签",
		["load_name"] = "加载设置",
		["module_desc"] = "支持将官方聊天设置保存到你的个人设置中，以便你可以在所有角色之间进行同步。",
		["module_info"] = [=[|cffff8888此模块是实验性的|r 
 该模块允许你加载/保存所有的聊天设置和框体布局。这些设置可以导入到你的其他账号内]=],
		["module_name"] = "内存",
		["msg_loadfailed"] = "无法完全恢复聊天设置",
		["msg_nosettings"] = "没有保存的设置",
		["msg_settingsloaded"] = "设置已加载",
		["options_header_name"] = "选项",
		["save_desc"] = "保存当前的聊天框/标签设置",
		["save_name"] = "保存设置",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",  L)
end
--@end-non-debug@

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

  local cvars = {
    whisperMode = "CVar",
    chatStyle = "CVar",
    wholeChatWindowClickable = "CVarBool",
    whisperMode = "CVar",
    blockChannelInvites = "CVarBool"
  }

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
    if not self.working and self.db.profile.autoload and next(self.db.profile.frames) then
      if not self.ready then
        self.needsLoading = true
      else
        self:ScheduleTimer("LoadSettings", 0)
      end
    end

    Prat.RegisterChatEvent(self, Prat.Events.PRE_ADDMESSAGE)
  end

  function module:SaveSettings()
    local db = self.db.profile

    wipe(db.frames)

    for i = 1, NUM_CHAT_WINDOWS do
      self:SaveSettingsForFrame(i)
    end

    db.types =  CopyTable(getmetatable(ChatTypeInfo).__index)
    db.channels = { GetChannelList() }

    for k,v in pairs(cvars) do
      db.cvars[k] = _G["Get"..v](k)
    end

    self:Output("Settings Saved")
  end

  function module:SaveSettingsForFrame(frameId)
    local db = self.db.profile.frames[frameId]

    local name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable = GetChatWindowInfo(frameId)
    db.name, db.fontSize, db.r, db.g, db.b, db.alpha, db.shown, db.locked, db.docked, db.uninteractable =
    name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable

    local f = Chat_GetChatFrame(frameId)
    db.minimized = f.minimized
    if f.minFrame then
      db.minframe = {}
      for i=1,f.minFrame:GetNumPoints() do
        local point, relativeTo, relativePoint, xoff, yoff = f.minFrame:GetPoint(i)
        db.minframe[#db.minframe+1] = { point, (type(relativeTo) == "table") and relativeTo:GetName() or relativeTo, relativePoint, xoff, yoff }
      end
    end
    db.messages = { GetChatWindowMessages(frameId) }
    db.channels = { GetChatWindowChannels(frameId) }

    local width, height = GetChatWindowSavedDimensions(frameId);
    local point, xOffset, yOffset = GetChatWindowSavedPosition(frameId)

    db.point, db.xOffset, db.yOffset, db.width, db.height =
    point, xOffset, yOffset, width, height
  end

  function module:LoadFrameSettingsForFrame(frameId)
    local db = self.db.profile.frames[frameId]
    local success = true
    local f = Chat_GetChatFrame(frameId)

    if not db.shown and not db.docked then
      FCF_Close(f)
      return success
    end

    if f.minimized then
      FCF_MaximizeFrame(f)
    end

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
    FCF_DockUpdate()
    -- ChatEdit_DeactivateChat(f.editBox) -- use service method to avoid tainting ACTIVE_CHAT_EDIT_BOX
    Prat.ChatEdit_SetDeactivated(f.editBox)
    FCF_FadeInChatFrame(f)

    if db.minimized then
      FCF_MinimizeFrame(f, "LEFT")
      f.minFrame:ClearAllPoints()
      for i,v in ipairs(db.minframe) do
        local point, relativeTo, relativePoint, xoff, yoff = unpack(v)
        f.minFrame:SetPoint(point, relativeTo and _G[relativeTo], relativePoint, xoff, yoff)
      end

      f.minFrame:SetUserPlaced(true)
    end
    return success
  end

  function module:LoadChatSettingsForFrame(frameId)
    local db = self.db.profile.frames[frameId]
    local success = true
    local f = Chat_GetChatFrame(frameId)

    -- Restore ChatFrame
    ChatFrame_RemoveAllMessageGroups(f)
    for _, v in ipairs(db.messages) do
      ChatFrame_AddMessageGroup(f, v);
    end

    ChatFrame_RemoveAllChannels(f)
    for i = 1, #db.channels, 2 do
      local chan = ChatFrame_AddChannel(f, db.channels[i])
      if not chan then
        dbg("failed to load", db.channels[i], chan)
        success = false
      end
    end

    ChatFrame_ReceiveAllPrivateMessages(f)
    return success
  end
  function module:LeaveChannels(...)
    local db = self.db.profile
    local map = self:GetChannelMap(unpack(db.channels))
    for i = 1, select("#", ...), 3 do
      local snum, sname = select(i, ...);
      local num, name = map[sname], map[snum];
      if snum ~= num or sname ~= name then
        dbg("leave", snum, sname, num, name)
        LeaveChannelByName(snum)
      end
    end
  end

  local channelStepDelay = 0.5
  local function getDelay()
    return channelStepDelay + module.errorcount
  end

  function module:LeavePlaceholderChannels(...)
    dbg("leave placeholders", ...)
    for i = 1, select("#", ...), 3 do
      local num, name = select(i, ...);
      if name:match("^LeaveMe") then
        dbg("leave", num, name)
        LeaveChannelByName(num)
      end
    end

    self:ScheduleTimer(function() module:CheckChannels(GetChannelList()) end,  getDelay())
  end

  function module:GetChannelMap(...)
    local map = {}
    for i = 1, select("#", ...), 3 do
      local num, name = select(i, ...);
      map[name] = num
      map[num] = name
    end

    return map
  end

  function module:CheckChannels(...)
    dbg("check channels", ...)
    local db = self.db.profile
    local map = self:GetChannelMap(unpack(db.channels))

    local correct = true
    if select("#", ...) ~= #db.channels then
      correct = "wrong"
    else
      for i = 1, select("#", ...), 3 do
        local snum, sname = select(i, ...);
        local num, name = db.channels[i], db.channels[i + 1];
        if snum ~= num or sname ~= name then
          dbg("mismatch", snum, num, sname, name, map[sname])
          correct = map[sname] and "order" or "wrong"
        end
      end
    end

    dbg("channels correct", correct)
    if type(correct) == "boolean" or self.errorcount >= 3 then
      self:ScheduleTimer("LoadSettings", 0)
    else
      if correct == "wrong" then
        self:LeaveChannels(GetChannelList())
        self:ScheduleTimer("RestoreChannels", getDelay(), unpack(db.channels))
        self.errorcount = self.errorcount + 1
      elseif correct == "order" then
        dbg(GetChannelList())
        for i = 1, select("#", ...), 3 do
          local snum, sname = select(i, GetChannelList());
          local curnum = map[sname]
          dbg("check", snum, curnum)
          if snum ~= curnum then
            dbg("swap", snum, curnum)
            if Prat.IsClassic then
              SwapChatChannelByLocalID(snum, curnum)
            else
              C_ChatInfo.SwapChatChannelsByChannelIndex(snum, curnum)
            end
          end
        end

        self:ScheduleTimer(function() module:CheckChannels(GetChannelList()) end,  getDelay())
      end
    end
  end

  if Prat.IsClassic then
    function module:RestoreChannels(...)
      local index = 1
      for i = 1, select("#", ...), 3 do
        local num, name = select(i, ...);
        dbg("restore", name, num)
        while index < num do
          if GetChannelName(index) == 0 then
            JoinTemporaryChannel("LeaveMe" .. index)
            dbg("join", "LeaveMe" .. index)
          end
          index = index + 1
        end
        if GetChannelName(index) == 0 then
          dbg("join", name)
          JoinChannelByName(name)
        else
          dbg("occupied", name, select(2, GetChannelName(index)))
        end
        index = index + 1
      end

      self:ScheduleTimer(function() module:LeavePlaceholderChannels(GetChannelList()) end,  getDelay())
    end
  else
    function module:RestoreChannels(...)
      local index = 1
      for i = 1, select("#", ...), 3 do
        local num, name = select(i, ...);
        dbg("restore", name, num)
        while index < num do
          if GetChannelName(index) == 0 then
            JoinTemporaryChannel("LeaveMe" .. index)
            dbg("join", "LeaveMe" .. index)
          else
            dbg("skip", index)
          end
          index = index + 1
        end
        if GetChannelName(index) == 0 then
          local clubId, streamId = ChatFrame_GetCommunityAndStreamFromChannel(name);
          if not clubId or not streamId then
            dbg("join", name)

            JoinChannelByName(name)
          else
            dbg("addclub", clubId, streamId)
            ChatFrame_AddNewCommunitiesChannel(1, clubId, streamId)
          end
        else
          dbg("occupied", name, select(2, GetChannelName(index)))
        end
        index = index + 1
      end
      self:ScheduleTimer(function() module:LeavePlaceholderChannels(GetChannelList()) end,  getDelay())
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

    if not self.working then
      self.working = {}
    end

    -- restore CVars
    if not self.working.cvars then
      for k, v in pairs(cvars) do
        local val = db.cvars[k]
        if val ~= nil then
          dbg("set cvar", k, val)
          SetCVar(k, val)
        end
      end
      self.working.cvars = true
    end

    -- restore frame appearance and layout
    if not self.working.frames then
      for k, v in pairs(db.frames) do
        if not self:LoadFrameSettingsForFrame(k) then
          success = false
        end
      end
      FCFDock_SelectWindow(GENERAL_CHAT_DOCK, ChatFrame1)
      self.working.frames = success
    end

    -- restore chat channels
    if not self.working.channels and db.channels and #db.channels > 0 then
      self.errorcount = 0
      self:ScheduleTimer("CheckChannels", getDelay(), GetChannelList())
      self.working.channels = true
      return
    end

    -- restore channels and messages to chatframes
    if not self.working.chatframes then
      for k, v in pairs(db.frames) do
        if not self:LoadChatSettingsForFrame(k) then
          success = false
        end
      end
      self.working.chatframes = success
    end

    -- restore chat colors
    if not self.working.colorsa then
      for k, v in pairs(db.types) do
        ChangeChatColor(k, v.r, v.g, v.b)
      end
      self.working.colorsa = true
    end

    if success then
      self.needsLoading = nil
      self.working = nil
      self.errorcount = nil
      self:Output(PL.msg_settingsloaded)
    else
      self.errorcount = self.errorcount + 1

      if self.errorcount > 10 then
        self.working = nil
        self.errorcount = nil
        self:Output(PL.msg_loadfailed)
        return
      end
      self:ScheduleTimer("LoadSettings", getDelay())
    end
  end

  function module:Prat_PreAddMessage(arg, message, frame, event, t, r, g, b)
    if self.working and ("YOU_CHANGED" == message.NOTICE or "YOU_LEFT" == message.NOTICE) then
      message.DONOTPROCESS = true
    end
  end
end)

