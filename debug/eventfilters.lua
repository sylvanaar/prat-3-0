
--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local pairs = pairs
local next = next
local issecurevariable = issecurevariable
local SVC_NAMESPACE = SVC_NAMESPACE

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]]--

addMessageFilterEventsRegistered = {}
addMessageFilterAddonsRegistered = {}

if not PrintEventFilterReport then 
    local org_AMEF = _G.ChatFrame_AddMessageEventFilter
    _G.ChatFrame_AddMessageEventFilter = function(event, ...) 
        addMessageFilterEventsRegistered[event] = true 

        local addon = _G.debugstack():match("\n.-ns\\(.-)\\")

        if addon then
            addMessageFilterAddonsRegistered[addon] = true
        end
        return org_AMEF(event, ...) 
    end


    function PrintEventFilterReport()
        Print("|cff80ffffAddons using event filters:|r")
        for addon in pairs(addMessageFilterAddonsRegistered) do
            Print("    "..addon)
        end

        Print("|cff80ffffEvents with filters:|r")
        for event in pairs(addMessageFilterEventsRegistered) do
            Print("    "..event)
        end            
    end
end