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
Name: module
Revision: $Revision: 82149 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_PlayerNames by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Scroll
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that enables mousewheel scrolling and TheDownLow for chat windows (default=on).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Scroll")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["Scroll"] = true,
    ["Chat window scrolling options."] = true,
    ["mousewheel_name"] = "Enable MouseWheel",
    ["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
    ["Set MouseWheel Speed"] = true,
    ["Set number of lines mousewheel will scroll."] = true,
    ["Set Ctrl+MouseWheel Speed"] = true,
    ["Set number of lines mousewheel will scroll when ctrl is pressed."] = true,
    ["lowdown_name"] = "Enable TheLowDown",
    ["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
    ["Set TheLowDown Delay"] = true,
    ["Set time to wait before jumping to the bottom of chat windows."] = true,
	["Text scroll direction"] = true,
	["Control whether text is added to the frame at the top or the bottom."] = true,
	["Top"] = "Top to bottom",
	["Bottom"] = "Bottom to top",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, Namespace="Scroll")@
)
--@end-non-debug@]===]




----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 82149 $
--]]
--

--

--

--

-- 

--



local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")


Prat:SetModuleDefaults(module.name, {
	profile = {
        on = true,
        mousewheel = { ["*"] = true },
        normscrollspeed = 1,
        ctrlscrollspeed = 3,
        lowdown = { ["*"] = true },
        lowdowndelay = 20,
		scrolldirection = "BOTTOM"     
	}
} )


---- build the options menu using prat templates
--module.toggleOptions = {
--    mousewheel_handler = {},
--    sep135_sep = 135,
--    lowdown_handler = {}
--}


Prat:SetModuleOptions(module.name, {
    name = L["Scroll"],
    desc = L["Chat window scrolling options."],
    type = "group",
    args = {
		 mousewheel = {
			name = L["mousewheel_name"],
			desc = L["mousewheel_desc"],
			type = "multiselect",
			order = 110,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
		 },
         normscrollspeed = {
            name = L["Set MouseWheel Speed"],
            desc = L["Set number of lines mousewheel will scroll."],
            type = "range",
            order = 120,
            min = 1,
            max = 21,
            step = 1,
        },
		scrolldirection = {
			type = "select", 
            name = L["Text scroll direction"],
            desc = L["Control whether text is added to the frame at the top or the bottom."],
			values = { ["TOP"] = L["Top"], ["BOTTOM"] = L["Bottom"] },
		},
        ctrlscrollspeed = {
            name = L["Set Ctrl+MouseWheel Speed"],
            desc = L["Set number of lines mousewheel will scroll when ctrl is pressed."],
            type = "range",
            order = 130,
            min = 3,
            max = 21,
            step = 3,
        },
--		lowdown = {
--			name = L["lowdown_name"],
--			desc = L["lowdown_desc"],
--			type = "multiselect",
--			order = 110,
--			values = Prat.HookedFrameList,
--			get = "GetSubValue",
--			set = "SetSubValue"
--		},		
--        lowdowndelay = {
--            name = L["Set TheLowDown Delay"],
--            desc = L["Set time to wait before jumping to the bottom of chat windows."],
--            type = "range",
--            order = 220,
--            min = 1,
--            max = 60,
--            step = 1,
--        },
    }
})

module.OnSubValueChanged = module.ConfigureAllFrames


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function module:OnModuleEnable()
	self:ConfigureAllFrames()	
end



-- things to do when the module is disabled
function module:OnModuleDisable()
    for k, v in pairs(Prat.Frames) do
        self:MouseWheel(v,false)
--       	self:LowDown(v,false)
    end

	self:SetScrollDirection("BOTTOM")
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function module:ConfigureAllFrames()
    for k, v in pairs(Prat.Frames) do
        self:MouseWheel(v, self.db.profile.mousewheel[k])
--       	self:LowDown(v, self.db.profile.lowdown[k])
    end

	self:SetScrollDirection(self.db.profile.scrolldirection)
end

do
	local function scrollFrame(cf, up)
		if IsShiftKeyDown() then
	        if up then cf:ScrollToTop() else cf:ScrollToBottom() end
		else
		    if IsControlKeyDown() then
		        for i = 1,module.db.profile.ctrlscrollspeed do
		            if up then cf:ScrollUp() else cf:ScrollDown() end
		        end
		    else
		        for i = 1,module.db.profile.normscrollspeed do
		            if up then cf:ScrollUp() else cf:ScrollDown() end
		        end
		    end
		end
	end
	
	function module:MouseWheel(cf, enabled)
	    if enabled then
	        cf:SetScript("OnMouseWheel", function(cf, arg1) scrollFrame(cf, arg1 > 0) end)
	        cf:EnableMouseWheel(true)
	    else
	        cf:SetScript("OnMouseWheel", nil)
	        cf:EnableMouseWheel(false)
	    end
	end
end

--function module:LowDown(cf, enabled)
--	local name = cf:GetName()
--	local funcs = {"ScrollUp", "ScrollDown", "ScrollToTop", "PageUp", "PageDown"}
--
--    if enabled then
--		for _,func in ipairs(funcs) do
--			local f = function(cf)
--				if self:IsEventScheduled(name.."DownTimeout") then self:CancelScheduledEvent(name.."DownTimeout") end
--				self:ScheduleEvent(name.."DownTimeout", self.ResetFrame, self.db.profile.lowdowndelay, self, cf)
--			end
--			self:SecureHook(cf, func, f)
--		end
--	else
--		for _,func in ipairs(funcs) do
--			if self:IsHooked(cf, func) then self:Unhook(cf, func) end
--		end
--	end
--end

function module:ResetFrame(cf)
	if not cf:AtBottom() then
		cf:ScrollToBottom()
	end
end

function module:SetScrollDirection(direction)
    for k, v in pairs(Prat.HookedFrames) do
		self:ScrollDirection(v, direction)
    end

	self.db.profile.scrolldirection = direction
end

function module:ScrollDirection(cf, direction)
	if cf:GetInsertMode() ~= direction then 
		cf:SetMaxLines(cf:GetMaxLines())
		cf:SetInsertMode(direction)
	end
end



  return
end ) -- Prat:AddModuleToLoad