--Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Experimental")

if PRAT_MODULE == nil then 
    return 
end

local PE = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")



function PE:OnModuleEnable()
	
	local ts = Prat.Addon:GetModule("Timestamps", true)

	if ts == nil then 
		Prat:Print("Experimental Module Requires Timestamps Module")
		self:Disable() 
		return 
	end

	ts.db.profile.colortimestamp = true

	if not ts:IsEnabled() then
		ts:Enable()
	end

    self:RawHook("ChatFrame_OnUpdate", true)
--    self:Hook("ChatFrame_OnUpdate", true)

	for k,v in pairs(Prat.HookedFrames) do
		self:HookScript(v, "OnHyperlinkEnter")
		self:HookScript(v, "OnHyperlinkLeave")
	end


	CHAT_CONFIG_CHAT_RIGHT[7] = {
		text = CHAT_MSG_WHISPER_INFORM,
		type = "WHISPER_INFORM",
		checked = function () return IsListeningForMessageType("WHISPER"); end;
		func = function (checked) ToggleChatMessageGroup(checked, "WHISPER"); end;
	}

	CHAT_CONFIG_CHAT_LEFT[7].text = CHAT_MSG_WHISPER

	Prat.RegisterChatEvent(self, Prat.Events.ENABLED, function() Prat:Print("|cffff4040EXPERIMENTAL MODULE ENABLED|r") end )
end

--local function DBG_FONT(...)  DBG:Debug("FONT", ...) end
--local function DUMP_FONT(...) DBG:Dump("FONT", ...) end

function PE:OnModuleDisable()
	self:UnhookAll()

	for k,v in pairs(self.fs_pool) do
		for k2, v2 in pairs(v) do
			v2:SetText("")
		end
	end

	for k,v in pairs(Prat.HookedFrames) do
		if v:IsShown() then 
			v:Hide()
			v:Show()
		end
	end
end

function PE:OnHyperlinkEnter(frame, link, ...)
	local linktype = link:match("^([^:]+)")
	if linktype == "player" then
		self.overPlayer = link:match("^[^:]+:([^:%]||]+)")
	end
end

function PE:OnHyperlinkLeave(frame, ...)
	self.overPlayer = nil
end


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--


function PE:ChatFrame_OnUpdate(...)	
	if Prat.WOTLK then 
		this = ...
	end

    if this:GetID() ~=2 then
        self:SplitFontStrings(this, this:GetRegions())
    end

	self.hooks["ChatFrame_OnUpdate"](...)
end


function PE:DumpRegion(frame, region)
    local o = select(region, frame:GetRegions())

    Prat.PrintLiteral(o)


end

-- /print experimental:FlashTimeStamp(0.5, 0.5, 1, 10, 1, 1, 0.5)
function PE:FlashTimeStamp(n, fadeInTime, fadeOutTime, flashDuration, showWhenDone, flashInHoldTime, flashOutHoldTime)

	local f = SELECTED_CHAT_FRAME
	local ts = _G[f:GetName().."LeftExtra"..tostring(n)]

	UIFrameFlash(ts, fadeInTime, fadeOutTime, flashDuration, showWhenDone, flashInHoldTime, flashOutHoldTime)

end


PE.fs_pool = {}

local new, del
do
	local cache = setmetatable({}, {__mode='k'})
	function new()
		local t = next(cache)
		if t then
			cache[t] = nil
			return t
		else
			return {}
		end
	end
	function del(t)
		for k in pairs(t) do
			t[k] = nil
		end
		cache[t] = true
		return nil
	end
end



function PE:SplitFontStrings(this, ...)
    local fs
	local tmp = new()
    for n=1,select("#", ...) do
        local o = select(n, ...)
		if  o and o:GetObjectType() == "FontString" and not o:GetName() then
            table.insert(tmp, o)
		end
    end
	
	local last
    for n,o in ipairs(tmp) do
        --self.fs[n] = o  -- debug
		if not self.fs_pool[this:GetID()] then
			self.fs_pool[this:GetID()] = {}
		end

		local pool = self.fs_pool[this:GetID()]
		if not pool[n] then
			pool[n] = this:CreateFontString(this:GetName().."LeftExtra"..n)
			pool[n]:SetJustifyV("TOP")
        end

		if o:GetNumPoints() ~= 0 then
            fs = pool[n]
            
			fs:ClearAllPoints()
            o:ClearAllPoints()
		
			if not last then 
				fs:SetPoint("BOTTOMLEFT", this , "BOTTOMLEFT", 0, 0)
			else
				fs:SetPoint("BOTTOMLEFT", last, "TOPLEFT", 0, 0)
			end
			
			fs:SetFont(o:GetFont())

			last = fs
			
			local l = o:GetText()
			if l:sub(1,1) ~= " " then
				local pos = l:find("|r")
				if pos then 	
					fs:SetText(l:sub(1, pos-1))
					o:SetText(" "..l:sub(pos))	
				end
			end


            o:SetPoint("BOTTOMLEFT", fs, "BOTTOMRIGHT", 0 , 0)
            o:SetPoint("RIGHT", this, "RIGHT", 0 , 0)
			
			-- Ensure proper text wrappring
			o:SetWidth(o:GetRight()-o:GetLeft())
			fs:SetHeight(o:GetHeight())

			-- Deny text wrapping, and force ... to be displayed
			--o:SetHeight(fs:GetHeight())

			if self.overPlayer then
				if l:match("player:"..self.overPlayer) then
					o:SetAlpha(1)
					if not o:IsShown() then
					    o.restoreTo = 0
						o:Show()
					end
				else
				    if o.restoreTo == 0 then 
						o:Hide()
						o.restoreTo =  nil
					else
						o:SetAlpha(0.50)
						o.restoreTo = 1
					end
				end
			else
			    if o.restoreTo == 0 then 
					o:Hide()
					o.restoreTo = nil
				elseif o.restoreTo == 1 then
					o.restoreTo = nil
					o:SetAlpha(1)
				end
			end

			fs:SetAlpha(o:GetAlpha())

			if fs:GetTop() > this:GetTop() or l:trim():len() == 0 then
				fs:Hide()
			end

			if o:GetTop() > this:GetTop() then
				o:Hide()
			end

			if o:IsShown() then
				fs:Show()
			else
				fs:Hide()
			end
		end
    end

	del(tmp)
end

--  return
--end ) -- Prat:AddModuleToLoad