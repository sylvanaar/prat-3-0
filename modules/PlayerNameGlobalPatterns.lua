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

	local L = module.L
	
	module.pluginopts["GlobalPatterns"] = {  
		coloreverywhere =  {
			type = "toggle",
			name = L["coloreverywhere_name"],
			desc = L["coloreverywhere_desc"],
			order = 220
		}
	}
	
	
	local class, level, subgroup
	
	local function ColorPlayer(name)
		 class, level, subgroup = module:GetData(name)
	
		 return Prat:RegisterMatch(Prat.CLR:Player(name, name, class))
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

		return { pattern = "%f[%w]"..namepat.."%f[%W]", matchfunc=ColorPlayer }
	end

	do
		local namePatterns = {}
	
		function module:OnPlayerDataChangedThrottled(Name)
			if self.db.profile.coloreverywhere and Name then
				if not namePatterns[Name] and Name:len() > 1 then
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
			self:CancelTimer(self.timerPlayerData, true)
			self.timerPlayerData = self:ScheduleTimer("OnPlayerDataChangedThrottled", 1, Name)
		end
	end
  return
end ) -- Prat:AddModuleToLoad