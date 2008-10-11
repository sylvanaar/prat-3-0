tinsert(Prat.EnableTasks, function(self) 
	-- register formatting with WIM.
	if(_G.WIM and _G.WIM.RegisterMessageFormatting) then
	   _G.WIM.RegisterMessageFormatting("Prat", Prat.Format);
	end
end )


Prat:AddModuleExtension(function() 
	local module = Prat.Addon:GetModule("CopyChat", true)	
	if not module then return end
	
    local orgOME = module.OnModuleEnable
	function module:OnModuleEnable(...) 
		orgOME(self, ...)
    	WIM.RegisterWidgetTrigger("chat_display", "whisper,chat,w2w,demo", "OnHyperlinkClick", function(...) self:ChatFrame_OnHyperlinkShow(...) end);
	end

  return
end ) -- Prat:AddModuleExtension