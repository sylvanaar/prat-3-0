---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2007  Prat Development Team
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



--[[
Name: PratChatButtons
Revision: $Revision: 80298 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
           Sylvanaar (sylvanaar@mindspring.com)
Inspired by: idChat2_Buttons by Industrial
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Buttons
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that adds chat menu and button options.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

-- Get Utility Libraries
local util, DBG, CLR = GetPratUtils()

local Prat = Prat

local LIB = PRATLIB
local PRAT_LIBRARY = PRAT_LIBRARY
-- set prat module name
local PRAT_MODULE = Prat:RequestModuleName("PratChatButtons")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local loc = PRAT_LIBRARY(LIB.LOCALIZATION)
local L = loc[PRATLIB.NEWLOCALENAMESPACE](loc, PRAT_MODULE)

L[LIB.NEWLOCALE](L, "enUS", function() return {
    ["Buttons"] = true,
    ["Chat window button options."] = true,
    ["chatmenu_name"] = "Show Chat Menu",
    ["chatmenu_desc"] = "Toggles chat menu on and off.",
    ["Show Arrows"] = true,
    ["Toggle showing chat arrows for each chat window."] = true, 
    ["Show Chat%d Arrows"] = true,
    ["Toggles navigation arrows on and off."] = true,
    ["reminder_name"] = "Show ScrollDown Reminder",
    ["reminder_desc"] = "Show reminder button when not at the bottom of a chat window.",
    ["Set Position"] = true,
    ["Sets position of chat menu and arrows for all chat windows."] = true,
    ["Default"] = true,
    ["Right, Inside Frame"] = true,
    ["Right, Outside Frame"] = true,
    ["alpha_name"] = "Set Alpha",
    ["alpha_desc"] = "Sets alpha of chat menu and arrows for all chat windows.",
} end)

--Chinese Translation: 月色狼影@CWDG
--CWDG site: http://Cwowaddon.com
L[LIB.NEWLOCALE](L, "zhCN", function() return {
    ["Buttons"] = "按钮",
    ["Chat window button options."] = "聊天窗口菜单及按钮选项。",
    ["chatmenu_name"] = "聊天菜单",
    ["chatmenu_desc"] = "显示聊天菜单打开与关闭。",
    ["Show Arrows"] = "聊天按钮",
    ["Toggle showing chat arrows for each chat window."] = "切换显示聊天按钮打开与关闭。",
    ["Show Chat%d Arrows"] = "聊天%d 按钮",
    ["Toggles navigation arrows on and off."] = "显示第 %d  聊天窗口按钮。",
    ["reminder_name"] = "显示提示按钮",
    ["reminder_desc"] = "聊天窗口不在底部时显示提示按钮。",
    ["Set Position"] = "设置定位",
    ["Sets position of chat menu and arrows for all chat windows."] = "为所有聊天窗口定义按钮位置.",
    ["Default"] = "默认",
    ["Right, Inside Frame"] = "右,聊天框内",
    ["Right, Outside Frame"] = "右,聊天框外",
    ["alpha_name"] = "设置透明度",
    ["alpha_desc"] = "设置所有聊天窗按钮的透明度.",
} end)

L[LIB.NEWLOCALE](L, "zhTW", function() return {
    ["Buttons"] = "聊天按鈕",
    ["Chat window button options."] = "聊天視窗選單及按鈕選項。",
    ["chatmenu_name"] = "顯示聊天功能表",
    ["chatmenu_desc"] = "切換是否顯示聊天功能表。",
    ["Show Arrows"] = "顯示聊天按鈕",
    ["Toggle showing chat arrows for each chat window."] = "切換是否在各個聊天視窗顯示聊天按鈕。",
    ["Show Chat%d Arrows"] = "聊天視窗%d顯示聊天按鈕",
    ["Toggles navigation arrows on and off."] = "切換是否顯示聊天按鈕。",
    ["reminder_name"] = "顯示提示按鈕",
    ["reminder_desc"] = "聊天視窗沒有捲到最底時顯示提示按鈕。",
    ["Set Position"] = "設定位置",
    ["Sets position of chat menu and arrows for all chat windows."] = "設定全部聊天視窗的聊天按鈕位置。",
    ["Default"] = "預設",
    ["Right, Inside Frame"] = "右邊，聊天視窗內",
    ["Right, Outside Frame"] = "右邊，聊天視窗外",
    ["alpha_name"] = "設定透明度",
    ["alpha_desc"] = "設定全部聊天視窗的聊天按鈕透明度。",
} end)

L[LIB.NEWLOCALE](L, "deDE", function() return {
    ["Buttons"] = "Chat Tasten",
    ["Chat window button options."] = "Chat Fenster Men\195\188 und Tasten Optionen.",
    ["chatmenu_name"] = "Zeige Chat Menu",
    ["chatmenu_desc"] = "Schaltet das Chat Men\195\188 ein und aus.",
    ["Show Arrows"] = "Zeige Chat Tasten",
    ["Toggle showing chat arrows for each chat window."] = "Schaltet die Chat Tastens ein und aus für jedes Chatfenster.",
    ["Show Chat%d Arrows"] = "%d Tasten",
    ["Toggles navigation arrows on and off."] = "Schaltet die Buttons ein und aus f\195\188r das %d .",
    ["reminder_name"] = "Zeige Erinnerungs Button",
    ["reminder_desc"] = "Zeige den Erinnerungs Button wenn man nicht am Ende des Chattextes ist.",
    ["Set Position"] = "Position festlegen",
    ["Sets position of chat menu and arrows for all chat windows."] = "Position der Tasten festlegen f\195\188r alle Chatfenster.",
    ["Default"] = "Grundeinstellung",
    ["Right, Inside Frame"] = "Rechts, im Fensters",
    ["Right, Outside Frame"] = "Rechts, am Fenster",
    ["alpha_name"] = "Helligkeit festlegen",
    ["alpha_desc"] = "Helligkeit der Tasten festlegen f\195\188r alle Chatfenster.",
} end)

L[LIB.NEWLOCALE](L, "frFR", function() return {
    ["Buttons"] = "Boutons de discussion",
    ["Chat window button options."] = "Options du menu et des boutons de chat.",
    ["chatmenu_name"] = "Afficher le menu de chat",
    ["chatmenu_desc"] = "Affiche ou masque le menu de chat.",
    ["Show Arrows"] = "Afficher les boutons de chat",
    ["Toggle showing chat arrows for each chat window."] = "Affiche ou masque les boutons pour chaque fen\195\170tre de chat.",
    ["Show Chat%d Arrows"] = "Boutons du %d ",
    ["Toggles navigation arrows on and off."] = "Affiche ou masque les boutons pour la fen\195\170tre de %d .",
    ["reminder_name"] = "Afficher le bouton de rappel de d\195\169filement",
    ["reminder_desc"] = "Affiche un bouton pour retourner en bas de la fen\195\170tre de chat quand vous n'y \195\170tes pas.",
    ["Set Position"] = "Position des boutons",
    ["Sets position of chat menu and arrows for all chat windows."] = "Change la position des boutons pour chaque fen\195\170tre de chat.",
    ["Default"] = "D\195\169faut",
    ["Right, Inside Frame"] = "Droite, à l'int\195\169rieur",
    ["Right, Outside Frame"] = "Droite, a l'ext\195\169rieur",
    ["alpha_name"] = "R\195\169gler la transparence",
    ["alpha_desc"] = "R\195\168gle la transparence de tous les boutons.",
} end)

L[LIB.NEWLOCALE](L, "esES", function() return {
    ["Buttons"] = "Botones",
    ["Chat window button options."] = "Opciones del men\195\186 de chat y botones",
    ["chatmenu_name"] = "Men\195\186 de Chat",
    ["chatmenu_desc"] = "Activa y desactiva el men\195\186 de chat",
    ["Show Arrows"] = "Botones de Chat",
    ["Toggle showing chat arrows for each chat window."] = "Activa y desactiva los botones de las ventanas de chat",
    ["Show Chat%d Arrows"] = "Botones del %d ",
    ["Toggles navigation arrows on and off."] = "Activa y desactiva los cursores en la caja de edici\195\179n del chat",
    ["reminder_name"] = "Mostrar Bot\195\179n de Recordatorio",
    ["reminder_desc"] = "Muestra el bot\195\179n de recordatorio cuando no est\195\161s en la parte inferior de una ventana de chat.",
    ["Set Position"] = "Posici\195\179n",
    ["Sets position of chat menu and arrows for all chat windows."] = "Posici\195\179n de los botones para todas las ventanas de chat.",
    ["Default"] = "Por Defecto",
    ["Right, Inside Frame"] = "Derecha, dentro del marco",
    ["Right, Outside Frame"] = "Derecha, fuera del marco",
    ["alpha_name"] = "Transparencia",
    ["alpha_desc"] = "Transparencia de los botones para todas las ventanas de chat.",
} end)

L[LIB.NEWLOCALE](L, "koKR", function() return {
    ["Buttons"] = "버튼",
    ["Chat window button options."] = "대화창 버튼 설정입니다.",
    ["chatmenu_name"] = "대화 메뉴 표시",
    ["chatmenu_desc"] = "대화 메뉴를 표시합니다.",
    ["Show Arrows"] = "버튼 표시",
    ["Toggle showing chat arrows for each chat window."] = "각 대화창에 대한 대화 버튼 표시를 전환합니다.", 
    ["Show Chat%d Arrows"] = "%d 대화창 버튼 표시",
    ["Toggles navigation arrows on and off."] = "네비게이션 버튼 켜고 끄기를 전환합니다.",
    ["reminder_name"] = "스크롤 버튼 표시",
    ["reminder_desc"] = "대화창의 하단이 아니면 스크롤 버튼을 표시합니다.",
    ["Set Position"] = "위치 설정",
    ["Sets position of chat menu and arrows for all chat windows."] = "모든 대화창에 대한 대화 메뉴와 버튼의 의치를 설정합니다.",
    ["Default"] = "기본",
    ["Right, Inside Frame"] = "우측, 창 내부",
    ["Right, Outside Frame"] = "우측, 창 외부",
    ["alpha_name"] = "투명도 설정",
    ["alpha_desc"] = "모든 대화창에 대한 대화 메뉴와 버튼의 투명도를 설정합니다.",
} end)



-- create prat module
Prat_ChatButtons = Prat:NewModule(PRAT_MODULE, LIB.HOOKS)
local Prat_ChatButtons = Prat_ChatButtons
Prat_ChatButtons.pratModuleName = PRAT_MODULE
Prat_ChatButtons.revision = tonumber(string.sub("$Revision: 80298 $", 12, -3))

-- define key module values
Prat_ChatButtons.moduleName = L["Buttons"]
Prat_ChatButtons.moduleDesc = L["Chat window button options."]
Prat_ChatButtons.consoleName = "buttons"
Prat_ChatButtons.guiName = L["Buttons"]


-- define the default db values
Prat_ChatButtons.defaultDB = {
    on = true,
    chatmenu = false,
    chatbutton = {false, false, false, false, false, false, false},
    position = "DEFAULT",
    reminder = false,
    alpha = 1.0,
}

-- create a moduleOptions stub (for setting self.moduleOptions)
Prat_ChatButtons.moduleOptions = {}

-- build the options menu using prat templates
Prat_ChatButtons.toggleOptions = {
    chatmenu = { 
        type = "toggle", 
        order = 110, 
        set = function(v) Prat_ChatButtons.db.profile.chatmenu = v Prat_ChatButtons:ChatMenu(v) end, 
    },
    sep125_sep = 125,
    reminder = 130,
    sep135_sep = 135,
    alpha = {
        type = "range", 
        set = function(v) Prat_ChatButtons.db.profile.alpha = v; Prat_ChatButtons:ConfigureAllFrames() end, 
        min = 0.1, 
        max = 1, 
        step = 0.1, 
        order = 150
    }
}

-- add module options not covered by templates
function Prat_ChatButtons:GetModuleOptions()
    self.moduleOptions = {
        name = L["Buttons"],
        desc = L["Chat window button options."],
        type = "group",
        args = {
            chatarrows = {
                name = L["Show Arrows"],
                desc = L["Toggle showing chat arrows for each chat window."],
                type = "group",
                order = 120,
                args = {
                    chat1 = {
                        name = string.format(L["Show Chat%d Arrows"], 1),
                        desc = string.format(L["Toggles navigation arrows on and off."], 1),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[1] end,
                        set = function(v) self.db.profile.chatbutton[1] = v; self:chatbutton(1,v) end
                    },
                    chat2 = {
                        name = string.format(L["Show Chat%d Arrows"], 2),
                        desc = string.format(L["Toggles navigation arrows on and off."], 2),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[2] end,
                        set = function(v) self.db.profile.chatbutton[2] = v; self:chatbutton(2,v) end
                    },
                    chat3 = {
                        name = string.format(L["Show Chat%d Arrows"], 3),
                        desc = string.format(L["Toggles navigation arrows on and off."], 3),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[3] end,
                        set = function(v) self.db.profile.chatbutton[3] = v; self:chatbutton(3,v) end
                    },
                    chat4 = {
                        name = string.format(L["Show Chat%d Arrows"], 4),
                        desc = string.format(L["Toggles navigation arrows on and off."], 4),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[4] end,
                        set = function(v) self.db.profile.chatbutton[4] = v; self:chatbutton(4,v) end
                    },
                    chat5 = {
                        name = string.format(L["Show Chat%d Arrows"], 5),
                        desc = string.format(L["Toggles navigation arrows on and off."], 5),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[5] end,
                        set = function(v) self.db.profile.chatbutton[5] = v; self:chatbutton(5,v) end
                    },
                    chat6 = {
                        name = string.format(L["Show Chat%d Arrows"], 6),
                        desc = string.format(L["Toggles navigation arrows on and off."], 6),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[6] end,
                        set = function(v) self.db.profile.chatbutton[6] = v; self:chatbutton(6,v) end
                    },
                    chat7 = {
                        name = string.format(L["Show Chat%d Arrows"], 7),
                        desc = string.format(L["Toggles navigation arrows on and off."], 7),
                        type = "toggle",
                        get = function() return self.db.profile.chatbutton[7] end,
                        set = function(v) self.db.profile.chatbutton[7] = v; self:chatbutton(7,v) end
                    },
                }
            },
            position = {
                name = L["Set Position"],
                desc = L["Sets position of chat menu and arrows for all chat windows."],
                type = "text",
                order = 140,
                get = function() return self.db.profile.position end,
                set = function(v) self.db.profile.position = v; self:ConfigureAllFrames() end,
                validate = {["DEFAULT"] = L["Default"], ["RIGHTINSIDE"] = L["Right, Inside Frame"], ["RIGHTOUTSIDE"] = L["Right, Outside Frame"]}                     
            }
        }
    }
   	return self.moduleOptions
end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function Prat_ChatButtons:OnModuleEnable()
    -- stub variables for frame handling
    self.frames = {}
    self.reminders = {}
    -- create reminder buttons
    for i = 1,NUM_CHAT_WINDOWS do
        table.insert(self.reminders, self:MakeReminder(i))
        self:chatbutton(i,self.db.profile.chatbutton[i])
    end
    self:ChatMenu(self.db.profile.chatmenu)
    -- set OnUpdateInterval, if they are profiling, update less
    if GetCVar("scriptProfile") == "1" then
        self.OnUpdateInterval = 0.5
    else
        self.OnUpdateInterval = 0.05
    end
    -- hook functions
    self:SecureHook("ChatFrame_OnUpdate", "ModuleOnUpdateHook")
end

-- things to do when the module is disabled
function Prat_ChatButtons:OnModuleDisable()
    -- show chatmenu
    self:ChatMenu(true)
    -- show all the chatbuttons
    for i = 1,NUM_CHAT_WINDOWS do
        self:chatbutton(i,true)
    end
    -- unhook functions
    self:UnhookAll()
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function Prat_ChatButtons:ConfigureAllFrames()
    for i = 1,NUM_CHAT_WINDOWS do
        self:chatbutton(i,self.db.profile.chatbutton[i])
    end
    self:ChatMenu(self.db.profile.chatmenu)
end

-- do something with the hook
function Prat_ChatButtons:OnModuleOnUpdateHook(this, elapsed)
    if ( not this:IsShown() ) then
        return;
    end
    local id = this:GetID()
    local prof = self.db.profile
    local show = prof.chatbutton[id]
    
    self:chatbutton(id, show)
    self:ChatFrame_OnUpdateTextFlow(this, elapsed)

    -- This is all code for the 'reminder' from here on
    if show then
        return
    end
    if not prof.reminder then
        return
    end
    local remind = getglobal(this:GetName().."ScrollDownReminder");
    local flash = getglobal(this:GetName().."ScrollDownReminderFlash");
    if ( not flash ) then
        return
    end
    if ( this:AtBottom() ) then
        if ( remind:IsShown() ) then
            remind:Hide();
            UIFrameFlashRemoveFrame(flash)
        end
        return;
    else
        if ( remind:IsShown() ) then
            return
        end
        remind:Show()
        UIFrameFlash(flash, 0, 0, -1, false, CHAT_BUTTON_FLASH_TIME, CHAT_BUTTON_FLASH_TIME)
    end
end

-- manipulate chatframe menu button
function Prat_ChatButtons:ChatMenu(visible)
    -- define variables used
    local f = self.frames[1]
    if not f then 
        self.frames[1] = {}
        f = self.frames[1]
    end   
    f.cfScrl = f.cfScrl or {}
    f.cfScrl.up = getglobal("ChatFrame1UpButton")
    -- chatmenu position:
    -- position chatmenu under the UpButton for chatframe1 if button position is set to "RIGHTINSIDE"
    -- otherwise position chatmenu above the UpButton for chatframe1
    ChatFrameMenuButton:ClearAllPoints()
    if self.db.profile.position == "RIGHTINSIDE" then
        ChatFrameMenuButton:SetPoint("TOP", f.cfScrl.up, "BOTTOM")
    else
        ChatFrameMenuButton:SetPoint("BOTTOM", f.cfScrl.up, "TOP")
    end
    -- chatmenu alpha:
    -- set alpha of the chatmenu based on the alpha setting
    ChatFrameMenuButton:SetAlpha(self.db.profile.alpha)
    -- chatmenu visibility
    -- show buttons based on show settings
    if visible then
        ChatFrameMenuButton:Show()
    else
        ChatFrameMenuButton:Hide()
    end
end

-- manipulate chatframe scrolling and reminder buttons
function Prat_ChatButtons:chatbutton(id,visible)
    -- define variables used
    local f = self.frames[id]
    local id = this:GetID()
    if not f then 
        self.frames[id] = {}
        f = self.frames[id]
    end    
    
    f.cfScrl = f.cfScrl or {}
    f.cf = f.cf or getglobal("ChatFrame"..id)
    f.cfScrl.up = f.cfScrl.up or getglobal("ChatFrame"..id.."UpButton")
    f.cfScrl.down = f.cfScrl.down or getglobal("ChatFrame"..id.."DownButton")
    f.cfScrl.bottom = f.cfScrl.bottom or getglobal("ChatFrame"..id.."BottomButton")
    
    f.cfScrlheight = (f.cfScrlheight and  f.cfScrlheight > 0) and f.cfScrlheight or ((f.cfScrl.up and f.cfScrl.down and f.cfScrl.bottom) and 
        (f.cfScrl.up:GetHeight() + f.cfScrl.down:GetHeight() + f.cfScrl.bottom:GetHeight()) or 0)
    f.cfreminder = f.cfreminder or self:MakeReminder(id)
    f.cfreminderflash = f.cfreminderflash or getglobal("ChatFrame"..id.."ScrollDownReminderFlash")
    
    -- chatbuttons position:
    -- position of the chatbuttons based on position setting
    if f.cfScrl.bottom and f.cfScrl.up then
        f.cfScrl.bottom:ClearAllPoints()
        f.cfScrl.up:ClearAllPoints()
        if self.db.profile.position == "RIGHTINSIDE" then
            f.cfScrl.bottom:SetPoint("BOTTOMRIGHT", f.cf, "BOTTOMRIGHT", 0, -4)
            f.cfScrl.up:SetPoint("TOPRIGHT", f.cf, "TOPRIGHT", 0, -4)
        elseif self.db.profile.position == "RIGHTOUTSIDE" then
            f.cfScrl.bottom:SetPoint("BOTTOMLEFT", f.cf, "BOTTOMRIGHT", 0, -4)
            f.cfScrl.up:SetPoint("BOTTOM", f.cfScrl.down, "TOP", 0, -2)
        else
            f.cfScrl.bottom:SetPoint("BOTTOMLEFT", f.cf, "BOTTOMLEFT", -32, -4)
            f.cfScrl.up:SetPoint("BOTTOM", f.cfScrl.down, "TOP", 0, -2)
        end
    end
    
    -- chatbuttons alpha:
    -- set alpha of the chatbuttons based on the alpha setting
    for _,v in pairs(f.cfScrl) do
        v:SetAlpha(self.db.profile.alpha)
    end
    -- chatbuttons visibility:
    -- show buttons based on visible value passed to function
    if f.cf then 
        if visible and (f.cf:GetHeight() > f.cfScrlheight) then
            for k, v in pairs(f.cfScrl) do
                f.cfScrl[k]:Show()
            end
        else
            for k, v in pairs(f.cfScrl) do
                f.cfScrl[k]:Hide()
            end
            -- reminder visibility:
            -- show the reminder button (if enabled) when not at the bottom of the chatframe
            if (not f.cf:AtBottom()) and self.db.profile.reminder and (f.cf:GetHeight() > f.cfreminder:GetHeight()) then
                f.cfreminder:Show()
                f.cfreminderflash:Show()
            else
                f.cfreminder:Hide()
                f.cfreminderflash:Hide()
            end
        end
    end
end

-- create a "reminder" button
function Prat_ChatButtons:MakeReminder(id)
    -- define variables used
    local cf = getglobal("ChatFrame"..id)
    local b = getglobal("ChatFrame"..id.."ScrollDownReminder")
    if b then return b end
    b = CreateFrame("Button","ChatFrame"..id.."ScrollDownReminder",cf )
    -- define the parameters for the button
    b:SetFrameStrata("BACKGROUND")
    b:SetWidth(24)
    b:SetHeight(24)
    b:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
    b:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
    b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
    b:SetPoint("RIGHT", cf, "RIGHT", 0, 0)
    b:SetPoint("LEFT", cf, "RIGHT", -32, 0)
    b:SetPoint("TOP", cf, "BOTTOM", 0, 28)
    b:SetPoint("BOTTOM", cf, "BOTTOM", 0, 0)
    b:SetScript("OnClick", function() PlaySound("igChatBottom"); this:GetParent():ScrollToBottom() end)
    -- hide the button by default
    b:Hide()
    -- add a flash texture for the reminder button
    self:AddFlashTexture(b)

    return b
end

-- create a "flash" texture
function Prat_ChatButtons:AddFlashTexture(frame)
    -- define variables used
    local t = frame:CreateTexture(frame:GetName().."Flash", "OVERLAY")
    -- define the parameters for the texture
    t:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
    t:SetPoint("CENTER", frame, "CENTER", 0, 1)
    t:SetBlendMode("ADD")
    t:SetAlpha(0.5)
    -- hide the texture by default
    t:Hide()
end

-- used for flowing text around a button which is on the frame
local avoid_frames = {}

-- used for flowing text around a button which is on the frame
local function intersects_pts(o1t, o1b,  o2t, o2b)
    -- above
    local above = o1t > o2t and o1b > o2t
    -- below
    local below = o1t < o2b and o1b < o2b
    -- either one true and we dont intersect
    return not( above or below )
end

-- used for flowing text around a button which is on the frame
local function intersects_line(line, frame)
    return intersects_pts(line:GetTop(), line:GetBottom(), frame:GetTop(), frame:GetBottom())
end

-- flow text around a button which is on the frame
function Prat_ChatButtons:ChatFrame_OnUpdateTextFlow(this, elapsed)
    if self.db.profile.position == "RIGHTINSIDE" then
        local id = this:GetID()
        local af = avoid_frames[id] 
        if not af then 
            avoid_frames[id] = {}
            af = avoid_frames[id]
        end
        af.cfup = af.cfup or getglobal("ChatFrame"..id.."UpButton")
        af.cfdown = af.cfdown or getglobal("ChatFrame"..id.."DownButton")
        af.cfbottom = af.cfbottom or getglobal("ChatFrame"..id.."BottomButton")
        af.cfreminder = af.cfreminder or getglobal("ChatFrame"..id.."ScrollDownReminder")
        for i=this:GetNumRegions(),1,-1 do
            local line = select(i, this:GetRegions())
            if line:GetObjectType() == "FontString" then
                local found = false
                for k,v in pairs(af) do
                    if v:IsVisible() and intersects_line(line, v) then
                        line:SetPoint("RIGHT", v, "LEFT", 0, 0)
                        local w = select(3, line:GetRect())
                        line:SetWidth(w)
                        found = true
                        break
                    end
                end
                if not found then 
                    line:SetPoint("RIGHT", this, "RIGHT", 0, 0)
                    local w = select(3, line:GetRect())
                    line:SetWidth(w)
                end              
                
                if line:GetTop() > this:GetTop() then
                    line:Hide()
                else
                    line:Show()
                end                  
            end
        end
    end
end


  return
end ) -- Prat:AddModuleToLoad