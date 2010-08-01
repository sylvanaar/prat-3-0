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
        }
    }
) 

--[[------------------------------------------------
	Module Event Functions
------------------------------------------------]]--

local B

-- things to do when the module is enabled
function module:OnModuleEnable()
    self.update = self.update or CreateFrame('Frame');
    self.throttle = 0.25

    self.update:SetScript("OnUpdate", 
        function(frame, elapsed) 
            self.throttle = self.throttle - elapsed
            if frame:IsShown() and self.throttle < 0 then
                self.throttle = 0.25
                self:GetB()
                if B and B:IsVisible() then
    --                print(B:GetWidth(), B:GetHeight())
    --                B.text:SetText(Prat.SplitMessage.MESSAGE)
                    
                   -- B.text:SetText(B.text:GetText())
                    
                end
            end
        end)

	if self.db.profile.shorten then
	    self.update:Show()
	else
	    self.update:Hide()
	end
end

function module:OnValueChanged(info, b)
	--local field = info[#info]
	if self.db.profile.shorten then
	    self.update:Show()
	else
	    self:UnShorten()
	end
end

function module:OnModuleDisable()
    self:UnShorten()
end

--[[ - - ------------------------------------------------
	Core Functions
--------------------------------------------- - ]]--
function module:GetB()

    local c = {WorldFrame:GetChildren()}
    
    for i,v in ipairs(c) do
        local b = v:GetBackdrop()
        if b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
            B = v
            

        end
    end
    if B and not B.text then 
       
        local c={B:GetRegions()}
         for i,v in ipairs(c) do
            if v:GetObjectType() == "FontString" then
                B.text = v
            end
        end       
    end
    
    if B and B.text and B:IsVisible() then
        if  B.text:GetText() then 
            local wrap = B.text:CanWordWrap() or 0
            if wrap == 1 then
                B.text:SetWordWrap(0)
                B.text:SetWidth(B.text:GetWidth())
            end
  --                  print( B.text:GetText())
        end
    end
    return B
end

function module:UnShorten()
    self.update:Hide()
    
     local c = {WorldFrame:GetChildren()}
    
    for i,v in ipairs(c) do
        local b = v:GetBackdrop()
        if b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background" then

        local c={B:GetRegions()}
            for i,v in ipairs(c) do
                if v:GetObjectType() == "FontString" then
                    v:SetWordWrap(1)
                    v:SetWidth(v:GetWidth())
                end
            end       
        end
    end
    
end

  return
end ) -- Prat:AddModuleToLoad