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
Name: module
Revision: $Revision: $
Author(s): Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Alias
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Alias")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

L:AddLocale("enUS", {
	["module_name"] = "Alias",
	["module_desc"] = "Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
	["add"] = true,
	["add an alias"] = true,
	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - \s "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = true,
	["unalias"] = true,
	["remove an alias"] = true,
	['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'] = true,
	["listaliases"] = true,
	["list all aliases"] = true,
	['findaliases'] = true,
	['find aliases matching a given search term'] = true,
	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = true,
	['verbose'] = true,
	['Display extra information in the chat frame when commands are dealiased'] = true,
	['inline'] = true,
	['Expand aliases as you are typing'] = true,
	["Options for altering the behaviour of Alias"] = true,
	['Options'] = true,
	['noclobber'] = true,
	["Don't overwrite existing aliases when using /addalias"] = true,
	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = true,
	["%s() called with nil argument!"] = true,
	["%s() called with blank string!"] = true,
	['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'] = true,
	['noclobber set - skipping new alias: /%s already expands to /%s'] = true,
	['overwriting existing alias "/%s" (was aliased to "/%s")'] = true,
	["/%s aliased to: /%s"] = true,
	['alias "/%s" does not exist'] = true,
	['deleting alias "/%s" (previously aliased as "/%s")'] = true,
	['tried to show value for alias "%s" but undefined in module.Aliases!'] = true,
	['/%s aliased to "/%s"'] = true,
	["No aliases have been defined"] = true,
	['There is no alias current defined for "%s"'] = true,
	['infinite loop detected for alias /%s - ignoring'] = true,
	['dealiasing command /%s to /%s'] = true,
	['matching aliases found: %d'] = true,
	['total aliases: %d'] = true,
	["warnUser() called with nil argument!"] = true,
	["warnUser() called with zero length string!"] = true,
})

L:AddLocale("ruRU", {
	["module_name"] = "Псевдонимы",
	["module_desc"] = "Добовляет команду /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
	["add"] = true,
	["add an alias"] = "добавить псевдоним",
	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - \s "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = true,
	["unalias"] = true,
	["remove an alias"] = "Убрать псевдоним",
	['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'] = true,
	["listaliases"] = true,
	["list all aliases"] = "список всех псевдонимов",
	['findaliases'] = true,
	['find aliases matching a given search term'] = "найти псевдонимы совпавшие с заданными запросами поиска",
	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = '<keyword> - найти все псевдонимы совпавшие с <keyword> (команда: /findalias)',
	['verbose'] = true,
	['Display extra information in the chat frame when commands are dealiased'] = true,
	['inline'] = true,
	['Expand aliases as you are typing'] = "Раскрыть псевдонимы которые вы вводили",
	["Options for altering the behaviour of Alias"] = true,
	['Options'] = true,
	['noclobber'] = true,
	["Don't overwrite existing aliases when using /addalias"] = "Не перезаписывать существующие псевдонимы при использовани /addalias",
	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = " - список всех псевдонимов; источник <keyword> для поиска псевдонимов (команда: /listallaliases)",
	["%s() called with nil argument!"] = true,
	["%s() called with blank string!"] = true,
	['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'] = true,
	['noclobber set - skipping new alias: /%s already expands to /%s'] = true,
	['overwriting existing alias "/%s" (was aliased to "/%s")'] = "перезапись сужествующего псевдонима \"/%s\" (теперь псевдоним \"/%s\")",
	["/%s aliased to: /%s"] = "/%s теперь псевдоним \"/%s\"",
	['alias "/%s" does not exist'] = "псевдоним \"/%s\" не существует",
	['deleting alias "/%s" (previously aliased as "/%s")'] = "удаление псевдонима \"/%s\" (перед этим назывался как \"/%s\")",
	['tried to show value for alias "%s" but undefined in module.Aliases!'] = true,
	['/%s aliased to "/%s"'] = "/%s теперь псевдоним на \"/%s\"",
	["No aliases have been defined"] = "Псевдонимов не обнаружено",
	['There is no alias current defined for "%s"'] = true,
	['infinite loop detected for alias /%s - ignoring'] = true,
	['dealiasing command /%s to /%s'] = true,
	['matching aliases found: %d'] = "совпавших псевдонимов найдено: %d",
	['total aliases: %d'] = "всего псевдонимов: %d",
	["warnUser() called with nil argument!"] = true,
	["warnUser() called with zero length string!"] = true,
})

--L[LIB.NEWLOCALE](L, "esES", function() return {
--	["Alias"] = "Alias",
--	["Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command."] = "A\195\177ade el comando /alias, que puede ser usado para crear alias de comandos de un modo similar al comando alias de Unix.",
--	["add"] = "add",
--	["add an alias"] = "A\195\177ade un alias",
--	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = "<comando>[ <valor>] - alias de <comando> que se ejecutar\195\161 como <valor>, o devuelve el valor del alias actualmente definido para <comando> si <comando> no tiene un valor asignado. Ej: '/alias /ejemplohola /decir Hola' - al escribir '/ejemplohola' tu personaje dir\195\161 'Hola'; '/alias ejemplohola' - muestra '/ejemplohola es el alias de /decir Hola' (cmd alias: /addalias)",
--	["unalias"] = "unalias",
--	["remove an alias"] = "Elimina un alias",
--	['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'] = "<alias> - elimina el alias <alias> (cmd aliases: /delalias, /remalias)",
--	["listaliases"] = "listaliases",
--	["list all aliases"] = "Lista todos los alias",
--	['findaliases'] = "findaliases",
--	['find aliases matching a given search term'] = "encuentra alias que coincidan con el buscado",
--	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = "<keyword> - encuentra todos los alias coincidentes <keyword> (cmd aliases: /findalias)",
--	['verbose'] = "verbose",
--	['Display extra information in the chat frame when commands are dealiased'] = "Muestra informaci\195\179n extra en el marco del chat cuando los comandos son ejecutados",
--	['inline'] = "inline",
--	['Expand aliases as you are typing'] = "Expande los alias al escribirlos",
--	["Options for altering the behaviour of Alias"] = "Opciones para alterar los Alias",
--	['Options'] = "Opciones",
--	['noclobber'] = "noclobber",
--	["Don't overwrite existing aliases when using /addalias"] = "No sobreescribe alias existentes al usar /addalias",
--	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = ' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)',
--	["%s() called with nil argument!"] = "%s() called with nil argument!",
--	["%s() called with blank string!"] = "%s() called with blank string!",
--	['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'] = 'refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up',
--	['noclobber set - skipping new alias: /%s already expands to /%s'] = 'noclobber set - skipping new alias: /%s already expands to /%s',
--	['overwriting existing alias "/%s" (was aliased to "/%s")'] = 'overwriting existing alias "/%s" (was aliased to "/%s")',
--	["/%s aliased to: /%s"] = "/%s aliased to: /%s",
--	['alias "/%s" does not exist'] = 'alias "/%s" does not exist',
--	['deleting alias "/%s" (previously aliased as "/%s")'] = 'deleting alias "/%s" (previously aliased as "/%s")',
--	['tried to show value for alias "%s" but undefined in module.Aliases!'] = 'tried to show value for alias "%s" but undefined in module.Aliases!',
--	['/%s aliased to "/%s"'] = '/%s aliased to "/%s"',
--	["No aliases have been defined"] = "Ning\195\186n alias ha sido definido",
--	['There is no alias current defined for "%s"'] = 'No existen alias definidos para "%s"',
--	['infinite loop detected for alias /%s - ignoring'] = 'Ciclo infinito detectado para alias /%s - ignorando',
--	['dealiasing command /%s to /%s'] = 'Comando alias inverso /%s a /%s',
--	['matching aliases found: %d'] = "Alias coincidentes encontrados: %d",
--	['total aliases: %d'] = "Total alias: %d",
--	["warnUser() called with nil argument!"] = "warnUser() llamado con argumento nil!",
--	["warnUser() called with zero length string!"] = "warnUser() llamado con cadena de longitud cero!",
--} end)
--
--L[LIB.NEWLOCALE](L, "deDE", function() return {
--	["Alias"] = "Alias",
--	["Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command."] = "Fügt das Chatkommando /alias hinzu, das dazu benutzt werden kann selbst definierte Wörter für Chatkommandos zu verwenden. Ähnlich wie es das UNIX Alias Kommando tut.",
--	["add"] = "Hinzufügen",
--	["add an alias"] = "Füge ein Alias Kommando hinzu.",
--	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = "<slashcommando>[ <ergebnisslashkommando>] - Füge ein <slashkommando> hinzu das das <ergebnisslashkommando> auslöst, oder dir anzeigt was für ein <slashkommando> was für ein >ergebnisslashkommando> auslösen würde. zB: '/alias /beispielhallo /s hallo zusammen' - eintippen von '/beispielhallo' würde nun deinen Charakter dazu bringen 'hallo zusammen' zu sagen; '/alias beispielhallo' - schreibt im chat '/beispielhallo ist zugeornet zu /s hallo zusammen' (cmd aliases: /addalias)",
--	["unalias"] = "Entferne Alias",
--	["remove an alias"] = "Ein Alias Kommando entfernen.",
--	['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'] = "<alias> - entferne den alias <alias>",
--	["listaliases"] = "Liste Aliase",
--	["list all aliases"] = "Listet alle vorhanden Aliase auf.",
--	['findaliases'] = "Finde Aliase",
--	['find aliases matching a given search term'] = "Finde Aliase die dem gesuchten Wort entsprechen.",
--	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = "'<Suchwort> - finde alle Aliase die <Suchwort> entsprechen (cmd aliases: /findalias)",
--	['verbose'] = "Ausführlich",
--	['Display extra information in the chat frame when commands are dealiased'] = "Zeige eine zusätzliche Information im Chatfenster wenn Alias Kommandos entfernt werden.",
--	['inline'] = "Ausfüllen",
--	['Expand aliases as you are typing'] = "Vervollständige Aliase beim eintippen.",
--	["Options for altering the behaviour of Alias"] = "Optionem um das verhalten der Aliasen zu abzuändern.",
--	['Options'] = "Optionen",
--	['noclobber'] = "NichtÜberschreiben",
--	["Don't overwrite existing aliases when using /addalias"] = "Kein Überschreiben von existierenden Aliasen wenn /addalias benutzt wird.",
--	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = " - Liste alle Aliase; benutze <Suchwortwort> um nach möglichen Aliasen zu suchen.",
--} end)
--
--L[LIB.NEWLOCALE](L, "zhTW", function() return {
--	["Alias"] = "指令別名",
--	["Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command."] = "增加指令 /alias，可用以作為一般指令的別名，就像在 Unix 系統中的指令別名。",
--	["add"] = "增加別名",
--	["add an alias"] = "增加一個指令別名。",
--	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = "<指令>[ <值>] - 將<指令>作為<值>的別名; 如果沒有指定<值>的話就傳回現定義為<指令>的別名。例: 「/alias /examplehello /say hello there」 - 現在鍵入「/examplehello」會使你的角色說: 「hello there」; 「/alias examplehello」 - 在聊天視窗顯示「/examplehello 是「/say hello there」的指令別名」 (別名: /addalias)",
--	["unalias"] = "移除別名",
--	["remove an alias"] = "移除一個指令別名。",
--	['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'] = "<指令別名> - 移除一個指令別名<指令別名> (別名: /delalias，/remalias)",
--	["listaliases"] = "列出別名",
--	["list all aliases"] = "列出你現在所有指令別名。",
--	['findaliases'] = "搜尋別名",
--	['find aliases matching a given search term'] = "搜尋指令別名。",
--	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = "<關鍵字> - 搜尋符合<關鍵字>的指令別名 (別名: /findalias)",
--	['verbose'] = "額外資訊",
--	['Display extra information in the chat frame when commands are dealiased'] = "當執行指令別名時在聊天視窗顯示額外資訊。",
--	['inline'] = "即時變更",
--	['Expand aliases as you are typing'] = "在輸入框把指令別名變為實際指令。",
--	["Options for altering the behaviour of Alias"] = "指令別名的選項。",
--	['Options'] = "選項",
--	['noclobber'] = "不覆寫",
--	["Don't overwrite existing aliases when using /addalias"] = "當執行 /addalias 時不覆寫現有的指令別名。",
--	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = " - 列出所有指令別名; 提供<關鍵字>搜尋符合的指令別名 (別名: /listallaliases)",
--	["%s() called with nil argument!"] = "%s(): 沒有參數!",
--	["%s() called with blank string!"] = "%s(): 空白字串!",
--	['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'] = "拒絕定義「/%s」",
--	['noclobber set - skipping new alias: /%s already expands to /%s'] = "已設定不覆寫現有的指令別名 - /%s 早已是 /%s 的指令別名",
--	['overwriting existing alias "/%s" (was aliased to "/%s")'] = "覆寫「/%s」 (先前是「/%s」的指令別名)",
--	["/%s aliased to: /%s"] = "/%s 是 /%s 的指令別名",
--	['alias "/%s" does not exist'] = "指令別名「/%s」不存在",
--	['deleting alias "/%s" (previously aliased as "/%s")'] = "移除「/%s」 (先前是「/%s」的指令別名)",
--	['tried to show value for alias "%s" but undefined in module.Aliases!'] = "「/%s」未定義!",
--	['/%s aliased to "/%s"'] = "/%s 是「/%s」的指令別名",
--	["No aliases have been defined"] = "沒有定義指令別名",
--	['There is no alias current defined for "%s"'] = "沒有「%s」指令別名",
--	['infinite loop detected for alias /%s - ignoring'] = "/%s: found無限迴路 - 忽略",
--	['dealiasing command /%s to /%s'] = "/%s => /%s",
--	['matching aliases found: %d'] = "找到符合的指令別名: %d",
--	['total aliases: %d'] = "指令別名總數: %d",
--	["warnUser() called with nil argument!"] = "warnUser(): 沒有參數!",
--	["warnUser() called with zero length string!"] = "warnUser(): 空白字串!",
--} end)
--
--
----Chinese Translation: 月色狼影@CWDG
----CWDG site: http://Cwowaddon.com
----Chinese Translate Add by Ananhaid(NovaLOG)@CWDG (Line:185-216)
--L[LIB.NEWLOCALE](L, "zhCN", function() return {
--	["Alias"] = "自定义指令",
--	["Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command."] = "增加指令 /alias ,可以作为一般指令的别名,就如在 Unix 系统中的自定义指令",
--	["add"] = "添加自定义",
--	["add an alias"] = "添加一条自定义指令",
--	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = "<指令>[ <值>] - 将自定义<指令>成为可执行<值>；如果你没用指定该<值>的话，系统就会反馈给你当前自定义<指令>的值。例如：/alias /examplehello /say hello there - 输入/examplehello，你的角色会立即/say Hello there输出到聊天框中。从上面例子可以看出/examplehello已经成为/say hello there的一个自定义指令。让你聊天更加快捷方便。",
--	["unalias"] = "移除自定义指令",
--	["remove an alias"] = "移除一条自定义指令",
--	["listaliases"] = "列出自定义指令",
--	["list all aliases"] = "列出你当前所有自定义指令",
--	['findaliases'] = "搜索自定义指令",
--	['find aliases matching a given search term'] = "搜索自定义指令。",
--	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = "<关键字> - 搜索符合<关键字>的自定义指令 (命令行: /findalias)",
--	['verbose'] = "额外信息",
--	['Display extra information in the chat frame when commands are dealiased'] = "当执行自定义指令时在聊天窗口显示额外信息。",
--	['inline'] = "即时更新",
--	['Expand aliases as you are typing'] = "在输入框把自定义指令变为实际指令。",
--	["Options for altering the behaviour of Alias"] = "自定义指令选项。",
--	['Options'] = "选项",
--	['noclobber'] = "不覆盖",
--	["Don't overwrite existing aliases when using /addalias"] = "当执行 /addalias 时不覆盖现有的自定义指令。",
--	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = " - 列出所有自定义指令; 提供<关键字>搜索符合的自定义指令 (別名: /listallaliases)",
--	["%s() called with nil argument!"] = "%s(): 沒有参数!",
--	["%s() called with blank string!"] = "%s(): 空白字符!",
--	['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'] = "拒绝定义「/%s」",
--	['noclobber set - skipping new alias: /%s already expands to /%s'] = "已设定不覆盖现有的自定义指令 - /%s 早已是 /%s 的自定义指令",
--	['overwriting existing alias "/%s" (was aliased to "/%s")'] = "覆盖「/%s」 (先前是「/%s」的自定义指令)",
--	["/%s aliased to: /%s"] = "/%s 是 /%s 的自定义指令",
--	['alias "/%s" does not exist'] = "自定义指令「/%s」不存在",
--	['deleting alias "/%s" (previously aliased as "/%s")'] = "移除「/%s」 (先前是「/%s」的自定义指令)",
--	['tried to show value for alias "%s" but undefined in module.Aliases!'] = "「/%s」未定义!",
--	['/%s aliased to "/%s"'] = "/%s 是「/%s」的自定义指令",
--	["No aliases have been defined"] = "沒有定义自定义指令",
--	['There is no alias current defined for "%s"'] = "沒有「%s」自定义指令",
--	['infinite loop detected for alias /%s - ignoring'] = "/%s: 发现无限循环 - 忽略",
--	['dealiasing command /%s to /%s'] = "/%s => /%s",
--	['matching aliases found: %d'] = "找到符合的自定义指令: %d",
--	['total aliases: %d'] = "自定义指令总数: %d",
--	["warnUser() called with nil argument!"] = "warnUser(): 沒有参数!",
--	["warnUser() called with zero length string!"] = "warnUser(): 空白字符!",
--} end)

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")



Prat:SetModuleDefaults(module.name, {
	profile = {
		on	= false,
		aliases	= {},
		verbose	= false,
		inline	= true,
		noclobber = false,
	
		-- things we won't alias
		wontalias = {
			unalias	= 1,
			alias	= 1,
			prat	= 1,
			script	= 1,
			run	= 1,
			ace	= 1,
			ace2	= 1,
			listaliases = 1,
			quit	= 1,
			reload	= 1,
			rl	= 1,
			},
		}
} )




-- any boolean options
--module.toggleOptions = {
--	on,
--	verbose,
--	inline,
--	noclobber,
--	}


Prat:SetModuleOptions(module, {
		name	= L["module_name"],
		desc	= L["module_desc"],
		type	= "group",
		args = {
			add = {
				type	= "input",
				name	= L["add"],
				desc	= L["add an alias"],
--				usage	= L['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'],

				get	= false,
				set	= function(info, argstr) return info.handler:setAlias(argstr) end,
				order	= 210,
				},

			del = {
				name	= L["unalias"],
				desc	= L["remove an alias"],
				type	= "select",
--				usage	= L['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'],
				values	= function(info) return info.handler.db.profile.aliases end,
				set	= function(info, aliastoremove) return info.handler:delAlias(aliastoremove) end,
				order	= 220,
				disabled = function(info) return info.handler:NumAliases()==0 end
				},

			find = {
				name	= L["findaliases"],
				desc	= L["find aliases matching a given search term"],
				type	= 'input',
				set	= function(info, q) return info.handler:listAliases(q) end,
				get	= false,
--				usage	= L['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'],
				order	= 230,
				},

			list = {
				name	= L["listaliases"],
				desc	= L["list all aliases"],
				type	= 'execute',
				func	= function(info) info.handler:listAliases() end,
--				usage	= L[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'],
				order	= 240,
				},


			blankheader = {
				name    = "",
				order	= 499,
				type	= 'header',
				},
			--[[ OPTIONS ]]--
			optionsheader = {
				name	= L["Options"],
				desc	= L["Options for altering the behaviour of Alias"],
				type	= 'header',
				order	= 500,
				},


			inline = {
				name	= L['inline'],
				desc	= L['Expand aliases as you are typing'],
				type	= 'toggle',
				order	= 510,
				},

			noclobber = {
				name	= L['noclobber'],
				desc	= L["Don't overwrite existing aliases when using /addalias"],
				type	= 'toggle',
				order	= 520,
				},

			verbose = {
				name	= L['verbose'],
				desc	= L['Display extra information in the chat frame when commands are dealiased'],
				type	= 'toggle',
				order	= 530,
				},
			}
		}
)

local CLR = Prat.CLR

local function clralias(text) return CLR:Colorize("64ff64", text:lower()) end
local function clrexpansion(text) return CLR:Colorize("64ffff", text:lower()) end
local function clrmodname(text) return CLR:Colorize("ff8080", text) end


-- things to do when the module is enabled
function module:OnModuleEnable()
	self.Aliases = {}

	table.sort(self.db.profile.aliases)

	for k, v in pairs(self.db.profile.aliases) do
		self.Aliases[k] = v
	end

	self.WontAlias = self.db.profile.wontalias
	for naughtyalias, justtrue in pairs(self.WontAlias) do
		self.WontAlias[string.lower(naughtyalias)] = 1
	end

	self:RawHook('ChatEdit_HandleChatType', true)

--	Prat:RegisterChatCommand({ '/alias', '/addalias', }, self.moduleOptions.args.add, 'PRATALIAS')
--	Prat:RegisterChatCommand({ '/unalias', '/delalias', '/remalias' }, self.moduleOptions.args.del, 'PRATUNALIAS')
--	Prat:RegisterChatCommand({ '/listaliases', '/listallaliases' }, self.moduleOptions.args.list, 'PRATLISTALIASES')
--	Prat:RegisterChatCommand({ '/findaliases', '/findalias' }, self.moduleOptions.args.find, 'PRATFINDALIASES')

	Prat.RegisterChatCommand("alias", function(argstr) return self:setAlias(argstr) end)
	Prat.RegisterChatCommand("unalias", function(argstr) return self:delAlias(argstr) end)
	Prat.RegisterChatCommand("listaliases", function(argstr) return self:listAliases(argstr) end)
end

-- things to do when the module is disabled
function module:OnModuleDisable()
	-- unregister events
--	Prat.UnregisterAllChatEvents(self)

	self:UnhookAll()
	self.Aliases = nil
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function module:splitAliasArgs(str)
	-- str should be "<command>[=value| value]"
	local name, value
	local args = {
		name	= "",
		value	= "",
		}

	-- if it doesn't match, args is left with default blank strings for values
	--for alias, command in str:find("(%w+)%s*=?%s*(.-)%s*$") do
	for alias, command in str:gmatch("/?(%w+)%s*[%s=]%s*/?(.-)$") do
		-- either matches both alias and command (may match command as a blank string)
		args['name']	= string.lower(alias)
		args['value']	= command or ""
		-- util:print('name ' .. args['name'])
		-- util:print('value ' .. args['value'])
	end

	return args
end

function module:checkArgStr(funcname, argstr)
	if argstr == nil then
		self:warnUser(string.format(L["%s() called with nil argument!"], funcname))
		return false
	end

	if argstr == "" then
		self:warnUser(string.format(L["%s() called with blank string!"], funcname))
		return false
	end

	return true
end

function module:setAlias(argstr)
	-- argstr should be "<command>[ <value]"
	if not self:checkArgStr('setAlias', argstr) then
		return false
	end

	local alias = self:splitAliasArgs(argstr)

	-- check to see if the user is defining an alias or not
	if not alias['value'] or (alias['value'] == "") then
		local name = argstr

		-- called as: /alias <command> - check for alias called <command> to display
		if self.Aliases[name] then
			-- alias found; show it :)
			self:showAlias(name)
			return true
		else
			-- no alias found called <command>; tell user
			self:reportUndefinedAlias(name)
		end
	elseif self.WontAlias[string.lower(alias['name'])] then
		-- user is defining an alias called <command>, but it's potentially bad
		self:warnUser(string.format(L['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'], clralias(alias['name'])))
		return false
	elseif self.db.profile.noclobber and self.Aliases[string.lower(alias['name'])] then
		self:warnUser(string.format(L['noclobber set - skipping new alias: /%s already expands to /%s'], clralias(alias['name']), clrexpansion(alias['value'])))
		return false
	else
		-- it's not listed as bad, so create or update the aliases tables
		-- called as /alias <command> <value> - define alias <command> as <value>
		if self.Aliases[alias['name']] then
			-- specified alias already exists, warn user and print old setting
			self:warnUser(string.format(L['overwriting existing alias "/%s" (was aliased to "/%s")'], clralias(alias['name']), clrexpansion(self.Aliases[alias['name']])))
		end

		-- now (re?)define the alias <command> to <value>
		self.Aliases[alias['name']] = alias['value']
		self.db.profile.aliases[alias['name']] = alias['value']

		table.sort(self.db.profile.aliases)
		table.sort(self.Aliases)

		LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")

		self:warnUser(string.format(L["/%s aliased to: /%s"], clralias(alias['name']), clrexpansion(alias['value'])))
	end
end

function module:delAlias(aliasname)
	if not self:checkArgStr('delAlias', aliasname) then
		return false
	end

	-- remove unecessary /s at the beginning of the alias name
	aliasname	= aliasname:gsub('^/*', '')

	if not self.Aliases[aliasname] then
		self:warnUser(string.format(L['alias "/%s" does not exist'], clralias(aliasname)))
		return false
	end

	local oldalias = self.Aliases[aliasname]

	self:warnUser(string.format(L['deleting alias "/%s" (previously aliased as "/%s")'], clralias(aliasname), clrexpansion(oldalias)))

	self.Aliases[aliasname]			= nil
	self.db.profile.aliases[aliasname]	= nil

	LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")

	return oldalias
end

function module:showAlias(aliasname)
	if not self:checkArgStr('showAlias', aliasname) then
		return false
	end

	-- check for undefined alias called aliasname
	if not self.Aliases[aliasname] then
		self:warnUser(string.format(L['tried to show value for alias "%s" but undefined in module.Aliases!'], clralias(aliasname)))
		return false
	end

	-- everything OK; display value of alias "aliasname"
	self:warnUser(string.format(L['/%s aliased to "/%s"'], clralias(aliasname), clrexpansion(self.Aliases[aliasname])))

	return true
end

function module:listAliases(q)
	if self.Aliases == {} then
		self:warnUser(L["No aliases have been defined"])
		return false
	end

	local msg
	local count	= 0

	table.sort(self.Aliases)

	for name, alias in pairs(self.Aliases) do
		if not q or (name:match(q)) then
			self:showAlias(name)
			count = count + 1
		end
	end

	if q then
		msg	= L['matching aliases found: %d']
	else
		msg	= L['total aliases: %d']
	end

	self:tellUser(string.format(msg, count))
end


function module:reportUndefinedAlias(name)
	return self:warnUser(string.format(L['There is no alias current defined for "%s"'], clralias(name)))
end

function module:tellUser(str)
	return module:warnUser(str)
end

function module:NumAliases()
	local n=0
	for name, alias in pairs(self.Aliases) do
		n=n+1
	end
	return n
end

function module:warnUser(str)
	if str == nil then
		str = L["warnUser() called with nil argument!"]
	elseif not str then
		str = L["warnUser() called with zero length string!"]
	end

	DEFAULT_CHAT_FRAME:AddMessage(string.format("%s: %s", clrmodname(self.moduleName), str))

	return true
end


local fake	= {}

function module:ChatEdit_HandleChatType(editBox, msg, command, send, dealiased)
	local command	= command or ""
	local alias	= self.Aliases[string.lower(strsub(command, 2))]
	local dealiased	= dealiased or {}
	local msg	= msg or ""

	if dealiased[command] then
		-- skip commands we've already dealiased
		self:warnUser(string.format(L['infinite loop detected for alias /%s - ignoring'], clralias(alias)))
	elseif alias and alias ~= "" then
		if (send == 1) and self.db.profile.verbose then
			self:warnUser(string.format(L['dealiasing command /%s to /%s'], clralias(strsub(command, 2)), clrexpansion(alias)))
		end

		dealiased[command] = true
		alias		= Prat.ReplaceMatches(alias, 'OUTBOUND')

		local newcmd	= strmatch(alias, "^/*([^%s]+)") or ""
		local premsg	= strsub(alias, strlen(newcmd) + 2) or ""

		if premsg ~= "" then
			msg	= premsg .. ' ' .. msg
		end

		command = '/' .. string.upper(newcmd)
		text	= string.lower(command)

		if msg ~= "" then
			fake.MESSAGE = msg

			Prat.Addon:ProcessUserEnteredChat(fake)

			msg	= fake.MESSAGE
			text	= text .. ' ' .. msg
		end

		if (send == 1) then
			editBox:SetText(text)
		elseif (self.db.profile.inline) then
			editBox:SetText(text .. ' ')
		end

		self:ChatEdit_HandleChatType(editBox, msg, command, send, dealiased)

		return true
	end

	if send == 1 then
		local text = editBox:GetText()
		-- ripped off Blizzard's slash command bits here; just changed return value
		if ( hash_SlashCmdList[command] ) then
			hash_SlashCmdList[command](strtrim(msg));
			editBox:AddHistoryLine(text);
			ChatEdit_OnEscapePressed(editBox);

			return true
		end

		for index, value in pairs(SlashCmdList) do
			local i = 1;
			local cmdString = getglobal("SLASH_"..index..i);
			while ( cmdString ) do
				cmdString = strupper(cmdString);
				if ( cmdString == command ) then
					hash_SlashCmdList[command] = value;	-- add to hash
					-- if the code in here changes - change the corresponding code above
					value(strtrim(msg));

					editBox:AddHistoryLine(text);
					ChatEdit_OnEscapePressed(editBox);
					return true
				end
				i = i + 1;
				cmdString = getglobal("SLASH_"..index..i);
			end
		end
	end

	return self.hooks["ChatEdit_HandleChatType"](editBox, msg, command, send)
end


  return
end ) -- Prat:AddModuleToLoad