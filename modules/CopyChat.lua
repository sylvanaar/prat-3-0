---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2011  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc., 
-- 51 Franklin Street, Fifth Floor, 
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------


Prat:AddModuleToLoad(function() 


local PRAT_MODULE = Prat:RequestModuleName("CopyChat")

if PRAT_MODULE == nil then 
    return 
end

local MAX_SCRAPE_TIME = 5 -- seconds

local PL = Prat:GetLocalizer({})

--@debug@
PL:AddLocale("enUS", {
    ["CopyChat"] = true,
    ["Copy text from the active chat window."] = true,
    ["Copy Text"] = true,
    ["Copy To Editbox"] = true,
    ["Copy all of the text in the selected chat frame into an edit box"] = true,
    ["showbutton_name"] = "Copy Button",
    ["showbutton_desc"] = "Show a button on the chatframe",
    buttonpos_name = "Button Location",
    buttonpos_desc = "Where on the chatframe to show the copy button",
    ["ChatFrame"] = true,
    [" Text"] = true,
    ["Message From : %s"] = true,
    ["Copy Text Format"] = true,
    ["Should the copied text be plain, or formatted so you can see the colors."] = true,
    ["Plain"] = true,
    ["HTML"] = true,
    ["BBCode"] = true,
    ["Wowace.com Forums"] = true,
    TOPLEFT  =    "Top, Left",
    TOPRIGHT =    "Top, Right",
    BOTTOMRIGHT = "Bottom, Right",
    BOTTOMLEFT =  "Bottom, Left",
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@



--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("enUS", L)


--@localization(locale="itIT", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("itIT", L)


--@localization(locale="ptBR", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("ptBR", L)

--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("frFR",L)



--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("deDE", L)

--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("koKR",L)
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("esMX",L)
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("ruRU",L)
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("zhCN",L)
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("esES",L)
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="CopyChat")@
PL:AddLocale("zhTW",L)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceTimer-3.0")

Prat:SetModuleDefaults(module.name, {
    profile = {
        on  = true,
        showbutton = {["*"] = true},
        buttonpos = "TOPLEFT",
        copyformat = "plain"
    }
} )

Prat:SetModuleOptions(module.name, {
    name = PL["CopyChat"],
    desc = PL["Copy text from the active chat window."],
    type = "group",
    args = {
        showbutton = {
            name = PL["showbutton_name"],
            desc = PL["showbutton_desc"],
            type = "multiselect",
            values = Prat.FrameList,
            get = "GetSubValue",
            set = "SetSubValue"
        },
        buttonpos = {
            name = PL.buttonpos_name,
            desc = PL.buttonpos_desc,
            type = "select",
            order = 195,
            get = "GetValue", 
            set = "SetValue",
            values = { ["TOPLEFT"] = PL.TOPLEFT, ["TOPRIGHT"] = PL.TOPRIGHT , 
                       ["BOTTOMLEFT"] = PL.BOTTOMLEFT, ["BOTTOMRIGHT"] = PL.BOTTOMRIGHT },
        },
        copy = {
            name = PL["Copy Text"],
            desc = PL["Copy all of the text in the selected chat frame into an edit box"],
            type = "execute",
            order = 190,
            func = "MenuScrape"
        },
        copyformat = {
            name = PL["Copy Text Format"],
            desc = PL["Should the copied text be plain, or formatted so you can see the colors."],
            type = "select",
            order = 195,
            get = "GetValue", 
            set = "SetValue",
            values = { ["plain"] = PL["Plain"], ["bbcode"] = PL["BBCode"] , ["html"] = PL["HTML"], ["wowace"] = PL["Wowace.com Forums"] },
        },

    }
})

function module:MenuScrape()
    self:ScrapeChatFrame(SELECTED_CHAT_FRAME) 
    HideDropDownMenu(1)
end


Prat:SetModuleInit(module.name,
    function(module)
        PratCCFrameScrollText:SetScript("OnTextChanged", function(this) module:OnTextChanged(this) end)
        PratCCFrameScrollText:SetScript("OnEscapePressed", function(this) PratCCFrame:Hide() module.str = nil end)


        Prat.RegisterChatCommand("copychat",
        function(name)
            local frame = SELECTED_CHAT_FRAME

            if frame then
                module:ScrapeChatFrame(frame)
            end
        end)
    end)


function module:OnModuleEnable()
    self.buttons = {}
    for k,v in pairs(Prat.Frames) do
        self.buttons[k] = self:MakeReminder(v:GetID())
        self:showbutton(k, self.db.profile.showbutton[k])
    end
--    UnitPopupButtons["COPYCHAT"]    = { text =PL["Copy Text"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlink(a1, a2) end , arg1 = "", arg2 = ""};
--    UnitPopupButtons["COPYCHATEDIT"]    = { text =PL["Copy To Editbox"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlinkToEdit(a1, a2) end , arg1 = "", arg2 = ""};



--    if not self.menusAdded then
--        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHATEDIT");
--        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHAT");
--        self.menusAdded = true
--    end
--
--    Prat:RegisterDropdownButton("COPYCHAT", function(menu, button) button.arg1 = module.clickedFrame end )
--    Prat:RegisterDropdownButton("COPYCHATEDIT", function(menu, button) button.arg1 = module.clickedFrame end )
--
--
--    self:SecureHook("ChatFrame_OnHyperlinkShow")
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
end
    
function module:Prat_FramesUpdated(info, name, chatFrame, ...)
    local id = chatFrame:GetID()
    self.buttons[id] = self:MakeReminder(id)
    self:showbutton(id, self.db.profile.showbutton[1])
end

function module:ChatFrame_OnHyperlinkShow(this, ...)
    self.clickedframe = this
end

function module:OnModuleDisable()
    Prat.UnregisterAllChatEvents(self)
    self:hidebuttons()
    PratCCFrame:Hide()
end


--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

module.lines = {}
module.str = nil

--function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
--    local ORIGIN_FRAME = self.clickedframe
--    
--    for i=1, UIDROPDOWNMENU_MAXBUTTONS do
--        button = _G["DropDownList"..UIDROPDOWNMENU_MENU_LEVEPL.."Button"..i];
--        
--        if button.value == "COPYCHAT" then 
--          --  self:Debug(dropdownMenu:GetName(), which, unit, name, userData, button.value, ...)
--            button.func = UnitPopupButtons["COPYCHAT"].func
--            button.arg1 = ORIGIN_FRAME
--        end
--    end
--end


function module:GetFormattedLine(line, r, g, b)
    local fmt = self.copyformat or self.db.profile.copyformat
    local CLR = Prat.CLR
    
    line = line:gsub("|c00000000|r", "")

    if fmt == "plain" then 
        return line
    end

    if fmt == "bbcode" or fmt == "wowace" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "[color=#%1]"):gsub("|r", "[/color]")
    
       return "[color=#"..CLR:GetHexColor(r,g,b).."]"..fline.."[/color]"
    end

    if fmt == "html" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "<font color='#%1'>"):gsub("|r", "</font>")
    
       return "<p><font color='#"..CLR:GetHexColor(r,g,b).."' face='monospace'>"..fline.."</font></p>"
    end

end


function module:CopyLineFromPlayerlinkToEdit(origin_frame, ...)

    -- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetObjectType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe

    wipe(self.lines)

    self:AddLines(self.lines, frame:GetRegions())

    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU

    local name = dropdownFrame.name
    local server = dropdownFrame.server  or ""
    local linenum = dropdownFrame.lineID

    local fullname = name;

    if server:len()>0 then
        fullname = name.."-"..server;
    end

    local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
        if self.lines[i]:find(findname:gsub("%-", "%%-")) then
            local text = self.lines[i]:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
            --self:StaticPopupCopyLine(fullname, self.lines[i])

            local editBox = ChatEdit_ChooseBoxForSend(frame);

            --DEBUG FIXME - for now, we're not going to remove spaces from names. We need to make sure X-server still works.
            -- Remove spaces from the server name for slash command parsing
            --name = gsub(name, " ", "");

            if ( editBox ~= ChatEdit_GetActiveWindow() ) then
                ChatFrame_OpenChat(text, frame);
            else
                editBox:SetText(text);
            end
            
        end
    end
end

function module:CopyLineFromPlayerlink(origin_frame, ...)

    -- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetObjectType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe

    wipe(self.lines)

    for _,v in ipairs(frame.visibleLines) do
        local msg = v.messageInfo

        if msg then
            table.insert(self.lines, 1, msg.message)
        end
    end

    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
    
    local name = dropdownFrame.name
    local server = dropdownFrame.server  or ""
    local linenum = dropdownFrame.lineID
    
    local fullname = name;

    if server:len()>0 then
        fullname = name.."-"..server;
    end

    local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
        Prat:PrintLiteral(findname:gsub("%-", "%%-"))
        if self.lines[i]:find(findname:gsub("%-", "%%-")) then
            self:StaticPopupCopyLine(fullname, self.lines[i])
        end
    end

    wipe(self.lines)
end


function module:StaticPopupCopyLine(sender, text)
    StaticPopupDialogs["COPY_LINE"] = StaticPopupDialogs["COPY_LINE"] or {
        text = PL["Message From : %s"],
        chattext = "",
        button2 = ACCEPT,
        hasEditBox = 1,
        hasWideEditBox = 1,

        preferredIndex = 3,

        OnShow = function(this)
            this:SetWidth(420)
            local editBox = _G[this:GetName().."WideEditBox"] or _G[this:GetName().."EditBox"]
            editBox:SetText(StaticPopupDialogs["COPY_LINE"].chattext);
            editBox:SetFocus();
            editBox:HighlightText(false);

            local button = _G[this:GetName().."Button2"];
            button:ClearAllPoints();
            button:SetWidth(200);
            button:SetPoint("CENTER", editBox, "CENTER", 0, -30);
        end,

        OnHide = function() end,
        OnAccept = function() end,
        OnCancel = function() end,
        EditBoxOnEscapePressed = function(this) this:GetParent():Hide(); end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1
    };

    StaticPopupDialogs["COPY_LINE"].chattext = text
    StaticPopup_Show ("COPY_LINE", sender);
end


function module:ScrapeChatFrame(frame, noshow)
    self:DoCopyChat(frame, noshow)
end

function module:ScrapeFullChatFrame(frame)
    self:DoCopyChatScroll(frame)
end
     
local scrapelines = {}
function module:DoCopyChatScroll(frame, noshow)
    self.longstr = ""
    self.str = ""
    
    if frame:GetNumMessages() == 0 then return end
    
    wipe(scrapelines)

    for i,v in ipairs(frame.historyBuffer.elements) do
        local msg = v.message

        if msg then
            table.insert(scrapelines, 1, msg)
        end
    end

    self.str = table.concat(scrapelines, "\n")
    wipe(scrapelines)

    if not noshow then
        if (self.copyformat and self.copyformat == "wowace") or self.db.profile.copyformat == "wowace" then
            self.str = "[bgcolor=black]"..self.str.."[/bgcolor]"
        end

        PratCCText:SetText(PL["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..PL[" Text"], lines)
        PratCCFrameScrollText:SetText(self.str or "")
        PratCCFrame:Show()
    end
end

function module:DoCopyChatArg(arg)
    self:DoCopyChat(unpack(arg))
end

function module:DoCopyChat(frame, noshow)
    wipe(self.lines)

    for _,v in ipairs(frame.visibleLines) do
        local msg = v.messageInfo

        if msg then
            table.insert(self.lines, 1, msg.message)
        end
    end

    self.str = table.concat(self.lines, "\n")

    wipe(self.lines)
    
    if not noshow then 
        if (self.copyformat and self.copyformat == "wowace") or self.db.profile.copyformat == "wowace" then
            self.str = "[bgcolor=black]"..self.str.."[/bgcolor]"
        end

        PratCCText:SetText(PL["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..PL[" Text"], lines)
        PratCCFrameScrollText:SetText(self.str or "")
        PratCCFrame:Show()
    end
end

function module:CopyChat()
    module:ScrapeChatFrame(SELECTED_CHAT_FRAME)
end

function module:OnTextChanged(this)
    if self.str and this:GetText() ~= self.str then
        this:SetText(self.str)
        self.str = nil
    end
    local s = PratCCFrameScrollScrollBar
    this:GetParent():UpdateScrollChildRect()
    local _, m = s:GetMinMaxValues()
    if m > 0 and this.max ~= m then
        this.max = m
        s:SetValue(m)
    end
end

function module:hidebuttons()
    for k,v in pairs(self.buttons) do
        v:Hide()
    end
end

function module:showbutton(id, show)
    local b = self.buttons[id]
    if show then b:Show() else b:Hide() end
end

do 
    local function reminderOnClick(self, button, down) 
        PlaySound("igChatBottom"); 
        if (IsShiftKeyDown()) then
            module.copyformat = "wowace"
        end
        if (IsControlKeyDown()) then
            module:ScrapeFullChatFrame(self:GetParent()) 
        else
            module:ScrapeChatFrame(self:GetParent()) 
        end
            
        module.copyformat = nil
    end
    local function reminderOnEnter(self, motion) self:SetAlpha(0.9) end
    local function reminderOnLeave(self, motion) self:SetAlpha(0.2) end
    
    function module:MakeReminder(id)
        local cf = _G["ChatFrame"..id]
        local name = "ChatFrame"..id.."PratCCReminder"
        local b = _G[name]
        if not b then
            b = CreateFrame("Button", name, cf)
            b:SetFrameStrata("BACKGROUND")
            b:SetWidth(24)
            b:SetHeight(24)
            b:SetNormalTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy2")
            b:SetPushedTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy")
            b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
            b:SetPoint(self.db.profile.buttonpos, cf, self.db.profile.buttonpos, 0, 0)
            b:SetScript("OnClick", reminderOnClick)
            b:SetScript("OnEnter", reminderOnEnter)
            b:SetScript("OnLeave", reminderOnLeave)
            b:SetAlpha(0.2)
            b:Hide()
        end

        return b
    end
end

  return
end ) -- Prat:AddModuleToLoad