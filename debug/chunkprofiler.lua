
--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local SVC_NAMESPACE = SVC_NAMESPACE

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]]--

if ChunkSizes then
CNTR = CNTR or 1
	local function MemoryUse(name)
		_G.UpdateAddOnMemoryUsage()
		return _G.GetAddOnMemoryUsage(name)
	end
	
	local location = _G.debugstack():match("ns\\(.-)\\")
	
	ChunkSizes[CNTR] = MemoryUse(location) or "?"
CNTR = CNTR + 1
end

