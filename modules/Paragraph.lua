﻿---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2011  Prat Development Team
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

-- Get Utility Libraries
local PRAT_MODULE = Prat:RequestModuleName("Paragraph")

if PRAT_MODULE == nil then 
    return 
end

local PL = Prat:GetLocalizer({})

--@debug@
PL:AddLocale("enUS", {
    ["Paragraph"] = true,
    ["Chat window paragraph options."] = true,
    ["justification_name"] = "Set Alignment",
    ["justification_desc"] = "Set horizontal alignment for each chat window",
    ["Line Spacing"] = true,
    ["Set the line spacing for all chat windows."] = true,
    ["adjustlinks_name"] = "Fix placement of player/item links",
    ["adjustlinks_desc"] = "Adjust links to restore clickability on centered or right-aligned text.",    
	["Center"] = true,
	["Right"] = true,
	["Left"] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@



--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("enUS", L)


--@localization(locale="itIT", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("itIT", L)


--@localization(locale="ptBR", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("ptBR", L)

--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("frFR",L)



--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("deDE", L)

--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("koKR",L)
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("esMX",L)
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("ruRU",L)
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("zhCN",L)
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("esES",L)
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Paragraph")@
PL:AddLocale("zhTW",L)
--@end-non-debug@]===]




----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80705 $
--]]
--

--

--

--

--

-- 

--

-- create prat module
local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module, {
	profile = {
	    on = false,
	    justification = { ["*"] = "LEFT" },
	}
} )

do
	local justifyoption = {
			name = function(info) return Prat.FrameList[info[#info]] or "" end,
			desc = PL["justification_name"],
			type="select",
			get = function(info) return info.handler.db.profile.justification[info[#info]] end,
			set = function(info, v) info.handler.db.profile.justification[info[#info]] = v info.handler:OnValueChanged(info, v) end,
			values = { ["RIGHT"] = PL["Right"], ["CENTER"] = PL["Center"], ["LEFT"] =  PL["Left"]},
			hidden = function(info) return Prat.FrameList[info[#info]] == nil end,
		}
	
	Prat:SetModuleOptions(module, {
	        name = PL["Paragraph"],
	        desc = PL["Chat window paragraph options."],
	        type = "group",
	        args = {
	            justification = {
	                name = PL["justification_name"],
	                desc = PL["justification_desc"],
	                type = "group",
					inline = true,
					args = {
						ChatFrame1 = justifyoption,
						ChatFrame2 = justifyoption,
						ChatFrame3 = justifyoption,
						ChatFrame4 = justifyoption,
						ChatFrame5 = justifyoption,
						ChatFrame6 = justifyoption,
						ChatFrame7 = justifyoption,
					}
				},

				info = {
					name = "Note: Playerlinks, itemlinks, and any other link type will not work when justification is set to anything other than 'Left'",
					type = "description",
					order = 110
				}
	        }
	    }
	)
end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function module:OnModuleEnable()
    self:ConfigureAllChatFrames(true)
end

function module:OnModuleDisable()
    self:ConfigureAllChatFrames(false)
end

function module:OnValueChanged()
	self:ConfigureAllChatFrames(true)
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:ConfigureAllChatFrames(enable)
	local prof = self.db.profile
	for k,v in pairs(Prat.Frames) do
        v:SetJustifyH(enable and prof.justification[k] or "LEFT")
	end
end

  return
end ) -- Prat:AddModuleToLoad