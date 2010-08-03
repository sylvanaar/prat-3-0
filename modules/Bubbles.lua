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

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Bubbles")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	module_name = "Bubbles",
	module_desc = "Chat bubble related customizations",
	shorten_name = "Shorten Chat Bubbles",
	shorten_desc = "Shorten the chat bubbles down to a single line each",
	color_name = "Color Chat Bubbles",
	color_desc = "Color the chat bubble border the same as the chat type.",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Bubbles")@
)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	    shorten = false,
	    color = true,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["module_name"],
        desc = L["module_desc"],
        type = "group",
        args = {
        	shorten = { 
				name = L["shorten_name"],
				desc = L["shorten_desc"],
				type = "toggle",
				order = 130 
			},	
        	color = { 
				name = L["color_name"],
				desc = L["color_desc"],
				type = "toggle",
				order = 135
			},				
        }
    }
) 

--[[------------------------------------------------
	Module Event Functions
------------------------------------------------]]--

local BUBBLE_SCAN_THROTTLE = 0.25

-- things to do when the module is enabled
function module:OnModuleEnable()
    self.update = self.update or CreateFrame('Frame');
    self.throttle = BUBBLE_SCAN_THROTTLE

    self.update:SetScript("OnUpdate", 
        function(frame, elapsed) 
            self.throttle = self.throttle - elapsed
            if frame:IsShown() and self.throttle < 0 then
                self.throttle = BUBBLE_SCAN_THROTTLE
                self:FormatBubbles()
            end
        end)

    self:ApplyOptions()
end

function module:ApplyOptions()
	self.shorten = self.db.profile.shorten
	self.color = self.db.profile.color
	
	if self.shorten or self.color then
	    self.update:Show()
	else
        self.update:Hide()
	end
end

function module:OnValueChanged(info, b)
    self:RestoreDefaults()	

	self:ApplyOptions()
end

function module:OnModuleDisable()
    self:RestoreDefaults()
end

function module:FormatBubbles()
    self:IterateChatBubbles("FormatCallback")
end

function module:RestoreDefaults()
    self.update:Hide()
    
    self:IterateChatBubbles("RestoreDefaultsCallback")
end

-- Called for each chatbubble, passed the bubble's frame and its fontstring
function module:FormatCallback(frame, fontstring)
    if self.color then 
        -- Color the bubble border the same as the chat
        frame:SetBackdropBorderColor(fontstring:GetTextColor())
    end
    
    if self.shorten then 
        local wrap = fontstring:CanWordWrap() or 0
        
        -- If the mouse is over, then expand the bubble
        if frame:IsMouseOver() then
            fontstring:SetWordWrap(1)
            fontstring:SetWidth(fontstring:GetWidth())
        elseif wrap == 1 then
            fontstring:SetWordWrap(0)
            fontstring:SetWidth(fontstring:GetWidth())
        end 
    end 
end

-- Called for each chatbubble, passed the bubble's frame and its fontstring
function module:RestoreDefaultsCallback(frame, fontstring)
   frame:SetBackdropBorderColor(1,1,1,1)
   fontstring:SetWordWrap(1)
   fontstring:SetWidth(fontstring:GetWidth())
end

function module:IterateChatBubbles(funcToCall)
    for i=1,WorldFrame:GetNumChildren() do
        local v = select(i, WorldFrame:GetChildren())
        local b = v:GetBackdrop()
        if b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
            for i=1,v:GetNumRegions() do
                local frame = v
                local v = select(i, v:GetRegions())
                if v:GetObjectType() == "FontString" then
                    if type(funcToCall) == "function" then
                        funcToCall(frame, v)
                    else 
                        self[funcToCall](self, frame, v)
                    end
                end
            end
        end
    end
end



  return
end ) -- Prat:AddModuleToLoad