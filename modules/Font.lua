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
Name: PratFont
Revision: $Revision: 80703 $
Author(s): Curney (asml8ed@gmail.com)
Inspired by: ChatFrameExtender by Satrina
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Font
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that allows you to set the font face and size for chat windows (default=blizz default font face at size 12).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Font")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["Font"] = true,
    ["Chat window font options."] = true,
    ["Set Separately"] = true,
    ["Toggle setting options separately for each chat window."] = true,
    ["Set Font Face"] = true,
    ["Set the text font face for all chat windows."] = true,
    ["rememberfont_name"] = "Remember Font",
    ["rememberfont_desc"] = "Remember your font choice and restore it at startup.",    
    ["Set Font Size"] = true,
    ["Set text font size for each chat window."] = true,
    ["Set ChatFrame%d Font Size"] = true,
    ["Set text font size."] = true,
    ["Auto Restore Font Size"] = true,
    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = true,
    ["outlinemode_name"] = "Set Outline Mode",
    ["outlinemode_desc"] = "Sets mode for the outline around the font.",
    ["None"] = true, 
    ["Outline"] = true, 
    ["Thick Outline"] = true,
    ["monochrome_name"] = "Toggle Monochrome",
    ["monochrome_desc"] = "Toggles monochrome coloring of the font.",
    ["shadowcolor_name"] = "Set Shadow Color",
    ["shadowcolor_desc"] = "Set the color of the shadow effect.", 
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, Namespace="Font")@
)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module, {
	profile = {
	    on = true,
	    fontface = "",
	    rememberfont = false,
	    size = {["*"]=12},
	    autorestore = false, 
	    outlinemode = "",
	    monochrome = false,
	    shadowcolor = {
	        r = 0,
	        g = 0,
	        b = 0,
	        a = 1,
	    },
	}
})

--Prat:SetModuleInit(module, function(self)
--	local _
--	for name,frame in pairs(Prat.Frames) do
--		_, defaults.profile.size[name], _ = frame:GetFont()
--	end
--
--	self.db:RegisterDefaults(defaults)
--end )



---- Fix the defaults that are being used for the chatframe text font size.
--for i=1,NUM_CHAT_WINDOWS do
--    local cf = getglobal("ChatFrame"..i)
--    local _, s, _ = cf:GetFont()    
--    module.defaultDB.size[i]  = s
--end
--
---- build the options menu using prat templates
--module.toggleOptions = { 
--    rememberfont = 120,
--    sep125_sep = 125,
--    sep145_sep = 145,
--    outlinemode = {
--        type = "text",
--        order = 150,
--        get = function() return module.db.profile.outlinemode end,
--        set = function(v) module.db.profile.outlinemode = v; module:ConfigureAllChatFrames() end,
--        validate = {[""] = L["None"], ["OUTLINE"] = L["Outline"], ["THICKOUTLINE"] = L["Thick Outline"]},
--    },
--    monochrome = {
--        type = "toggle",
--        order = 160,
--        get = function() return module.db.profile.monochrome end,
--        set = function(v) module.db.profile.monochrome = v; module:ConfigureAllChatFrames() end,
--    },
--    shadowcolor = { 
--        type = "color", 
--        order = 170, 
--        get = "GetShadowClr", 
--        set = "SetShadowClr",
--    },
--}

--local fontslist = {}
--local media 
--local cf, i, v, k
--
--function module:BuildFontList()
--    for i,v in ipairs(fontslist) do
--        fontslist[i] = nil
--    end
--    
--    for k,v in pairs(media:List(media.MediaType.FONT)) do
--        table.insert(fontslist, v)
--    end
--end
--
--function module:SharedMedia_Registered(mediatype, name)
--	self:Debug("SharedMedia_Registered", mediatype, name)
--    if mediatype == media.MediaType.FONT then
--        self:BuildFontList()
--    end
--end

local frameOption = 
{
--  name = string.format(L["Set ChatFrame%d Font Size"], num),
	name = function(info) return Prat.FrameList[info[#info]] or "" end,
    desc = L["Set text font size."], 
    type = "range",
	get = "GetSubValue",
	set = "SetSubValue",
    min = 4,
    max = 22,
    step = 1,
	hidden = function(info) return Prat.FrameList[info[#info]] == nil end,
}


Prat:SetModuleOptions(module, {
        name = L["Font"],
        desc = L["Chat window font options."],
        type = "group",
        args = {
            fontface = {
                name = L["Set Font Face"],
                desc = L["Set the text font face for all chat windows."],
                type = "select",
				dialogControl = 'LSM30_Font',
				values = AceGUIWidgetLSMlists.font,
                order = 110,
            },
            size = {
                name = L["Set Font Size"],
                desc = L["Set text font size for each chat window."],
                type = "group",
				inline = true,
                order = 130,
                args = {
                    ChatFrame1 = frameOption,
                    ChatFrame2 = frameOption,
                    ChatFrame3 = frameOption,
                    ChatFrame4 = frameOption,
                    ChatFrame5 = frameOption,
                    ChatFrame6 = frameOption,
                    ChatFrame7 = frameOption,
                }
            },
		
--			sep130 = { name="", order = 130, type = "header"},

		    outlinemode = {
				name = L["outlinemode_name"],
				desc = L["outlinemode_desc"],
		        type = "select",
		        order = 150,
		        values = {[""] = L["None"], ["OUTLINE"] = L["Outline"], ["THICKOUTLINE"] = L["Thick Outline"]},
		    },
		    monochrome = {
		        type = "toggle",
				name = L["monochrome_name"],
				desc = L["monochrome_desc"],
		        order = 160,
		    },
		    shadowcolor = { 
				name = L["shadowcolor_name"],
				desc = L["shadowcolor_desc"],
		        type = "color", 
		        order = 170, 
		        get = "GetColorValue", 
		        set = "SetColorValue",
		    },
			rememberfont = {
		        type = "toggle",
		        order = 120,
				name = L["rememberfont_name"],
				desc = L["rememberfont_desc"],
			},
--            autorestore = { 
--                name = L["Auto Restore Font Size"],
--                desc = L["Workaround a Blizzard bug which changes the font size when you open a system menu."],
--                type = "toggle",
--                order = 140,
--                get = function() return self.db.profile.autorestore end,
--                set = function(v) self.db.profile.autorestore = v; self:SetAutoRestore(v) end
--            },
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function module:OnModuleEnable()
    self.oldsize = {}

    for k, cf in pairs(Prat.Frames) do
        local _, s, _ = cf:GetFont()    
        self.oldsize[k]  = s
    end

    if not self.db.profile.rememberfont then
        self.db.profile.fontface = nil
    end

    self:ConfigureAllChatFrames()
--    -- This will resolve the issue where, when font sizes are set smaller than 12,
--    -- the size resets to 12 when closing UIOptionsFrame.
--    self:SetAutoRestore(self.db.profile.autorestore)
    self:SecureHook("FCF_SetChatWindowFontSize")
end

function module:OnModuleDisable()
    self:UnhookAll()
    for k, cf in pairs(Prat.Frames) do
        self:SetFontSize(cf,self.oldsize[k] or 12)
    end
    self:SetFontMode("")
end

function module:GetSubValue(info)
		return self.db.profile[info[#info-1]][info[#info]]
end
function module:SetSubValue(info, b)
	self.db.profile[info[#info-1]][info[#info]] = b
	self:OnValueChanged(info, b)
end


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--

function module:ConfigureAllChatFrames()
	local db = self.db.profile

    if self.db.profile.fontface then
        self:SetFont(self.db.profile.fontface)
    end


    -- apply font size settings
    for k,v in pairs(Prat.Frames) do
        self:SetFontSize(v, db.size[k])
    end
    -- apply font flag settings
    if not db.monochrome then
        self:SetFontMode(db.outlinemode)
    else
        self:SetFontMode(db.outlinemode..", MONOCHROME")
    end
end

function module:SetFontSize(cf, size)
    FCF_SetChatWindowFontSize(nil, cf, size)
end



function module:SetFont(font)
    fontfile = Prat.Media:Fetch(Prat.Media.MediaType.FONT, font)
    for k, cf in pairs(Prat.Frames) do
        local f, s, m = cf:GetFont()    
        cf:SetFont(fontfile, s, m)
    end
end

function module:SetFontMode(mode, monochrome)
    for k, cf in pairs(Prat.Frames) do
        local f, s, m = cf:GetFont()    
        cf:SetFont(f, s, mode)
	
		if monochrome then
	        local c = self.db.profile.shadowcolor
	        cf:SetShadowColor(c.r, c.g, c.b, c.a)
		end
    end
end

function module:GetShadowClr()
    local h = self.db.profile.shadowcolor or {}
    return h.r or 1.0, h.g or 1.0, h.b or 1.0
end

function module:SetShadowClr(r,g,b)
	local db = self.db.profile
    db.shadowcolor = db.shadowcolor or {}
    local h = db.shadowcolor
    h.r, h.g, h.b = r, g, b
    self:ConfigureAllChatFrames()
end

function module:FCF_SetChatWindowFontSize(fcfself, chatFrame, fontSize)
	if ( not chatFrame ) then
		chatFrame = FCF_GetCurrentChatFrame();
	end
	if ( not fontSize ) then
		fontSize = fcfself.value;
	end    
    if self.db and self.db.profile.on then
       self.db.profile.size[chatFrame:GetName()] = fontSize
    end
end

--function module:SetAutoRestore(val)
--    self.db.profile.autorestore = val
--    if self.db.profile.autorestore then
--    	if not self:IsHooked("UpdateMicroButtons") then self:SecureHook("UpdateMicroButtons", "ConfigureAllChatFrames") end
--    else
--    	if self:IsHooked("UpdateMicroButtons") then self:Unhook("UpdateMicroButtons") end
--    end
--end    


module.OnValueChanged = module.ConfigureAllChatFrames
module.OnSubValueChanged = module.ConfigureAllChatFrames
module.OnColorValueChanged = module.ConfigureAllChatFrames

  return
end ) -- Prat:AddModuleToLoad