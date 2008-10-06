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
})




local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = false,
		scrollReminder = true,
		showButtons = true
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
	if not self.db.profile.showButtons then
		self:HideButtons()
	end
	
	local v = self.db.profile.scrollReminder
	if v then
		module:EnableBottomButton()
	elseif self.buttonsEnabled then
		module:DisableBottomButton()
	end
	
	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)

	--self:RawHook("FCF_SetButtonSide", true)
end

function module:OnModuleDisable()
	self:DisableBottomButton()
	self:ShowButtons()
	
	Prat.UnregisterAllChatEvents(self)
end

function module:OnValueChanged(info, b)
	if info[#info] == "showButtons" then
		if not self.db.profile.showButtons then
			self:HideButtons()
		else
			self:ShowButtons()
		end
	end
end

function module:HideButtons()
	ChatFrameMenuButton:Hide()
	local upButton, downButton, bottomButton

	for name, frame in pairs(Prat.Frames) do
		upButton = _G[name.."UpButton"]
		upButton:SetScript("OnShow", hide)
		upButton:Hide()
		downButton = _G[name.."DownButton"]
		downButton:SetScript("OnShow", hide)
		downButton:Hide()
		bottomButton = _G[name.."BottomButton"]
		bottomButton:SetScript("OnShow", hide)
		bottomButton:Hide()
--		self:FCF_SetButtonSide(frame)
	end
end

function module:ShowButtons()
--	self:Unhook("FCF_SetButtonSide")
	ChatFrameMenuButton:Show()
	local upButton, downButton, bottomButton

	for name, frame in pairs(Prat.Frames) do
		upButton = _G[name.."UpButton"]
		upButton:SetScript("OnShow", nil)
		upButton:Show()
		downButton = _G[name.."DownButton"]
		downButton:SetScript("OnShow", nil)
		downButton:Show()
		bottomButton = _G[name.."BottomButton"]
		bottomButton:SetScript("OnShow", nil)
		bottomButton:Show()
		
		frame.buttonSide = nil
		bottomButton:ClearAllPoints()
		bottomButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", -32, -4);
		FCF_UpdateButtonSide(frame)
	end
end

--[[ - - ------------------------------------------------
	Core Functions
--------------------------------------------- - ]]--

function module:FCF_SetButtonSide(chatFrame, buttonSide)
	local f = _G[chatFrame:GetName().."BottomButton"]
	f:ClearAllPoints()
	f:SetPoint("TOPRIGHT", chatFrame, "TOPRIGHT", 2, 2)
end


function module:EnableBottomButton()
	if self.buttonsEnabled then return end
	self.buttonsEnabled = true
	for name, f in pairs(Prat.Frames) do
		self:Hook(f, "ScrollUp", true)
		self:Hook(f, "ScrollToTop", "ScrollUp", true)
		self:Hook(f, "PageUp", "ScrollUp", true)
					
		self:Hook(f, "ScrollDown", true)
		self:Hook(f, "ScrollToBottom", "ScrollDownForce", true)
		self:Hook(f, "PageDown", "ScrollDown", true)

		if f:GetCurrentScroll() ~= 0 then
			local button = _G[name .. "BottomButton"]
			button.override = true
			button:Show()	
		end
	end
end

function module:DisableBottomButton()
	if not self.buttonsEnabled then return end
	self.buttonsEnabled = false
	for i = 1, NUM_CHAT_WINDOWS do
		local f = _G["ChatFrame" .. i]
		if f then
			self:Unhook(f, "ScrollUp")
			self:Unhook(f, "ScrollToTop")
			self:Unhook(f, "PageUp")					
			self:Unhook(f, "ScrollDown")
			self:Unhook(f, "ScrollToBottom")
			self:Unhook(f, "PageDown")
			
			if f ~= COMBATLOG then
				self:Unhook(f, "AddMessage")
			end
			local button = _G["ChatFrame" .. i .. "BottomButton"]
			button:Hide()
		end
	end
end

function module:ScrollUp(frame)
	local button = _G[frame:GetName() .. "BottomButton"]
	button.override = true
	button:Show()
end

function module:ScrollDown(frame)
	if frame:GetCurrentScroll() == 0 then
		local button = _G[frame:GetName() .. "BottomButton"]
		button:Hide()	
	end
end

function module:ScrollDownForce(frame)
	local button = _G[frame:GetName() .. "BottomButton"]
	button:Hide()	
end

--function module:AddMessage(frame, text, ...)
function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
	local button = _G[frame:GetName() .. "BottomButton"]
	if frame:GetCurrentScroll() > 0 then
		button.override = true
		button:Show()
	else
		button:Hide()	
	end
end


  return
end ) -- Prat:AddModuleToLoad