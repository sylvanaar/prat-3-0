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
	shorten_name = "Shorten Bubbles",
	shorten_desc = "Shorten the chat bubbles down to a single line each. Mouse over the bubble to expand the text.",
	color_name = "Color Bubbles",
	color_desc = "Color the chat bubble border the same as the chat type.",
    format_name = "Format Text",
	format_desc = "Apply Prat's formatting to the chat bubble text.",
	icons_name = "Show Raid Icons",
	icons_desc = "Show raid icons in the chat bubbles.",
	font_name = "Use Chat Font",
	font_desc = "Use the same font you are using on the chatframe",
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
	    format = true,
	    icons = true,
        font = true,
	}
} )

local toggleOption = {
		name = function(info) return L[info[#info].."_name"] end,
		desc = function(info) return L[info[#info].."_desc"] end,
		type="toggle", 
}

Prat:SetModuleOptions(module.name, {
        name = L["module_name"],
        desc = L["module_desc"],
        type = "group",
        args = {
        	shorten = toggleOption,
        	color = toggleOption,
        	format = toggleOption,
        	icons = toggleOption,
            font = toggleOption,
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
	self.format = self.db.profile.format
	self.icons = self.db.profile.icons
    self.font = self.db.profile.font and ChatFrame1:GetFont()
	
	if self.shorten or self.color or self.format or self.icons or self.font then
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


    if self.font then
        local a,b,c = fontstring:GetFont()
        fontstring:SetFont(self.font, b, c)
    end

    if self.icons then
        local text = fontstring:GetText() or ""
		local term;
		for tag in string.gmatch(text, "%b{}") do
			term = strlower(string.gsub(tag, "[{}]", ""));
			if ( ICON_TAG_LIST[term] and ICON_LIST[ICON_TAG_LIST[term]] ) then
				text = string.gsub(text, tag, ICON_LIST[ICON_TAG_LIST[term]] .. "0|t");
			end
		end  
		
        fontstring:SetText(text)   
        fontstring:SetWidth(fontstring:GetWidth()) 
    end
  
    if self.format then
        local text = fontstring:GetText() or ""
        local TAIL_MAGIC = " "
        
        if text:sub(-1) ~= TAIL_MAGIC then
            text = Prat.MatchPatterns(text)
            text = Prat.ReplaceMatches(text)
            
            fontstring:SetText(text..TAIL_MAGIC)   
            fontstring:SetWidth(fontstring:GetWidth()) 
        end
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
                    local fontstring = v
                    if type(funcToCall) == "function" then
                        funcToCall(frame, fontstring)
                    else 
                        self[funcToCall](self, frame, fontstring)
                    end
                end
            end
        end
    end
end



  return
end ) -- Prat:AddModuleToLoad