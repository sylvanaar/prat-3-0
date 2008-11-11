Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Experimental")

if PRAT_MODULE == nil then 
    return 
end

PE = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")



function PE:OnModuleEnable()
	

	CHAT_CONFIG_CHAT_RIGHT[7] = {
		text = CHAT_MSG_WHISPER_INFORM,
		type = "WHISPER_INFORM",
		checked = function () return IsListeningForMessageType("WHISPER"); end;
		func = function (checked) ToggleChatMessageGroup(checked, "WHISPER"); end;
	}

	CHAT_CONFIG_CHAT_LEFT[#CHAT_CONFIG_CHAT_LEFT].text = CHAT_MSG_WHISPER

	Prat.RegisterChatEvent(self, Prat.Events.ENABLED, function() Prat:Print("|cffff4040EXPERIMENTAL MODULE ENABLED|r") end )
end

--local function DBG_FONT(...)  DBG:Debug("FONT", ...) end
--local function DUMP_FONT(...) DBG:Dump("FONT", ...) end

function PE:OnModuleDisable()
end

PE.lines = {}
function PE:GetLines()
    wipe(self.lines)
    self:AddLines(self.lines, ChatFrame1:GetRegions())
end


function PE:AddLines(lines, ...)
  for i=select("#", ...),1,-1 do
    local x = select(i, ...)
    if x:GetObjectType() == "FontString" and not x:GetName() then
        table.insert(lines, x)
    end
  end
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--


  return
end ) -- Prat:AddModuleToLoad