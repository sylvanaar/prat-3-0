--if Prat.BN_CHAT then return end -- Removed in 3.3.5 

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
Revision: $Revision: r24999 $
Author(s): Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Clear
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Adds /clear (or /cls) and /clearall (or /clsall) commands for clearing chat frames (default=off).
Dependencies: Prat
Credits: Code taken almost entirely from Chatter by Antiarc
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Buttons")

if PRAT_MODULE == nil then 
    return 
end


local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
    ["Buttons"] = true,
    ["Chat window button options."] = true,
    ["chatmenu_name"] = "Show Chat Menu",
    ["chatmenu_desc"] = "Toggles chat menu on and off.",
    ["Show Arrows"] = true,
    ["Toggle showing chat arrows for each chat window."] = true, 
    ["Show Chat%d Arrows"] = true,
    ["Toggles navigation arrows on and off."] = true,
    ["scrollReminder_name"] = "Show ScrollDown Reminder",
    ["scrollReminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
    ["Set Position"] = true,
    ["Sets position of chat menu and arrows for all chat windows."] = true,
    ["Default"] = true,
    ["Right, Inside Frame"] = true,
    ["Right, Outside Frame"] = true,
    ["alpha_name"] = "Set Alpha",
    ["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
    ["showmenu_name"] = "Show Menu",
    ["showmenu_desc"] = "Show Chat Menu",
    ["showbnet_name"] = "Show Social Menu",
    ["showbnet_desc"] = "Show Social Menu",
    })
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Buttons")@
)
--@end-non-debug@]===]


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = true,
		scrollReminder = true,
		showButtons = true,
		showBnet = true,
		showMenu = true,
	}
} )

Prat:SetModuleOptions(module.name, {
        name = L["Buttons"],
        desc = L["Chat window button options."],
        type = "group",
        args = {
		    showButtons = { 
				name = L["Show Arrows"],
				desc = L["Toggle showing chat arrows for each chat window."],
				type = "toggle",
				order = 100
			},
		    scrollReminder = { 
				name = L["scrollReminder_name"],
				desc = L["scrollReminder_desc"],
				type = "toggle",
				order = 110 
			},
		    showBnet = { 
				name = L["showbnet_name"],
				desc = L["showbnet_desc"],
				type = "toggle",
				order = 120 
			},
		    showMenu = { 
				name = L["showmenu_name"],
				desc = L["showmenu_desc"],
				type = "toggle",
				order = 130 
			},						
        }
    }
)

--[[------------------------------------------------
	Module Event Functions
------------------------------------------------]]--
local fmt = _G.string.format


local function hide(self)
	if not self.override then
		self:Hide()
	end
	self.override = nil
end

function module:OnModuleEnable()
    local buttons3 = Prat.Addon:GetModule("OriginalButtons", true)
    if buttons3 and buttons3:IsEnabled() then
        self.disabledB3 = true
        buttons3.db.profile.on = false
        buttons3:Disable()
        LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")
    end

    self:ApplyAllSettings()
	
	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)

	--self:SecureHook("FCF_SetButtonSide")

end

function module:ApplyAllSettings()
	if not self.db.profile.showButtons then
		self:HideButtons()
	else
	    self:ShowButtons()
	end

	self:UpdateMenuButtons()
	
	self:AdjustMinimizeButtons()
	
	self:AdjustButtonFrames(self.db.profile.showButtons)
	
    self:UpdateReminder()
end

function module:OnModuleDisable()
	self:DisableBottomButton()
	self:ShowButtons()
	
	Prat.UnregisterAllChatEvents(self)
end

function module:UpdateReminder()
	local v = self.db.profile.scrollReminder
	if v then
		module:EnableBottomButton()
	elseif self.buttonsEnabled then
		module:DisableBottomButton()
	end
end

function module:OnValueChanged(info, b)
    self:ApplyAllSettings()
end

function module:UpdateMenuButtons()
    if self.db.profile.showBnet then
        FriendsMicroButton:Show()
    else
        FriendsMicroButton:Hide()
    end

    if self.db.profile.showMenu then
    	ChatFrameMenuButton:SetScript("OnShow", nil)
	    ChatFrameMenuButton:Show()
	else
    	ChatFrameMenuButton:SetScript("OnShow", hide)
        ChatFrameMenuButton:Hide()	
    end
end
function module:HideButtons()
    self:UpdateMenuButtons()
    
	local upButton, downButton, bottomButton, min

	for name, frame in pairs(Prat.Frames) do
		upButton = _G[name.."ButtonFrameUpButton"]
		upButton:SetScript("OnShow", hide)
		upButton:Hide()
		downButton = _G[name.."ButtonFrameDownButton"]
		downButton:SetScript("OnShow", hide)
		downButton:Hide()
		bottomButton = _G[name.."ButtonFrameBottomButton"]
		bottomButton:SetScript("OnShow", hide)
		bottomButton:Hide()
		bottomButton:SetParent(frame)
		
		self:FCF_SetButtonSide(frame)
	end
	
	self:AdjustMinimizeButtons()
end

function module:AdjustButtonFrames(visible)
    for name, frame in pairs(Prat.Frames) do
        local f = _G[name.."ButtonFrame"]
        
        if visible then
            f:SetScript("OnShow", nil)
            f:Show()
            f:SetWidth(29)
        else
            f:SetScript("OnShow", hide)    
            f:Hide()    
            f:SetWidth(0.1)
        end
    end
end

function module:AdjustMinimizeButtons()
    for name, frame in pairs(Prat.Frames) do
		local min = _G[name.."ButtonFrameMinimizeButton"]
		
		if min then 
		    min:ClearAllPoints()
		    
		    min:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", 2, 2)
		    --min:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", -32, -4);
		    
    		min:SetParent(_G[frame:GetName().."Tab"])
    
            min:SetScript("OnShow", 
                                function(self)
                                    if frame.isDocked then
                                        self:Hide()
                                    end
                                end )
                                
            min:SetScript("OnClick", 
                                function(self) 
    								FCF_MinimizeFrame(frame, strupper(frame.buttonSide))
    							end )
    	end
	end    
end

function module:ShowButtons()
	self:Unhook("FCF_SetButtonSide")
    self:UpdateMenuButtons()
	local upButton, downButton, bottomButton

	for name, frame in pairs(Prat.Frames) do
		upButton = _G[name.."ButtonFrameUpButton"]
		upButton:SetScript("OnShow", nil)
		upButton:Show()
		downButton = _G[name.."ButtonFrameDownButton"]
		downButton:SetScript("OnShow", nil)
		downButton:Show()
		bottomButton = _G[name.."ButtonFrameBottomButton"]
		bottomButton:SetScript("OnShow", nil)
		bottomButton:Show()
		bottomButton:SetParent(_G[name.."ButtonFrame"])
		
--		frame.buttonSide = nil
--		bottomButton:ClearAllPoints()
--		bottomButton:SetPoint("BOTTOMRIGHT", _G[name.."ButtonFrame"], "BOTTOMLEFT", 2, 2)
--		bottomButton:SetPoint("BOTTOMLEFT", _G[name.."ButtonFrame"], "BOTTOMLEFT", -32, -4);
		--FCF_UpdateButtonSide(frame)
		self:FCF_SetButtonSide(frame)
	end
	
	self:AdjustMinimizeButtons()	
end

--[[ - - ------------------------------------------------
	Core Functions
--------------------------------------------- - ]]--

function module:FCF_SetButtonSide(chatFrame, buttonSide)
	local f = _G[chatFrame:GetName().."ButtonFrameBottomButton"]
	local bf = _G[chatFrame:GetName().."ButtonFrame"]
	
	if self.db.profile.showButtons then
    	f:ClearAllPoints()
        f:SetPoint("BOTTOM", bf, "BOTTOM", 0, 0)
	else
    	f:ClearAllPoints()
        f:SetPoint("BOTTOMRIGHT", chatFrame, "BOTTOMRIGHT", 2, 2)
    end
end


function module:EnableBottomButton()
	if self.buttonsEnabled then return end
	self.buttonsEnabled = true
	for name, f in pairs(Prat.Frames) do
		self:SecureHook(f, "ScrollUp")
		self:SecureHook(f, "ScrollToTop", "ScrollUp")
		self:SecureHook(f, "PageUp", "ScrollUp")
					
		self:SecureHook(f, "ScrollDown")
		self:SecureHook(f, "ScrollToBottom", "ScrollDownForce")
		self:SecureHook(f, "PageDown", "ScrollDown")

		local button = _G[name .. "ButtonFrameBottomButton"]
		
		if button then
    		if f:GetCurrentScroll() ~= 0 then
    			button.override = true
    			button:Show()	
    		else
    			button:Hide()
    		end
        end
	end
end

function module:DisableBottomButton()
	if not self.buttonsEnabled then return end
	self.buttonsEnabled = false
	for name, f in pairs(Prat.Frames) do
		if f then
			self:Unhook(f, "ScrollUp")
			self:Unhook(f, "ScrollToTop")
			self:Unhook(f, "PageUp")					
			self:Unhook(f, "ScrollDown")
			self:Unhook(f, "ScrollToBottom")
			self:Unhook(f, "PageDown")
			local button = _G[name.. "ButtonFrameBottomButton"]
			button:Hide()
		end
	end
end

function module:ScrollUp(frame)
	local button = _G[frame:GetName() .. "ButtonFrameBottomButton"]
	button.override = true
	button:Show()
end

function module:ScrollDown(frame)
	if frame:GetCurrentScroll() == 0 then
		local button = _G[frame:GetName() .. "ButtonFrameBottomButton"]
		button:Hide()	
	end
end

function module:ScrollDownForce(frame)
	local button = _G[frame:GetName() .. "ButtonFrameBottomButton"]
	button:Hide()	
end

--function module:AddMessage(frame, text, ...)
function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
	local button = _G[frame:GetName() .. "ButtonFrameBottomButton"]

	if not button then return end
	if frame:GetCurrentScroll() > 0 then
		button.override = true
		button:Show()
	else
		button:Hide()	
	end
end


  return
end ) -- Prat:AddModuleToLoad