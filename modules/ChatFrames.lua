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
Name: PratChatFrames
Revision: $Revision: 80703 $
Author(s): Curney (asml8ed@gmail.com)
           Sylvanaar (sylvanaar@mindspring.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChatFrames
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that adds options for changing chat window parameters.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local Prat = Prat

local PRAT_MODULE = Prat:RequestModuleName("Frames")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat.GetLocalizer({})

L:AddLocale("enUS", {
    ["Frames"] = true,
    ["Chat window frame parameter options"] = true,
    ["minchatwidth_name"] = "Set Minimum Width",
    ["minchatwidth_desc"] = "Sets the minimum width for all chat windows.",
    ["maxchatwidth_name"] = "Set Maximum Width",
    ["maxchatwidth_desc"] = "Sets the maximum width for all chat windows.",
    ["minchatheight_name"] = "Set Minimum Height",
    ["minchatheight_desc"] = "Sets the minimum height for all chat windows.",
    ["maxchatheight_name"] = "Set Maximum Height",
    ["maxchatheight_desc"] = "Sets the maximum height for all chat windows.",
    ["mainchatonload_name"] = "Force Main Chat Frame On Load",
    ["mainchatonload_desc"] = "Automatically select the first chat frame and make it active on load.",
	["framealpha_name"] = "Set Chatframe Alpha",
	["framealpha_desc"] = "Conrols the transparency of the chatframe when you hover over it with your mouse.",
} )


local mod = Prat:NewModule(PRAT_MODULE)


Prat:SetModuleDefaults(mod.name, {
	profile = {
        on = true,
        minchatwidth = 160,
        minchatwidthdefault = 160,
        maxchatwidth = 800,
        maxchatwidthdefault = 800,
        minchatheight = 120,
        minchatheightdefault = 120,
        maxchatheight = 600,
        maxchatheightdefault = 600,
        mainchatonload = true,
        framealpha = DEFAULT_CHATFRAME_ALPHA
	}
})

do
	local frameoption = {
		name = function(info) return L[info[#info].."_name"] end,
		desc = function(info) return L[info[#info].."_desc"] end,
		type="range", min=25, max=1024, step=1
	}
	
	Prat:SetModuleOptions(mod.name, {
	        name = L["Frames"],
	        desc = L["Chat window frame parameter options"],
	        type = "group",
	        args = {
	    		minchatwidth = frameoption,
			    maxchatwidth = frameoption,
			    minchatheight = frameoption,
			    maxchatheight = frameoption,
			    framealpha = {
					name = L["framealpha_name"],
					desc = L["framealpha_desc"],
					type="range", min=0.0, max=1.0, step=.01, order=190,
				},
	--		    mainchatonload = 200,
	        }
	    }
	)
end


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

Prat:SetModuleInit(mod, function(self) mod:GetDefaults() end)

function mod:OnModuleEnable()
    self:ConfigureAllChatFrames(true)
end

function mod:OnModuleDisable()
    self:ConfigureAllChatFrames(false)
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- make ChatFrame1 the selected chat frame
function mod:AceEvent_FullyInitialized()
    if self.db.profile.mainchatonload then
        FCF_SelectDockFrame(ChatFrame1)
    end
end

-- set parameters for each chatframe
function mod:ConfigureAllChatFrames(enabled)
    for _,v in pairs(Prat.Frames) do
        self:SetParameters(v, enabled)
    end
    
    DEFAULT_CHATFRAME_ALPHA = self.db.profile.framealpha
end

-- get the defaults for chat frame1 max/min width/height for use when disabling the module
function mod:GetDefaults()
    local cf = _G["ChatFrame1"]
	local prof = self.db.profile

    local minwidthdefault, minheightdefault = cf:GetMinResize()
    local maxwidthdefault, maxheightdefault = cf:GetMaxResize()

    prof.minchatwidthdefault = minwidthdefault
    prof.maxchatwidthdefault = maxwidthdefault
    prof.minchatheightdefault = minheightdefault
    prof.maxchatheightdefault = maxheightdefault

    prof.initialized = true
end

-- set the max/min width/height for a chatframe
function mod:SetParameters(cf, enabled)
	local prof = self.db.profile
    if enabled then
        cf:SetMinResize(prof.minchatwidth, prof.minchatheight)
        cf:SetMaxResize(prof.maxchatwidth, prof.maxchatheight)
    else
        cf:SetMinResize(prof.minchatwidthdefault, prof.minchatheightdefault)
        cf:SetMaxResize(prof.maxchatwidthdefault, prof.maxchatheightdefault)
    end
end


function mod:OnValueChanged()
	self:ConfigureAllChatFrames(true)
end

  return
end ) -- Prat:AddModuleToLoad