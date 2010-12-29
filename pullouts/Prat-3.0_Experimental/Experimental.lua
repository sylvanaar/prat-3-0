Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Experimental")

if PRAT_MODULE == nil then 
    return 
end

PE = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")


local function testLibAutoAlts()

    LoadAddOn("LibAutoAlts-1.0")
    
    local alts = LibStub("LibAlts-1.0")
    
    alts:RegisterCallback("LibAlts_SetAlt", function(...) print(...) end )
end

local alts = LibStub("LibAlts-1.0")

local function tail2(main, ...)
    if main == nil then return end
    
    print("main: "..main, alts:GetAlts(main))
    
    return tail2(...)
end

function PE:DumpLA()

   tail2(alts:GetAllMains())

end

function PE:GetB()

    local c = {WorldFrame:GetChildren()}
    
    for i,v in ipairs(c) do
        local b = v:GetBackdrop()
        if b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
            B = v
            

        end
    end
    if B and not B.text then 
       
        local c={B:GetRegions()}
         for i,v in ipairs(c) do
            if v:GetObjectType() == "FontString" then
                B.text = v
            end
        end       
    end
    
    if B and B.text and B:IsVisible() then
                   if  B.text:GetText() then 
                   B.text:SetWordWrap(0)
  --                  print( B.text:GetText())
                end
    end
    return B
end

PE.frame = CreateFrame('Frame');
throttle = 0.25

    PE.frame:SetScript("OnUpdate", function(frame, elapsed) 
        throttle = throttle - elapsed
        if throttle < 0 then
            throttle = 0.25
            PE:GetB()
            if B and B:IsVisible() then
--                print(B:GetWidth(), B:GetHeight())
--                B.text:SetText(Prat.SplitMessage.MESSAGE)
                
               -- B.text:SetText(B.text:GetText())
                
            end
        end
    end)

function PE:OnModuleEnable()   
         



	
    --testLibAutoAlts()
    
--	CHAT_CONFIG_CHAT_RIGHT[7] = {
--		text = CHAT_MSG_WHISPER_INFORM,
--		type = "WHISPER_INFORM",
--		checked = function () return IsListeningForMessageType("WHISPER"); end;
--		func = function (checked) ToggleChatMessageGroup(checked, "WHISPER"); end;
--	}
--
--	CHAT_CONFIG_CHAT_LEFT[#CHAT_CONFIG_CHAT_LEFT].text = CHAT_MSG_WHISPER

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

local MAX_SCRAPE_TIME = 30
local scrapelines = {}


SLASH_FIND1 = "/find"
SlashCmdList["FIND"] = function(msg) PE:TS(msg) end

SLASH_FINDALL1 = "/findall"
SlashCmdList["FINDALL"] = function(msg) PE:TS(msg, true) end

local foundlines = {}

function PE:TS(word, all, frame, noshow)


    self.longstr = ""
    self.str = ""

    if frame == nil then
        frame = ChatFrame1
    end


    if not word then return end

    if #word <= 1 then
        frame:ScrollToBottom()
        Prat:Print("Search term is too short")
        return
    end    

    if frame:GetNumMessages() == 0 then return end


    local starttime = time()
    local runtime = 0

    if not all and self.lastsearch == word then
        frame:PageUp()
    end

    if all then
        frame:ScrollToBottom()
    end

    self.lastsearch = word

    repeat
        self:DoCopyChat(frame, nil, true)

        for i,v in ipairs(scrapelines) do
            if v:find(word) then
                --Prat:Print(("Found line %d scroll %d"):format(frame:GetCurrentLine(), frame:GetCurrentScroll()))
                if all then
                    table.insert(foundlines, v)
                else
                    return
                end
            end
        end

        frame:PageUp()
        runtime = time() - starttime
        if runtime >= MAX_SCRAPE_TIME then
            Prat:Print("Frame scraping timeout exceeded, results will be incomplete.")
            break;
        end
        
    until frame:AtTop() or runtime >= MAX_SCRAPE_TIME

    self.lastsearch = nil

    frame:ScrollToBottom()

    if all and  #foundlines > 0 then
        Prat:Print("Find Results:")
        
        for i,v in ipairs(foundlines) do
            Prat:Print(v)
        end
    else
        Prat:Print("Not Found")
    end

    wipe(foundlines)
end

function PE:DoCopyChat(frame, oldsize, noshow)
    wipe(scrapelines)

    self:AddLines(scrapelines, frame:GetRegions())
end

function PE:AddLines(lines, ...)
  for i=select("#", ...),1,-1 do
    local x = select(i, ...)
    if x:GetObjectType() == "FontString" and not x:GetName() then
        table.insert(lines, x:GetText())
    end
  end
end


  return
end ) -- Prat:AddModuleToLoad