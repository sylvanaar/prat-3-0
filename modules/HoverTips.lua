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
  local PRAT_MODULE = Prat:RequestModuleName("HoverTips")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

  -- define localized strings
  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "Hover Tips",
    ["module_desc"] = "Shows tooltip when hovering over link in chat",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["HoverTips"] = {
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["HoverTips"] = {
		--[[Translation missing --]]
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		--[[Translation missing --]]
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["HoverTips"] = {
		--[[Translation missing --]]
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		--[[Translation missing --]]
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)



L = {
	["HoverTips"] = {
		--[[Translation missing --]]
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		--[[Translation missing --]]
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR", L)



L = {
	["HoverTips"] = {
		["module_desc"] = "Zeigt einen Tooltip an, wenn der Mauszeiger über den Link im Chat schwebt",
		["module_name"] = "Schwebetipps",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)



L = {
	["HoverTips"] = {
		["module_desc"] = "채팅창에 마우스 오버시 링크 툴팁 보이기",
		["module_name"] = "툴팁 [HoverTips]",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",  L)


L = {
	["HoverTips"] = {
		--[[Translation missing --]]
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		--[[Translation missing --]]
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",  L)


L = {
	["HoverTips"] = {
		["module_desc"] = "Показывает подсказку при наведении курсора на ссылку в чате ",
		["module_name"] = "Советы по наведению курсора",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",  L)


L = {
	["HoverTips"] = {
		["module_desc"] = "鼠标悬停在聊天链接上时显示工具提示",
		["module_name"] = "悬停提示",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",  L)


L = {
	["HoverTips"] = {
		--[[Translation missing --]]
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		--[[Translation missing --]]
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",  L)


L = {
	["HoverTips"] = {
		--[[Translation missing --]]
		["module_desc"] = "Shows tooltip when hovering over link in chat",
		--[[Translation missing --]]
		["module_name"] = "Hover Tips",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",  L)
end
--@end-non-debug@

  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
    }
  })

  -- basic code from Chatter

  local strmatch = string.match
  local linkTypes = {
    item = true,
    enchant = true,
    spell = true,
    quest = true,
    achievement = true,
    currency = true,
    battlepet = true,
  }

  function module:OnEnable()
    for i = 1, NUM_CHAT_WINDOWS do
      local frame = _G["ChatFrame" .. i]
      self:SecureHookScript(frame, "OnHyperlinkEnter", OnHyperlinkEnter)
      self:SecureHookScript(frame, "OnHyperlinkLeave", OnHyperlinkLeave)
    end
  end

  function module:OnDisable()
    for i = 1, NUM_CHAT_WINDOWS do
      local frame = _G["ChatFrame" .. i]
      self:Unhook(frame, "OnHyperlinkEnter")
      self:Unhook(frame, "OnHyperlinkLeave")
    end
  end

  local showingTooltip = false
  function module:OnHyperlinkEnter(f, link, text)
    local t = strmatch(link, "^(.-):")
    if linkTypes[t] then
      if t == "battlepet" then
        showingTooltip = BattlePetTooltip
        GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
        BattlePetToolTip_ShowLink(text)
      else
        showingTooltip = GameTooltip
        ShowUIPanel(GameTooltip)
        GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
        GameTooltip:SetHyperlink(link)
        GameTooltip:Show()
      end
    end
  end

  function module:OnHyperlinkLeave(f, link)
    if showingTooltip then
      showingTooltip:Hide()
      showingTooltip = false
    end
  end
end)