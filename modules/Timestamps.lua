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
Name: PratTimestamps
Revision: $Revision: 80569 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Author(s): Curney (asml8ed@gmail.com)
	   Krtek (krtek4@gmail.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Timestamps
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds configurable timestamps to chat windows (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 


local PRAT_MODULE = Prat:RequestModuleName("Timestamps")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["Timestamps"] = true,
	["Chat window timestamp options."] = true,
	["Show Timestamp"] = true,
	["Toggle showing timestamp for each window."] = true,
	["show_name"] = "Show Timestamp",
	["show_desc"] = "Toggle showing timestamp on and off for each window.",
	["Set the timestamp format"] = true,
	["Format All Timestamps"] = true,
	["colortimestamp_name"] = "Color Timestamp",
	["colortimestamp_desc"] = "Toggle coloring the timestamp on and off.",
	["Set Timestamp Color"] = true,
	["Sets the color of the timestamp."] = true,
	["localtime_name"] = "Use Local Time",
	["localtime_desc"] = "Toggle using local time on and off.",
	["space_name"] = "Show Space",
	["space_desc"] = "Toggle adding space after timestamp on and off.",
	["twocolumn_name"] = "2 Column Chat",
	["twocolumn_desc"] = "Place the timestamps in a separate column so the text does not wrap underneath them",
    ["HH:MM:SS AM (12-hour)"] = true,
    ["HH:MM:SS (12-hour)"] = true,
    ["HH:MM:SS (24-hour)"] = true,
    ["HH:MM (12-hour)"] = true,
    ["HH:MM (24-hour)"] = true,
    ["MM:SS"] = true,
    ["Post-Timestamp"] = true,
    ["Pre-Timestamp"] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, Namespace="Timestamps")@
)
--@end-non-debug@]===]




----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80569 $
--]]
--

--

--

--
--

--

--


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")
module.L = L

module.pluginopts = {}

-- Chatter (Antiarc) 
local FORMATS = {
	["%I:%M:%S %p"] = L["HH:MM:SS AM (12-hour)"],
	["%I:%M:%S"] = L["HH:MM (12-hour)"],
	["%X"] = L["HH:MM:SS (24-hour)"],
	["%I:%M"] = L["HH:MM (12-hour)"],
	["%H:%M"] = L["HH:MM (24-hour)"],
	["%M:%S"] = L["MM:SS"],
}

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	    show = {["*"]=true},
		formatcode = "%X",
        formatpre = "[",
        formatpost = "]",
		["timestampcolor"] = {
			["b"] = 0.592156862745098,
			["g"] = 0.592156862745098,
			["r"] = 0.592156862745098,
			a = 1
		},
	    colortimestamp = true,
	    space = true,
	    localtime = true,
		twocolumn = false,
	}
})

Prat:SetModuleOptions(module.name, {
	name = L["Timestamps"],
	desc = L["Chat window timestamp options."],
	type = "group",
	plugins = module.pluginopts,
	args = {
		show = {
			name = L["Show Timestamp"],
			desc = L["Toggle showing timestamp for each window."],
			type = "multiselect",
			order = 120,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
		},

		helpheader = {
			name = "Timestamp Text Format",
			type = "header",
			order = 129,
        },

		formatpre = {
			name = L["Pre-Timestamp"],
			desc = L["Pre-Timestamp"],
			type = "input",
			order = 130,
			usage = "<string>",		
		},
		formatcode = {
			name = L["Format All Timestamps"],
			desc = L["Set the timestamp format"],
			type = "select",
			order = 131,
            values = FORMATS,
		},
		formatpost = {
			name = L["Post-Timestamp"],
			desc = L["Post-Timestamp"],
			type = "input",
			order = 132,
			usage = "<string>",		
		},
		colortimestamp = {
			name = L["colortimestamp_name"],
			desc = L["colortimestamp_desc"],
			type = "toggle",
			get = function(info) return info.handler:GetValue(info) end,		
			order = 171,
		},
		localtime = {
			name = L["localtime_name"],
			desc = L["localtime_desc"],
			type = "toggle",		
			order = 171,
		},
		space = {
			name = L["space_name"],
			desc = L["space_desc"],
			type = "toggle",		
			order = 171,
		},
		otherheader = {
			name = "Other Formatting Options",
			type = "header",
			order = 170,
        },
		timestampcolor = {
			name = L["Set Timestamp Color"],
			desc = L["Sets the color of the timestamp."],
			type = "color",
			order = 181,
			get = "GetColorValue",
			set = "SetColorValue",
			disabled = "IsTimestampPlain",
		},
	},
})

function module:OnModuleEnable()
	-- For this module to work, it must hook before Prat
    for _,v in pairs(Prat.HookedFrames) do
        self:RawHook(v, "AddMessage", true)
    end

  	self.secondsDifference = 0
	self.lastMinute = select(2, GetGameTime())
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:AddMessage(frame, text, ...)
	if self.db.profile.show[frame:GetName()] and not Prat.loading then
		text = text and self:InsertTimeStamp(text, frame)
	end
	self.hooks[frame].AddMessage(frame, text, ...)
end

function module:IsTimestampPlain()
	return not self.db.profile.colortimestamp
end

local function Timestamp(text)
    if not module:IsTimestampPlain() then
        return Prat.CLR:Colorize(module.db.profile.timestampcolor, text)
    else
        return text
    end
end

function module:PlainTimestampNotAllowed()
	return false
end

function module:InsertTimeStamp(text, cf)
	if type(text) == "string" then
        local db = self.db.profile
        local space = db.space
        local fmt = db.formatpre..db.formatcode..db.formatpost

        if cf and cf:GetJustifyH() == "RIGHT" then
            text = text..(space and " " or "")..Timestamp(self:GetTime(fmt))
        else
            text = Timestamp(self:GetTime(fmt)).."|c00000000|r"..(space and " " or "")..text
        end
    end

	return text
end

function module:GetTime(format)
	if self.db.profile.localtime then
		return date(format)
	else
		local tempDate = date("*t")
		tempDate["hour"], tempDate["min"] = GetGameTime()
		-- taken from FuBar_ClockFu
		if self.lastMinute ~= tempDate["min"] then
			self.lastMinute = select(2, GetGameTime())
			self.secondsDifference = mod(time(), 60)
		end
		tempDate["sec"] = mod(time() - self.secondsDifference, 60)
		return date(format, time(tempDate))
	end
end




  return
end ) -- Prat:AddModuleToLoad
