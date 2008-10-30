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
Name: PratUrlCopy
Revision: $Revision: 81859 $
Author(s): Krtek (krtek4@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#UrlCopy
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that makes it easy to copy URLs in chat windows.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("UrlCopy")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["UrlCopy"] = true,
    ["URL formating options."] = true,
    ["Show Brackets"] = true,
    ["Toggle showing brackets on and off."] = true,
    ["Use Popup"] = true,
    ["Use popup window to show URL."] = true,
    ["Color URL"] = true,
    ["Toggle the URL color on and off."] = true,
    ["Set Color"] = true,
    ["Change the color of the URL."] = true,
    ["Toggle"] = true,
    ["Toggle the module on and off."] = true,
})

L:AddLocale("ruRU", {
    ["UrlCopy"] = true,
    ["URL formating options."] = "Настройки формата URL-адреса.",
    ["Show Brackets"] = "Показывать скобки",
    ["Toggle showing brackets on and off."] = "Вкл/Выкл отображение скобок.",
    ["Use Popup"] = "Всплывающее окно",
    ["Use popup window to show URL."] = "Использовать всплывающее окно для отображение ссылки.",
    ["Color URL"] = "Цвет ссылки",
    ["Toggle the URL color on and off."] = "Вкл/Выкл окраску ссылок.",
    ["Set Color"] = "Цвет",
    ["Change the color of the URL."] = "Изменение цвета ссылок.",
    ["Toggle"] = "Вкл/выкл",
    ["Toggle the module on and off."] = "Вкл/Выкл данный модуль.",
})

----[[
--    Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--    CWDG site: http://Cwowaddon.com
--]]
--
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--    ["UrlCopy"] = "复制超链接",
--    ["URL formating options."] = "超链接格式选项.",
--    ["Show Brackets"] = "显示括号",
--    ["Toggle showing brackets on and off."] = "切换显示括号功能打开与关闭.",
--    ["Use Popup"] = "弹出",
--    ["Use popup window to show URL."] = "用弹出窗口显示超链接.",
--    ["Color URL"] = "颜色",
--    ["Toggle the URL color on and off."] = "切换超链接颜色打开与关闭.",
--    ["Set Color"] = "设置颜色",
--    ["Change the color of the URL."] = "更改超链接颜色.",
--    ["Toggle"] = "切换",
--    ["Toggle the module on and off."] = "切换此模块的打开与关闭.",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["UrlCopy"] = "複製超連結",
--    ["URL formating options."] = "超連結格式選項。",
--    ["Show Brackets"] = "顯示括號",
--    ["Toggle showing brackets on and off."] = "切換顯示括號功能。",
--    ["Use Popup"] = "使用彈出視窗",
--    ["Use popup window to show URL."] = "用彈出視窗顯示超連結。",
--    ["Color URL"] = "顏色",
--    ["Toggle the URL color on and off."] = "切換使用超連結顏色。",
--    ["Set Color"] = "設定顏色",
--    ["Change the color of the URL."] = "更改超連結顏色。",
---- no use anymore    ["Toggle"] = true,
---- no use anymore    ["Toggle the module on and off."] = true,
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["UrlCopy"] = "URL 복사",
--    ["URL formating options."] = "URL 형식 설정입니다.",
--    ["Show Brackets"] = "괄호 표시",
--    ["Toggle showing brackets on and off."] = "괄호를 표시합니다.",
--    ["Use Popup"] = "팝업 사용",
--    ["Use popup window to show URL."] = "URL 표시를 위한 팝업창을 사용합니다.",
--    ["Color URL"] = "URL 색상",
--    ["Toggle the URL color on and off."] = "URL에 색상을 사용합니다.",
--    ["Set Color"] = "색상 설정",
--    ["Change the color of the URL."] = "URL의 색상을 변경합니다.",
--    ["Toggle"] = "사용",
--    ["Toggle the module on and off."] = "기능 사용 여부를 결정합니다.",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["UrlCopy"] = "Copia de URL",
--    ["URL formating options."] = "Opciones de formato de URL",
--    ["Show Brackets"] = "Mostrar Par\195\169ntesis",
--    ["Toggle showing brackets on and off."] = "Determina si se muestran los par\195\169ntesis",
--    ["Use Popup"] = "Usar Ventana Emergente",
--    ["Use popup window to show URL."] = "Usa una ventana emergente para mostrar la URL",
--    ["Color URL"] = "Color del URL",
--    ["Toggle the URL color on and off."] = "Determina si se colorea la URL",
--    ["Set Color"] = "Establecer Color",
--    ["Change the color of the URL."] = "Cambia el color del URL",
--    ["Toggle"] = "Activar",
--    ["Toggle the module on and off."] = "Activa y desactiva este m\195\179dulo.",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["UrlCopy"] = "URL Kopieren",
--    ["URL formating options."] = "URL Format Optionen",
--    ["Show Brackets"] = "Zeige Klammern",
--    ["Toggle showing brackets on and off."] = "Schaltet das Anzeigen von Klammern an und aus.",
--    ["Use Popup"] = "Benutze Popup",
--    ["Use popup window to show URL."] = "Benutze Popup Fenster um die URL anzuzeigen.",
--    ["Color URL"] = "F\195\164rbe URL",
--    ["Toggle the URL color on and off."] = "Schaltet das einf\195\164rben der URL ein und aus.",
--    ["Set Color"] = "W\195\164hle Farbe",
--    ["Change the color of the URL."] = "Farbe der URL \195\164ndern.",
--    ["Toggle"] = "Einschalten",
--    ["Toggle the module on and off."] = "Schaltet das Modul an und aus.",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["UrlCopy"] = "Copie des URL",
--    ["URL formating options."] = "Options d'affichage des URL.",
--    ["Show Brackets"] = "Crochets",
--    ["Toggle showing brackets on and off."] = "Affiche/masque les crochets autour de l'URL",
--    ["Use Popup"] = "Fen\195\170tre flottante",
--    ["Use popup window to show URL."] = "Affiche l'URL dans une fen\195\170tre flottante.",
--    ["Color URL"] = "Colorer l'URL",
--    ["Toggle the URL color on and off."] = "Affiche ou non l'URL en couleur.",
--    ["Set Color"] = "Couleur",
--    ["Change the color of the URL."] = "Change la couleur de l'URL.",
--} end)


local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module.name, {
	profile = {
        on = true,
        bracket = true,
        popup = true,
        colorurl = true,
        color = {
            r = 1,
            g = 1,
            b = 1,
			a = 1
        },
	}
})

do
	local function Link(...)
	    return module:Link(...)
	end
	local function LinkwTLD(...)
	    return module:LinkwTLD(...)
	end
	local function Skip(...)
	    return module:Skip(...)
	end
	
	Prat:SetModulePatterns(module, {
	        -- X://Y url
	    { pattern = "^(%a[%w+.-]+://%S+)", matchfunc=Link},
	    { pattern = "%f[%S](%a[%w+.-]+://%S+)", matchfunc=Link},
	        -- www.X.Y url
	    { pattern = "^(www%.[%w_-%%]+%.%S+)", matchfunc=Link},
	    { pattern = "%f[%S](www%.[%w_-%%]+%.%S+)", matchfunc=Link},
	        -- "W X"@Y.Z email (this is seriously a valid email)
	    { pattern = '^(%"[^%"]+%"@[%w_.-%%]+%.(%a%a+))', matchfunc=LinkwTLD},
	    { pattern = '%f[%S](%"[^%"]+%"@[%w_.-%%]+%.(%a%a+))', matchfunc=LinkwTLD},
	        -- X@Y.Z email
	    { pattern = "(%S+@[%w_.-%%]+%.(%a%a+))", matchfunc=LinkwTLD},
	        -- XXX.YYY.ZZZ.WWW:VVVV/UUUUU IPv4 address with port and path
	    { pattern = "^([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d:[0-6]?%d?%d?%d?%d/%S+)", matchfunc=Link},
	    { pattern = "%f[%S]([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d:[0-6]?%d?%d?%d?%d/%S+)", matchfunc=Link},
	        -- XXX.YYY.ZZZ.WWW:VVVV IPv4 address with port (IP of ts server for example)
	    { pattern = "^([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d:[0-6]?%d?%d?%d?%d)%f[%D]", matchfunc=Link},
	    { pattern = "%f[%S]([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d:[0-6]?%d?%d?%d?%d)%f[%D]", matchfunc=Link},
	        -- XXX.YYY.ZZZ.WWW/VVVVV IPv4 address with path
	    { pattern = "^([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%/%S+)", matchfunc=Link},
	    { pattern = "%f[%S]([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%/%S+)", matchfunc=Link},
	        -- XXX.YYY.ZZZ.WWW IPv4 address
	    { pattern = "^([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%)%f[%D]", matchfunc=Link},
	    { pattern = "%f[%S]([0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%.[0-2]?%d?%d%)%f[%D]", matchfunc=Link},
	        -- X.Y.Z:WWWW/VVVVV url with port and path
	    { pattern = "^([%w_.-%%]+[%w_-%%]%.(%a%a+):[0-6]?%d?%d?%d?%d/%S+)", matchfunc=LinkwTLD},
	    { pattern = "%f[%S]([%w_.-%%]+[%w_-%%]%.(%a%a+):[0-6]?%d?%d?%d?%d/%S+)", matchfunc=LinkwTLD},
	        -- X.Y.Z:WWWW url with port (ts server for example)
	    { pattern = "^([%w_.-%%]+[%w_-%%]%.(%a%a+):[0-6]?%d?%d?%d?%d)%f[%D]", matchfunc=LinkwTLD},
	    { pattern = "%f[%S]([%w_.-%%]+[%w_-%%]%.(%a%a+):[0-6]?%d?%d?%d?%d)%f[%D]", matchfunc=LinkwTLD},
	        -- X.Y.Z/WWWWW url with path
	    { pattern = "^([%w_.-%%]+[%w_-%%]%.(%a%a+)/%S+)", matchfunc=LinkwTLD},
	    { pattern = "%f[%S]([%w_.-%%]+[%w_-%%]%.(%a%a+)/%S+)", matchfunc=LinkwTLD},
	        -- X.Y.Z url
	    { pattern = "^([%w_.-%%]+[%w_-%%]%.(%a%a+))", matchfunc=LinkwTLD},
	    { pattern = "%f[%S]([%w_.-%%]+[%w_-%%]%.(%a%a+))", matchfunc=LinkwTLD},
	})
end

module.tlds = {
ONION = true,
-- Copied from http://data.iana.org/TLD/tlds-alpha-by-domain.txt
--# Version 2008020401, Last Updated Tue Feb  5 09:07:01 2008 UTC
AC = true,
AD = true,
AE = true,
AERO = true,
AF = true,
AG = true,
AI = true,
AL = true,
AM = true,
AN = true,
AO = true,
AQ = true,
AR = true,
ARPA = true,
AS = true,
ASIA = true,
AT = true,
AU = true,
AW = true,
AX = true,
AZ = true,
BA = true,
BB = true,
BD = true,
BE = true,
BF = true,
BG = true,
BH = true,
BI = true,
BIZ = true,
BJ = true,
BM = true,
BN = true,
BO = true,
BR = true,
BS = true,
BT = true,
BV = true,
BW = true,
BY = true,
BZ = true,
CA = true,
CAT = true,
CC = true,
CD = true,
CF = true,
CG = true,
CH = true,
CI = true,
CK = true,
CL = true,
CM = true,
CN = true,
CO = true,
COM = true,
COOP = true,
CR = true,
CU = true,
CV = true,
CX = true,
CY = true,
CZ = true,
DE = true,
DJ = true,
DK = true,
DM = true,
DO = true,
DZ = true,
EC = true,
EDU = true,
EE = true,
EG = true,
ER = true,
ES = true,
ET = true,
EU = true,
FI = true,
FJ = true,
FK = true,
FM = true,
FO = true,
FR = true,
GA = true,
GB = true,
GD = true,
GE = true,
GF = true,
GG = true,
GH = true,
GI = true,
GL = true,
GM = true,
GN = true,
GOV = true,
GP = true,
GQ = true,
GR = true,
GS = true,
GT = true,
GU = true,
GW = true,
GY = true,
HK = true,
HM = true,
HN = true,
HR = true,
HT = true,
HU = true,
ID = true,
IE = true,
IL = true,
IM = true,
IN = true,
INFO = true,
INT = true,
IO = true,
IQ = true,
IR = true,
IS = true,
IT = true,
JE = true,
JM = true,
JO = true,
JOBS = true,
JP = true,
KE = true,
KG = true,
KH = true,
KI = true,
KM = true,
KN = true,
KP = true,
KR = true,
KW = true,
KY = true,
KZ = true,
LA = true,
LB = true,
LC = true,
LI = true,
LK = true,
LR = true,
LS = true,
LT = true,
LU = true,
LV = true,
LY = true,
MA = true,
MC = true,
MD = true,
ME = true,
MG = true,
MH = true,
MIL = true,
MK = true,
ML = true,
MM = true,
MN = true,
MO = true,
MOBI = true,
MP = true,
MQ = true,
MR = true,
MS = true,
MT = true,
MU = true,
MUSEUM = true,
MV = true,
MW = true,
MX = true,
MY = true,
MZ = true,
NA = true,
NAME = true,
NC = true,
NE = true,
NET = true,
NF = true,
NG = true,
NI = true,
NL = true,
NO = true,
NP = true,
NR = true,
NU = true,
NZ = true,
OM = true,
ORG = true,
PA = true,
PE = true,
PF = true,
PG = true,
PH = true,
PK = true,
PL = true,
PM = true,
PN = true,
PR = true,
PRO = true,
PS = true,
PT = true,
PW = true,
PY = true,
QA = true,
RE = true,
RO = true,
RS = true,
RU = true,
RW = true,
SA = true,
SB = true,
SC = true,
SD = true,
SE = true,
SG = true,
SH = true,
SI = true,
SJ = true,
SK = true,
SL = true,
SM = true,
SN = true,
SO = true,
SR = true,
ST = true,
SU = true,
SV = true,
SY = true,
SZ = true,
TC = true,
TD = true,
TEL = true,
TF = true,
TG = true,
TH = true,
TJ = true,
TK = true,
TL = true,
TM = true,
TN = true,
TO = true,
TP = true,
TR = true,
TRAVEL = true,
TT = true,
TV = true,
TW = true,
TZ = true,
UA = true,
UG = true,
UK = true,
UM = true,
US = true,
UY = true,
UZ = true,
VA = true,
VC = true,
VE = true,
VG = true,
VI = true,
VN = true,
VU = true,
WF = true,
WS = true,
YE = true,
YT = true,
YU = true,
ZA = true,
ZM = true,
ZW = true,
}

--[[
XN--0ZWM56D = true,
XN--11B5BS3A9AJ6G = true,
XN--80AKHBYKNJ4F = true,
XN--9T4B11YI5A = true,
XN--DEBA0AD = true,
XN--G6W251D = true,
XN--HGBK6AJ7F53BBA = true,
XN--HLCJ6AYA9ESC7A = true,
XN--JXALPDLP = true,
XN--KGBECHTV = true,
XN--ZCKZAH = true,
]]

Prat:SetModuleOptions(module, {
        name = L["UrlCopy"],
        desc = L["URL formating options."],
        type = "group",
        args = {
            bracket = {
                name = L["Show Brackets"],
                desc = L["Toggle showing brackets on and off."],
                type = "toggle",
                order = 160,            },
            popup = {
                name = L["Use Popup"],
                desc = L["Use popup window to show URL."],
                type = "toggle",
                order = 170,            },
            colorurl = {
                name = L["Color URL"],
                desc = L["Toggle the URL color on and off."],
                type = "toggle",
                order = 180,            },
            color = {
                name = L["Set Color"],
                desc = L["Change the color of the URL."],
                type = "color",
                order = 190,
				get = "GetColorValue",
				set = "SetColorValue",
                disabled = "IsSetColorDisabled",
            },
        }
    }
)

function module:IsSetColorDisabled()
	if not self.db.profile.colorurl then 
		return true 
	end
	return false 
end

function module:OnModuleEnable()
    Prat.RegisterLinkType(  { linkid="url", linkfunc=module.Url_Link, handler=module }, module.name)
end

function module:OnModuleDisable()
	Prat.UnregisterAllLinkTypes(self)
end

--module.IWIN = "|cff9d9d9d|Hitem:18230:0:0:0:0:0:0:1763172530|h[Broken I.W.I.N. Button]|h|r"


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--


function module:Url_Link(link, text, button, ...)
    self:ShowUrl(link)
    return false
end

do
	local function NOP() return end

	function module:StaticPopupUrl(link)
	    StaticPopupDialogs["SHOW_URL"] = StaticPopupDialogs["SHOW_URL"] or {
	        text = "URL : %s",
	        button2 = ACCEPT,
	        hasEditBox = 1,
	        hasWideEditBox = 1,
	
	        OnShow = function(...)
	            this:SetWidth(420)
	
	            local editBox = getglobal(this:GetName().."WideEditBox")
	            editBox:SetText(StaticPopupDialogs["SHOW_URL"].urltext)
	            editBox:SetFocus()
	            editBox:HighlightText(0)
	
	            local button = getglobal(this:GetName().."Button2")
	            button:ClearAllPoints()
	            button:SetWidth(200)
	            button:SetPoint("CENTER", editBox, "CENTER", 0, -30)
	        end,
	
	        OnHide = NOP,
	        OnAccept = NOP,
	        OnCancel = NOP,
	        EditBoxOnEscapePressed = function(...) this:GetParent():Hide() end,
	        timeout = 0,
	        whileDead = 1,
	        hideOnEscape = 1
	    }
	
	    StaticPopupDialogs["SHOW_URL"].urltext = link
	    StaticPopup_Show("SHOW_URL", link)
	end
end


function module:EditBoxUrl(link)
    if (not ChatFrameEditBox:IsShown()) then
        ChatFrame_OpenChat(link, DEFAULT_CHAT_FRAME)
    else
        ChatFrameEditBox:Insert(link)
    end
end

function module:ShowUrl(link)
    link = strsub(link, 5)
    if ( self.db.profile.popup ) then
        self:StaticPopupUrl(link)
    else
        self:EditBoxUrl(link)
    end
end


-- Utility Function (called by gsub)
function module:RawLink(link)
    local returnedLink = ""

    if self.db.profile.colorurl then
        local c = self.db.profile.color
        local color = string.format("%02x%02x%02x", c.r*255, c.g*255, c.b*255)
        returnedLink = "|cff" .. color
    end

    link = link:gsub('%%', '%%%%')

    returnedLink = returnedLink .. "|Hurl:" .. link .. "|h"

    if ( self.db.profile.bracket ) then
        returnedLink = returnedLink .. "[" .. link .. "]"
    else
        returnedLink = returnedLink .. link
    end

    returnedLink = returnedLink .. "|h|r"

    return returnedLink
end

function  module:Link(link, ...)
    if link == nil then
        return ""
    end

    return self:AddLink(self:RawLink(link))
end

function  module:LinkwTLD(link, tld, ...)
    if link == nil or tld == nil then
        return ""
    end

    if self.tlds[tld:upper()] then
        link = self:RawLink(link)
    end

    return self:AddLink(link)
end

function  module:Skip(link, ...)
    if link == nil then
        return ""
    end

    return self:AddLink(link)
end


function module:AddLink(link)
     return Prat:RegisterMatch(link)
end


  return
end ) -- Prat:AddModuleToLoad