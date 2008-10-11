---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2008  Prat Development Team
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
Name: Prat 3.0 (options.lua)
Revision: $Revision: 80963 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat
Forum: http://www.wowace.com/forums/index.php?topic=6243.0
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: The implementation of addon-wide options
]]


--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local LibStub = LibStub
local tonumber = tonumber
local tostring = tostring
local pairs = pairs
local type = type
local Prat = Prat
local setmetatable = setmetatable
local tinsert = tinsert

-- Isolate the environment
setfenv(1, Prat)

--[[ END STANDARD HEADER ]]--

--local L = Prat.Localizations
--
--L:AddLocale("enUS", { 
--	["ChatFrame %d"] = true
--})

local AceConfig = LibStub("AceConfig-3.0")
--local AceConfigDialog = LibStub("AceConfigDialog-3.0")
--local AceConfigCmd = LibStub("AceConfigCmd-3.0")

local moduleControlArgs = {}

Options = {
	type = "group",
	childGroups = "tab",
	get = "GetValue",
	set = "SetValue",
	args = {
		display = {
			type = "group",name = "Display Settings",
			desc = "Chat Frame Control and Look",
			hidden = function(info) end,
			get = "GetValue",
			set = "SetValue",			
			args = {},
			order = 1,
		},
		formatting = {
			type = "group",name = "Chat Formatting",
			desc = "Change the way the lines look and feel",
			hidden = function(info) end,
			get = "GetValue",
			set = "SetValue",			
			args = {},
			order = 2,
		},
		extras = {
			type = "group",name = "Extra Stuff",
			desc = "Msc. Modules",
			hidden = function(info) end,
			get = "GetValue",
			set = "SetValue",			
			args = {},
			order = 3,
		},
		modulecontrol = {
			type = "group",
			name = "Module Control",
			desc = "Control the loading and enabling of Prat's modules.",
			get = "GetValue",
			set = "SetValue",			
			args = moduleControlArgs,
			order = 4,
		}
	}
}

--[[ WitchHunt: [Ammo] ]]--
tinsert(EnableTasks, function(self) 

	local acreg = LibStub("AceConfigRegistry-3.0")
	acreg:RegisterOptionsTable("Prat", Options)
	acreg:RegisterOptionsTable("Prat: "..Options.args.display.name, Options.args.display)
	acreg:RegisterOptionsTable("Prat: "..Options.args.formatting.name, Options.args.formatting)
	acreg:RegisterOptionsTable("Prat: "..Options.args.extras.name, Options.args.extras)
	acreg:RegisterOptionsTable("Prat: "..Options.args.modulecontrol.name, Options.args.modulecontrol)
	acreg:RegisterOptionsTable("Prat: "..Options.args.profiles.name, Options.args.profiles)

	local acdia = LibStub("AceConfigDialog-3.0")
	acdia:AddToBlizOptions("Prat", "Prat")
	acdia:AddToBlizOptions("Prat: "..Options.args.display.name, Options.args.display.name, "Prat")
	acdia:AddToBlizOptions("Prat: "..Options.args.formatting.name, Options.args.formatting.name, "Prat")
	acdia:AddToBlizOptions("Prat: "..Options.args.extras.name, Options.args.extras.name, "Prat")
	acdia:AddToBlizOptions("Prat: "..Options.args.modulecontrol.name, Options.args.modulecontrol.name, "Prat")
	acdia:AddToBlizOptions("Prat: "..Options.args.profiles.name, Options.args.profiles.name, "Prat")

	self:RegisterChatCommand("prat", function() acdia:Open("Prat") end)
end)


do
	local function getModuleFromShortName(shortname)
		for k, v in Addon:IterateModules() do
			if v.moduleName == shortname then
				return v
			end
		end
	end

	local lastReloadMessage = 0
	local function PrintReloadMessage()
		local tm = _G.GetTime()
		if tm - lastReloadMessage > 60 then
			Prat.Print(("This option change may not take full effect until you %s your UI."):format(GetReloadUILink()))
			lastReloadMessage = tm
		end
	end

	local function setValue(info, b)
		local old = Prat.db.profile.modules[info[#info]]
		Prat.db.profile.modules[info[#info]] = b

		if old == 1 or b ==1 then 
			PrintReloadMessage()
		end

		local m = getModuleFromShortName(info[#info])
		if not m then return end
		
		if b == 2 or b == 1 then 
		   m.db.profile.on = false
		   m:Disable()
		elseif b == 3 then
		   m.db.profile.on = true
		   m:Enable()
		end
	end

	local function getValue(info)
 		local v,m
		v = Prat.db.profile.modules[info[#info]]
			
		if v ~= 1 then
			m = getModuleFromShortName(info[#info])
			if m then 
				v = m.db.profile.on and 3 or 2
			end
		end

		return v
	end


	do
		local moduleControlOption = {
			name = function(info) return info[#info] end,
			desc = "Control the load behavior for this module.",
			type = "select",
			style = "radio",
			values = { "|cffA0A0A0Don't Load|r", "|cffff8080Disabled|r", "|cff80ff80Enabled|r" },
			get = getValue,
			set = setValue
		}
	
		function CreateModuleControlOption(name)
			moduleControlArgs[name] = moduleControlOption
		end
	end
end

FrameList = {}
HookedFrameList = {}


tinsert(EnableTasks, function(self) 
	self:SecureHook("FCF_SetWindowName", 
	function()
		for k,v in pairs(HookedFrames) do
			if (v.isDocked == 1) or v:IsShown() then
				HookedFrameList[k] = (v.name)
			else
				HookedFrameList[k] = nil
			end
		end
		for k,v in pairs(Frames) do
			if (v.isDocked == 1) or v:IsShown() then
				FrameList[k] = (v.name)
			else
				FrameList[k] = nil
			end
		end
		LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")
	end)
	local name = _G.GetChatWindowInfo(1)
	_G.FCF_SetWindowName(_G.ChatFrame1, name, 1)
end)
       


	
