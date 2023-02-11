---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2023  Prat Development Team
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

  local PRAT_MODULE = Prat:RequestModuleName("LinkInfoIcons")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

  local PL = module.PL

  -- define localized strings
  local PL = module.PL

  --@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "LinkInfoIcons",
    ["module_desc"] = "Adds icons and item info to hyperlinks",
    ["full_description"] = "Adds icons and item info to links in the chat.",
    ["Item Links"] = "Item Links",
    ["Spell Links"] = "Spell Links",
    ["Achievement Links"] = "Achievement Links",
    ["Icon"] = "Icon",
    ["Item Level"] = "Item Level",
    ["Item Type"] = "Item Type",
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@
do
    local L


--@localization(locale="enUS", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "enUS", L)



--@localization(locale="itIT", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "itIT", L)



--@localization(locale="ptBR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "ptBR", L)



--@localization(locale="frFR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "frFR", L)



--@localization(locale="deDE", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "deDE", L)



--@localization(locale="koKR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "koKR",  L)


--@localization(locale="esMX", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "esMX",  L)


--@localization(locale="ruRU", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "ruRU",  L)


--@localization(locale="zhCN", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "zhCN",  L)


--@localization(locale="esES", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "esES",  L)


--@localization(locale="zhTW", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="LinkInfoIcons")@
PL:AddLocale(PRAT_MODULE, "zhTW",  L)
end
--@end-non-debug@]===]

  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      item = {
        icon = true,
        itemLevel = true,
        itemType = true,
      },
      spell = {
        icon = true,
      },
      achievement = {
        icon = true,
      }
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL.module_name,
    desc = PL.module_desc,
    type = "group",
    --childGroups = "tab",
    get = function(info)
      return module.db.profile[info[#info-1]][info[#info]]
    end,
    set = function(info, value)
      module.db.profile[info[#info-1]][info[#info]] = value
    end,
    args = {
      description = {
        name = PL["full_description"],
        type = "description",
        order = 10,
      },
      item = {
        name = PL["Item Links"],
        type = "group",
        order = 20,
        inline = true,
        args = {
          icon = {
            name = PL["Icon"],
            type = "toggle",
            order = 90
          },
          itemLevel = {
            name = PL["Item Level"],
            type = "toggle",
            order = 100
          },
          itemType = {
            name = PL["Item Type"],
            type = "toggle",
            order = 110
          },
        },
      },
      spell = {
        name = PL["Spell Links"],
        type = "group",
        inline = true,
        order = 30,
        args = {
          icon = {
            name = PL["Icon"],
            type = "toggle",
            order = 90
          },
        },
      },
      achievement = {
        name = PL["Achievement Links"],
        type = "group",
        inline = true,
        order = 40,
        args = {
          icon = {
            name = PL["Icon"],
            type = "toggle",
            order = 90
          },
        },
      },
    },
  })


  function module:OnModuleEnable()
  end

  function module:OnModuleDisable()
  end


  function module:Prat_Ready()
    self:updateAll()
  end

  function module:GetDescription()
    return PL["module_desc"]
  end

  local function GetPattern(type)
    return "|c.-|H" .. type .. ":.-|h.-|h|r"
  end

  local function GetTexture(file)
    return CreateTextureMarkup(file, 64, 64, 12, 12, 0, 1, 0, 1, 0, -2)
  end

  local function IsGear(classID)
    return classID == Enum.ItemClass.Armor or classID == Enum.ItemClass.Weapon or classID == Enum.ItemClass.Profession
  end

  local function SubInItemInfo(link)
    local res = link

    local _, _, subType, equipLocation, icon, classID = GetItemInfoInstant(link)

    local details = {}

    if module.db.profile.item.itemType then
      table.insert(details, subType)
    end

    if module.db.profile.item.itemType and IsGear(classID) and classID ~= Enum.ItemClass.Weapon and equipLocation and equipLocation ~= "" then
      table.insert(details, _G[equipLocation])
    end

    local level = GetDetailedItemLevelInfo(link)
    if module.db.profile.item.itemLevel and IsGear(classID) and level then
      table.insert(details, level)
    end

    if #details > 0 then
      res = link:gsub("|h%[(.-)%]|h", "|h%[%1 %(" .. table.concat(details, " ") .. "%)%]|h")
    end

    if module.db.profile.item.icon and icon then
      res = GetTexture(icon) .. res
    end

    return res
  end

  local function SubInSpellInfo(link)
    local spellID = tonumber(link:match("Hspell:(%d+)"))
    local icon = select(3, GetSpellInfo(spellID))

    local res = link
    if module.db.profile.spell.icon and icon then
      res = GetTexture(icon) .. res
    end

    return res
  end

  local function SubInAchievementInfo(link)
    local achievementID = tonumber(link:match("Hachievement:(%d+)"))
    local icon = select(10, GetAchievementInfo(achievementID))

    local res = link
    if module.db.profile.achievement.icon and icon then
      res = GetTexture(icon) .. res
    end

    return res
  end

  Prat.RegisterPattern({
    pattern = GetPattern("item"),
    matchfunc = function(link)
      return Prat:RegisterMatch(SubInItemInfo(link))
    end,
    type = "FRAME",
    priority = 43
  }, module.name)

  Prat.RegisterPattern({
    pattern = GetPattern("spell"),
    matchfunc = function(link)
      return Prat:RegisterMatch(SubInSpellInfo(link))
    end,
    type = "FRAME",
    priority = 43
  }, module.name)

  Prat.RegisterPattern({
    pattern = GetPattern("achievement"),
    matchfunc = function(link)
      return SubInAchievementInfo(link)
    end,
    type = "FRAME",
    priority = 41
  }, module.name)

  return
end) -- Prat:AddModuleToLoad
