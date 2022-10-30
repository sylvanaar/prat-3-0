--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local SVC_NAMESPACE = select(2, ...)
local LibStub = LibStub
local setmetatable = setmetatable
local pairs = pairs

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]] --



--@non-debug@
local BR = {}
--@non-end-debug@

for k, v in pairs(_G.LOCALIZED_CLASS_NAMES_FEMALE) do
  BR[v] = k
end
for k, v in pairs(_G.LOCALIZED_CLASS_NAMES_MALE) do
  BR[v] = k
end

function GetGenderNeutralClass(ns, class)
  class = class or ns
  return class and (BR[class] or class):upper()
end

-- /print Prat.GetGenderNeutralClass("Shaman")
