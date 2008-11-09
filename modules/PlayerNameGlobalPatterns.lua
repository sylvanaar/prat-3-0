---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2007  Prat Development Team
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



--[[
Name: PratPlayerNamesGlobalPatterns
Revision: $Revision: 81333 $
Author(s): Sylvanaar
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#PlayerNames
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Maintains patterns in the registry for coloring player names outside of links.
Dependencies: Prat
]]

Prat:AddModuleExtension(function() 
    local module = Prat.Addon:GetModule("PlayerNames", true)
    
    if not module then return end

    LibStub("AceTimer-3.0"):Embed(module)

    local L = module.L
    
    module.pluginopts["GlobalPatterns"] = {  
        coloreverywhere =  {
            type = "toggle",
            name = L["coloreverywhere_name"],
            desc = L["coloreverywhere_desc"],
            order = 220
        }
    }

    local ColorPlayer
    do  
        local function Player(name, class)
            return Prat.CLR:Player(name, name, class)
        end
        
        ColorPlayer = function(name)        
             return Prat:RegisterMatch(Player(name, module:GetData(name)))
        end
    end
    
    -- Thanks for the frontier pattern: Josh Borke & Arrowmaster
    local function newPattern(name)
        local u,l = name:sub(1,1):upper(), name:sub(1,1):lower()
        local namepat 
        if u == l then
            namepat = name:lower()
        else
            namepat = ("[%s%s]%s"):format(name:sub(1,1):upper(), name:sub(1,1):lower(), name:sub(2))
        end

        return { pattern = "%f[%w]"..namepat.."%f[%W]", matchfunc=ColorPlayer, priority=24 }
    end


    do
        local namePatterns = {}
    
        function module:OnPlayerDataChangedThrottled(Name)
            self.timerPlayerData = nil

            if self.db.profile.coloreverywhere and Name then
                Name = Name:lower()
                if not namePatterns[Name] and not Prat.PlayerNameBlackList[Name] and Name:len() > 1 then
                    namePatterns[Name] = Prat.RegisterPattern(newPattern(Name), self.name)
                end
            else
                for k,v in pairs(namePatterns) do
                    Prat.UnregisterPattern(v)
                    namePatterns[k] = nil
                end
            end
        end

        function module:OnPlayerDataChanged(Name)
            if not self.db.profile.coloreverywhere then return end

            if not self.timerPlayerData then 
                self.timerPlayerData = self:ScheduleTimer("OnPlayerDataChangedThrottled", 1, Name)
            end

            --self:OnPlayerDataChangedThrottled(Name)

-- This code just leaks resources
--          self:CancelTimer(self.timerPlayerData, true)
--          self.timerPlayerData = self:ScheduleTimer("OnPlayerDataChangedThrottled", 1, Name)
        end
    end
  return
end ) -- Prat:AddModuleToLoad