

--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local setmetatable = setmetatable
local tostring = tostring
local type = type
local pairs = pairs
local GetLocale = GetLocale
local SVC_NAMESPACE = select(2, ...)

-- Isolate the environment
setfenv(1, select(2, ...))

--[[ END STANDARD HEADER ]] --

--==============
-- Locale
--==============

MULTIBYTE_FIRST_CHAR = "^([\192-\255]?%a?[\128-\191]*)"

function GetNamePattern(name)
  local u = name:match(MULTIBYTE_FIRST_CHAR):upper()

  if not u or u:len() == 0 then Prat:Print("GetNamePattern: name error", name) return end

  local l = u:lower()
  local namepat
  if u == l then
    namepat = name:lower()
  elseif u:len() == 1 then
    namepat = "[" .. u .. l .. "]" .. name:sub(2):lower()
  elseif u:len() > 1 then
    namepat = ""
    for i=1,u:len() do
      namepat = namepat .. "[" .. u:sub(i, i) .. l:sub(i, i) .. "]"
    end
    namepat = namepat .. name:sub(u:len() + 1)
  end

  return "%f[%a\192-\255]" .. namepat .. "%f[^%a\128-\255]"
end

AnyNamePattern = "%f[%a\192-\255]([%a\128-\255]+)%f[^%a\128-\255]"

function AddLocale(L, name, loc)
  if GetLocale() == name or name == "enUS" then
    for k,v in pairs(loc) do
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
  return setmetatable(locs, loc_mt)
end

