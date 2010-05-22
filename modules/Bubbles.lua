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
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Clear")@
)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["module_name"],
        desc = L["module_desc"],
        type = "group",
        args = {
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
            if self.throttle < 0 then
                self.throttle = 0.25
                self:GetB()
                if B and B:IsVisible() then
    --                print(B:GetWidth(), B:GetHeight())
    --                B.text:SetText(Prat.SplitMessage.MESSAGE)
                    
                   -- B.text:SetText(B.text:GetText())
                    
                end
            end
        end)

end

function module:OnModuleDisable()
    self.update:Hide()
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
                   B.text:SetWordWrap(0)
  --                  print( B.text:GetText())
                end
    end
    return B
end

  return
end ) -- Prat:AddModuleToLoad