----------------------------------------------------------------------------------
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
Name: PratEditbox
Revision: $Revision: 80463 $
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
Inspired by: idChat2_Editbox by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Editbox
Issues and feature requests: http://code.google.com/p/prat/issues/list
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Module for Prat that adds editbox options.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Editbox")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
    ["Editbox"] = true,
    ["Editbox options."] = true,
    ["Set Alpha"] = true,
    ["Set the alpha of the editbox."] = true,
    ["Set Position"] = true,
    ["Set the position of the editbox."] = true,
    ["Hide Border"] = true,
    ["Hide the border around the edit box."] = true,
    ["Set Width (NB: only enabled if the editbox is undocked)"] = true,
    ["Set the width of the editbox."] = true,
    ["Lock Position"] = true,
    ["Lock editbox position if undocked."] = true,
    ["Enable Arrowkeys"] = true,
    ["Enable using arrowkeys in editbox without the alt key."] = true,
    ["Autohide"] = true,
    ["Hide the edit box after you have pressed enter."] = true,
    ["Clickable"] = true,
    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = true,
	["Top"] = true,
	["Bottom"] = true,
	["Undocked"] = true,
	['Set the frame strata of the editbox.'] = true,
	['Set Strata'] = true,
	['DIALOG'] = true,
	['HIGH'] = true,
	['MEDIUM'] = true,
	['LOW'] = true,
	['BACKGROUND'] = true,
	['Texture'] = true,
	['Set the texture of the chat edit box'] = true,
	['Bar colour'] = true,
	['Set the edit box background colour'] = true,
	['Border width'] = true,
	["Set the width of the edit box's border"] = true,
	['Border colour'] = true,
	['Set the edit box border colour'] = true,
	['Padding'] = true,
	["Set the amount of padding inside the edit box"] = true,
})

L:AddLocale("ruRU", {
    ["Editbox"] = true,
    ["Editbox options."] = true,
    ["Set Alpha"] = true,
    ["Set the alpha of the editbox."] = true,
    ["Set Position"] = true,
    ["Set the position of the editbox."] = true,
    ["Hide Border"] = true,
    ["Hide the border around the edit box."] = true,
    ["Set Width (NB: only enabled if the editbox is undocked)"] = true,
    ["Set the width of the editbox."] = true,
    ["Lock Position"] = true,
    ["Lock editbox position if undocked."] = true,
    ["Enable Arrowkeys"] = true,
    ["Enable using arrowkeys in editbox without the alt key."] = true,
    ["Autohide"] = true,
    ["Hide the edit box after you have pressed enter."] = true,
    ["Clickable"] = true,
    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = true,
	["Top"] = true,
	["Bottom"] = true,
	["Undocked"] = true,
	['Set the frame strata of the editbox.'] = true,
	['Set Strata'] = true,
	['DIALOG'] = true,
	['HIGH'] = true,
	['MEDIUM'] = true,
	['LOW'] = true,
	['BACKGROUND'] = true,
	['Texture'] = true,
	['Set the texture of the chat edit box'] = true,
	['Bar colour'] = true,
	['Set the edit box background colour'] = true,
	['Border width'] = true,
	["Set the width of the edit box's border"] = true,
	['Border colour'] = true,
	['Set the edit box border colour'] = true,
	['Padding'] = true,
	["Set the amount of padding inside the edit box"] = true,
})

----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["Editbox"] = "输入框",
-- 	["Editbox options."] = "输入框选项.",
--    ["Set Alpha"] = "透明度",
--    ["Set the alpha of the editbox."] = "设置编辑框透明度.",
--    ["Set Position"] = "位置",
--    ["Set the position of the editbox."] = "设置编辑框位置.",
--    ["Hide Border"] = "隐藏边框",
--    ["Hide the border around the edit box."] = "隐藏编辑框的边框.",
--    ["Set Width (NB: only enabled if the editbox is undocked)"] = "宽度（仅当编辑框悬浮时有效）",
--    ["Set the width of the editbox."] = "设置编辑框宽度",
--    ["Lock Position"] = "锁定",
--    ["Lock editbox position if undocked."] = "卸除时锁定编辑框位置.",
--    ["Enable Arrowkeys"] = "开启方向键",
--    ["Enable using arrowkeys in editbox without the alt key."] = "不用 <Alt> 直接使用方向键编辑.",
--    ["Autohide"] = "自动隐藏",
--    ["Hide the edit box after you have pressed enter."] = "按下输入键后隐藏编辑框.",
--    ["Clickable"] = "可点击",
--    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = "点击打开编辑框编辑, 仅在自动隐藏关闭时有效.",
--	["Top"] = "顶部",
--	["Bottom"] = "底部",
--	["Undocked"] = "卸除",
--	['Set the frame strata of the editbox.'] = "设定聊天輸入框框架显示层级。",
--	['Set Strata'] = "显示层级",
--	['DIALOG'] = "对话框",
--	['HIGH'] = "高",
--	['MEDIUM'] = "中",
--	['LOW'] = "低",
--	['BACKGROUND'] = "背景",
--} end)
--
--L[LIB.NEWLOCALE](L, "frFR", function() return {
--    ["Editbox"] = "Zone de saisie",
--    ["Editbox options."] = "Options de la zone de saisie",
--    ["Set Alpha"] = "Transparence",
--    ["Set the alpha of the editbox."] = "R\195\168gle la transparence de la zone de saisie.",
--    ["Set Position"] = "Position",
--    ["Set the position of the editbox."] = "Change la position de la zone de saisie",
--    ["Hide Border"] = "Cache les bords",
--    ["Hide the border around the edit box."] = "Ache les bordure autour de la zone de saisie",
--    ["Set Width (NB: only enabled if the editbox is undocked)"] = "Definit la largeur",
--    ["Set the width of the editbox."] = "Definit la largeur",
--    ["Lock Position"] = "Verrouiller la position",
--    ["Lock editbox position if undocked."] = "Verrouille la position de la zone de saisie si elle est libre.",
--    ["Enable Arrowkeys"] = "Activer les fl\195\168ches du clavier",
--    ["Enable using arrowkeys in editbox without the alt key."] = "Permet d'utiliser les fl\195\168ches du clavier sans utiliser Alt.",
--    ["Autohide"] = "cache auto",
--    ["Hide the edit box after you have pressed enter."] = "cacher la zone de saisie apr?s avoir presse Entrer",
--    ["Clickable"] = "Cliquable",
--    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = "Cliquer sur la zone de saisie ouvre l'edition. Seulement valable si autohide est descative.",
--	["Top"] = "Haut",
--	["Bottom"] = "Bas",
--	["Undocked"] = "Mouvement libre",
--	['Set the frame strata of the editbox.'] = "Met la strata de la zone de saisie",
--	['Set Strata'] = "Defini le strata",
--	['DIALOG'] = "Dialog",
--	['HIGH'] = "Haut",
--	['MEDIUM'] = "Moyen",
--	['LOW'] = "Bas",
--	['BACKGROUND'] = "Fond",
--
--} end)
--
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--    ["Editbox"] = "입력창",
--    ["Editbox options."] = "입력창 설정입니다.",
--    ["Set Alpha"] = "투명도 설정",
--    ["Set the alpha of the editbox."] = "입력창의 투명도를 설정합니다.",
--    ["Set Position"] = "위치 설정",
--    ["Set the position of the editbox."] = "입력창의 위치를 설정합니다.",
--    ["Hide Border"] = "테두리 숨김",
--    ["Hide the border around the edit box."] = "입력창 주변의 테두리를 숨깁니다.",
--    ["Set Width (NB: only enabled if the editbox is undocked)"] = "너비 설정 (NB: 입력창이 분리되었을 때 적용)",
--    ["Set the width of the editbox."] = "입력창의 넓이를 설정합니다.",
--    ["Lock Position"] = "위치 고정",
--    ["Lock editbox position if undocked."] = "입력창의 위치를 고정합니다.",
--    ["Enable Arrowkeys"] = "방향키 사용",
--    ["Enable using arrowkeys in editbox without the alt key."] = "ALT키를 누르지 않고 입력창에 방향키를 사용합니다.",
--    ["Autohide"] = "자동 숨김",
--    ["Hide the edit box after you have pressed enter."] = "엔터키 입력 후 입력창을 숨깁니다.",
--    ["Clickable"] = "클릭 사용",
--    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = "Click the edit box to open it up for editing. Only available if Autohide is disabled.",
--	["Top"] = "상단",
--	["Bottom"] = "하단",
--	["Undocked"] = "분리됨",
--	['Set the frame strata of the editbox.'] = "입력창의 프레임 우선순위를 설정합니다.",
--	['Set Strata'] = "우선순위 설정",
--	['DIALOG'] = "DIALOG",
--	['HIGH'] = "HIGH",
--	['MEDIUM'] = "MEDIUM",
--	['LOW'] = "LOW",
--	['BACKGROUND'] = "BACKGROUND",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--    ["Editbox"] = "聊天輸入框",
--    ["Editbox options."] = "聊天輸入框選項。",
--    ["Set Alpha"] = "透明度",
--    ["Set the alpha of the editbox."] = "設定聊天輸入框透明度。",
--    ["Set Position"] = "位置",
--    ["Set the position of the editbox."] = "設定聊天輸入框位置。",
--    ["Hide Border"] = "隱藏邊框",
--    ["Hide the border around the edit box."] = "隱藏聊天輸入框的邊框。",
--    ["Set Width (NB: only enabled if the editbox is undocked)"] = "寬度 (註: 聊天輸入框浮動時才有效)",
--    ["Set the width of the editbox."] = "設定聊天輸入框寬度。",
--    ["Lock Position"] = "鎖定",
--    ["Lock editbox position if undocked."] = "浮動時鎖定聊天輸入框位置。",
--    ["Enable Arrowkeys"] = "啟用方向鍵",
--    ["Enable using arrowkeys in editbox without the alt key."] = "不用Alt鍵直接使用方向鍵編輯。",
--    ["Autohide"] = "自動隱藏",
--    ["Hide the edit box after you have pressed enter."] = "按下輸入鍵後隱藏聊天輸入框。",
--    ["Clickable"] = "可點擊",
--    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = "點擊打開輸入框編輯，僅在自動隱藏停用時有效。",
--	["Top"] = "頂部",
--	["Bottom"] = "底部",
--	["Undocked"] = "浮動",
--	['Set the frame strata of the editbox.'] = "設定聊天輸入框框架顯示層級。",
--	['Set Strata'] = "顯示層級",
--	['DIALOG'] = "對話框",
--	['HIGH'] = "高",
--	['MEDIUM'] = "中",
--	['LOW'] = "低",
--	['BACKGROUND'] = "背景",
--	['Texture'] = "材質",
--	['Set the texture of the chat edit box'] = "設定聊天輸入框的材質。",
--	['Bar colour'] = "背景顏色",
--	['Set the edit box background colour'] = "設定聊天輸入框的背景顏色。",
--	['Border width'] = "邊框寬度",
--	["Set the width of the edit box's border"] = "設定聊天輸入框的邊框寬度。",
--	['Border colour'] = "邊框顏色",
--	['Set the edit box border colour'] = "設定聊天輸入框的邊框顏色。",
--	['Padding'] = "間距",
--	["Set the amount of padding inside the edit box"] = "設定聊天輸入框的邊框間距。",
--} end)
--
--L[LIB.NEWLOCALE](L, "esES", function() return {
--    ["Editbox"] = "Caja de Edici\195\179n",
--    ["Editbox options."] = "Opciones de la caja de edici\195\179n",
--    ["Set Alpha"] = "Transparencia",
--    ["Set the alpha of the editbox."] = "Establece la transparencia de la caja de edici\195\179n",
--    ["Set Position"] = "Posici\195\179n",
--    ["Set the position of the editbox."] = "Establece la posici\195\179n de la caja de edici\195\179n",
--    ["Set Width (NB: only enabled if the editbox is undocked)"] = "Anchura (Nota: Solo activo si la caja de edici\195\179n no est\195\161 anclada",
--    ["Set the width of the editbox."] = "Establece la anchura de la caja de edici\195\179n",
--    ["Lock Position"] = "Bloqueado",
--    ["Lock editbox position if undocked."] = "Bloquea la posici\195\179n de la caja de edici\195\179n cuando no est\195\161 anclada",
--    ["Enable Arrowkeys"] = "Teclas de Direcci\195\179n",
--    ["Enable using arrowkeys in editbox without the alt key."] = "Determina si se usan las teclas de direcci\195\179n en la caja de edici\195\179n sin la tecla Alt",
--    ["Autohide"] = "AutoOcultar",
--    ["Hide the edit box after you have pressed enter."] = "Oculta la caja de edici\195\179n despu\195\169s de pulsar enter.",
--    ["Clickable"] = "Cliqueable",
--    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = "Click la caja de edici\195\179n para abrirla para editarla. Solo disponible si AutoOcultar est\195\161 desactivado.",
--	["Top"] = "Arriba",
--	["Bottom"] = "Abajo",
--	["Undocked"] = "Suelto",
--	['Set the frame strata of the editbox.'] = "Establece el orden del marco de la caja de edici\195\179n.",
--	['Set Strata'] = "Establecer el Orden",
--	['DIALOG'] = "DIALOGO",
--	['HIGH'] = "ALTO",
--	['MEDIUM'] = "MEDIO",
--	['LOW'] = "BAJO",
--	['BACKGROUND'] = "FONDO",
-- 	['Texture'] = "Textura",
--	['Set the texture of the chat edit box'] = "Establece la textura de la caja de edici\195\179n del chat",
--	['Bar colour'] = "Color de la Barra",
--	['Set the edit box background colour'] = "Establece el color de fondo de la caja de edici\195\179n",
--	['Border width'] = "Ancho del borde",
--	["Set the width of the edit box's border"] = "Establece el ancho del borde de la caja de edici\195\179n",
--	['Border colour'] = "Color del borde",
--	['Set the edit box border colour'] = "Establece el color del borde de la caja de edici\195\179n",
--	['Padding'] = "Margen",
--	["Set the amount of padding inside the edit box"] = "Establece el margen del interior de la caja de edici\195\179n",
--} end)
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--    ["Editbox"] = "Eingabefeld",
--    ["Editbox options."] = "Eingabefeld Optionen.",
--    ["Set Alpha"] = "Helligkeit einstellen",
--    ["Set the alpha of the editbox."] = "Stellt die Helligkeit f\195\188r das Eingabefeld ein.",
--    ["Set Position"] = "Position einstellen",
--    ["Set the position of the editbox."] = "Position des Eingabefelds festlegen",
--    ["Hide Border"] = "Rahmen verstecken",
--    ["Hide the border around the edit box."] = "Rahmen um das Eingabefeld verstecken",
--    ["Set Width (NB: only enabled if the editbox is undocked)"] = "Breite einstellen",
--    ["Set the width of the editbox."] = "Stellt die Breite des Eingabefelds ein.",
--    ["Lock Position"] = "Sperre Position",
--    ["Lock editbox position if undocked."] = "Sperrt die Position des Eingabefelds falls freigegeben.",
--    ["Enable Arrowkeys"] = "Aktiviere Pfeiltasten",
--    ["Enable using arrowkeys in editbox without the alt key."] = "Aktiviere das benutzen von Pfeiltasten ohne die Alt-Taste benutzen zu m\195\188ssen.",
--    ["Autohide"] = "Automatisch Verstecken",
--    ["Hide the edit box after you have pressed enter."] = "Versteckt das Eingabefeld nachdem du Enter gedr?ckt hast.",
--    ["Clickable"] = "Klickbar",
--    ["Click the edit box to open it up for editing. Only available if Autohide is disabled."] = "Klicke auf das Einfabefeld um es f?r Eingaben zu oeffnen.",
--    ["Top"] = "Oben",
--    ["Bottom"] = "Unten",
--    ["Undocked"] = "Frei",
--    ['Set the frame strata of the editbox.'] = "Bestimmt die Helligkeit des eingabefeldes",
--    ['Set Strata'] = "Bestimmt die Helligkeit",
--    ['DIALOG'] = "Dialog",
--    ['HIGH'] = "Hoch",
--    ['MEDIUM'] = "Mittel",
--    ['LOW'] = "Niedrig",
--    ['BACKGROUND'] = "Hintergrund",
--} end)


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
        on = true,
        alpha = 1,
        position = "TOP",
        hideborder = false,
        width = 400,
        undocked = {point = "CENTER", relativeTo="UIParent", relativePoint = "CENTER", xoff = 0, yoff = 0},
        locked = false,
        arrowkeys = true,
        autohide = true,
        clickable = false,
		strata	= nil,
		texture = nil,
		texturebg = nil,
		backdropcolour	= { 0, 0, 0, 1 },
		bordercolour	= { 0, 0, 0, 1 },
		borderwidth	= 0,
		padding		= 4,
	}
} )


module.defaultRegions = nil
module.using = false
module.parent = nil

Prat:SetModuleOptions(module, {
        name = L["Editbox"],
        desc = L["Editbox options."],
        type = "group",
        args = {
            position = {
                name = L["Set Position"],
                desc = L["Set the position of the editbox."],
                type = "select",
                order = 110,
                values = {["TOP"] = L["Top"], ["BOTTOM"] = L["Bottom"], ["UNDOCKED"] = L["Undocked"]},
            },
            width = {
                name = L["Set Width (NB: only enabled if the editbox is undocked)"],
                desc = L["Set the width of the editbox."],
                type = "range",
                order = 120,
                min = 267,
                max = 800,
                step = 1,
                disabled = function(info) if info.handler.db.profile.position == "UNDOCKED" then return false else return true end end,
            },
            locked = {
                name = L["Lock Position"],
                desc = L["Lock editbox position if undocked."],
                type = "toggle",
                order = 130,                
				disabled = function(info) if info.handler.db.profile.position == "UNDOCKED" then return false else return true end end,
            },
            alpha = {
                name = L["Set Alpha"],
                desc = L["Set the alpha of the editbox."],
                type = "range",
                order = 140,
                min = 0,
                max = 1,
                step = 0.05,
            },
            strata = {
                name = L['Set Strata'],
                desc = L['Set the frame strata of the editbox.'],
                type = 'select',
                order = 150,
                values = {
                    ['DIALOG'] = L['DIALOG'],
                    ['HIGH'] = L['HIGH'],
                    ['MEDIUM'] = L['MEDIUM'],
                    ['LOW'] = L['LOW'],
                    ['BACKGROUND'] = L['BACKGROUND'],
                },
            },
            hideborder = {
                name = L["Hide Border"],
                desc = L["Hide the border around the edit box."],
                type = "toggle",
                order = 160,
            },
            arrowkeys = {
                name = L["Enable Arrowkeys"],
                desc = L["Enable using arrowkeys in editbox without the alt key."],
                type = "toggle",
                order = 170,
            },
            autohide = {
                name = L["Autohide"],
                desc = L["Hide the edit box after you have pressed enter."],
                type = "toggle",
                order = 180,
            },
            clickable = {
                name = L["Clickable"],
                desc = L["Click the edit box to open it up for editing. Only available if Autohide is disabled."],
                type = "toggle",
                order = 190,
                disabled = function (info) return info.handler.db.profile.autohide end,
            },
            texture = {
                name = L['Texture'],
				order = 200,
                desc = L['Set the texture of the chat edit box'],
                type = 'select',
				dialogControl = 'LSM30_Background',
                values = AceGUIWidgetLSMlists.background,
                get = function(info) return info.handler.db.profile.texture end,
                set = function(info, texture)
                        info.handler.db.profile.texture = texture
                        info.handler:SetBackdrop(info.handler.db.profile.texture)
                    end,
            },
            bordertexture = {
                name = 'Border Texture',
				order = 200,
                desc = 'Border Texture',
                type = 'select',
				dialogControl = 'LSM30_Border',
                values = AceGUIWidgetLSMlists.border,
                get = function(info) return info.handler.db.profile.bordertexture end,
                set = function(info, bordertexture)
                        info.handler.db.profile.bordertexture = bordertexture
                        info.handler:SetBackdrop()
                    end,
            },
	    backdropcolour = {
			name = L['Bar colour'],
			order = 205,
			desc = L['Set the edit box background colour'],
			type = 'color',
			set = function(info, r, g, b, a)
				info.handler.db.profile.backdropcolour = { r, g, b, a }
				return info.handler:SetBackdropColourTo(unpack(info.handler.db.profile.backdropcolour))
			end,
			get = function(info)
				return unpack(info.handler.db.profile.backdropcolour)
			end,
			hasAlpha = true,
	    },
	    borderwidth = {
			name = L['Border width'],
			order = 210,
			type = 'range',
			min = 1,
			max = 30,
			step = 1,
			desc = L["Set the width of the edit box's border"],
			set = function(info, width)
				info.handler.db.profile.borderwidth = width
				info.handler:SetBackdrop(info.handler.db.profile.texture)
				info.handler:SetBackdropColourTo(unpack(info.handler.db.profile.backdropcolour))
			end,
			get = function(info) return info.handler.db.profile.borderwidth or 0 end,
			--disabled = function(info) return info.handler.db.profile.hideborder end,
	    },
	    bordercolour = {
			name = L['Border colour'],
			order = 220,
			desc = L['Set the edit box border colour'],
			type = 'color',
			set = function(info, r, g, b, a)
				info.handler.db.profile.bordercolour = { r, g, b, a }
				return info.handler:SetBackdropBorderColorTo(unpack(info.handler.db.profile.bordercolour))
			end,
			get = function(info)
				return unpack(info.handler.db.profile.bordercolour)
			end,
			hasAlpha = true,
		--	disabled = function(info) return info.handler.db.profile.hideborder end,
	    },
	    padding = {
			name = L['Padding'],
			order = 230,
			type = 'range',
			min = 1,
			max = 30,
			step = 1,
			desc = L["Set the amount of padding inside the edit box"],
			set = function(info, padding)
				info.handler.db.profile.padding = padding
				info.handler:SetBackdrop(info.handler.db.profile.texture)
				info.handler:SetBackdropColourTo(unpack(info.handler.db.profile.backdropcolour))
			end,
			get = function(info) return info.handler.db.profile.padding or 4 end,
		--disabled = function(info) return info.handler.db.profile.hideborder end,
	    },
        }
    }
)

function module:OnValueChanged(info, b)
	local field = info[#info]
	if field == "position" or field == "width" or field == "locked" then
		self:Position(self.db.profile.position)
	elseif field == "arrowkeys" then
		self:ArrowKeys(b)
	elseif field == "hideborder" then
		self:HideBorder(b)
	elseif field == "strata" then
		self:SetStrata(b)
	elseif field == "autohide" then
		self:AutoHide(b)
	elseif field == "clickable" then
		self:Clickable(b)
	elseif field == "alpha" then
		self:Alpha(b)
	end
end


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

local SharedMedia = Prat.Media
-- things to do when the module is enabled
function module:OnModuleEnable()
    self.parent = ChatFrameEditBox:GetParent()
    self:Position(self.db.profile.position)
    self:Alpha(self.db.profile.alpha)
    self:ArrowKeys(self.db.profile.arrowkeys)
    

    self:HideBorder(self.db.profile.hideborder)
    self:AutoHide(self.db.profile.autohide)
    self:Clickable(self.db.profile.clickable)

    if self.db.profile.strata then
		self:SetStrata(strata)
    end

    if self.db.profile.texture then
		self:SetBackdrop(self.db.profile.texture)
		self:SetBackdropColourTo(unpack(self.db.profile.backdropcolour))
    end
end

-- things to do when the module is disabled
function module:OnModuleDisable()
    self:Position("BOTTOM")
    self:Alpha(1)
    self:HideBorder(false)
    self:ArrowKeys(false)
    self:AutoHide(true)
    self:Clickable(false)
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--

function module:Alpha(value)
    local eb = VisorEditbox or ChatFrameEditBox
    for i,v in ipairs({eb:GetRegions()}) do
        if i==6 or i==7 or i==8 then
            v:SetAlpha(value)
        end
    end
end

function module:ArrowKeys(enabled)
    local eb = VisorEditBox or ChatFrameEditBox
    if enabled then eb:SetAltArrowKeyMode(false) else eb:SetAltArrowKeyMode(true) end
end

function module:Position(option)
    local eb = VisorEditBox or ChatFrameEditBox
    eb:ClearAllPoints()
    if option == "TOP" then
        eb:SetPoint("BOTTOMLEFT",  "ChatFrame1", "TOPLEFT",  -5, 0)
        eb:SetPoint("BOTTOMRIGHT", "ChatFrame1", "TOPRIGHT", 5, 0)
    end
    if option == "BOTTOM" then
        eb:SetPoint("TOPLEFT",  "ChatFrame1", "BOTTOMLEFT",  -5, 0)
        eb:SetPoint("TOPRIGHT", "ChatFrame1", "BOTTOMRIGHT", 5, 0)
    end
    if option == "UNDOCKED" then
        eb:SetMovable(true)
        eb:EnableMouse(true)
        eb:RegisterForDrag("LeftButton")
        eb:SetScript("OnDragStart", function(eb) if not self.db.profile.locked then eb:StartMoving() end end)
        eb:SetScript("OnDragStop", function(eb)
            eb:StopMovingOrSizing()
            local point, relativeTo, relativePoint, xoff, yoff = eb:GetPoint()
            self.db.profile.undocked.point = point
            -- self.db.profile.undocked.relativeTo = relativeTo:GetName() -- this causes game crash, keep commented out
            self.db.profile.undocked.relativePoint = relativePoint
            self.db.profile.undocked.xoff = xoff
            self.db.profile.undocked.yoff = yoff
        end)
        eb:SetPoint(self.db.profile.undocked.point, self.db.profile.undocked.relativeTo, self.db.profile.undocked.relativePoint, self.db.profile.undocked.xoff, self.db.profile.undocked.yoff)
        eb:SetWidth(self.db.profile.width)
    end
end

function module:HideBorder(hide)
    local eb = VisorEditbox or ChatFrameEditBox
    local regions = { eb:GetRegions() }
    local editBoxLeft = regions[6]
    local editBoxRight = regions[7]
    local editBoxMiddle = regions[8]

    if (not self.defaultRegions) then
        self.defaultRegions = {
            left = {
                width = editBoxLeft:GetWidth(),
                height = editBoxLeft:GetHeight(),
                texCoord = { editBoxLeft:GetTexCoord() },
                texture = editBoxLeft:GetTexture(),
            },
            middle = {
                width = editBoxMiddle:GetWidth(),
                height = editBoxMiddle:GetHeight(),
                texCoord = { editBoxMiddle:GetTexCoord() },
                texture = editBoxMiddle:GetTexture(),
            },
            right = {
                width = editBoxRight:GetWidth(),
                height = editBoxRight:GetHeight(),
                texCoord = { editBoxRight:GetTexCoord() },
                texture = editBoxRight:GetTexture(),
            },
        }
    end

    if (hide) then

        editBoxLeft:SetWidth(16)
        editBoxLeft:SetHeight(32)
        editBoxLeft:SetTexCoord(0, 0.0625, 0, 1.0)
        editBoxLeft:SetTexture("Interface\\AddOns\\"..Prat.FolderLocation.."\\textures\\prat-editnotexture")

        editBoxMiddle:SetWidth(1)
        editBoxMiddle:SetHeight(32)
        editBoxMiddle:SetTexCoord(0.0625, 0.9375, 0, 1.0)
        editBoxMiddle:SetTexture("Interface\\AddOns\\"..Prat.FolderLocation.."\\textures\\prat-editnotexture")

        editBoxRight:SetWidth(16)
        editBoxRight:SetHeight(32)
        editBoxRight:SetTexCoord(0.9375, 1.0, 0, 1.0)
        editBoxRight:SetTexture("Interface\\AddOns\\"..Prat.FolderLocation.."\\textures\\prat-editnotexture")

    else

        editBoxLeft:SetWidth(self.defaultRegions.left.width)
        editBoxLeft:SetHeight(self.defaultRegions.left.height)
        editBoxLeft:SetTexCoord(self.defaultRegions.left.texCoord[1], self.defaultRegions.left.texCoord[2],
                                self.defaultRegions.left.texCoord[3], self.defaultRegions.left.texCoord[4],
                                self.defaultRegions.left.texCoord[5], self.defaultRegions.left.texCoord[6],
                                self.defaultRegions.left.texCoord[7], self.defaultRegions.left.texCoord[8])
        editBoxLeft:SetTexture(self.defaultRegions.left.texture)

        editBoxMiddle:SetWidth(self.defaultRegions.middle.width)
        editBoxMiddle:SetHeight(self.defaultRegions.middle.height)
        editBoxMiddle:SetTexCoord(self.defaultRegions.middle.texCoord[1], self.defaultRegions.middle.texCoord[2],
                                  self.defaultRegions.middle.texCoord[3], self.defaultRegions.middle.texCoord[4],
                                  self.defaultRegions.middle.texCoord[5], self.defaultRegions.middle.texCoord[6],
                                  self.defaultRegions.middle.texCoord[7], self.defaultRegions.middle.texCoord[8])
        editBoxMiddle:SetTexture(self.defaultRegions.middle.texture)

        editBoxRight:SetWidth(self.defaultRegions.right.width)
        editBoxRight:SetHeight(self.defaultRegions.right.height)
        editBoxRight:SetTexCoord(self.defaultRegions.right.texCoord[1], self.defaultRegions.right.texCoord[2],
                                 self.defaultRegions.right.texCoord[3], self.defaultRegions.right.texCoord[4],
                                 self.defaultRegions.right.texCoord[5], self.defaultRegions.right.texCoord[6],
                                 self.defaultRegions.right.texCoord[7], self.defaultRegions.right.texCoord[8])
        editBoxRight:SetTexture(self.defaultRegions.right.texture)

    end
end

function module:AutoHide(enabled)

    if (enabled) then

        if (self:IsHooked("ChatFrame_OpenChat")) then
            self:Unhook("ChatFrame_OpenChat")
        end
        if (self:IsHooked(ChatFrameEditBox, "Hide")) then
            self:Unhook(ChatFrameEditBox, "Hide")
        end
        if (self:IsHooked(ChatFrameEditBox, "IsVisible")) then
            self:Unhook(ChatFrameEditBox, "IsVisible")
        end
        if (self:IsHooked(ChatFrameEditBox, "IsShown")) then
            self:Unhook(ChatFrameEditBox, "IsShown")
        end
        if (self.parent and self:IsHooked(self.parent, "Show")) then
            self:Unhook(self.parent, "Show")
        end
        self:ResetToAutoHide()

    else

        self:RawHook("ChatFrame_OpenChat", "OpenChat", true)
        self:RawHook(ChatFrameEditBox, "Hide", true)
        self:RawHook(ChatFrameEditBox, "IsVisible", "IsUsing", true)
        self:RawHook(ChatFrameEditBox, "IsShown", "IsUsing", true)
        if self.parent then
            self:SecureHook(self.parent, "Show", "parentShow")
        end
        self:OpenChat("", nil)
        self:Hide()
    end
end

function module:OpenChat(text, chatFrame)
    self.using = true

    ChatFrameEditBox:EnableKeyboard(true)

    ChatEdit_UpdateHeader(ChatFrameEditBox)

    if self.hooks['ChatFrame_OpenChat'] then
		self.hooks["ChatFrame_OpenChat"](text, chatFrame)
    end
end

function module:Hide()
    self.using = false

    ChatFrameEditBoxHeader:SetTextColor(0, 0, 0, 0)
    ChatFrameEditBox:SetTextColor(0, 0, 0, 0)
    ChatFrameEditBox:EnableKeyboard(false)
end

function module:parentShow()
    self:OpenChat("", nil)
    self:Hide()
end

function module:IsUsing()
    return self.using
end

function module:ResetToAutoHide()

    self.using = false

    ChatFrameEditBox:EnableKeyboard(true)
    ChatFrameEditBox:Hide()

end

function module:Clickable(enabled)

    if (enabled) then

        self:HookScript(ChatFrameEditBox, "OnMouseDown")

    elseif (self:IsHooked(ChatFrameEditBox, "OnMouseDown")) then

        self:Unhook(ChatFrameEditBox, "OnMouseDown")

    end

end

function module:OnMouseDown(...)
    if (not self.using) then
        self:OpenChat("", nil)
    else
        self.hooks[ChatFrameEditBox]["OnMouseDown"](...)
    end

end

function module:SetStrata(strata)
	strata = strata or ChatFrameEditBox:GetFrameStrata()
	ChatFrameEditBox:SetFrameStrata(strata)
end

function module:GetBackdropTexture()
    return SharedMedia:Fetch('background', self.db.profile.texture)
end


function module:SetBackdrop(texture)
	local texture = SharedMedia:Fetch('background', self.db.profile.texture)
	local border = SharedMedia:Fetch('border', self.db.profile.bordertexture)
    local borderwidth	= self.db.profile.borderwidth or 0
    local padding	= self.db.profile.padding or 4

    local backdrop = {
	tileSize	= 16,
	tile		= true,
        bgFile		= texture,
        insets = {
            top     = padding,
            bottom  = padding,
            left    = padding,
            right   = padding,
            }
        }

    if not self.db.profile.hideborder then
		backdrop.edgeFile	= border --SharedMedia:Fetch('border', 'Blizzard Dialog')
		backdrop.edgeSize	= borderwidth
    end

    ChatFrameEditBox:SetBackdrop(backdrop)

    if not self.db.profile.hideborder then
		self:SetBackdropBorderColorTo(unpack(self.db.profile.bordercolour))
	end

    self:SetBackdropColourTo(unpack(self.db.profile.backdropcolour))
end



function module:SetBackdropColourTo(r, g, b, a)
	ChatFrameEditBox:SetBackdropColor(r, g, b, a)
end

function module:SetBackdropBorderColorTo(r, g, b, a)
	ChatFrameEditBox:SetBackdropBorderColor(r, g, b, a)
end


  return
end ) -- Prat:AddModuleToLoad