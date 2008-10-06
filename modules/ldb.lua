tinsert(Prat.EnableTasks, function(self)
	if not LibStub:GetLibrary("LibDataBroker-1.1", true) then return end
	LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Prat", {
		type = "launcher",
		icon = "Interface\\Addons\\"..Prat.FolderLocation.."\\textures\\chat-bubble",
		OnClick = function(frame, button)
			LibStub("AceConfigDialog-3.0"):Open("Prat")
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddLine("Prat 3.0 (Alpha)")
		end,
	})
end)
