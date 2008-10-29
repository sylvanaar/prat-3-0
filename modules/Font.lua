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
Name: PratFont
Revision: $Revision: 80703 $
Author(s): Curney (asml8ed@gmail.com)
Inspired by: ChatFrameExtender by Satrina
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Font
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that allows you to set the font face and size for chat windows (default=blizz default font face at size 12).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Font")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["Font"] = true,
    ["Chat window font options."] = true,
    ["Set Separately"] = true,
    ["Toggle setting options separately for each chat window."] = true,
    ["Set Font Face"] = true,
    ["Set the text font face for all chat windows."] = true,
    ["rememberfont_name"] = "Remember Font",
    ["rememberfont_desc"] = "Remember your font choice and restore it at startup.",    
    ["Set Font Size"] = true,
    ["Set text font size for each chat window."] = true,
    ["Set ChatFrame%d Font Size"] = true,
    ["Set text font size."] = true,
    ["Auto Restore Font Size"] = true,
    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = true,
    ["outlinemode_name"] = "Set Outline Mode",
    ["outlinemode_desc"] = "Sets mode for the outline around the font.",
    ["None"] = true, 
    ["Outline"] = true, 
    ["Thick Outline"] = true,
    ["monochrome_name"] = "Toggle Monochrome",
    ["monochrome_desc"] = "Toggles monochrome coloring of the font.",
    ["shadowcolor_name"] = "Set Shadow Color",
    ["shadowcolor_desc"] = "Set the color of the shadow effect.", 
})

L:AddLocale("ruRU", {
    ["Font"] = true,
    ["Chat window font options."] = true,
    ["Set Separately"] = true,
    ["Toggle setting options separately for each chat window."] = true,
    ["Set Font Face"] = true,
    ["Set the text font face for all chat windows."] = true,
    ["rememberfont_name"] = "Remember Font",
    ["rememberfont_desc"] = "Remember your font choice and restore it at startup.",    
    ["Set Font Size"] = true,
    ["Set text font size for each chat window."] = true,
    ["Set ChatFrame%d Font Size"] = true,
    ["Set text font size."] = true,
    ["Auto Restore Font Size"] = true,
    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = true,
    ["outlinemode_name"] = "Set Outline Mode",
    ["outlinemode_desc"] = "Sets mode for the outline around the font.",
    ["None"] = true, 
    ["Outline"] = true, 
    ["Thick Outline"] = true,
    ["monochrome_name"] = "Toggle Monochrome",
    ["monochrome_desc"] = "Toggles monochrome coloring of the font.",
    ["shadowcolor_name"] = "Set Shadow Color",
    ["shadowcolor_desc"] = "Set the color of the shadow effect.", 
})

--[[
	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
	CWDG site: http://Cwowaddon.com
	$Rev: 80703 $
]]

--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["Font"] = "字体尺寸",
--	["Chat window font options."] = "聊天窗口字体尺寸选项.",
--    ["Set Font Face"] = "字体",
--    ["Set the text font face for all chat windows."] = "设置聊天文本字体",
--    ["rememberfont_name"] = "记录字体",
--    ["rememberfont_desc"] = "记录字体选择并在启动时恢复.",
--    ["Set Font Size"] = "字体大小",
--    ["Set text font size for each chat window."] = "每个聊天窗口的字体大小.",
--    ["Set ChatFrame%d Font Size"] = "聊天窗口 %d 字体大小",
--    ["Set text font size."] = "设置聊天窗口 %d 字体大小.",
--    ["Auto Restore Font Size"] = "自动恢复",
--    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "解决打开系统菜单后字体大小变化的错误.",
--    ["outlinemode_name"] = "设定轮廓模式",
--    ["outlinemode_desc"] = "设定字体阴影模式。",
--    ["None"] = "无", 
--    ["Outline"] = "普通", 
--    ["Thick Outline"] = "厚",
--    ["monochrome_name"] = "单色",
--    ["monochrome_desc"] = "切换字体使用单色颜色。",
--    ["shadowcolor_name"] = "阴影颜色",
--    ["shadowcolor_desc"] = "设定字体阴影颜色。",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Font"] = "字型",
--    ["Chat window font options."] = "聊天視窗字型選項。",
---- no use anymore    ["Set Separately"] = true,
---- no use anymore    ["Toggle setting options separately for each chat window."] = true,
--    ["Set Font Face"] = "字體",
--    ["Set the text font face for all chat windows."] = "設定全部聊天視窗的字體。",
--    ["rememberfont_name"] = "記住字型",
--    ["rememberfont_desc"] = "進入系統後恢復選擇的字型。",    
--    ["Set Font Size"] = "字型大小",
--    ["Set text font size for each chat window."] = "設定各個聊天視窗的字型大小。",
--    ["Set ChatFrame%d Font Size"] = "聊天視窗%d字型大小",
--    ["Set text font size."] = "設定字型大小。",
--    ["Auto Restore Font Size"] = "自動恢復設定",
--    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "修正 Blizzard 的錯誤: 當你開啟系統選單時會改變字型大小。",
--    ["outlinemode_name"] = "設定輪廓模式",
--    ["outlinemode_desc"] = "設定字型陰影模式。",
--    ["None"] = "無", 
--    ["Outline"] = "普通", 
--    ["Thick Outline"] = "厚",
--    ["monochrome_name"] = "單色",
--    ["monochrome_desc"] = "切換字型使用單色顏色。",
--    ["shadowcolor_name"] = "陰影顏色",
--    ["shadowcolor_desc"] = "設定字型陰影顏色。",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["Font"] = "Taille du texte",
--    ["Chat window font options."] = "Options des tailles des textes",
--    ["Set Font Size"] = "Changer la taille des textes",
--    ["Set text font size for each chat window."] = "Change la taille du texte pour chaque fen\195\170tre.",
--    ["Set ChatFrame%d Font Size"] = "Taille du texte, fen\195\170tre %d",
--    ["Set text font size."] = "Change la taille du texte pour la fen\195\170tre %d.",
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["Font"] = "글꼴",
--    ["Chat window font options."] = "대화창 글꼴 설정입니다.",
--    ["Set Separately"] = "개별 설정",
--    ["Toggle setting options separately for each chat window."] = "각 대화창에 대한 개별 설정을 사용합니다.",
--    ["Set Font Face"] = "글꼴 서체 설정",
--    ["Set the text font face for all chat windows."] = "모든 대화창에 대한 글꼴 서체를 설정합니다.",
--    ["rememberfont_name"] = "글꼴 저장",
--    ["rememberfont_desc"] = "선택된 글꼴을 저장하고 시작 시 적용합니다.",    
--    ["Set Font Size"] = "글꼴 크기 설정",
--    ["Set text font size for each chat window."] = "각 대화창에 대한 글꼴 크기를 설정합니다.",
--    ["Set ChatFrame%d Font Size"] = "%d 대화창 글꼴 크기 설정",
--    ["Set text font size."] = "글자 글꼴 크기를 설정합니다.",
--    ["Auto Restore Font Size"] = "글꼴 크기 자동 복원",
--    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "시스템 메뉴 열 때 글꼴 크기가 변경되는 게임 버그를 수정합니다.",
--    ["outlinemode_name"] = "외곽선 모드 설정",
--    ["outlinemode_desc"] = "글꼴 주위 외곽선을 위한 모드를 설정합니다.",
--    ["None"] = "없음", 
--    ["Outline"] = "외곽선", 
--    ["Thick Outline"] = "두꺼운 외곽선",
--    ["monochrome_name"] = "단색 전환",
--    ["monochrome_desc"] = "글꼴의 단색화를 전환합니다.",
--    ["shadowcolor_name"] = "그림자 색상 설정",
--    ["shadowcolor_desc"] = "그림자 효과의 색상을 설정합니다.", 
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["Font"] = "Tama\195\177o de Fuente",
--    ["Chat window font options."] = "Opciones del tama\195\177o de fuente en las ventanas de chat",
--    ["Set Separately"] = "Establecer separadamente",
--    ["Toggle setting options separately for each chat window."] = "Permite tener configuraciones separadas para cada ventana de chat.",
--    ["Set Font Face"] = "Establecer Tipo de Fuente",
--    ["Set the text font face for all chat windows."] = "Establece el tipo de fuente del texto para todas las ventanas del chat.",
--    ["rememberfont_name"] = "Recordar Fuente",
--    ["rememberfont_desc"] = "Recuerda tu selecci\195\179n de fuente y la restaura al inicio.",
--    ["Set Font Size"] = "Tama\195\177o de Fuente",
--    ["Set text font size for each chat window."] = "Establece el tama\195\177o de fuente para cada ventana de chat",
--    ["Set ChatFrame%d Font Size"] = "Tama\195\177o de Fuente del Chat %d",
--    ["Set text font size."] = "Establece el tama\195\177o de fuente para la ventana de chat %d",
--    ["Auto Restore Font Size"] = "AutoRestaurar Tama\195\177o de la Fuente",
--    ["Workaround a Blizzard bug which changes the font size when you open a system menu."] = "Solucina temporalmente un bug de Blizzard que cambia el tama\195\177o de fuente cuando abres el men\195\186 de sistema.",
--    ["outlinemode_name"] = "Establecer Borde Fuente",
--    ["outlinemode_desc"] = "Establece el modo para el borde de la fuente.",
--    ["None"] = "Ninguno",
--    ["Outline"] = "Borde",
--    ["Thick Outline"] = "Borde Grueso",
--    ["monochrome_name"] = "Monocromo",
--    ["monochrome_desc"] = "Pono el color de la fuente en modo monocromo.",
--    ["shadowcolor_name"] = "Establecer Color de Sombra",
--    ["shadowcolor_desc"] = "Establece el color del efecto de la sombra.",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Font"] = "Schriftgr\195\182\195\159e",
--	["Chat window font options."] = "Chatfenster Schriftgr\195\182\195\159en Optionen.",
--	["Set Font Size"] = "Setze Schriftgr\195\182\195\159e",
--	["Set text font size for each chat window."] = "Setze Schriftgr\195\182\195\159e f\195\188r jedes Fenster.",
--	["Set ChatFrame%d Font Size"] = "Chat %d Schriftgr\195\182\195\159e",
--	["Set text font size."] = "Setze Schrifgr\195\182\195\159e f\195\188r Chatfenster %d.",
--} end)
--


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

local defaults = {
	profile = {
	    on = true,
	    fontface = "",
	    rememberfont = false,
	    size = {["*"]=12},
	    autorestore = false, 
	    outlinemode = "",
	    monochrome = false,
	    shadowcolor = {
	        r = 0,
	        g = 0,
	        b = 0,
	        a = 1,
	    },
	}
}

Prat:SetModuleDefaults(module, defaults)

Prat:SetModuleInit(module, function(self)
	local _
	for name,frame in pairs(Prat.Frames) do
		_, defaults.profile.size[name], _ = frame:GetFont()
	end

	self.db:RegisterDefaults(defaults)
end )



---- Fix the defaults that are being used for the chatframe text font size.
--for i=1,NUM_CHAT_WINDOWS do
--    local cf = getglobal("ChatFrame"..i)
--    local _, s, _ = cf:GetFont()    
--    module.defaultDB.size[i]  = s
--end
--
---- build the options menu using prat templates
--module.toggleOptions = { 
--    rememberfont = 120,
--    sep125_sep = 125,
--    sep145_sep = 145,
--    outlinemode = {
--        type = "text",
--        order = 150,
--        get = function() return module.db.profile.outlinemode end,
--        set = function(v) module.db.profile.outlinemode = v; module:ConfigureAllChatFrames() end,
--        validate = {[""] = L["None"], ["OUTLINE"] = L["Outline"], ["THICKOUTLINE"] = L["Thick Outline"]},
--    },
--    monochrome = {
--        type = "toggle",
--        order = 160,
--        get = function() return module.db.profile.monochrome end,
--        set = function(v) module.db.profile.monochrome = v; module:ConfigureAllChatFrames() end,
--    },
--    shadowcolor = { 
--        type = "color", 
--        order = 170, 
--        get = "GetShadowClr", 
--        set = "SetShadowClr",
--    },
--}

--local fontslist = {}
--local media 
--local cf, i, v, k
--
--function module:BuildFontList()
--    for i,v in ipairs(fontslist) do
--        fontslist[i] = nil
--    end
--    
--    for k,v in pairs(media:List(media.MediaType.FONT)) do
--        table.insert(fontslist, v)
--    end
--end
--
--function module:SharedMedia_Registered(mediatype, name)
--	self:Debug("SharedMedia_Registered", mediatype, name)
--    if mediatype == media.MediaType.FONT then
--        self:BuildFontList()
--    end
--end

local frameOption = 
{
--  name = string.format(L["Set ChatFrame%d Font Size"], num),
	name = function(info) return Prat.FrameList[info[#info]] or "" end,
    desc = L["Set text font size."], 
    type = "range",
	get = "GetSubValue",
	set = "SetSubValue",
    min = 4,
    max = 22,
    step = 1,
	hidden = function(info) return Prat.FrameList[info[#info]] == nil end,
}


Prat:SetModuleOptions(module, {
        name = L["Font"],
        desc = L["Chat window font options."],
        type = "group",
        args = {
            fontface = {
                name = L["Set Font Face"],
                desc = L["Set the text font face for all chat windows."],
                type = "select",
				dialogControl = 'LSM30_Font',
				values = AceGUIWidgetLSMlists.font,
                order = 110,
            },
            size = {
                name = L["Set Font Size"],
                desc = L["Set text font size for each chat window."],
                type = "group",
				inline = true,
                order = 130,
                args = {
                    ChatFrame1 = frameOption,
                    ChatFrame2 = frameOption,
                    ChatFrame3 = frameOption,
                    ChatFrame4 = frameOption,
                    ChatFrame5 = frameOption,
                    ChatFrame6 = frameOption,
                    ChatFrame7 = frameOption,
                }
            },
		
--			sep130 = { name="", order = 130, type = "header"},

		    outlinemode = {
				name = L["outlinemode_name"],
				desc = L["outlinemode_desc"],
		        type = "select",
		        order = 150,
		        values = {[""] = L["None"], ["OUTLINE"] = L["Outline"], ["THICKOUTLINE"] = L["Thick Outline"]},
		    },
		    monochrome = {
		        type = "toggle",
				name = L["monochrome_name"],
				desc = L["monochrome_desc"],
		        order = 160,
		    },
		    shadowcolor = { 
				name = L["shadowcolor_name"],
				desc = L["shadowcolor_desc"],
		        type = "color", 
		        order = 170, 
		        get = "GetColorValue", 
		        set = "SetColorValue",
		    },
			rememberfont = {
		        type = "toggle",
		        order = 120,
				name = L["rememberfont_name"],
				desc = L["rememberfont_desc"],
			},
--            autorestore = { 
--                name = L["Auto Restore Font Size"],
--                desc = L["Workaround a Blizzard bug which changes the font size when you open a system menu."],
--                type = "toggle",
--                order = 140,
--                get = function() return self.db.profile.autorestore end,
--                set = function(v) self.db.profile.autorestore = v; self:SetAutoRestore(v) end
--            },
        }
    }
)

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function module:OnModuleEnable()
    self.oldsize = {}

    for k, cf in pairs(Prat.Frames) do
        local _, s, _ = cf:GetFont()    
        self.oldsize[k]  = s
    end

    if not self.db.profile.rememberfont then
        self.db.profile.fontface = nil
    end

    self:ConfigureAllChatFrames()
--    -- This will resolve the issue where, when font sizes are set smaller than 12,
--    -- the size resets to 12 when closing UIOptionsFrame.
--    self:SetAutoRestore(self.db.profile.autorestore)
    self:SecureHook("FCF_SetChatWindowFontSize")
end

function module:OnModuleDisable()
    for k, cf in pairs(Prat.Frames) do
        self:SetFontSize(cf,self.oldsize[k] or 12)
    end
    self:SetFontMode("")
end

function module:GetSubValue(info)
		return self.db.profile[info[#info-1]][info[#info]]
end
function module:SetSubValue(info, b)
	self.db.profile[info[#info-1]][info[#info]] = b
	self:OnValueChanged(info, b)
end


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--

function module:ConfigureAllChatFrames()
	local db = self.db.profile

    if self.db.profile.fontface then
        self:SetFont(self.db.profile.fontface)
    end


    -- apply font size settings
    for k,v in pairs(Prat.Frames) do
        self:SetFontSize(v, db.size[k])
    end
    -- apply font flag settings
    if not db.monochrome then
        self:SetFontMode(db.outlinemode)
    else
        self:SetFontMode(db.outlinemode..", MONOCHROME")
    end
end

function module:SetFontSize(cf, size)
	if Prat.WOTLK then 
	    FCF_SetChatWindowFontSize(nil, cf, size)
	else
	    FCF_SetChatWindowFontSize(cf, size)
	end
end



function module:SetFont(font)
    fontfile = Prat.Media:Fetch(Prat.Media.MediaType.FONT, font)
    for k, cf in pairs(Prat.Frames) do
        local f, s, m = cf:GetFont()    
        cf:SetFont(fontfile, s, m)
    end
end

function module:SetFontMode(mode, monochrome)
    for k, cf in pairs(Prat.Frames) do
        local f, s, m = cf:GetFont()    
        cf:SetFont(f, s, mode)
	
		if monochrome then
	        local c = self.db.profile.shadowcolor
	        cf:SetShadowColor(c.r, c.g, c.b, c.a)
		end
    end
end

function module:GetShadowClr()
    local h = self.db.profile.shadowcolor or {}
    return h.r or 1.0, h.g or 1.0, h.b or 1.0
end

function module:SetShadowClr(r,g,b)
	local db = self.db.profile
    db.shadowcolor = db.shadowcolor or {}
    local h = db.shadowcolor
    h.r, h.g, h.b = r, g, b
    self:ConfigureAllChatFrames()
end

function module:FCF_SetChatWindowFontSize(fcfself, chatFrame, fontSize)
	if not Prat.WOTLK then
		chatFrame, fontSize = fcfself, chatFrame, fontSize
	end

	if ( not chatFrame ) then
		chatFrame = FCF_GetCurrentChatFrame();
	end
	if ( not fontSize ) then
		fontSize = chatFrame.value;
	end    
    self.oldsize[chatFrame:GetName()] = fontSize 
    if self.db and self.db.profile.on then
       self.db.profile.size[chatFrame:GetName()] = fontSize
    end
end

--function module:SetAutoRestore(val)
--    self.db.profile.autorestore = val
--    if self.db.profile.autorestore then
--    	if not self:IsHooked("UpdateMicroButtons") then self:SecureHook("UpdateMicroButtons", "ConfigureAllChatFrames") end
--    else
--    	if self:IsHooked("UpdateMicroButtons") then self:Unhook("UpdateMicroButtons") end
--    end
--end    


module.OnValueChanged = module.ConfigureAllChatFrames
module.OnSubValueChanged = module.ConfigureAllChatFrames
module.OnColorValueChanged = module.ConfigureAllChatFrames

  return
end ) -- Prat:AddModuleToLoad