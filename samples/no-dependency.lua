--
-- How to handle a Prat event without a dependency on Prat, or anything else.
--

local eventLibrary
local NoDepAddon = {}

function NoDepAddon:RegisterForAPratEvent()
	if not eventLibrary then
	    eventLibrary = AceLibrary and AceLibrary:HasInstance("AceEvent-2.0") and AceLibrary("AceEvent-2.0") or nil
	end

	if eventLibrary then
	     eventLibrary:RegisterEvent("Prat_FrameMessage", function(...) NoDepAddon:Prat_FrameMessage(...) end )
	     eventLibrary:RegisterEvent("Prat_PreAddMessage", function(...) NoDepAddon:Prat_PreAddMessage(...) end )
    end
end

function NoDepAddon:Prat_FrameMessage(message, frame, event)

end


function NoDepAddon:Prat_PreAddMessage(message, frame, event, text, r, g, b, id)

end