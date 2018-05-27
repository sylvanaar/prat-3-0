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
    local function dbg(...) end

    --@debug@
    function dbg(...) Prat:PrintLiteral(...) end

    --@end-debug@

    local PRAT_MODULE = Prat:RequestModuleName("Achievements")

    if PRAT_MODULE == nil then
        return
    end

    local module = Prat:NewModule(PRAT_MODULE)

    -- define localized strings
    local PL = module.PL

    --@debug@
    PL:AddLocale(PRAT_MODULE, "enUS", {
        ["module_name"] = "Achievements",
        ["module_desc"] = "Achievment related customizations",
        ["grats_link"]  = "grats",
        ["completed"] = "Completed %s",
        ["showCompletedDate_name"] = "Show completed date",
        ["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
        ["showGratsLink_name"] = "Show grats link",
        ["showGratsLink_desc"] = "Show a clickable link which sends a grats message",

        ["grats_have_1"] = "Grats %s",
        ["grats_have_2"] = "Gz %s, I have that one too",
        ["grats_have_3"] = "Wow %s that's great",
        ["grats_have_4"] = "Welcome to the club %s",
        ["grats_have_5"] = "I can still rememeber getting that one %s",
        ["grats_have_6"] = "That one is a rite of passge %s",
        ["grats_have_7"] = "I worked on that for ages %s, grats!",
        ["grats_have_8"] = "I remember doing that, %s, grats!",
        ["grats_have_9"] = "Nicely done %s",
        ["grats_have_10"] = "Good work %s, now we both have it",

        ["grats_donthave_1"] = "Grats %s",
        ["grats_donthave_2"] = "Gz %s, I still need that",
        ["grats_donthave_3"] = "I want that one %s, grats!",
        ["grats_donthave_4"] = "Wow %s that's great",
        ["grats_donthave_5"] = "I'm jealous %s, grats!",
        ["grats_donthave_6"] = "I have been working on that for ages %s",
        ["grats_donthave_7"] = "Still need that one %s, grats!",
        ["grats_donthave_8"] = "WTB your achievment %s",
        ["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
        ["grats_donthave_10"] = "I can't wait to get that one %s",
    } )
    --@end-debug@

    -- These Localizations are auto-generated. To help with localization
    -- please go to http://www.wowace.com/projects/prat-3-0/localization/


    --[===[@non-debug@
  do
      local L

  L=
  --@localization(locale="enUS", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "enUS", L)


  L=
  --@localization(locale="itIT", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "itIT", L)


  L=
  --@localization(locale="ptBR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "ptBR", L)


  L=
  --@localization(locale="frFR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "frFR", L)


  L=
  --@localization(locale="deDE", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "deDE", L)


  L=
  --@localization(locale="koKR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "koKR",  L)

  L=
  --@localization(locale="esMX", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "esMX",  L)

  L=
  --@localization(locale="ruRU", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "ruRU",  L)

  L=
  --@localization(locale="zhCN", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "zhCN",  L)

  L=
  --@localization(locale="esES", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "esES",  L)

  L=
  --@localization(locale="zhTW", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Achievements")@
  PL:AddLocale(PRAT_MODULE, "zhTW",  L)
  end
  --@end-non-debug@]===]


    local repeatPrevention = {}


    Prat:SetModuleDefaults(module.name, {
        profile = {
            on = true,
            showCompletedDate = true,
            showGratsLink = true
        }
    })

    Prat:SetModuleOptions(module.name, {
        name = PL.module_name,
        desc = PL.module_desc,
        type = "group",
        args = {
            showCompletedDate = {
                name = PL.showCompletedDate_name,
                desc = PL.showCompletedDate_desc,
                type = "toggle",
                order = 100
            },
            showGratsLink = {
                name = PL.showGratsLink_name,
                desc = PL.showGratsLink_desc,
                type = "toggle",
                order = 110
            },
        }
    })


    local gratsVariantsHave = {
        PL.grats_have_1,
        PL.grats_have_2,
        PL.grats_have_3,
        PL.grats_have_4,
        PL.grats_have_5,
        PL.grats_have_6,
        PL.grats_have_7,
        PL.grats_have_8,
        PL.grats_have_9,
        PL.grats_have_10,
    }
    local gratsVariantsDontHave = {
        PL.grats_donthave_1,
        PL.grats_donthave_2,
        PL.grats_donthave_3,
        PL.grats_donthave_4,
        PL.grats_donthave_5,
        PL.grats_donthave_6,
        PL.grats_donthave_7,
        PL.grats_donthave_8,
        PL.grats_donthave_9,
        PL.grats_donthave_10,
    }

    local function white(text)
        return Prat.CLR:Colorize("ffffff", text)
    end

    local regexp = "(|cffffff00|Hachievement:([0-9]+):(.+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+)|h%[([^]]+)%]|h|r)"
    local gratsLinkType = "gratsl"




    local function buildGratsLink(name, group, channel, achievementId)
        if type(name) == "nil" or type(group) == "nil" then
        else
            return Prat.BuildLink(gratsLinkType, ("%s:%s:%s:%s"):format(name, group, channel or "", tostring(achievementId)), PL.grats_link, "00a0ff")
        end

        return ""
    end

    local function ShowOurCompletion(...)
--        dbg(...)
        local type = Prat.CurrentMessage.CHATTYPE
        if type == "WHISPER" then return end

        local text, thierId, thierPlayerGuid, thierDone, thierMonth, thierDay, thierYear, _, _, _, _, thierAchievmentName = ...

        if thierDone == "0" then return end

        local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(thierId)

        local _, _, _, _, _, thierName, _ = GetPlayerInfoByGUID(thierPlayerGuid)
        local group = Prat.CurrentMessage.CHATGROUP
        local channelNum = Prat.CurrentMessage.CHATTARGET

--        dbg(Prat.CurrentMessage)
        if group == "CHANNEL" and not tonumber(channelNum) then return end

        if completed then
            return Prat:RegisterMatch(text..module:addDate(day, month, year)..module:addGrats(thierName, group, channelNum, thierId))
        else
            return Prat:RegisterMatch(text..module:addGrats(thierName, group, channelNum, thierId))
        end
    end

    Prat:SetModulePatterns(module, {
        { pattern = regexp, matchfunc = ShowOurCompletion, priority = 100 },
    })

    function module:OnModuleEnable()
        Prat.RegisterLinkType({ linkid = gratsLinkType, linkfunc = self.OnGratsLink, handler = self }, self.name)
    end

    function module:addGrats(name, group, channel, achievementId)
        if self.db.profile.showGratsLink then
            return " " .. buildGratsLink(name, group, channel, achievementId)
        end

        return ""
    end

    function module:addDate(day, month, year)
        if self.db.profile.showCompletedDate then
            return " "..white("(")..PL.completed:format(FormatShortDate(day, month, year))..white(")")
        end

        return ""
    end

    function module:OnGratsLink(link, text, button, ...)
--        dbg(link)
        local theirName, group, channel, id = strsub(link, gratsLinkType:len()+2):match("([^:]*):([^:]*):([^:]*):([^:]*)")

        id = tonumber(id)

        local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(id)

        local gratsVariants = wasEarnedByMe and gratsVariantsHave or gratsVariantsDontHave

        local last = repeatPrevention[wasEarnedByMe and 1 or 2]
        local next = math.random(#gratsVariants)

        while next == last do
            next = math.random(#gratsVariants)
        end

        local grats = gratsVariants[next]
        repeatPrevention[wasEarnedByMe and 1 or 2] = last

        if group == "WHISPER" then
            SendChatMessage(grats:format(theirName), group, nil, theirName)
        elseif group == "CHANNEL" then
            SendChatMessage(grats:format(theirName), group, nil, tonumber(channel))
        else
            SendChatMessage(grats:format(theirName), group)
        end

        return false
    end
end)