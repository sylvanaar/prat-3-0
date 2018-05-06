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
    local PRAT_MODULE = Prat:RequestModuleName("Achievements")

    if PRAT_MODULE == nil then
        return
    end

    local module = Prat:NewModule(PRAT_MODULE)

    Prat:SetModuleDefaults(module.name, {
        profile = {
            on = false
        }
    })

    local function white(text)
        return Prat.CLR:Colorize("ffffff", text)
    end

    local regexp = "(|cffffff00|Hachievement:([0-9]+):(.+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+)|h%[([^]]+)%]|h|r)"

    local function ShowOurCompletion(...)
        local text, thierId, thierPlayerGuid, thierDone, thierMonth, thierDay, thierYear, thierName = ...
        local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(thierId)

        if completed then
            return Prat:RegisterMatch(text.." "..white("(").."Completed "..month.."/"..day.."/"..year..white(")"))
        end
    end

    Prat:SetModulePatterns(module, {
        { pattern = regexp, matchfunc = ShowOurCompletion, priority = 100 },
    })
end)