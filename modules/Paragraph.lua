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
Name: PratParagraph
Revision: $Revision: 80705 $
Author(s): Curney (asml8ed@gmail.com)
Thanks to: Wubin for helping me understand variables better
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Paragraph
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that gives options for paragraphs in chat windows (defaults=left-aligned text, linespacing=0).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

-- Get Utility Libraries
local PRAT_MODULE = Prat:RequestModuleName("Paragraph")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
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
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, Namespace="Paragraph")@
)
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
	    adjustlinks = false,
	}
} )

do
	local justifyoption = {
			name = function(info) return Prat.HookedFrameList[info[#info]] or "" end,
			desc = L["justification_name"],
			type="select",
			get = function(info) return info.handler.db.profile.justification[info[#info]] end,
			set = function(info, v) info.handler.db.profile.justification[info[#info]] = v info.handler:OnValueChanged(info, v) end,
			values = { ["RIGHT"] = L["Right"], ["CENTER"] = L["Center"], ["LEFT"] =  L["Left"]},
			hidden = function(info) return Prat.HookedFrameList[info[#info]] == nil end,
		}
	
	Prat:SetModuleOptions(module, {
	        name = L["Paragraph"],
	        desc = L["Chat window paragraph options."],
	        type = "group",
	        args = {
	            justification = {
	                name = L["justification_name"],
	                desc = L["justification_desc"],
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