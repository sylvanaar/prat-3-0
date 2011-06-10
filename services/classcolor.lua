

--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local LibStub = LibStub

-- Isolate the environment
setfenv(1, select(2, ...))

--[[ END STANDARD HEADER ]] --

function GetClassGetColor(class)
  if GetGenderNeutralClass then
    class = GetGenderNeutralClass(class)
  end

  class = class:upper()

  if _G.CUSTOM_CLASS_COLORS and _G.CUSTOM_CLASS_COLORS[class] then
    return _G.CUSTOM_CLASS_COLORS[class].r, _G.CUSTOM_CLASS_COLORS[class].g, _G.CUSTOM_CLASS_COLORS[class].b
  end
  if _G.RAID_CLASS_COLORS and _G.RAID_CLASS_COLORS[class] then
    return _G.RAID_CLASS_COLORS[class].r, _G.RAID_CLASS_COLORS[class].g, _G.RAID_CLASS_COLORS[class].b
  end
  return 0.63, 0.63, 0.63
end