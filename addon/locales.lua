--[[
Name: Prat 3.0 (locales.lua)
Revision: $Revision: 79217 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat
Forum: http://www.wowace.com/forums/index.php?topic=6243.0
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Implements the chat string sectioning service
]]

--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local setmetatable = setmetatable
local tostring = tostring
local type = type
local pairs = pairs
local GetLocale = GetLocale
local SVC_NAMESPACE = SVC_NAMESPACE

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]]--

--==============
-- Locale
--==============

function AddLocale(L, name, loc)
	if GetLocale() == name then
		for k, v in pairs(loc) do
			if v == true then
				L[k] = k
			else
				L[k] = v
			end
		end
	end
end

local loc_mt = {
		__index = function(t, k)
			_G.error("Locale key " .. tostring(k) .. " is not provided.")
		end
	}

function GetLocalizer(self, locs)
	if self ~= SVC_NAMESPACE then 
		locs = self
	end

	locs.AddLocale = AddLocale
	return setmetatable(locs,  loc_mt)
end

