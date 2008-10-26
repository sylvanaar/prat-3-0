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
Name: AltNames
Revision: $Revision $
Author(s): Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#AltNames
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Allows people's alt characters to be linked to their mains, which will then be displayed next to their names when found in chat messages (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("AltNames")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["Start"] = true,
	["AltNames"] = true,
	["module_desc"] = "Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off).",
	["quiet"] = "Be quiet",
	["quiet_name"] = true,
	["quiet_desc"] = "Whether to report to the chat frame or not.",
	["mainpos_name"] = "Main name position",
	["mainpos_desc"] = "Where to display a character's main name when on their alt.",
	["Main name position"] = true,
	["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = true,
	["Where to display a character's main name when on their alt."] = true,
	["Left"] = true,
	["Right"] = true,
	["Disabled"] = true,
	["Find characters"] = true,
	["Search the list of linked characters for matching main or alt names."] = true,
	["<search term> (eg, /altnames find fin)"] = true,
	["Link alt"] = true,
	["Link someone's alt character with the name of their main."] = true,
	["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = true,
	["Delete alt"] = true,
	["Delete a character's link to another character as their main."] = true,
	["Be quiet"] = true,
	["Whether to report to the chat frame or not."] = true,
	["You have not yet linked any alts with their mains."] = true,
	["no matches found"] = true,
	["List all"] = true,
	["List all links between alts and their main names."] = true,
	["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."] = true,
	["LOKWhoIsWho import"] = true,
	["Clear all"] = true,
	["Clear all links between alts and main names."] = true,
	["Colour"] = true,
	["The colour of an alt's main name that will be displayed"] = true,
	["Import from guild roster"] = true,
	['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'] = true,
	['Import from Guild Greet database'] = true,
	['Imports alt names from a Guild Greet database, if present'] = true,
	['Use class colour (from the PlayerNames module)'] = true,
	["use class colour of main"] = true,
	["use class colour of alt"] = true,
	["don't use"] = true,
	["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = true,
	["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = true,
	["Don't use data from the PlayerNames module at all"] = true,
	["Import options"] = true,
	["Various ways to import a main's alts from other addons"] = true,
	["Don't overwrite existing links"] = true,
	["Don't overwrite existing alt <-> main links when importing or adding new alts."] = true,
	[".*[Aa]lts?$"] = true,
	["(.-)'s? [Aa]lt"] = true,
	["([^%s%p%d%c%z]+)'s alt"] = true,
	['ERROR: some function sent a blank message!'] = true,
	["Alts:"] = true,
	['Main:'] = true,
	["No main name supplied to link %s to"] = true,
	['alt name exists: %s -> %s; not overwriting as set in preferences'] = true,
	['warning: alt %s already linked to %s'] = true,
	["linked alt %s => %s"] = true,
	["character removed: %s"] = true,
	['no characters called "%s" found; nothing deleted'] = true,
	['%s total alts linked to mains'] = true,
	['no alts or mains found matching "%s"'] = true,
	["searched for: %s - total matches: %s"] = true,
	['LOKWhoIsWho lua file not found, sorry.'] = true,
	["LOKWhoIsWho data not found"] = true,
	["%s alts imported from LOKWhoIsWho"] = true,
	['No Guild Greet database found'] = true,
	['You are not in a guild'] = true,
	["guild member alts found and imported: %s"] = true,
	["Fix alts"] = true,
	["Fix corrupted entries in your list of alt names."] = true,
	["Class colour"] = true,
	["Use class colour (from the PlayerNames module)"] = true,
	['Show main in tooltip'] = true,
	["Display a player's main name in the tooltip"] = true,
	['Show alts in tooltip'] = true,
	["Display a player's alts in the tooltip"] = true,
	["Found alt: %s => main: %s"] = true,
	["alt"] = true,
	["main"] = true,
	["Alt"] = true,
	["Main"] = true,
	['no alts found for character '] = true,
	['List alts'] = true,
	['List alts for a given character'] = true,
	['<main> (eg /altnames listalts Fin)'] = true,
	['%d alts found for %s: %s'] = true,
	['No arg string given to :addAlt()'] = true,
	["Use LibAlts Data"] = true,
	["Use the data available via the shared alt information library."] = true,
})

L:AddLocale("ruRU", {
	["Start"] = true,
	["AltNames"] = true,
	["module_desc"] = "Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off).",
	["quiet"] = "Be quiet",
	["quiet_name"] = true,
	["quiet_desc"] = "Whether to report to the chat frame or not.",
	["mainpos_name"] = "Main name position",
	["mainpos_desc"] = "Where to display a character's main name when on their alt.",
	["Main name position"] = true,
	["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = true,
	["Where to display a character's main name when on their alt."] = true,
	["Left"] = true,
	["Right"] = true,
	["Disabled"] = true,
	["Find characters"] = true,
	["Search the list of linked characters for matching main or alt names."] = true,
	["<search term> (eg, /altnames find fin)"] = true,
	["Link alt"] = true,
	["Link someone's alt character with the name of their main."] = true,
	["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = true,
	["Delete alt"] = true,
	["Delete a character's link to another character as their main."] = true,
	["Be quiet"] = true,
	["Whether to report to the chat frame or not."] = true,
	["You have not yet linked any alts with their mains."] = true,
	["no matches found"] = true,
	["List all"] = true,
	["List all links between alts and their main names."] = true,
	["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."] = true,
	["LOKWhoIsWho import"] = true,
	["Clear all"] = true,
	["Clear all links between alts and main names."] = true,
	["Colour"] = true,
	["The colour of an alt's main name that will be displayed"] = true,
	["Import from guild roster"] = true,
	['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'] = true,
	['Import from Guild Greet database'] = true,
	['Imports alt names from a Guild Greet database, if present'] = true,
	['Use class colour (from the PlayerNames module)'] = true,
	["use class colour of main"] = true,
	["use class colour of alt"] = true,
	["don't use"] = true,
	["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = true,
	["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = true,
	["Don't use data from the PlayerNames module at all"] = true,
	["Import options"] = true,
	["Various ways to import a main's alts from other addons"] = true,
	["Don't overwrite existing links"] = true,
	["Don't overwrite existing alt <-> main links when importing or adding new alts."] = true,
	[".*[Aa]lts?$"] = true,
	["(.-)'s? [Aa]lt"] = true,
	["([^%s%p%d%c%z]+)'s alt"] = true,
	['ERROR: some function sent a blank message!'] = true,
	["Alts:"] = true,
	['Main:'] = true,
	["No main name supplied to link %s to"] = true,
	['alt name exists: %s -> %s; not overwriting as set in preferences'] = true,
	['warning: alt %s already linked to %s'] = true,
	["linked alt %s => %s"] = true,
	["character removed: %s"] = true,
	['no characters called "%s" found; nothing deleted'] = true,
	['%s total alts linked to mains'] = true,
	['no alts or mains found matching "%s"'] = true,
	["searched for: %s - total matches: %s"] = true,
	['LOKWhoIsWho lua file not found, sorry.'] = true,
	["LOKWhoIsWho data not found"] = true,
	["%s alts imported from LOKWhoIsWho"] = true,
	['No Guild Greet database found'] = true,
	['You are not in a guild'] = true,
	["guild member alts found and imported: %s"] = true,
	["Fix alts"] = true,
	["Fix corrupted entries in your list of alt names."] = true,
	["Class colour"] = true,
	["Use class colour (from the PlayerNames module)"] = true,
	['Show main in tooltip'] = true,
	["Display a player's main name in the tooltip"] = true,
	['Show alts in tooltip'] = true,
	["Display a player's alts in the tooltip"] = true,
	["Found alt: %s => main: %s"] = true,
	["alt"] = true,
	["main"] = true,
	["Alt"] = true,
	["Main"] = true,
	['no alts found for character '] = true,
	['List alts'] = true,
	['List alts for a given character'] = true,
	['<main> (eg /altnames listalts Fin)'] = true,
	['%d alts found for %s: %s'] = true,
	['No arg string given to :addAlt()'] = true,

})

-- L[LIB.NEWLOCALE](L"deDE", function() return {
-- } end)
-- L[LIB.NEWLOCALE](L"frFR", function() return {
-- } end)
--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["Start"] = "Iniciar",
--	--["AltNames"] = "Nombres de Secundario",
--	["quiet"] = "silencioso",
--	["quiet_name"] = "silencioso_nombre",
--	["quiet_desc"] = "Determina si se informa en la ventana de chat o no.",
--	["mainpos_name"] = "Posición del nombre del principal",
--	["mainpos_desc"] = "Dónde mostrar el nombre del personaje principal cuando está con su secundario.",
--	["Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off)."] = "Permite que los personajes secundarios (alts) de los jugadores sean enlazados a sus principales, para poder luego mostrarlos junto a sus nombres en sus mensajes en la ventana de chat (por defecto=desactivado).",
--	["Main name position"] = "Posición del nombre del principal",
--	["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<nombre de secundario> (ej: /altnames del Personaquecreistequeeraalguienquerealmentenoes)",
--	["Where to display a character's main name when on their alt."] = "Dónde mostrar el nombre de un personaje principal cuando está con su secundario.",
--	["Left"] = "Izquierda",
--	["Right"] = "Derecha",
--	["Disabled"] = "Desactivado",
--	["Find characters"] = "Buscar personajes",
--	["Search the list of linked characters for matching main or alt names."] = "Busca en la lista de personajes enlazados para encontrar personajes de principales o secundarios.",
--	["<search term> (eg, /altnames find fin)"] = "<término de búsqueda> (ej: /altnames find Fin)",
--	["Link alt"] = "Enlazar secundario",
--	["Link someone's alt character with the name of their main."] = "Enlaza el personaje secundario de alguien con el nombre de su principal.",
--	["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "link <nombre de secundario> <nombre de principal> (ej: /altnames link Fin Finjathealtoffin)",
--	["Delete alt"] = "Borrar secundario",
--	["Delete a character's link to another character as their main."] = "Borra el enlace como principal de un personaje con otro",
--	["Be quiet"] = "Silencioso",
--	["Whether to report to the chat frame or not."] = "Determina si se informa en la ventana de chat o no.",
--	["You have not yet linked any alts with their mains."] = "Todavía no has enlazado ningún secundario con su principal",
--	["no matches found"] = "No se ha encontrado nada",
--	["List all"] = "Mostrar lista de todos",
--	["List all links between alts and their main names."] = "Muestra una lista de todos los enlaces entre los nombres de secundarios y sus principales.",
--	["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "Importa información de LOKWhoIsWho, si la hay (coloca el archivo SavedVariables\LOKWhoIsWho.lua en el directorio de Prat para poder usar esto)",
--	["LOKWhoIsWho import"] = "Importar LOKWhoIsWho",
--	["Clear all"] = "Borrar todo",
--	["Clear all links between alts and main names."] = "Borra todos los enlaces entre los nombres de secundarios y principales",
--	["Colour"] = "Color",
--	["The colour of an alt's main name that will be displayed"] = "El color del nombre del principal de un personaje secundario",
--} end)
--L[LIB.NEWLOCALE](L, "koKR", function() return {
--	["Start"] = "시작",
--	["AltNames"] = "부캐이름",
--	["quiet"] = "정숙",
----	["quiet_name"] = "정숙",
----	["quiet_desc"] = "대화창에 결과를 표시할지 않을지를 선택합니다.",
----	["mainpos_name"] = "주캐릭터 이름 위치",
----	["mainpos_desc"] = "주캐릭터를 부캐릭터의 이름의 어느 위치에 표시할지를 선택합니다.",
--	["Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off)."] = "대화창에서 부캐릭터의 이름 옆에 주캐릭터의 이름을 표시합니다 (기본=끔).",
--	["Main name position"] = "주캐릭터 이름 위치",
--	["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<부캐릭터 이름> (예, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)",
--	["Where to display a character's main name when on their alt."] = "주캐릭터의 이름을 부캐릭터 이름 어느 쪽에 표시할지를 선택합니다",
--	["Left"] = "좌",
--	["Right"] = "우",
--	["Disabled"] = "사용 안함",
--	["Find characters"] = "캐릭터 검색",
--	["Search the list of linked characters for matching main or alt names."] = "주캐릭터나 부캐릭터의 이름중 검색어와 일치하는 연관 정보를 검색합니다",
--	["<search term> (eg, /altnames find fin)"] = "<검색어> (예, /altnames find fin)",
--	["Link alt"] = "부캐 연결",
--	["Link someone's alt character with the name of their main."] = "부캐릭터와 주캐릭터의 연결을 입력합니다",
--	["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "link <부캐릭터 이름> <주캐릭터 이름> (예, /altnames link Fin Finjathealtoffin)",
--	["Delete alt"] = "부캐릭터 삭제",
--	["Delete a character's link to another character as their main."] = "주캐릭터에 연관되어 있는 부 캐릭터정보를 삭제합니다",
--	["Be quiet"] = "정숙모드",
--	["Whether to report to the chat frame or not."] = "대화창에 결과를 출력하거나 출력하지 않습니다.",
--	["You have not yet linked any alts with their mains."] = "주캐릭터와 부캐릭터의 연관 정보가 없습니다",
--	["no matches found"] = "일치하는 결과가 없습니다",
--	["List all"] = "목록 출력",
--	["List all links between alts and their main names."] = "모든 주캐릭터와 부캐릭터 연관 정보 목록을 출력합니다",
--	["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "LOKWhoIsWho 자료를 입력받습니다(당신의 SavedVariables\LOKWhoIsWho.lua 파일을 Prat 폴더에 넣어야 사용할 수 있습니다).",
--	["LOKWhoIsWho import"] = "LOKWhoIsWho 입력",
--	["Clear all"] = "초기화",
--	["Clear all links between alts and main names."] = "모든 주캐릭터와 부캐릭터 연관 정보를 초기화 합니다",
--	["Colour"] = "색상",
--	["The colour of an alt's main name that will be displayed"] = "부캐릭터의 주케릭터 이름의 색상을 표시합니다",
--	["Import from guild roster"] = "길드원 정보 입력",
--	['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'] = '길드원 정보에서 길드 등급이 "부캐" 또는 "부케"인지 또는 쪽지나 길드관리자 쪽지에 "<이름> 부캐" 또는 "<이름> 부케"의 내용이 있는지를 확인해 입력합니다',
--	['Import from Guild Greet database'] = "Guild Greet 부캐릭터 정보 입력",
--	['Imports alt names from a Guild Greet database, if present'] = "Guild Greet의 부캐릭터 정보를 입력받습니다",
--	['Use class colour (from the PlayerNames module)'] = "직업 색상 사용(플레이어명 모듈 사용)",
--	["use class colour of main"] = "주캐릭터 직업 색상 사용",
--	["use class colour of alt"] = "부캐릭터 직업 색상 사용",
--	["don't use"] = "사용 안함",
--	["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "주캐의 이름 색상을 ,주캐의 직업 색상으로 표시합니다(플레이어명 모듈에서 정보를 받아옵니다)",
--	["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "주캐의 이름 색상을 부캐의 직업 색상으로 표시합니다(플레이어명 모듈에서 정보를 받아옵니다)",
--	["Don't use data from the PlayerNames module at all"] = "플레이어명 모듈을 사용하지 않을 경우 사용할 수 없습니다",
--	["Import options"] = "외부 입력 설정",
--	["Various ways to import a main's alts from other addons"] = "주캐와 부캐 정보를 다양한 타 애드온으로 부터 외부 입력 받습니다",
--	["Don't overwrite existing links"] = "덮어쓰지 않음",
--	["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "신규 부캐를 추가하거나 외부 자료 입력시 기존 부캐 <-> 주캐 정보를 덮어쓰지 않습니다",
--	[".*[Aa]lts?$"] = ".*부[캐케릭]+$",
--	["([^%s%p%d%c%z]+)'s alt"] = "^([^%s]+) 부[캐케]+",
--	['ERROR: some function sent a blank message!'] = '오류: 몇몇 기능이 공백 문자열로 인한 문제가 발생했습니다!',
--	["Alts:"] = "부캐:",
--	['Main:'] = "본캐:",
--	["No main name supplied to link %s to"] = "%s|1와;과; 연결된 주캐릭터 이름이 없습니다",
--	['alt name exists: %s -> %s; not overwriting as set in preferences'] = '부캐릭터 정보 존재: %s -> %s; 설정에 의해 덮어쓰기가 금지되었습니다',
--	['warning: alt %s already linked to %s'] = '경고: "%s"|1은;는 이미 "%s"의 부캐릭터로 저장되어 있습니다',
--	["linked alt %s => %s"] = "부캐릭터 연결 %s => %s",
--	["character removed: %s"] = "캐릭터 정보 삭제: %s",
--	['no characters called "%s" found; nothing deleted'] = '"%s"|1은;는; 검색되지 않습니다; 삭제가 불가능합니다',
--	['%s total alts linked to mains'] = '총 %s개의 부캐릭터가 저장되어 있습니다',
--	['no alts or mains found matching "%s"'] = "%s|1와;과; 일치하는 부캐릭터나 주캐릭터가 존재하지 않습니다",
--	["searched for: %s - total matches: %s"] = "검색 결과: %s - 총 일치 결과: %s",
--	['LOKWhoIsWho lua file not found, sorry.'] = 'LOKWholsWho lua 파일을 찾을 수 없습니다.',
--	["LOKWhoIsWho data not found"] = "LOKWholsWho 자료를 찾을 수 없습니다",
--	["%s alts imported from LOKWhoIsWho"] = "%s개의 부캐릭터 정보가 LOKWholsWho로 부터 입력되었습니다",
--	['No Guild Greet database found'] = 'Guild Greet 자료를 찾을 수 없습니다',
--	['You are not in a guild'] = '길드에 속해 있지 않습니다',
--	["guild member alts found and imported: %s"] = "입력된 길드원 부캐릭터 정보: %s개",
--	["Fix alts"] = "부캐릭터 정보 수정",
--	["Fix corrupted entries in your list of alt names."] = "부캐릭터 목록 상의 오류를 수정합니다.",
--	["Class colour"] = "직업 색상",
--	["Use class colour (from the PlayerNames module)"] = "직업 색상을 사용합니다 (플레이어명 모듈이 필요합니다)",
--	['Show main in tooltip'] = "툴팁에 주캐릭터 표시",
--	["Display a player's main name in the tooltip"] = "부캐릭터의 툴팁에 주캐릭터를 표시합니다" ,
--	['Show alts in tooltip'] = "툴팁에 부캐릭터 표시",
--	["Display a player's alts in the tooltip"] = "주캐릭터의 툴팁에 부캐릭터를 표시합니다",
--	["Found alt: %s => main: %s"] = "부캐 검색 결과: %s => 주캐릭터: %s",
--	["alt"] = "부캐릭터",
--	["main"] = "주캐릭터",
--	["Alt"] = "부캐릭터",
--	["Main"] = "주캐릭터",
--	['no alts found for character '] = "부캐릭터 검색 결과가 없습니다: ",
--	['List alts'] = "부캐 목록",
--	['List alts for a given character'] = "입력된 캐릭터에 대한 부캐릭터의 목록을 표시합니다",
--	['<main> (eg /altnames listalts Fin)'] = "<주캐릭터> (예 /altnames listalts Fin)",
--	['%d alts found for %s: %s'] = "%2$s에 대하여 %1$d개의 부캐릭터 검색: %3$s",
--} end)
--
---- Help to translate,Thanks
---- L[LIB.NEWLOCALE](L"zhCN", function() return {
---- } end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["Start"] = "開端",
--	["AltNames"] = "分身名字",
---- no use anymore	["quiet"] = true,
--	["quiet_name"] = "安靜",
--	["quiet_desc"] = "是否在聊天視窗中回報。",
--	["mainpos_name"] = "本尊名字位置",
--	["mainpos_desc"] = "當其他人開分身時要在哪裡顯示本尊名字。",
--	["Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off)."] = "允許分身角色與本尊連結，使得在聊天視窗出現時可顯示本尊名字在其名字旁邊 (預設: 關閉)。",
--	["Main name position"] = "本尊名字位置",
--	["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<分身名字> (例: /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)",
--	["Where to display a character's main name when on their alt."] = "當其他人開分身時要在哪裡顯示本尊名字。",
--	["Left"] = "左",
--	["Right"] = "右",
---- no use anymore	["Disabled"] = true,
--	["Find characters"] = "尋找角色",
--	["Search the list of linked characters for matching main or alt names."] = "搜尋已連結角色清單的本尊或分身名字。",
--	["<search term> (eg, /altnames find fin)"] = "<搜尋關鍵> (例: /altnames find fin)",
--	["Link alt"] = "連結分身",
--	["Link someone's alt character with the name of their main."] = "將某人的分身名字與本尊連結起來。",
--	["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "link <分身名字> <本尊名字> (例: /altnames link Fin Finjathealtoffin)",
--	["Delete alt"] = "刪除分身",
--	["Delete a character's link to another character as their main."] = "刪除某角色與其本尊名字的連結。",
--	["Be quiet"] = "安靜",
--	["Whether to report to the chat frame or not."] = "是否在聊天視窗中回報。",
--	["You have not yet linked any alts with their mains."] = "你還沒有將任何分身名字與它們的本尊連結起來。",
---- no use anymore	["no matches found"] = true,
--	["List all"] = "列出清單",
--	["List all links between alts and their main names."] = "列出所有分身與他們的本尊名字。",
--	["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "如果有的話，從 LOKWhoIsWho 匯入資料 (將你的SavedVariables\LOKWhoIsWho.lua移到Prat目錄下才能使用本功能)。",
--	["LOKWhoIsWho import"] = "從 LOKWhoIsWho 匯入",
--	["Clear all"] = "全部清除",
--	["Clear all links between alts and main names."] = "清除所有分身與本尊名字間的連結。",
--	["Colour"] = "顏色",
--	["The colour of an alt's main name that will be displayed"] = "本尊名字顯示時的顏色",
--	["Import from guild roster"] = "從公會名冊中匯入",
--	['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'] = "從公會名冊中根據階級/注釋匯入分身名字。",
--	['Import from Guild Greet database'] = "從 Guild Greet 資料庫中匯入",
--	['Imports alt names from a Guild Greet database, if present'] = "如果有的話，從 Guild Greet 資料庫中匯入資料。",
--	['Use class colour (from the PlayerNames module)'] = "使用職業顏色 (從玩家名字模組)",
--	["use class colour of main"] = "使用本尊的職業顏色",
--	["use class colour of alt"] = "使用分身的職業顏色",
--	["don't use"] = "不用",
--	["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "使用本尊的職業顏色顯示本尊名字 (從玩家名字模組)",
--	["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "使用分身的職業顏色顯示本尊名字 (從玩家名字模組)",
--	["Don't use data from the PlayerNames module at all"] = "不用玩家名字模組的資料",
--	["Import options"] = "匯入選項",
--	["Various ways to import a main's alts from other addons"] = "從其他插件匯入本尊-分身連結的方法",
--	["Don't overwrite existing links"] = "不覆寫現有的連結",
--	["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "當匯入或連結分身時不覆寫現有的本尊-分身連結。",
--	[".*[Aa]lts?$"] = "分身",
--	["(.-)'s? [Aa]lt"] = "(.*)的分身",
--	["([^%s%p%d%c%z]+)'s alt"] = "(.*)的分身",
--	['ERROR: some function sent a blank message!'] = "錯誤: 空白的訊息!",
--	["Alts:"] = "分身:",
--	['Main:'] = "本尊:",
--	["No main name supplied to link %s to"] = "沒有提供本尊名字連結到%s",
--	['alt name exists: %s -> %s; not overwriting as set in preferences'] = "存在分身名字: %s -> %s; 不覆寫",
--	['warning: alt %s already linked to %s'] = "警告: %s早已連結到%s",
--	["linked alt %s => %s"] = "已連結%s => %s",
--	["character removed: %s"] = "角色已移除: %s",
--	['no characters called "%s" found; nothing deleted'] = "找不到「%s」; 沒有移除任何東西",
--	['%s total alts linked to mains'] = "連結到本尊的分身數目: %s",
--	['no alts or mains found matching "%s"'] = "找不到符合「%s」的本尊或分身",
--	["searched for: %s - total matches: %s"] = "尋找: %s - 找到: %s",
--	['LOKWhoIsWho lua file not found, sorry.'] = "找不到LOKWhoIsWho.lua。",
--	["LOKWhoIsWho data not found"] = "在 LOKWhoIsWho 找不到資料",
--	["%s alts imported from LOKWhoIsWho"] = "已從 LOKWhoIsWho 匯入%s分身",
--	['No Guild Greet database found'] = "找不到 Guild Greet 資料庫",
--	['You are not in a guild'] = "你不在任何公會裡",
--	["guild member alts found and imported: %s"] = "從公會名冊中匯入的分身: %s",
--	["Fix alts"] = "修復分身",
--	["Fix corrupted entries in your list of alt names."] = "修復分身名字。",
--	["Class colour"] = "職業顏色",
---- duplicated entry	["Use class colour (from the PlayerNames module)"] = true,
--	['Show main in tooltip'] = "在提示訊息顯示本尊",
--	["Display a player's main name in the tooltip"] = "在提示訊息顯示本尊名字",
--	['Show alts in tooltip'] = "在提示訊息顯示分身",
--	["Display a player's alts in the tooltip"] = "在提示訊息顯示分身名字",
--	["Found alt: %s => main: %s"] = "找到分身: %s => 本尊: %s",
---- no use anymore	["alt"] = true,
---- no use anymore	["main"] = true,
---- no use anymore	["Alt"] = true,
---- no use anymore	["Main"] = true,
--	['no alts found for character '] = "找不到分身名字的角色: ",
--	['List alts'] = "列出分身",
--	['List alts for a given character'] = "列出角色的分身",
--	['<main> (eg /altnames listalts Fin)'] = "<本尊> (例: /altnames listalts Fin)",
--	['%d alts found for %s: %s'] = "找到%d個分身，%s: %s",
--	['No arg string given to :addAlt()'] = "addAlt: 空白的參數!",
--
--} end)


local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

local altregistry = LibStub("LibAlts-1.0")

module.Alts = {}

Prat:SetModuleDefaults(module.name, {
	profile = {
		on	= false,
		quiet	= false,
		pncol	= 'no',
		altidx	= {},
		mainpos	= 'RIGHT',
		colour	= {},
	
		maincolour	= '97ff4c',	-- fairly light bright green
		altcolour	= 'ff6df2',	-- fairly bright light purpley pinkish
		noclobber	= false,
	
		tooltip_showmain	= false,
		tooltip_showalts	= false,

		usealtlib = false
	},
	realm = {
		alts	= {},
	}
} )



-- any boolean options
module.toggleOptions = {
	quiet,
	noclobber,
	tooltip_showmain,
	tooltip_showalts,
	}

Prat:SetModuleInit(module, 
	function(self) 
		if self.db.profile.alts then
		   local alts = self.db.profile.alts
		   self.db.profile.alts = nil
		   for k,v in pairs(alts) do 
		     self.db.realm.alts[k] = self.db.realm.alts[k] or v
		   end
		end
		
		-- Load shared Alts data
		for alt,main in pairs(self.db.realm.alts) do
			altregistry:SetAlt(main,alt)
		end

		-- define a popup to get the main name
		StaticPopupDialogs['MENUITEM_LINKALT'] = {
			-- text		= "Who would you like to set as the main character of %s?",
			text	= 'Mainname',
			button1		= TEXT(ACCEPT),
			button2		= TEXT(CANCEL),
			hasEditBox	= 1,
			maxLetters	= 24,
			exclusive	= 0,
	
			OnAccept = function(this, altname)
				local editBox	= getglobal(this:GetParent():GetName().."EditBox");
				local mainname	= editBox:GetText()
	
				altname	= altname or 'xxx'
	
				module:addAlt(string.format('%s %s', altname, mainname))
			end,
	
			OnShow = function(this)
				getglobal(this:GetName().."EditBox"):SetFocus();
			end,
	
			OnHide = function(this)
				if ( ChatFrameEditBox:IsShown() ) then
					ChatFrameEditBox:SetFocus();
				end
				getglobal(this:GetName().."EditBox"):SetText("");
			end,
	
			EditBoxOnEnterPressed = function(this, altname)
				local editBox	= getglobal(this:GetParent():GetName().."EditBox");
				local mainname	= editBox:GetText()
	
				altname	= altname or 'xxx'
	
				module:addAlt(string.format('%s %s', altname, mainname))
	
				this:GetParent():Hide();
			end,
	
			EditBoxOnEscapePressed = function(this)
				this:GetParent():Hide();
			end,
			timeout		= 0,
			whileDead	= 1,
			hideOnEscape	= 1
			}
	return end)


Prat:SetModuleOptions(module, {
		name	= L["AltNames"],
		desc	= L["module_desc"],
		type	= "group",
		args = {
			find = {
				name	= L["Find characters"],
				desc	= L["Search the list of linked characters for matching main or alt names."],
				type	= "input",
				usage	= L["<search term> (eg, /altnames find fin)"],
				order	= 110,
				set	= function(info, q) info.handler:findChars(q) end,
				get	= false,
				},

			listalts = {
				name	= L['List alts'],
				desc	= L['List alts for a given character'],
				type	= 'input',
				usage	= L['<main> (eg /altnames listalts Fin)'],
				order	= 115,
				set	= function(info, m) info.handler:listAlts(m) end,
				get	= false,
				},

			link = {
				name	= L["Link alt"],
				desc	= L["Link someone's alt character with the name of their main."],
				type	= "input",
				order	= 120,
				usage	= L["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"],
				-- pass	= true,
				-- set	= function(argname, argstr) self:addAlt(argstr) end,
				set	= function(info, argstr) info.handler:addAlt(argstr) end,
				get	= false,
--				alias	= { 'new', 'add' },
				},

			del = {
				name	= L["Delete alt"],
				desc	= L["Delete a character's link to another character as their main."],
				type	= "input",
				usage	= L["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"],
				order	= 130,
				set	= function(info, altname) info.handler:delAlt(altname) end,
				get	= false,
				confirm	= true,
--				alias	= { 'remove', 'unlink' },
				},

			quiet = {
				name	= L["Be quiet"],
				desc	= L["Whether to report to the chat frame or not."],
				type	= "toggle",
				order	= 191, -- 19x = options

				},

			listall = {
				name	= L["List all"],
				desc	= L["List all links between alts and their main names."],
				type	= "execute",
				func	= "listAll",
--				alias	= { 'list', 'all' },
				},

			clearall = {
				name	= L["Clear all"],
				desc	= L["Clear all links between alts and main names."],
				type	= "execute",
				func	= "clearAllAlts",
				confirm	= true,
				},

			fixalts = {
				name	= L["Fix alts"],
				desc	= L["Fix corrupted entries in your list of alt names."],
				type	= "execute",
				func	= "fixAlts",
				},

			colour = {
				name	= L["Colour"],
				get	= function(info) return info.handler:getColour() end,
				set	= function(info, nr, ng, nb, na) info.handler.db.profile.colour = { r = nr, g = ng, b = nb, a = na } end,
				desc	= L["The colour of an alt's main name that will be displayed"],
				type	= "color",
--				alias	= 'color',
				},

			mainpos = {
				name	= L["Main name position"],
				desc	= L["Where to display a character's main name when on their alt."],
				type	= "select",
				order	= 100,
				get	= function(info) return info.handler.db.profile.mainpos end,
				set	= function(info, v) info.handler:setMainPos(v) end,
				values = {
					["LEFT"]	= L["Left"],
					["RIGHT"]	= L["Right"],
	 				["START"]	= L["Start"],
					},
				},

			tooltip_showmain = {
				name	= L['Show main in tooltip'],
				desc	= L["Display a player's main name in the tooltip"],
				type	= 'toggle',
				order	= 150,
				get	= function(info) return info.handler.db.profile.tooltip_showmain end,
				set	= function(info)
						info.handler.db.profile.tooltip_showmain = not info.handler.db.profile.tooltip_showmain
						info.handler.altertooltip = info.handler.db.profile.tooltip_showalts or info.handler.db.profile.tooltip_showmain

						info.handler:HookTooltip()
					end,

				},

			tooltip_showalts = {
				name	= L['Show alts in tooltip'],
				desc	= L["Display a player's alts in the tooltip"],
				type	= 'toggle',
				order	= 150,
				get	= function(info) return info.handler.db.profile.tooltip_showalts end,
				set	= function(info)
						info.handler.db.profile.tooltip_showalts = not info.handler.db.profile.tooltip_showalts
						info.handler.altertooltip = info.handler.db.profile.tooltip_showalts or info.handler.db.profile.tooltip_showmain
						
						info.handler:HookTooltip()
					end,
				},


			noclobber = {
				name	= L["Don't overwrite existing links"],
				desc	= L["Don't overwrite existing alt <-> main links when importing or adding new alts."],
				type	= "toggle",
				order	= 192,	-- 19x = options

				},

--			blankheader = {
--				order	= 499,
--				type	= 'header',
--				},

			--[[ IMPORT OPTIONS ]]--
			importheader = {
				name	= L["Import options"],
				desc	= L["Various ways to import a main's alts from other addons"],
				type	= 'header',
				order	= 500,
				},

			-- imports: LOKWhoIsWho - SavedVariables
			importfromlok = {
				name	= L["LOKWhoIsWho import"],
				desc	= L["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."],
				type	= "execute",
				func	= "importFromLOK",
				confirm	= true,
				order	= 510,
				},

			-- imports: guild roster - officer notes, public notes, ranks
			guildimport = {
				name	= L["Import from guild roster"],
				desc	= L['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'],
				type	= "execute",
				func	= "importGuildAlts",
				confirm	= true,
				order	= 520,
				},

			-- imports: guild greet - SavedVariables
			ggimport = {
				name	= L['Import from Guild Greet database'],
				desc	= L['Imports alt names from a Guild Greet database, if present'],
				type	= 'execute',
				func	= "importGGAlts",
				confirm	= true,
				order	= 530,
				},

			usealtlib = {
				name	= L["Use LibAlts Data"],
				desc	= L["Use the data available via the shared alt information library."],
				type	= "toggle",
				order	= 540,	
				},

			}
		}
)

--	if Prat:IsModuleActive("PlayerNames") then
--		self.moduleOptions['args']['pncol'] = {
--			name	= L["Class colour"],
--			desc	= L["Use class colour (from the PlayerNames module)"],
--			type	= "text",
--			get     =  function() return self.db.profile.pncol end,
--			set	= function(v) self.db.profile.pncol = v end,
--			order	= 150,
--			validate = {
--				['main']	= L["use class colour of main"],
--				['alt']		= L["use class colour of alt"],
--				['no']		= L["don't use"],
--				},
--			validateDesc = {
--				['main']	= L["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"],
--				['alt']		= L["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"],
--				['no']		= L["Don't use data from the PlayerNames module at all"],
--				},
--			}
--	end
--)


--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

function module:OnModuleEnable()
	-- much code ripped off from the PlayerMenu code - thanks, and sorry!

	-- things to do when the module is enabled
	for altname, mainname in pairs(self.db.realm.alts) do
		self.Alts[altname] = mainname
	end

	-- PlayerNames colour
	local pncol = self.db.profile.pncol

	if pncol == 'no' then
		pncol			= false
		self.db.profile.pncol	= false
	end

	self.db.profile.pncol = self.db.profile.pncol or false

	-- for caching a main's list of alts
	self.Altlists = {}

	-- just register one area which can be used for anything
	-- (and only actually has one use at the moment)
	self.ALTNAMES = ""

	-- set position that main names are displayed in chat messages
	self:setMainPos(self.db.profile.mainpos)

	-- register events
	Prat.RegisterChatEvent(self, "Prat_PreAddMessage")

	-- hook functions
	self.altertooltip = self.db.profile.tooltip_showmain or self.db.profile.tooltip_showalts

	self:HookTooltip()

	-- hack 'n' slash
	local slashcmds = {
		'/altnames',
		'/alts',
		'/alt',
		}

	--Prat:RegisterChatCommand(slashcmds, self.moduleOptions, string.upper("AltNames"))

	--self:SecureHook("UnitPopup_OnClick")
	self:SecureHook("UnitPopup_ShowMenu")

	-- add the bits to the context menus
	UnitPopupButtons['LINK_ALT'] = { text = "Set Main", dist = 0, func = function() module:UnitPopup_LinkAltOnClick() end , arg1 = "", arg2 = ""}

	tinsert(UnitPopupMenus['PARTY'], #UnitPopupMenus['PARTY']-1, 'LINK_ALT')
	tinsert(UnitPopupMenus['FRIEND'], #UnitPopupMenus['FRIEND']-1, 'LINK_ALT')
	tinsert(UnitPopupMenus['SELF'], #UnitPopupMenus['SELF']-1, 'LINK_ALT')
	tinsert(UnitPopupMenus['PLAYER'], #UnitPopupMenus['PLAYER']-1, 'LINK_ALT')
	-- tinsert(UnitPopupMenus['TARGET'], getn(UnitPopupMenus['TARGET'])-1, 'LINK_ALT')
end

local function NOP() return end

function module:HookTooltip()
	if self.altertooltip then
		self:SecureHookScript(GameTooltip, 'OnTooltipSetUnit')
		self:SecureHookScript(GameTooltip, 'OnTooltipCleared')
	
		module.HookTooltip = NOP
	end
end

function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
	for i=1, UIDROPDOWNMENU_MAXBUTTONS do
		button = getglobal("DropDownList"..UIDROPDOWNMENU_MENU_LEVEL.."Button"..i);

		-- Patch our handler function back in
		if  button.value == "LINK_ALT" then
		    button.func = UnitPopupButtons["LINK_ALT"].func
		end
	end
end

function module:UnitPopup_LinkAltOnClick()
	local dropdownFrame = getglobal(UIDROPDOWNMENU_INIT_MENU)

	--if (button == 'LINK_ALT') then
		local altname	= dropdownFrame.name
		local dialog	= StaticPopup_Show('MENUITEM_LINKALT', altname)

		if dialog then
			local altname	= dropdownFrame.name
			dialog.data	= altname
		end
	--end
end



-- things to do when the module is disabled
function module:OnModuleDisable()
	-- unregister events
	Prat.UnregisterAllChatEvents(self)
end


--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--


function module:print(msg, printanyway)
	-- make sure we've got a message
	if msg == nil then
		printanyway = true
		msg = L['ERROR: some function sent a blank message!']
	end

	local verbose = not self.db.profile.quiet

	if verbose or printanyway then
		msg = string.format('|cffffd100' .. L['AltNames'] .. ':|r %s', msg)
		DEFAULT_CHAT_FRAME:AddMessage(msg)
	end
end

--[[ colo*u*ring and formatting ]]--

local clrname = function(name, colour)
	return '|cff' .. (colour or 'ffffff') .. (name or "") .. '|r'
end

local clrmain = function(mainname, maincolour)
	mainname	= mainname or ""
	maincolour	= maincolour or module.db.profile.maincolour or '8080ff'

	-- 1, 0.9, 0, 0.5, 0.5, 1

	return clrname(mainname, maincolour)
end

local clralt = function(altname, altcolour)
	altname		= altname or ""
	altcolour	= altcolour or module.db.profile.altcolour or 'ff8080'

	-- 1, 0.7, 0, 1, 0.5, 0.5

	return clrname(altname, altcolour)
end

local clralts = function(alts, altcolour)
	if not alts or (type(alts) ~= 'table') or (#alts == 0) then return false end

	for mainname, altname in pairs(alts) do
		alts[mainname] = clralt(altname)
	end

	return alts
end

function module:formatCharName(name)
	-- format character names as having uppercase first letter followed by all lowercase

	if name == nil then
		return ""
	end

	name	= name:gsub('[%%%[%]":|%s]', '')
	name	= name:gsub("'", '')

	name	= string.lower(name)
	name	= string.gsub(name, "^(%w)", string.upper, 1)

	return name
end

--[[ alt <-> main link management ]]--

function module:addAlt(argstr)
	local mainname

	local altname	= ""
	local args	= {}

	-- check we've been passed something
	if (argstr == nil) or (argstr == "") then
		self:print(L['No arg string given to :addAlt()'])
		return false
	end

	-- extract the alt's name and the main name to link to
	for k, v in argstr:gmatch('%s*(%S+)%s+(.+)') do
		altname, mainname = k, v
	end

	-- check we've got a main name to link to
	if altname and not mainname then
		altname = argstr
		self:print(string.format(L["No main name supplied to link %s to"], clralt(altname)), true)
		return false
	end

	-- clean up character names
	mainname	= mainname:gsub('%s+$', '')
	altname		= self:formatCharName(altname)

	-- check if alt has already been linked to a main
	local oldmain	= ""
	local noclobber	= self.db.profile.noclobber

	if self.Alts[altname] then
		oldmain = self.Alts[altname]

		if oldmain == mainname then
			self:print(string.format(L['warning: alt %s already linked to %s'], clralt(altname), clrmain(mainname)))
			return false
		end

		if noclobber then
			self:print(string.format(L['alt name exists: %s -> %s; not overwriting as set in preferences'], clralt(altname), clrmain(oldmain)))
			return false
		end

		self:print(string.format(L['warning: alt %s already linked to %s'], clralt(altname), clrmain(oldmain)))
	end

	-- add alt to list of alts -> mains
	self.Alts[altname]		= mainname
	self.db.realm.alts[altname]	= mainname

	-- make sure this character's list of alts is rebuilt next time it's needed
	if self.Altlists[mainname] then self.Altlists[mainname] = nil end

    -- publish this info globablly
	altregistry:SetAlt(mainname, altname)

	self:print(string.format(L["linked alt %s => %s"], clralt(altname), clrmain(mainname)))
end

function module:delAlt(altname)
	local suppliedaltname = altname

	altname = self:formatCharName(altname)

	if self.Alts[altname] then
		self.Alts[altname]		= nil
		self.db.realm.alts[altname]	= nil

		self:print(string.format(L["character removed: %s"], clralt(suppliedaltname)))

		-- make sure this character's list of alts is rebuilt next time it's needed
		if self.Altlists[mainname] then self.Altlists[mainname] = nil end

		return true
	end

	self:print(string.format(L['no characters called "%s" found; nothing deleted'], clralt(suppliedaltname)))
end

function module:listAll()
	if not self.db.realm.alts and self.Alts then
		self:print(L["You have not yet linked any alts with their mains."], true)
		return false
	end

	local altcount = 0

	for altname, mainname in pairs(self.Alts) do
		altcount = altcount + 1
		self:print(string.format("alt: %s => main: %s", clralt(altname), clrmain(mainname)))
	end

	self:print(string.format(L['%s total alts linked to mains'], altcount))
end

function module:findChars(q)
	local numfound

	local matchhighlight

	if not self.Alts then
		self:print(L["You have not yet linked any alts with their mains."], true)
		return false
	else
		local matches = {}
		local numfound = 0

		for altname, mainname in pairs(self.Alts) do
			local a = string.lower(altname)
			local m = string.lower(mainname)
			local pat = string.lower(q)

			-- self:print(string.format("matching against: altname:'%s', mainname:'%s', pat:'%s'", a, m, pat))

			if (a == pat) or (m == pat) or (a:find(pat)) or (m:find(pat)) then
				matches[altname] = mainname
				numfound = numfound + 1
			end
		end

		if numfound == 0 then
			self:print(string.format(L['no alts or mains found matching "%s"'], '|cffffb200' .. q .. '|r'), true)
		else
			for altname, mainname in pairs(matches) do
				self:print(string.format(L["Found alt: %s => main: %s"], clralt(altname), clrmain(mainname)))
			end

			self:print(string.format(L["searched for: %s - total matches: %s"], q, numfound))
		end

		return numfound
	end
end


function module:fixAlts()
	local fixedalts = {}

	for altname, mainname in pairs(self.db.realm.alts) do
		altname		= self:formatCharName(altname)
		mainname	= self:formatCharName(mainname)

		fixedalts[altname] = mainname
	end

	self.Alts = fixedalts
	self.db.realm.alts = fixedalts
end


function module:clearAllAlts()
	self.Alts		= {}
	self.db.realm.alts	= {}
	self.Altlists		= {}
end


local CLR = Prat.CLR

function module:setMainPos(pos)
	-- which item to go after, depending on our position
	local msgitems = {
		RIGHT	= 'Pp',
		LEFT	= 'Ff',
		START	= nil,
		}

	pos	= pos or 'RIGHT'

	Prat.RegisterMessageItem('ALTNAMES', msgitems[pos])

	if pos == 'RIGHT' then
		self.padfmt	= ' '..CLR:Colorize("ffffff", "(").."%s"..CLR:Colorize("ffffff", ")")
	else
		self.padfmt	= CLR:Colorize("ffffff", "(").."%s"..CLR:Colorize("ffffff", ")")..' '
	end

	self.db.profile.mainpos	= pos
end

function module:Prat_PreAddMessage(e, message, frame, event)
	local hexcolour = CLR.NONE
	local mainname = message.PLAYERLINK

	if self.db.profile.on and self.Alts[mainname] then
		local altname	= self.Alts[mainname]
		local padfmt	= self.padfmt or ' (%s)'


		if self.db.profile.colour then
			if self.db.profile.pncol ~= 'no' then
				local charname
				local coltype = self.db.profile.pncol

				if coltype == "alt" then
					charname = mainname
				elseif coltype == "main" then
					charname = altname
				else
					charname = nil
					self.db.profile.pncol = 'no'
				end

				if charname then
					local class, level, subgroup = Prat_PlayerNames:GetData(charname)
					if class then
						hexcolour = Prat_PlayerNames:GetClassColor(class)
					end
				end
			else
				hexcolour = CLR:GetHexColor(self.db.profile.colour)
			end

			hexcolour = hexcolour or CLR:GetHexColor(self.db.profile.colour)
		end

		self.ALTNAMES	= string.format(padfmt, CLR:Colorize(hexcolour, altname))

		message.ALTNAMES = self.ALTNAMES
	end
end

function module:getColour(r, g, b, a)
	local col = self.db.profile.colour
	if not col then return false end
	return col.r, col.g, col.b, nil
end

function module:importFromLOK()
	if not LOKWhoIsWho_Config then
		self:print(L['LOKWhoIsWho lua file not found, sorry.'])
		return false
	end

	local server	= GetRealmName()
	local lokalts	= LOKWhoIsWho_Config[server]['players']

	if lokalts == nil then
		self:print(L["LOKWhoIsWho data not found"])
		return false
	end

	local numimported = 0

	for altname, mainname in pairs(lokalts) do
		self:addAlt(string.format("%s %s", altname, mainname))
		numimported = numimported + 1
	end

	self:print(string.format(L["%s alts imported from LOKWhoIsWho"], numimported))
end

function module:importGGAlts()
	--[[
		imports guilds from a Guild Greet database, if present
	]]
	if not GLDG_Data then
		self:print(L['No Guild Greet database found'])
		return
	end

	local servername = GetRealmName()
	local k, v

	for k, v in pairs(GLDG_Data) do
		if string.match(k, servername .. ' - %S+') then
			local name, player

			for name, player in pairs(v) do
				-- not sure whether this would be useful:
				-- if player['alt'] and player['alt'] ~= "" and not player['own'] then
				if player['alt'] and player['alt'] ~= "" then
					mainname	= player['alt']
					altname		= name

					self:addAlt(string.format('%s %s', altname, mainname))
				end
			end
		end
	end
end

function module:importGuildAlts(altrank)
	if altrank == "" then altrank = nil end

	local totalmembers

	totalmembers = GetNumGuildMembers(true)

	if totalmembers == 0 then
		self:print(L['You are not in a guild'])
		return
	end


	-- build a list of guild members to check guild notes against later
	local guildMembers = {}

	for x = 1, totalmembers do
		local name, rank, rankIndex, level, class, zone, publicnote, officernote, online, status = GetGuildRosterInfo(x)
		guildMembers[string.lower(name)] = name
	end


	-- loop through members and check stuff for later
	local mainname
	local altname
	local numfound = 0

	for x = 1, totalmembers do
		altname		= nil
		mainname	= nil

		local name, rank, rankIndex, level, class, zone, publicnote, officernote, online, status = GetGuildRosterInfo(x)

		-- yeah I know the vars should be pre-lc'ed and it's not as efficient as it could be below
		-- ... feel free to clean it up

		-- untested (is there a more convenient trim function available?):
		--[[
		officernote = gsub("^%s*", "", officernote)
		publicnote = gsub("^%s*", "", publicnote)
		]]

        officernote = (officernote):match(L["(.-)'s? [Aa]lt"]) or officernote
        publicnote = (publicnote):match(L["(.-)'s? [Aa]lt"]) or publicnote

		-- check for guild members with rank "alt" or "alts" or "officer alt"
		if rank:match(L[".*[Aa]lts?$"]) or (altrank and rank == altrank) then
			-- self:print(string.format('found mainname name for member %s', name))
			mainname = publicnote
		-- check whether guild note is an exact match of a member's name
		elseif guildMembers[publicnote:lower()] then
			mainname = publicnote
		elseif guildMembers[officernote:lower()] then
			mainname = officernote
		elseif officernote:find(L["([^%s%p%d%c%z]+)'s alt"]) or publicnote:find(L["([^%s%p%d%c%z]+)'s alt"]) then
			local TempName = officernote:match(L["([^%s%p%d%c%z]+)'s alt"]) or publicnote:match(L["([^%s%p%d%c%z]+)'s alt"])
			if TempName and guildMembers[string.lower(TempName)] then
				mainname = TempName
			end
		end

		-- set alt name if we've found their main name
		if mainname and mainname ~= "" then
			numfound	= numfound + 1
			altname		= name
			self:addAlt(string.format('%s %s', altname, mainname))
		end
	end

	self:print(string.format(L["guild member alts found and imported: %s"], numfound))
end


-- function for showing a list of alt names in the tooltip
function module:getAlts(mainname)
	if self.db.profile.usealtlib then
		local alts = { altregistry:GetAlts(mainname) }
		if #alts > 0 then
			return alts
		end		

		return false
	end

	-- self.Alts = self.db.profile.altnames

	-- check valid mainname is being passed and that we actually have a list of alts
	if not (mainname and self.Alts) then return false end

	-- format the character name
	mainname = self:formatCharName(mainname)

	-- check mainname wasn't just made of invalid characters
	if mainname == "" then return false end

	-- check we've not already built the list of alts for this character
	if self.Altlists[mainname] then return self.Altlists[mainname] end

	local alts	= {}
	local allalts	= self.Alts

	-- loop through list of alts and build alts table for given mainname
	for alt, tmpmainname in pairs(allalts) do
		if mainname == tmpmainname then
			table.insert(alts, alt)
		end
	end

	-- check there we've actually found some alts
	if #alts == 0 then return false end

	-- cache this list of alts
	self.Altlists[mainname] = alts

	return alts
end


-- function for showing main names in the tooltip
function module:getMain(altname)
	if self.db.profile.usealtlib then
		local main = altregistry:GetMain(altname)
		if main then
			return self:formatCharName(main)
		end		

		return false
	end

	-- self.Alts = self.db.profile.altnames

	-- check for valid alt name being passed and that we actually have a list of alts
	if not altname and self.Alts then return false end

	-- format the character name
	altname = self:formatCharName(altname)

	-- check the alt name wasn't just made of invalid character
	if altname == "" then return false end

	-- check a main exists for the given alt name
	if not self.Alts[altname] then return false end

	return self.Alts[altname]
end



function module:nicejoin(t, glue, gluebeforelast)
	-- check we've got a table
	if type(t) ~= 'table' then return false end

	local list	= {}
	local index	= 1

	-- create a copy of the table with a numerical and no nested tables
	for i, v in pairs(t) do
		local vtype	= type(v)
		local item	= self:formatCharName(v)

		if vtype ~= 'string' then
			item = vtype
		end

		list[index]	= item or vtype
		index		= index + 1
	end

	-- make sure we have some items to join
	if #list == 0 then
		return ""
	end

	-- trying to join one item = that item
	if #list == 1 then
		return list[1]
	end

	-- defaults with which we will want wo woin no that's not going to work
	-- defaults
	glue		= glue or ', '
	gluebeforelast	= gluebeforelast or ', and '

	-- pop the last value off
	local last	= table.remove(list) or "" -- shouldn't need the ' or ""'?

	-- standard way of joining a list of items together
	local str	= table.concat(list, glue)

	-- return the previous list, but add the last value nicely
	return str .. gluebeforelast .. last
end


-- displays all alts for a given character as a list rather than seperate matches
function module:listAlts(mainname)
	if not mainname then return false end

	mainname = self:formatCharName(mainname)

	if mainname == "" then return false end

	local alts

	alts = self:getAlts(mainname)

	if not alts or (#alts == 0) then
		self:print(L['no alts found for character '] .. mainname)
		return
	else
		self:print(string.format(L['%d alts found for %s: %s'], #alts, clrmain(mainname), self:nicejoin(clralts(alts))))
		return #alts
	end
end


-- hooked function to show mains and alts if set in preferences
function module:OnTooltipSetUnit()
	--[[
	check:

	 . the user wants information about alts or mains on the tooltip
	 . there's a tooltip to alter
	 .  we haven't already added anything to the tooltip

	]]
	if self.altertooltip and GameTooltip and not self.showingtooltip then
		-- create lines table for extra information that might be added
		local lines	= {}

		-- check who / what the tooltip's being displayed for
		local charname, unitid	= GameTooltip:GetUnit()

		-- check to see if it's a character
		if UnitIsPlayer(unitid) then
			local mainname, alts, tooltipaltered

			-- check if the user wants the mainame name shown on alts' tooltips
			if self.db.profile.tooltip_showmain then
				local mainname = self:getMain(charname)

				if mainname then
					-- add the character's main name to the tooltip
					GameTooltip:AddDoubleLine(L['Main:'] .. ' ', clrmain(mainname), 1, 0.9, 0, 0.5, 0.5, 1)
					tooltipaltered = true
				end
			end

			-- check if the user wants a list of alts shown on mains' tooltips
			if self.db.profile.tooltip_showalts then
				local alts	= self:getAlts(charname) or self:getAlts(mainame)

				if alts then
					-- build the string listing alts
					local altstr = self:nicejoin(alts)

					-- add the list of alts to the tooltip
					GameTooltip:AddDoubleLine(L['Alts:'] .. ' ', clralt(altstr), 1, 0.7, 0, 1, 0.5, 0.5)
					tooltipaltered = true
				end
			end

			if tooltipaltered then
				GameTooltip:Show()
			end

			-- make sure we don't add another tooltip
			self.showingtooltip = true
		end
	end
end

-- got to reset the flag so we know when to readd the lines
function module:OnTooltipCleared()
	self.showingtooltip	= false
end


  return
end ) -- Prat:AddModuleToLoad