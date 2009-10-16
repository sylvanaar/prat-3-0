-- This is the editbox module from Chatter by Antiarc

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Editbox")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["Editbox"] = true,
	["Editbox options."] = true,
	["Top"] = true,
	["Bottom"] = true,
	["Free-floating"] = true,
	["Free-floating, Locked"] = true,
	["Background texture"] = true,
	["Border texture"] = true,
	["Background color"] = true,
	["Border color"] = true,
	["Background Inset"] = true,
	["Tile Size"] = true,
	["Edge Size"] = true,
	["Attach to..."] = true,
	["Attach edit box to..."] = true,
	["Color border by channel"] = true,
	["Sets the frame's border color to the color of your currently active channel"] = true,
	["Use Alt key for cursor movement"] = true,
	["Requires the Alt key to be held down to move the cursor in chat"] = true,
	["Font"] = true,
	["Select the font to use for the edit box"] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Editbox")@
)
--@end-non-debug@]===]



local mod = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")


local Media = Prat.Media
local backgrounds, borders, fonts = {}, {}, {}
local CreateFrame = _G.CreateFrame
local max = _G.max
local pairs = _G.pairs
local select = _G.select

local VALID_ATTACH_POINTS = {
	TOP = L["Top"],
	BOTTOM = L["Bottom"],
	FREE = L["Free-floating"],
	LOCK = L["Free-floating, Locked"]
}


Prat:SetModuleOptions(mod, {
    name = L["Editbox"],
    desc = L["Editbox options."],
    type = "group",
    args = {
		background = {
			type = "select",
			name = L["Background texture"],
			desc = L["Background texture"],
			values = backgrounds,
			get = function() return mod.db.profile.background end,
			set = function(info, v)
				mod.db.profile.background = v
				mod:SetBackdrop()
			end
		},
		border = {
			type = "select",
			name = L["Border texture"],
			desc = L["Border texture"],
			values = borders,
			get = function() return mod.db.profile.border end,
			set = function(info, v)
				mod.db.profile.border = v
				mod:SetBackdrop()
			end
		},
		backgroundColor = {
			type = "color",
			name = L["Background color"],
			desc = L["Background color"],
			hasAlpha = true,
			get = function()
				local c = mod.db.profile.backgroundColor
				return c.r, c.g, c.b, c.a
			end,
			set = function(info, r, g, b, a)
				local c = mod.db.profile.backgroundColor
				c.r, c.g, c.b, c.a = r, g, b, a
				mod:SetBackdrop()
			end
		},
		borderColor = {
			type = "color",
			name = L["Border color"],
			desc = L["Border color"],
			hasAlpha = true,
			get = function()
				local c = mod.db.profile.borderColor
				return c.r, c.g, c.b, c.a
			end,
			set = function(info, r, g, b, a)
				local c = mod.db.profile.borderColor
				c.r, c.g, c.b, c.a = r, g, b, a
				mod:SetBackdrop()
			end
		},
		inset = {
			type = "range",
			name = L["Background Inset"],
			desc = L["Background Inset"],
			min = 1,
			max = 64,
			step = 1,
			bigStep = 1,
			get = function() return mod.db.profile.inset end,
			set = function(info, v)
				mod.db.profile.inset = v
				mod:SetBackdrop()
			end
		},
		tileSize = {
			type = "range",
			name = L["Tile Size"],
			desc = L["Tile Size"],
			min = 1,
			max = 64,
			step = 1,
			bigStep = 1,
			get = function() return mod.db.profile.tileSize end,
			set = function(info, v)
				mod.db.profile.tileSize = v
				mod:SetBackdrop()
			end
		},
		edgeSize = {
			type = "range",
			name = L["Edge Size"],
			desc = L["Edge Size"],
			min = 1,
			max = 64,
			step = 1,
			bigStep = 1,
			get = function() return mod.db.profile.edgeSize end,
			set = function(info, v)
				mod.db.profile.edgeSize = v
				mod:SetBackdrop()
			end
		},
		attach = {
			type = "select",
			name = L["Attach to..."],
			desc = L["Attach edit box to..."],
			get = function() return mod.db.profile.attach end,
			values = VALID_ATTACH_POINTS,
			set = function(info, v)
				mod.db.profile.attach = v
				mod:SetAttach()
			end
		},
		colorByChannel = {
			type = "toggle",
			name = L["Color border by channel"],
			desc = L["Sets the frame's border color to the color of your currently active channel"],
			get = function()
				return mod.db.profile.colorByChannel
			end,
			set = function(info, v)
				mod.db.profile.colorByChannel = v
				if v then
					mod:RawHook("ChatEdit_UpdateHeader", "SetBorderByChannel", true)
				else
					if mod:IsHooked("ChatEdit_UpdateHeader") then
						mod:Unhook("ChatEdit_UpdateHeader")
						local c = mod.db.profile.borderColor
						mod.frame:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
					end
				end
			end
		},
		useAltKey = {
			type = "toggle",
			name = L["Use Alt key for cursor movement"],
			desc = L["Requires the Alt key to be held down to move the cursor in chat"],
			get = function()
				return mod.db.profile.useAlt
			end,
			set = function(info, v)
				mod.db.profile.useAlt = v
				ChatFrameEditBox:SetAltArrowKeyMode(v)
			end
		},
		font = {
			type = "select",
			name = L["Font"],
			desc = L["Select the font to use for the edit box"],
			values = fonts,
			get = function() return mod.db.profile.font end,
			set = function(i, v)
				mod.db.profile.font = v
				local f, s, m = ChatFrameEditBox:GetFont()
				ChatFrameEditBox:SetFont(Media:Fetch("font", v), s, m)
			end
		}
	}
} )

Prat:SetModuleDefaults(mod.name, {
	profile = {
		on = true,
		background = "Blizzard Tooltip",
		border = "Blizzard Dialog",
		backgroundColor = {r = 0, g = 0, b = 0, a = 1},
		borderColor = {r = 1, g = 1, b = 1, a = 1},
		inset = 4,
		edgeSize = 24,
		tileSize = 16,
		attach = "BOTTOM",
		font = (function()
			local f = ChatFrameEditBox:GetFont()
			for k,v in pairs(Media:HashTable("font")) do
				if v == f then return k end
			end
		end)()
	}
} )


function mod:LibSharedMedia_Registered()
	for k, v in pairs(Media:List("background")) do
		backgrounds[v] = v
	end
	for k, v in pairs(Media:List("border")) do
		borders[v] = v
	end
	for k, v in pairs(Media:List("font")) do
		fonts[v] = v
	end
end

Prat:SetModuleInit(mod, 
	function(self)
		--self.db = Chatter.db:RegisterNamespace("EditBox", defaults)
		--Media.RegisterCallback(mod, "LibSharedMedia_Registered")
		self.frame = CreateFrame("Frame", nil, ChatFrameEditBox)
		self.frame:SetAllPoints(ChatFrameEditBox)
		ChatFrameEditBox:SetFrameStrata("TOOLTIP")
		self.frame:SetFrameStrata("FULLSCREEN_DIALOG")
		
		self.lDrag = CreateFrame("Frame", nil, ChatFrameEditBox)
		self.lDrag:SetWidth(15)
		self.lDrag:SetPoint("TOPLEFT", ChatFrameEditBox, "TOPLEFT")
		self.lDrag:SetPoint("BOTTOMLEFT", ChatFrameEditBox, "BOTTOMLEFT")
	
		self.rDrag = CreateFrame("Frame", nil, ChatFrameEditBox)
		self.rDrag:SetWidth(15)
		self.rDrag:SetPoint("TOPRIGHT", ChatFrameEditBox, "TOPRIGHT")
		self.rDrag:SetPoint("BOTTOMRIGHT", ChatFrameEditBox, "BOTTOMRIGHT")
		
		self.lDrag.left = true
	end )

function mod:OnEnable()
	self:LibSharedMedia_Registered()
	ChatFrameEditBox:SetAltArrowKeyMode(mod.db.profile.useAlt)
	local left, mid, right = select(6, ChatFrameEditBox:GetRegions())
	left:Hide()
	mid:Hide()
	right:Hide()
	self.frame:Show()
	self:SetBackdrop()
	self:SetAttach(nil, self.db.profile.editX, self.db.profile.editY, self.db.profile.editW)
	
	local f, s, m = ChatFrameEditBox:GetFont()
	ChatFrameEditBox:SetFont(Media:Fetch("font", self.db.profile.font), s, m)
	
	if self.db.profile.colorByChannel then
		self:RawHook("ChatEdit_UpdateHeader", "SetBorderByChannel", true)
	end
end

function mod:OnDisable()
	ChatFrameEditBox:SetAltArrowKeyMode(true)
	local left, mid, right = select(6, ChatFrameEditBox:GetRegions())
	left:Show()
	mid:Show()
	right:Show()
	self.frame:Hide()
	self:SetAttach("BOTTOM")
	ChatFrameEditBox:SetFont(Media:Fetch("font", defaults.profile.font), 14)
end

function mod:GetOptions()
	return options
end

function mod:SetBackdrop()
	self.frame:SetBackdrop({
		bgFile = Media:Fetch("background", self.db.profile.background),
		edgeFile = Media:Fetch("border", self.db.profile.border),
		tile = true,
		tileSize = self.db.profile.tileSize,
		edgeSize = self.db.profile.edgeSize,
		insets = {left = self.db.profile.inset, right = self.db.profile.inset, top = self.db.profile.inset, bottom = self.db.profile.inset}
	})
	local c = self.db.profile.backgroundColor
	self.frame:SetBackdropColor(c.r, c.g, c.b, c.a)
	
	local c = self.db.profile.borderColor
	self.frame:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
end

function mod:SetBorderByChannel(...)
	self.hooks.ChatEdit_UpdateHeader(...)
	local attr = ChatFrameEditBox:GetAttribute("chatType")
	if attr == "CHANNEL" then
		local chan = ChatFrameEditBox:GetAttribute("channelTarget")
		if chan == 0 then
			local c = self.db.profile.borderColor
			self.frame:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
		else	
			local r, g, b = GetMessageTypeColor("CHANNEL" .. chan)
			self.frame:SetBackdropBorderColor(r, g, b, 1)
		end
	else
		local r, g, b = GetMessageTypeColor(attr)
		self.frame:SetBackdropBorderColor(r, g, b, 1)
	end
end

do
	local function startMoving(self)
		self:StartMoving()
	end

	local function stopMoving(self)
		self:StopMovingOrSizing()
		mod.db.profile.editX = self:GetLeft()
		mod.db.profile.editY = self:GetTop()
		mod.db.profile.editW = self:GetRight() - self:GetLeft()
	end

	local cfHeight
	local function constrainHeight()
		ChatFrameEditBox:SetHeight(cfHeight)
	end
	
	local function startDragging(self)
		cfHeight = ChatFrameEditBox:GetHeight()
		self:GetParent():StartSizing(not self.left and "TOPRIGHT" or "TOPLEFT")
		self:SetScript("OnUpdate", constrainHeight)
	end
	
	local function stopDragging(self)
		local parent = self:GetParent()
		parent:StopMovingOrSizing()
		self:SetScript("OnUpdate", nil)
		mod.db.profile.editX = parent:GetLeft()
		mod.db.profile.editY = parent:GetTop()
		mod.db.profile.editW = parent:GetWidth()
	end

	function mod:SetAttach(val, x, y, w)
		local val = val or self.db.profile.attach
		if not x and val == "FREE" then
			x, y, w = ChatFrameEditBox:GetLeft(), ChatFrameEditBox:GetTop(), max(ChatFrameEditBox:GetWidth(), (ChatFrameEditBox:GetRight() or 0) - (ChatFrameEditBox:GetLeft() or 0))
		end
		if not w or w < 10 then w = 100 end
		ChatFrameEditBox:ClearAllPoints()
		if val ~= "FREE" then
			ChatFrameEditBox:SetMovable(false)
			self.lDrag:EnableMouse(false)
			self.rDrag:EnableMouse(false)
			ChatFrameEditBox:SetScript("OnMouseDown", nil)
			ChatFrameEditBox:SetScript("OnMouseUp", nil)
			self.lDrag:EnableMouse(false)
			self.rDrag:EnableMouse(false)			
			self.lDrag:SetScript("OnMouseDown", nil)
			self.rDrag:SetScript("OnMouseDown", nil)
			self.lDrag:SetScript("OnMouseUp", nil)
			self.rDrag:SetScript("OnMouseUp", nil)
		end
		
		if val == "TOP" then
			ChatFrameEditBox:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT")
			ChatFrameEditBox:SetPoint("BOTTOMRIGHT", ChatFrame1, "TOPRIGHT")
		elseif val == "BOTTOM" then			
			ChatFrameEditBox:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT")
			ChatFrameEditBox:SetPoint("TOPRIGHT", ChatFrame1, "BOTTOMRIGHT")
		elseif val == "FREE" then
			ChatFrameEditBox:EnableMouse(true)
			ChatFrameEditBox:SetMovable(true)
			ChatFrameEditBox:SetResizable(true)
			ChatFrameEditBox:SetScript("OnMouseDown", startMoving)
			ChatFrameEditBox:SetScript("OnMouseUp", stopMoving)
			ChatFrameEditBox:SetWidth(w)
			ChatFrameEditBox:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
			ChatFrameEditBox:SetMinResize(40, 1)
			
			self.lDrag:EnableMouse(true)
			self.rDrag:EnableMouse(true)
			
			self.lDrag:SetScript("OnMouseDown", startDragging)
			self.rDrag:SetScript("OnMouseDown", startDragging)

			self.lDrag:SetScript("OnMouseUp", stopDragging)
			self.rDrag:SetScript("OnMouseUp", stopDragging)
		elseif val == "LOCK" then
			ChatFrameEditBox:SetWidth(self.db.profile.editW or w)
			ChatFrameEditBox:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.db.profile.editX or x, self.db.profile.editY or y)
		end
	end
end

--function mod:Info()
--	return L["Lets you customize the position and look of the edit box"]
--end

  return
end ) -- Prat:AddModuleToLoad
