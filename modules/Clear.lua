---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
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

  local PRAT_MODULE = Prat:RequestModuleName("Clear")

  if PRAT_MODULE == nil then
    return
  end


  local module = Prat:NewModule(PRAT_MODULE)

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["Clear"] = true,
    ["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = true,
    ["Clears the current chat frame."] = true,
    ["Clearall"] = true,
    ["Clears all chat frames."] = true,
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = true,
		["Clear"] = true,
		["Clearall"] = true,
		["Clears all chat frames."] = true,
		["Clears the current chat frame."] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["Clear"] = {
		--[[Translation missing --]]
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall).",
		--[[Translation missing --]]
		["Clear"] = "Clear",
		--[[Translation missing --]]
		["Clearall"] = "Clearall",
		--[[Translation missing --]]
		["Clears all chat frames."] = "Clears all chat frames.",
		--[[Translation missing --]]
		["Clears the current chat frame."] = "Clears the current chat frame.",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["Clear"] = {
		--[[Translation missing --]]
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall).",
		--[[Translation missing --]]
		["Clear"] = "Clear",
		--[[Translation missing --]]
		["Clearall"] = "Clearall",
		--[[Translation missing --]]
		["Clears all chat frames."] = "Clears all chat frames.",
		--[[Translation missing --]]
		["Clears the current chat frame."] = "Clears the current chat frame.",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)


L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Ajoute les commandes slash de nettoyage du texte (/clear)(/cls)(/clearall)(/clsall).",
		["Clear"] = "Effacer",
		["Clearall"] = "EffacerTout",
		["Clears all chat frames."] = "Efface toutes les fenêtres de discussion.",
		["Clears the current chat frame."] = "Efface la fenêtre de discussion actuelle.",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR",L)




L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Fügt Slash-Befehle zum Löschen von Text hinzu (/clear)(/cls)(/clearall)(/clsall).",
		["Clear"] = "Löschen",
		["Clearall"] = "Alles löschen",
		["Clears all chat frames."] = "Alle Chatfenster leeren",
		["Clears the current chat frame."] = "Das aktuelle Chatfenster leeren.",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)


L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "지우기 명령어 /clear, /cls, /clearall, /clsall 을 추가합니다.",
		["Clear"] = "지우기 [Clear]",
		["Clearall"] = "모두 지우기",
		["Clears all chat frames."] = "모든 대화창의 내용을 지웁니다.",
		["Clears the current chat frame."] = "현재 대화창의 내용을 지웁니다.",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",L)

L = {
	["Clear"] = {
		--[[Translation missing --]]
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall).",
		--[[Translation missing --]]
		["Clear"] = "Clear",
		--[[Translation missing --]]
		["Clearall"] = "Clearall",
		--[[Translation missing --]]
		["Clears all chat frames."] = "Clears all chat frames.",
		--[[Translation missing --]]
		["Clears the current chat frame."] = "Clears the current chat frame.",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",L)

L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Добавляет слаш команды очистки текста (/clear)(/cls)(/clearall)(/clsall).",
		["Clear"] = "Очистить",
		["Clearall"] = "Очистить все",
		["Clears all chat frames."] = "Очистить все окна чата.",
		["Clears the current chat frame."] = "Очистить текущее окно чата.",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",L)

L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "添加清除文本斜杠命令(/clear)(/cls)(/clearall)(/clsall).",
		["Clear"] = "清除",
		["Clearall"] = "全部清除",
		["Clears all chat frames."] = "清除所有聊天框架",
		["Clears the current chat frame."] = "清除当前聊天框架",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",L)

L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "Añade comandos para limpiar texto (/clear)(/cls)(/clearall)(/clsall).",
		["Clear"] = "Limpiar",
		["Clearall"] = "Limpiar todo",
		["Clears all chat frames."] = "Limpiar todas las ventanas de chat",
		["Clears the current chat frame."] = "Limpiar la ventana de chat actual",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",L)

L = {
	["Clear"] = {
		["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."] = "新增清除文字的快捷命令 (/clear)(/cls)(/clearall)(/clsall)",
		["Clear"] = "清除",
		["Clearall"] = "全部清除",
		["Clears all chat frames."] = "清除所有聊天視窗。",
		["Clears the current chat frame."] = "清除當前聊天視窗。",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@


  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL["Clear"],
    desc = PL["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."],
    type = "group",
    args = {}
  })

  --[[------------------------------------------------
    Module Event Functions
  ------------------------------------------------]] --

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    Prat.RegisterChatCommand("clear", function() module:clear(SELECTED_CHAT_FRAME) end)
    Prat.RegisterChatCommand("cls", function() module:clear(SELECTED_CHAT_FRAME) end)
    Prat.RegisterChatCommand("clearall", function() module:clearAll() end)
    Prat.RegisterChatCommand("clsall", function() module:clearAll() end)

    --	local slashcmds, cmdopts
    --
    --	-- clear
    --	cmdopts_clear = {
    --		name	= PL["Clear"],
    --		desc	= PL["Clears the current chat frame."],
    --		type	= "execute",
    --		func	= function() module:clear(SELECTED_CHAT_FRAME) end,
    --		}
    --
    --	-- cleartastic
    --	cmdopts_clearall = {
    --		name	= PL["Clearall"],
    --		desc	= PL["Clears all chat frames."],
    --		type	= "execute",
    --		func	= function() module:clearAll() end,
    --		}

    -- TODO - need to find call equivalent to RCC in Ace2
    --	Prat.Addon:RegisterChatCommand({ '/clear', '/cls' }, cmdopts_clear)
    --	Prat.Addon:RegisterChatCommand({ '/clearall', '/clsall' }, cmdopts_clearall)
  end

  function module:OnModuleDisable()
  end

  --[[ - - ------------------------------------------------
    Core Functions
  --------------------------------------------- - ]] --

  function module:GetDescription()
    return PL["Adds clear text slash commands (/clear)(/cls)(/clearall)(/clsall)."]
  end

  function module:clear(chatframe)
    local vartype = type(chatframe)
    local type = chatframe:GetObjectType() or nil

    if self.db.profile.on and type == 'Frame' and chatframe.Clear then
      chatframe:Clear()
    end
  end

  function module:clearAll()
    for i = 1, NUM_CHAT_WINDOWS do
      self:clear(_G['ChatFrame' .. i])
    end
  end


  return
end) -- Prat:AddModuleToLoad