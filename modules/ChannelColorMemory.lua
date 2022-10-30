---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat modules
--
-- Copyright (C) 2006-2018  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- moduleify it under the terms of the GNU General Public License
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

  local PRAT_MODULE = Prat:RequestModuleName("ChannelColorMemory")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["ChannelColorMemory"] = true,
    ["Remembers the colors of each channel name."] = true,
    ["(%w+)%s?(.*)"] = "([^%s]+)%s?(.*)",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --@non-debug@
 do
     local L

 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = "(%S+)%s?(.*)",
		["ChannelColorMemory"] = true,
		["Remembers the colors of each channel name."] = true,
	}
}


   PL:AddLocale(PRAT_MODULE, "enUS",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = "(%S+)%s?(.*)",
		["ChannelColorMemory"] = "Couleur Canal",
		["Remembers the colors of each channel name."] = "Mémorise la couleur de chaque nom de canal.",
	}
}


   PL:AddLocale(PRAT_MODULE, "frFR",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = true,
		["ChannelColorMemory"] = "Kanalfarbspeicher",
		["Remembers the colors of each channel name."] = "Erinnert sich an die Farben jedes Kanalnamens.",
	}
}


   PL:AddLocale(PRAT_MODULE, "deDE",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = "(%S+)%s?(.*)",
		["ChannelColorMemory"] = "채널 색상 기억 [ChannelColorMemory]",
		["Remembers the colors of each channel name."] = "각 채널 이름의 색상을 기억합니다.",
	}
}


   PL:AddLocale(PRAT_MODULE, "koKR",L)


 
L = {
	["ChannelColorMemory"] = {
		--[[Translation missing --]]
		["(%w+)%s?(.*)"] = "(%S+)%s?(.*)",
		--[[Translation missing --]]
		["ChannelColorMemory"] = "ChannelColorMemory",
		--[[Translation missing --]]
		["Remembers the colors of each channel name."] = "Remembers the colors of each channel name.",
	}
}


   PL:AddLocale(PRAT_MODULE, "esMX",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = true,
		["ChannelColorMemory"] = "Сохранение цветов каналов",
		["Remembers the colors of each channel name."] = "Запоминает цвета названия каждого канала.",
	}
}


   PL:AddLocale(PRAT_MODULE, "ruRU",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = true,
		["ChannelColorMemory"] = "频道颜色存储",
		["Remembers the colors of each channel name."] = "记住每个频道名称的颜色",
	}
}


   PL:AddLocale(PRAT_MODULE, "zhCN",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = "(%S+)%s?(.*)",
		["ChannelColorMemory"] = "MemoriaColorCanal",
		["Remembers the colors of each channel name."] = "Recordar los colores de cada nombre de canal.",
	}
}


   PL:AddLocale(PRAT_MODULE, "esES",L)


 
L = {
	["ChannelColorMemory"] = {
		["(%w+)%s?(.*)"] = "(%S+)%s?(.*)",
		["ChannelColorMemory"] = "頻道顏色記憶",
		["Remembers the colors of each channel name."] = "記住每個頻道顏色的名稱。",
	}
}


   PL:AddLocale(PRAT_MODULE, "zhTW",L)


 end
 --@end-non-debug@



  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      colors = {},
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL["ChannelColorMemory"],
    desc = PL["Remembers the colors of each channel name."],
    type = "group",
    args = {
      info = {
        name = "This module remembers what color you give to a channel with a particular name, so that if you rejoin the channel, no matter what number it is, it will always have the same color.",
        type = "description",
      }
    }
  })

  --[[------------------------------------------------
      Moduleule Event Functions
  ------------------------------------------------]] --

  -- things to do when the moduleule is enabled
  function module:OnModuleEnable()
    self:RegisterEvent("UPDATE_CHAT_COLOR")
    self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
    self.zoneChanIdx = {}

    -- upgrade saved channel names to lowercase only
    for k, v in pairs(self.db.profile.colors) do
      if k ~= k:lower() then
        self.db.profile.colors[k:lower()] = v
      end
    end
    self:RestoreAllChatColors()
  end

  function module:GetDescription()
    return PL["Remembers the colors of each channel name."]
  end

  function module:IndexServerChannels()
    for k, v in pairs(Prat.HookedFrames) do
      local t = { GetChatWindowChannels(v:GetID()) }
      for i = 1, #t, 2 do
        local chan, num = t[i], t[i + 1]
        if tonumber(num) and tonumber(num) > 0 then
          self.zoneChanIdx[tostring(num)] = tostring(chan)
        end
      end
    end
  end

  function module:RestoreAllChatColors()
    for k, v in pairs(Prat.HookedFrames) do
      local t = { GetChatWindowChannels(v:GetID()) }
      for i = 1, #t, 2 do
        local chan, num = t[i], t[i + 1]
        if tonumber(num) and tonumber(num) > 0 then
          self.zoneChanIdx[tostring(num)] = tostring(chan)
        end
        if chan and chan:len() > 0 then
          local color = self.db.profile.colors[chan:lower()];
          if color then
            local number = Prat.GetChannelName(chan);
            if number then
              ChangeChatColor("CHANNEL" .. number, color.r, color.g, color.b);
            end
          end
        end
      end
    end
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --


  local function getServerChan(name)
    local t = { EnumerateServerChannels() }
    for _, channame in pairs(t) do
      if channame:lower() == name:lower() then
        return channame
      end
    end
  end


  function module:UPDATE_CHAT_COLOR(evt, ChatType, cr, cg, cb)
    if (ChatType) then
      local number = ChatType:match("CHANNEL(%d+)")
      if (number) then
        local _, name = Prat.GetChannelName(number);
        if (name) then
          local name, zoneSuffix = name:match(PL["(%w+)%s?(.*)"]);
          if zoneSuffix and zoneSuffix:len() > 0 then
            local cname = name

            name = getServerChan(name)
          end

          if not name then return end

          local color = self.db.profile.colors[name:lower()];
          if (not color) then
            self.db.profile.colors[name:lower()] = { r = cr, g = cg, b = cb };
          else
            color.r = cr
            color.g = cg
            color.b = cb
          end
        end
      end
    end
  end

  function module:CHAT_MSG_CHANNEL_NOTICE(evt, NoticeType, Sender, Language, LongName, Target, Flags, ServChanID,
  number, cname, unknown, counter)
    if tonumber(ServChanID) > 0 then
      cname = self.zoneChanIdx[tostring(ServChanID)]

      if not cname then
        self:IndexServerChannels()

        cname = self.zoneChanIdx[tostring(ServChanID)]
      end
    end

    if number == nil or cname == nil then
      return
    elseif (NoticeType == "YOU_JOINED") then
      local color = self.db.profile.colors[cname:lower()];
      if (color) then
        ChangeChatColor("CHANNEL" .. number, color.r, color.g, color.b);
      end
    elseif (NoticeType == "YOU_LEFT") then
      local color = self.db.profile.colors[cname:lower()];
      if (color) then
        ChangeChatColor("CHANNEL" .. number, 1.0, 0.75, 0.75);
      else
        color = ChatTypeInfo["CHANNEL" .. number];
        self.db.profile.colors[cname:lower()] = { r = color.r, g = color.g, b = color.b };
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad