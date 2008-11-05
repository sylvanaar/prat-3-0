local SMFHax = Prat:NewModule("SMFHax", "AceHook-3.0")

SMFHax.fs_pool = {}

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

function SMFHax:OnModuleEnable()
    self:RawHook("ChatFrame_OnUpdate", true)
end

function SMFHax:OnModuleDisable()
	self:UnhookAll()

	self:ClearColumn1()

	for k,v in pairs(Prat.HookedFrames) do
		if v:IsShown() then 
			v:Hide()
			v:Show()
		end
	end
end

function SMFHax:ClearColumn1()
	for k,v in pairs(self.fs_pool) do
		for k2, v2 in pairs(v) do
			v2:SetText("")
		end
	end
end

function SMFHax:ChatFrame_OnUpdate(this, ...)	
    if this:GetID() ~=2 then
        self:SplitFontStrings(this, this:GetRegions())
    end

	self.hooks["ChatFrame_OnUpdate"](this, ...)
end

function SMFHax:SplitFontStrings(this, ...)
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
		if self.twocolumn then
			if not self.fs_pool[this:GetID()] then
				self.fs_pool[this:GetID()] = {}
			end
	
			local pool = self.fs_pool[this:GetID()]
			if not pool[n] then
				pool[n] = this:CreateFontString(this:GetName().."LeftExtra"..n)
				pool[n]:SetJustifyV("TOP")
	        end
		end

		if o:GetNumPoints() ~= 0 then
			if self.twocolumn then
	            fs = pool[n]
	            
				fs:ClearAllPoints()
			
				if not last then 
					fs:SetPoint("BOTTOMLEFT", this , "BOTTOMLEFT", 0, 0)
				else
					fs:SetPoint("BOTTOMLEFT", last, "TOPLEFT", 0, 0)
				end
				
				fs:SetFont(o:GetFont())
	
				last = fs
	
	            o:ClearAllPoints()
			end

			
			local l = o:GetText()

			if self.twocolumn then
				if l:sub(1,1) ~= " " then
					local pos = l:find("|r")
					if pos then 	
						fs:SetText(l:sub(1, pos+1))
						o:SetText(" "..l:sub(pos+2))	
					end
				end
	
	            o:SetPoint("BOTTOMLEFT", fs, "BOTTOMRIGHT", 0 , 0)
	            o:SetPoint("RIGHT", this, "RIGHT", 0 , 0)
			
				-- Ensure proper text wrappring
				o:SetWidth(o:GetRight()-o:GetLeft())
		
				fs:SetHeight(o:GetHeight())
			end

			-- Playerlink hover-fade effect
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

			if self.twocolumn then
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
    end

	del(tmp)
end




Prat:AddModuleExtension(function() 
	local module = Prat.Addon:GetModule("Timestamps", true)
	
	if not module then return end

	local L = module.L

	module.pluginopts["TwoColumnFrames"] = {  
		twocolumn =  {
			type = "toggle",
			name = L["twocolumn_name"],
			desc = L["twocolumn_desc"],
			order = 185
		}
	}

    local orgOME = module.OnModuleEnable
	function module:OnModuleEnable(...) 
		orgOME(self, ...)

		if self.db.profile.twocolumn then
			SMFHax:Enable()
			SMFHax.twocolumn = true
		end
	end

	local ovc = module.OnValueChanged
	function module:OnValueChanged(info, b)
		ovc(self, info, b)

		if info[#info] == "twocolumn" then
			if SMFHax.twocolumn ~= b then
				SMFHax.twocolumn = b
				if b then
					SMFHax:Enable()
				else
					SMFHax:ClearColumn1()
				end
			end
		end
	end
end ) -- Module Extension


Prat:AddModuleExtension(function() 
	local module = Prat.Addon:GetModule("PlayerNames", true)
	
	if not module then return end

	local L = module.L
	
	module.pluginopts["HoverHilight"] = {  
		hoverhilight =  {
			type = "toggle",
			name = L["hoverhilight_name"],
			desc = L["hoverhilight_desc"],
			order = 230
		}
	}
	

	local function hoverOnHyperlinkEnter(frame, link, ...)
		local linktype = link:match("^([^:]+)")
		if linktype == "player" then
			SMFHax.overPlayer = link:match("^[^:]+:([^:%]||]+)")
		end
	end
	
	local function hoverOnHyperlinkLeave(frame, ...)
		SMFHax.overPlayer = nil
	end

	local function hoverHilight(enable)
		if (enable) then
			SMFHax:Enable()
			for k,v in pairs(Prat.HookedFrames) do
				SMFHax:HookScript(v, "OnHyperlinkEnter", hoverOnHyperlinkEnter)
				SMFHax:HookScript(v, "OnHyperlinkLeave", hoverOnHyperlinkLeave)
			end
		else
			for k,v in pairs(Prat.HookedFrames) do
				SMFHax:Unhook(v, "OnHyperlinkEnter")
				SMFHax:Unhook(v, "OnHyperlinkLeave")
			end
		end
	end

    local orgOME = module.OnModuleEnable
	function module:OnModuleEnable(...) 
		orgOME(self, ...)

		if self.db.profile.hoverhilight then
			hoverHilight(true)
		end
	end

	local ovc = module.OnValueChanged
	function module:OnValueChanged(info, b)
		ovc(self, info, b)

		if info[#info] == "hoverhilight" then
			hoverHilight(b)
		end
	end
end ) -- Module Extension