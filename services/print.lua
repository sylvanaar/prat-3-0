--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local tostring = tostring
local select = select
local type = type

local name, adoon = ...

-- Isolate the environment
setfenv(1, adoon)

--[[ END STANDARD HEADER ]] --

local function buildText(...)
  local text = "|cffffff78" .. tostring(adoon) .. ":|r "

  for i = 1, select("#", ...) do
    local parm = select(i, ...)
    if type(parm) == "string" then
      text = text .. parm
    else
      text = text .. tostring(parm) .. " "
    end
  end

  if text == nil or #text == 0 then
    return ""
  end

  return text
end

--[[ from AceConsole-3.0 ]] --
if not Print then
  function Print(self, ...)
    local text = (self == adoon) and buildText(...) or buildText(self, ...)

    if text == nil or #text == 0 then
      return
    end

    _G.DEFAULT_CHAT_FRAME:AddMessage(text)
  end
end

if not PrintLiteral then
  function PrintLiteral(self, ...)
    _G.UIParentLoadAddOn("Blizzard_DebugTools");
    _G.DevTools_Dump((...));
    _G.DevTools_Dump(select(2, ...));
  end
end

if not AddPrintMethod then
  function AddPrintMethod(_, frame)
    function frame:print(...)
      Print(self, ...)
    end

    function frame:dbg()
    end
  end
end

if not AddPrintMethods then
  function AddPrintMethods()
    for i = 1, _G.NUM_CHAT_WINDOWS do
      AddPrintMethod(adoon, _G["ChatFrame" .. i])
    end
  end
  
  EnableTasks[#EnableTasks + 1] = AddPrintMethods
end

