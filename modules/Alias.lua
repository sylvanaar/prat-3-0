---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
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

  local PRAT_MODULE = Prat:RequestModuleName("Alias")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")
  local PL = module.PL

  local function dbg(...) end

  --[==[@debug@
  local function dbg(...)
    -- Prat:PrintLiteral(...)
  end

  PL:AddLocale(PRAT_MODULE, "enUS", {
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
    [' - list all aliases; suPLy <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = true,
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
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = true,
		["%s() called with blank string!"] = true,
		["%s() called with nil argument!"] = true,
		["/%s aliased to \"/%s\""] = true,
		["/%s aliased to: /%s"] = true,
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = true,
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = true,
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = true,
		["add"] = true,
		["add an alias"] = true,
		["alias \"/%s\" does not exist"] = true,
		["dealiasing command /%s to /%s"] = true,
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = true,
		["Display extra information in the chat frame when commands are dealiased"] = true,
		["Don't overwrite existing aliases when using /addalias"] = true,
		["Expand aliases as you are typing"] = true,
		["find aliases matching a given search term"] = true,
		["findaliases"] = true,
		["infinite loop detected for alias /%s - ignoring"] = true,
		["inline"] = true,
		["list all aliases"] = true,
		["listaliases"] = true,
		["matching aliases found: %d"] = true,
		["module_desc"] = "Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
		["module_name"] = "Alias",
		["No aliases have been defined"] = true,
		["noclobber"] = true,
		["noclobber set - skipping new alias: /%s already expands to /%s"] = true,
		["Options"] = true,
		["Options for altering the behaviour of Alias"] = true,
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = true,
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = true,
		["remove an alias"] = true,
		["There is no alias current defined for \"%s\""] = true,
		["total aliases: %d"] = true,
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = true,
		["unalias"] = true,
		["verbose"] = true,
		["warnUser() called with nil argument!"] = true,
		["warnUser() called with zero length string!"] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)




L = {
	["Alias"] = {
		--[[Translation missing --]]
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = " - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)",
		--[[Translation missing --]]
		["%s() called with blank string!"] = "%s() called with blank string!",
		--[[Translation missing --]]
		["%s() called with nil argument!"] = "%s() called with nil argument!",
		--[[Translation missing --]]
		["/%s aliased to \"/%s\""] = "/%s aliased to \"/%s\"",
		--[[Translation missing --]]
		["/%s aliased to: /%s"] = "/%s aliased to: /%s",
		--[[Translation missing --]]
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)",
		--[[Translation missing --]]
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)",
		--[[Translation missing --]]
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)",
		--[[Translation missing --]]
		["add"] = "add",
		--[[Translation missing --]]
		["add an alias"] = "add an alias",
		--[[Translation missing --]]
		["alias \"/%s\" does not exist"] = "alias \"/%s\" does not exist",
		--[[Translation missing --]]
		["dealiasing command /%s to /%s"] = "dealiasing command /%s to /%s",
		--[[Translation missing --]]
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "deleting alias \"/%s\" (previously aliased as \"/%s\")",
		--[[Translation missing --]]
		["Display extra information in the chat frame when commands are dealiased"] = "Display extra information in the chat frame when commands are dealiased",
		--[[Translation missing --]]
		["Don't overwrite existing aliases when using /addalias"] = "Don't overwrite existing aliases when using /addalias",
		--[[Translation missing --]]
		["Expand aliases as you are typing"] = "Expand aliases as you are typing",
		--[[Translation missing --]]
		["find aliases matching a given search term"] = "find aliases matching a given search term",
		--[[Translation missing --]]
		["findaliases"] = "findaliases",
		--[[Translation missing --]]
		["infinite loop detected for alias /%s - ignoring"] = "infinite loop detected for alias /%s - ignoring",
		--[[Translation missing --]]
		["inline"] = "inline",
		--[[Translation missing --]]
		["list all aliases"] = "list all aliases",
		--[[Translation missing --]]
		["listaliases"] = "listaliases",
		--[[Translation missing --]]
		["matching aliases found: %d"] = "matching aliases found: %d",
		--[[Translation missing --]]
		["module_desc"] = "Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
		--[[Translation missing --]]
		["module_name"] = "Alias",
		--[[Translation missing --]]
		["No aliases have been defined"] = "No aliases have been defined",
		--[[Translation missing --]]
		["noclobber"] = "noclobber",
		--[[Translation missing --]]
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "noclobber set - skipping new alias: /%s already expands to /%s",
		--[[Translation missing --]]
		["Options"] = "Options",
		--[[Translation missing --]]
		["Options for altering the behaviour of Alias"] = "Options for altering the behaviour of Alias",
		--[[Translation missing --]]
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "overwriting existing alias \"/%s\" (was aliased to \"/%s\")",
		--[[Translation missing --]]
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up",
		--[[Translation missing --]]
		["remove an alias"] = "remove an alias",
		--[[Translation missing --]]
		["There is no alias current defined for \"%s\""] = "There is no alias current defined for \"%s\"",
		--[[Translation missing --]]
		["total aliases: %d"] = "total aliases: %d",
		--[[Translation missing --]]
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "tried to show value for alias \"%s\" but undefined in module.Aliases!",
		--[[Translation missing --]]
		["unalias"] = "unalias",
		--[[Translation missing --]]
		["verbose"] = "verbose",
		--[[Translation missing --]]
		["warnUser() called with nil argument!"] = "warnUser() called with nil argument!",
		--[[Translation missing --]]
		["warnUser() called with zero length string!"] = "warnUser() called with zero length string!",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = "- lista todos os \"apelidos\" ; forneça <palavra-chave> para procurar pelos \"apelidos\" correspondentes (cmd aliases: /listallaliases)",
		["%s() called with blank string!"] = "%s() chamado faltando um argumento!",
		["%s() called with nil argument!"] = "%s chamado com um argumento nulo!",
		["/%s aliased to \"/%s\""] = "/% linkado para \"/%s\"",
		["/%s aliased to: /%s"] = "/%s linkado para: /%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - remove o \"apelido\" <alias> (cmd aliases: /delalias, /remalias)",
		--[[Translation missing --]]
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)",
		--[[Translation missing --]]
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)",
		--[[Translation missing --]]
		["add"] = "add",
		--[[Translation missing --]]
		["add an alias"] = "add an alias",
		--[[Translation missing --]]
		["alias \"/%s\" does not exist"] = "alias \"/%s\" does not exist",
		--[[Translation missing --]]
		["dealiasing command /%s to /%s"] = "dealiasing command /%s to /%s",
		--[[Translation missing --]]
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "deleting alias \"/%s\" (previously aliased as \"/%s\")",
		--[[Translation missing --]]
		["Display extra information in the chat frame when commands are dealiased"] = "Display extra information in the chat frame when commands are dealiased",
		--[[Translation missing --]]
		["Don't overwrite existing aliases when using /addalias"] = "Don't overwrite existing aliases when using /addalias",
		--[[Translation missing --]]
		["Expand aliases as you are typing"] = "Expand aliases as you are typing",
		--[[Translation missing --]]
		["find aliases matching a given search term"] = "find aliases matching a given search term",
		--[[Translation missing --]]
		["findaliases"] = "findaliases",
		--[[Translation missing --]]
		["infinite loop detected for alias /%s - ignoring"] = "infinite loop detected for alias /%s - ignoring",
		--[[Translation missing --]]
		["inline"] = "inline",
		--[[Translation missing --]]
		["list all aliases"] = "list all aliases",
		--[[Translation missing --]]
		["listaliases"] = "listaliases",
		--[[Translation missing --]]
		["matching aliases found: %d"] = "matching aliases found: %d",
		--[[Translation missing --]]
		["module_desc"] = "Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
		--[[Translation missing --]]
		["module_name"] = "Alias",
		--[[Translation missing --]]
		["No aliases have been defined"] = "No aliases have been defined",
		--[[Translation missing --]]
		["noclobber"] = "noclobber",
		--[[Translation missing --]]
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "noclobber set - skipping new alias: /%s already expands to /%s",
		["Options"] = "Opções",
		--[[Translation missing --]]
		["Options for altering the behaviour of Alias"] = "Options for altering the behaviour of Alias",
		--[[Translation missing --]]
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "overwriting existing alias \"/%s\" (was aliased to \"/%s\")",
		--[[Translation missing --]]
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up",
		--[[Translation missing --]]
		["remove an alias"] = "remove an alias",
		--[[Translation missing --]]
		["There is no alias current defined for \"%s\""] = "There is no alias current defined for \"%s\"",
		--[[Translation missing --]]
		["total aliases: %d"] = "total aliases: %d",
		--[[Translation missing --]]
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "tried to show value for alias \"%s\" but undefined in module.Aliases!",
		--[[Translation missing --]]
		["unalias"] = "unalias",
		["verbose"] = "prolixo",
		["warnUser() called with nil argument!"] = "warnUser() chamado com argumento nulo!",
		["warnUser() called with zero length string!"] = "warnUser() chamado com uma linha vazia.",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = "- liste tous les alias ; fournissez un <mot clé> pour trouver une correspondance d'alias (cmd alias: /listallaliases)",
		["%s() called with blank string!"] = "%s() appelé avec un argument vide !",
		["%s() called with nil argument!"] = "%s() appelé sans argument !",
		["/%s aliased to \"/%s\""] = "/%s défini comme alias de \"/%s\"",
		["/%s aliased to: /%s"] = "/%s défini comme alias de : /%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - Enlever l'alias <alias> (cmd des alias: /delalias, /remalias)",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<commande>[ <valeur> ] - Créé un alias <commande> exécuté comme <valeur>. si <commande> n'a pas de valeur assigné, retourne la valeur de l'alias actuellement définit pour <commande>. Ex: \"/alias /examplebonjour /dire Bonjour à tous\" - Taper \"/exemplebonjour\" fera alors dire \"Bonjour à tous\" à votre personnage; \"/alias examplehello\" fera dire \"/examplebonjour est un alias pour /dire Bonjour à tous\" (cmd des alias : /addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<motclé> - Trouve tout les alias avec <motclé> (cmd des alias /findalias)",
		["add"] = "ajouter",
		["add an alias"] = "ajouter un alias",
		["alias \"/%s\" does not exist"] = "l'alias \"/%s\" n'existe pas",
		["dealiasing command /%s to /%s"] = "Enlever l'alias de la commande /%s vers /%s",
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "Supprimer l'alias \"/%s\" (Précédemment l'alias de \"/%s\")",
		["Display extra information in the chat frame when commands are dealiased"] = "Afficher des informations supplémentaires dans le chat quand des alias de commandes sont supprimés",
		["Don't overwrite existing aliases when using /addalias"] = "Ne pas écraser les alias existant avec /addalias",
		["Expand aliases as you are typing"] = "Agrandir les alias au fur et à mesure que vous tapez ",
		["find aliases matching a given search term"] = "Trouver des alias correspondant à un terme recherché",
		["findaliases"] = "TrouverAlias",
		["infinite loop detected for alias /%s - ignoring"] = "Boucle infinie détectée pour l'alias /%s - ignorée",
		["inline"] = "en ligne",
		["list all aliases"] = "Lister tout les alias",
		["listaliases"] = "ListerAlias",
		["matching aliases found: %d"] = "Alias correspondant trouvés: %d",
		["module_desc"] = "Ajoute la commande /alias qui peut être utilisé pour créer des alias de commandes slash de façon similaire aux commandes d'alias d'UNIX",
		["module_name"] = "Alias",
		["No aliases have been defined"] = "Aucun alias n'a été défini",
		["noclobber"] = "NePasÉcraser",
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "NePasÉcraser défini - Passer le nouvel alias: /%s déjà étendu à /%s",
		["Options"] = true,
		["Options for altering the behaviour of Alias"] = "Options pour modifier le comportement des alias",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "Écraser l'alias existant \"/%s\" (Était l'alias de \"/%s\")  ",
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "Refuser à l'alias \"/%s\" de faire quoi que ce soit dans l'intérêt de ne pas tout bugger par dessus",
		["remove an alias"] = "Supprimer un alias",
		["There is no alias current defined for \"%s\""] = "Il n'y a pas d'alias actuellement défini pour \"%s\"",
		["total aliases: %d"] = "Alias totaux : %d",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "A tenté de montrer la valeur de l'alias \"%s\" mais il était indéfini dans le module Alias!",
		["unalias"] = "Enlever l'alias",
		["verbose"] = "détaillé",
		["warnUser() called with nil argument!"] = "warnUser() appelé avec un argument nul !",
		["warnUser() called with zero length string!"] = "warnUser() appelé avec un chaine de longueur zéro !",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = "- Auflisten aller Aliase; <Suchbegriff> eingeben, um nach passenden Aliasen zu suchen (cmd aliases: /listallaliases)",
		["%s() called with blank string!"] = "%s() mit leerer Zeichenfolge aufgerufen!",
		["%s() called with nil argument!"] = "%s() mit Null Parameter aufgerufen!",
		["/%s aliased to \"/%s\""] = "/%s hat nun den Alias \"/%s\"",
		["/%s aliased to: /%s"] = "/%s hat nun den Alias: /%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - entfernt den Alias <alias> (cmd aliases: /delalias, /remalias)",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<befehl>[ <wert>] - alias <befehl> auszuführen als <wert>, oder den Wert des gegenwärtig definierten Alias erwidern für <befehl> falls <befehl> noch kein Wert zugewiesen worden ist; z.B: \"/alias /beispielhallo /say hallo du\" - die Eingabe von \"/beispielhallo\" wird nun deinen Charakter veranlassen, zu sagen \"hallo du\"; \"/alias beispielhallo\" - s \"/beispielhallo is aliased to /say hallo du\" (befehl alias: /addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<keyword> - Findet alle Alias, die <keyword> (Stichwort) entsprechen (cmd aliases: /findalias)",
		["add"] = "hinzufügen",
		["add an alias"] = "Ein Alias hinzufügen",
		["alias \"/%s\" does not exist"] = "Alias \"/%s\" existiert nicht.",
		["dealiasing command /%s to /%s"] = "Alias des Befehls ausschalten /%s wird /%s ",
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "Alias \"/%s\" wird gelöscht (bisheriger Alias \"/%s\")",
		["Display extra information in the chat frame when commands are dealiased"] = "Zusätzliche Informationen im Chatfenster anzeigen, wenn Alias von Befehlen ausgeschaltet wird.",
		["Don't overwrite existing aliases when using /addalias"] = "Bestehende Alias nicht überschreiben, wenn /addalias benutzt wird.",
		["Expand aliases as you are typing"] = "Autovervollständigung von Alias während des Tippens",
		["find aliases matching a given search term"] = "Mit einem Suchbegriff nach Alias suchen",
		["findaliases"] = true,
		["infinite loop detected for alias /%s - ignoring"] = "Endlosschleife entdeckt für Alias /%s - wird ignoriert",
		["inline"] = "innerhalb",
		["list all aliases"] = "Alle Alias auflisten",
		["listaliases"] = true,
		["matching aliases found: %d"] = "Passende Alias gefunden: %d",
		["module_desc"] = "Fügt das Kommando /alias hinzu, das verwendet werden kann, um \"Slash\"-Befehle durch Alias zu ersetzen, ähnlich wie der Alias-Befehl unter Unix.",
		["module_name"] = "Alias",
		["No aliases have been defined"] = "Es wurden keine Alias definiert.",
		["noclobber"] = true,
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "\"Noclobber\" (kein unsinniger Kleinkram) eingeschaltet - neues Alias übergehen: /%s wird bereits erweitert zu /%s",
		["Options"] = "Optionen",
		["Options for altering the behaviour of Alias"] = "Optionen für Verhaltensänderung von Alias",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "Überschreibe vorhandenes Alias \"/%s\" (Vorheriges Alias war: \"/%s\")",
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "Verweigert Alias von \"/%s\" zu etwas anderem, um Störungen zu vermeiden.",
		["remove an alias"] = "Ein Alias entfernen",
		["There is no alias current defined for \"%s\""] = "Es ist derzeit kein Alias definiert für \"%s\"",
		["total aliases: %d"] = "Gesamtanzahl an Alias: %d",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "Versuche einen Wert für Alias von \"%s\" anzuzeigen, ist aber nicht definiert im Modul \"Alias\"!",
		["unalias"] = "Alias aufheben",
		["verbose"] = "verlängern",
		["warnUser() called with nil argument!"] = "Benutzerwarnung() wird mit dem Argument Null aufgerufen!",
		["warnUser() called with zero length string!"] = "Benutzerwarnung() wird mit der Zeichenfolge mit der Länge Null aufgerufen!",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = " - 모든 대체 명령어 목록; 대체 명령어를 찾기 위한 <키워드> 지원 (명령어: /listallaliases)",
		["%s() called with blank string!"] = "%s() 함수가 문자열없이 호출되었습니다!",
		["%s() called with nil argument!"] = "%s() 함수가 nil 인자로 호출되었습니다!",
		["/%s aliased to \"/%s\""] = "/%s |1이;가; \"/%s\"|1으로;로; 대체되었습니다",
		["/%s aliased to: /%s"] = "/%s |1이;가; 다음으로 대체되었습니다: /%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - <alias> 대체 명령어 삭제 (명령어: /delalias, /remalias)",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<명령어>[ <인자>] - <명령어>를 <인자>로 실행되도록 대체하거나, <명령어>에 할당된 값이 없는 경우 현재 정의된 대체 명령어의 값을 반환합니다. 예: \"/alias /꾸벅 /say 안녕하세요\" - \"/꾸벅\"을 입력하면 캐릭터가 \"안녕하세요\"라고 말합니다; \"/alias 꾸벅\" - s \"/꾸벅 이 /say 안녕하세요 로 대체되었습니다\" (명령어: /addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<키워드> - <키워드>가 포함된 모든 대체 명령어를 찾습니다. (명령어: /findalias)",
		["add"] = "추가",
		["add an alias"] = "대체 명령어 추가",
		["alias \"/%s\" does not exist"] = "대체 명령어 \"/%s\"|1이;가; 없습니다",
		["dealiasing command /%s to /%s"] = "/%s|1이;가; /%s|1으로;로; 대체 명령어가 해제됩니다",
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "대체 명령어 \"%s\"|1을;를; 삭제합니다. (\"/%s\"로 설정되어 있었음)",
		["Display extra information in the chat frame when commands are dealiased"] = "대체 명령어가 해제될 때 대화창에 추가 정보를 표시합니다.",
		["Don't overwrite existing aliases when using /addalias"] = "/addalias 를 사용할 때 기존 대체 명령어를 덮어쓰지 마세요",
		["Expand aliases as you are typing"] = "대화창에 입력할 때 대체 명령어를 설정된 값으로 자동으로 바꿉니다.",
		["find aliases matching a given search term"] = "주어진 검색어와 일치하는 대체 명령어 찾기",
		["findaliases"] = true,
		["infinite loop detected for alias /%s - ignoring"] = "대체 명령어 /%s의 무한 반복이 감지되었습니다 - 무시합니다",
		["inline"] = true,
		["list all aliases"] = "모든 대체 명령어 목록",
		["listaliases"] = true,
		["matching aliases found: %d"] = "일치하는 대체 명령어 찾음: %d개",
		["module_desc"] = "UNIX의 alias 명령과 비슷한 방법으로 슬래쉬 명령어를 대체하는데 사용하는 /alias 명령을 추가합니다.",
		["module_name"] = "대체 명령어 [Alias]",
		["No aliases have been defined"] = "설정된 대체 명령어가 없습니다.",
		["noclobber"] = "덮어쓰기 금지",
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "덮어쓰기 금지 - 새로운 대체 명령어를 무시합니다 : /%s |1은;는; 이미 /%s |1으로;로; 설정되어 있습니다",
		["Options"] = "옵션",
		["Options for altering the behaviour of Alias"] = "대체 명령어의 작동을 바꾸는 옵션입니다",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "대체 명령어 \"/%s\"|1을;를; 덮어씁니다 (\"/%s\"의 대체 명령어 였음)",
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "\"/%s\" |1은;는; 중요 명령어로 사용 중이어서 대체 명령어 사용으로 거부되었습니다.",
		["remove an alias"] = "대체 명령어를 제거합니다",
		["There is no alias current defined for \"%s\""] = "\"%s\"|1으로;로; 설정된 대체 명령어가 없습니다.",
		["total aliases: %d"] = "모든 대체 명령어: %d개",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "대체 명령어 \"%s\"의 값을 표시하려고 했지만 모듈에 설정되어 있지 않습니다. 대체하세요!",
		["unalias"] = true,
		["verbose"] = true,
		["warnUser() called with nil argument!"] = "warnUser() 함수가 nil 인자로 호출되었습니다!",
		["warnUser() called with zero length string!"] = "warnUser() 함수가 문자열 없이 호출되었습니다!",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR", L)




L = {
	["Alias"] = {
		--[[Translation missing --]]
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = " - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)",
		--[[Translation missing --]]
		["%s() called with blank string!"] = "%s() called with blank string!",
		--[[Translation missing --]]
		["%s() called with nil argument!"] = "%s() called with nil argument!",
		--[[Translation missing --]]
		["/%s aliased to \"/%s\""] = "/%s aliased to \"/%s\"",
		--[[Translation missing --]]
		["/%s aliased to: /%s"] = "/%s aliased to: /%s",
		--[[Translation missing --]]
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)",
		--[[Translation missing --]]
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)",
		--[[Translation missing --]]
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)",
		--[[Translation missing --]]
		["add"] = "add",
		--[[Translation missing --]]
		["add an alias"] = "add an alias",
		--[[Translation missing --]]
		["alias \"/%s\" does not exist"] = "alias \"/%s\" does not exist",
		--[[Translation missing --]]
		["dealiasing command /%s to /%s"] = "dealiasing command /%s to /%s",
		--[[Translation missing --]]
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "deleting alias \"/%s\" (previously aliased as \"/%s\")",
		--[[Translation missing --]]
		["Display extra information in the chat frame when commands are dealiased"] = "Display extra information in the chat frame when commands are dealiased",
		--[[Translation missing --]]
		["Don't overwrite existing aliases when using /addalias"] = "Don't overwrite existing aliases when using /addalias",
		--[[Translation missing --]]
		["Expand aliases as you are typing"] = "Expand aliases as you are typing",
		--[[Translation missing --]]
		["find aliases matching a given search term"] = "find aliases matching a given search term",
		--[[Translation missing --]]
		["findaliases"] = "findaliases",
		--[[Translation missing --]]
		["infinite loop detected for alias /%s - ignoring"] = "infinite loop detected for alias /%s - ignoring",
		--[[Translation missing --]]
		["inline"] = "inline",
		--[[Translation missing --]]
		["list all aliases"] = "list all aliases",
		--[[Translation missing --]]
		["listaliases"] = "listaliases",
		--[[Translation missing --]]
		["matching aliases found: %d"] = "matching aliases found: %d",
		--[[Translation missing --]]
		["module_desc"] = "Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
		--[[Translation missing --]]
		["module_name"] = "Alias",
		--[[Translation missing --]]
		["No aliases have been defined"] = "No aliases have been defined",
		--[[Translation missing --]]
		["noclobber"] = "noclobber",
		--[[Translation missing --]]
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "noclobber set - skipping new alias: /%s already expands to /%s",
		--[[Translation missing --]]
		["Options"] = "Options",
		--[[Translation missing --]]
		["Options for altering the behaviour of Alias"] = "Options for altering the behaviour of Alias",
		--[[Translation missing --]]
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "overwriting existing alias \"/%s\" (was aliased to \"/%s\")",
		--[[Translation missing --]]
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up",
		--[[Translation missing --]]
		["remove an alias"] = "remove an alias",
		--[[Translation missing --]]
		["There is no alias current defined for \"%s\""] = "There is no alias current defined for \"%s\"",
		--[[Translation missing --]]
		["total aliases: %d"] = "total aliases: %d",
		--[[Translation missing --]]
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "tried to show value for alias \"%s\" but undefined in module.Aliases!",
		--[[Translation missing --]]
		["unalias"] = "unalias",
		--[[Translation missing --]]
		["verbose"] = "verbose",
		--[[Translation missing --]]
		["warnUser() called with nil argument!"] = "warnUser() called with nil argument!",
		--[[Translation missing --]]
		["warnUser() called with zero length string!"] = "warnUser() called with zero length string!",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = " - список всех псевдонимов; источник <keyword> для поиска псевдонимов (команда: /listallaliases)",
		["%s() called with blank string!"] = "Функция %s() вызвана с пустой строкой!",
		["%s() called with nil argument!"] = "Функция %s() вызвана с нулевым аргументом!",
		["/%s aliased to \"/%s\""] = "/%s теперь псевдоним на \"/%s\"",
		["/%s aliased to: /%s"] = "/%s теперь псевдоним: /%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - удалить все псевдонимы <alias> (cmd псевдонимы: /delalias, /remalias)",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<command>[ <value>] - псевдоним <command> будет исполняться как <value>, или возвращать значение value в качестве определённого в настоящий момент значения для <command>. Например: \"/alias /examplehello /say всем привет\" - набрав \"/examplehello\" ваш персонаж скажет \"всем привет\"; \"/alias examplehello\" - \"/examplehello is aliased to /say всем привет\" (cmd aliases: /addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<keyword> - найти все псевдонимы, совпадающие с <keyword> (команда: /findalias)",
		["add"] = "добавить",
		["add an alias"] = "добавить псевдоним",
		["alias \"/%s\" does not exist"] = "псевдонима \"/%s\" не существует",
		["dealiasing command /%s to /%s"] = "раскрытие псевдонима /%s в /%s",
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "удаление псевдонима \"/%s\" (перед этим назывался как \"/%s\")",
		["Display extra information in the chat frame when commands are dealiased"] = "Отображать дополнительную информацию в рамке чата при раскрытии псевдонимов команд",
		["Don't overwrite existing aliases when using /addalias"] = "Не перезаписывать существующие псевдонимы при использовани /addalias",
		["Expand aliases as you are typing"] = "Раскрыть псевдонимы, которые вы вводили",
		["find aliases matching a given search term"] = "найти псевдонимы соответствующие критериям поиска",
		["findaliases"] = true,
		["infinite loop detected for alias /%s - ignoring"] = "обнаружен бесконечный цикл при раскрытии псевдонима /%s - игнорируется",
		["inline"] = "на линии",
		["list all aliases"] = "список всех псевдонимов",
		["listaliases"] = "вывести список псевдонимов",
		["matching aliases found: %d"] = "совпавших псевдонимов найдено: %d",
		["module_desc"] = "Добовляет команду /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
		["module_name"] = "Псевдонимы",
		["No aliases have been defined"] = "Псевдонимов не обнаружено",
		["noclobber"] = "защита настроек",
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "защита настроек - пропускаем новый псевдоним:  /%s уже задано как /%s",
		["Options"] = "Настройки",
		["Options for altering the behaviour of Alias"] = "Опции для изменения поведения Псевдонимов",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "перезапись сужествующего псевдонима \"/%s\" (теперь псевдоним \"/%s\")",
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "отказ псевдониму \"/%s\" в чём-либо, чтобы не испортить ВСЁ",
		["remove an alias"] = "убрать псевдоним",
		["There is no alias current defined for \"%s\""] = "Нет псевдонимов для \"%s\"",
		["total aliases: %d"] = "всего псевдонимов: %d",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "\"%s\" не определено в модуле \"Псевдонимы\" при попытке показать значение!",
		["unalias"] = "удалить псевдоним",
		["verbose"] = "подробно",
		["warnUser() called with nil argument!"] = "Функция warnUser() вызвана с нулевым аргументом!",
		["warnUser() called with zero length string!"] = "Функция warnUser() вызвана со строкой нулевой длины!",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = "-列出全部替换词;支持<关键字>搜索匹配的替换词(替换词命令:/listallaliases)",
		["%s() called with blank string!"] = "%s()为空白字符!",
		["%s() called with nil argument!"] = "%s()不能为空!",
		["/%s aliased to \"/%s\""] = "/%s替换为\"/%s\"",
		["/%s aliased to: /%s"] = "/%s替换为:/%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - 移除替换词<alias> (命令: /delalias, /remalias)",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<命令>[<值>] - 替换词<命令>被实现为<值>，如果<命令>没有被定义一个值,就为<命令>返回当前确定了值的替换词.例: \"/alias /好 /s 你好啊\" - 键入\"/好\"就会马上让你的角色去说\"你好啊\";\"/alias 好\"是\"/好 去替换/s 你好啊\"(替换词命令:/addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<关键字> - 寻找所有匹配<关键字>的替换词(命令: /findalias)",
		["add"] = "添加",
		["add an alias"] = "添加一个替换词",
		["alias \"/%s\" does not exist"] = "替换词\"/%s\"不存在",
		["dealiasing command /%s to /%s"] = "/%s到/%s非替换词命令",
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "删除替换词\"/%s\"(先前被命名为\"/%s\")",
		["Display extra information in the chat frame when commands are dealiased"] = "当命令取消替换名时在聊天框显示额外信息",
		["Don't overwrite existing aliases when using /addalias"] = "使用/addalias时不能覆盖一个已存在的替换词",
		["Expand aliases as you are typing"] = "输入时展开替换词",
		["find aliases matching a given search term"] = "寻找匹配替换词的特定搜索字词",
		["findaliases"] = "寻找替换词",
		["infinite loop detected for alias /%s - ignoring"] = "死循环替换名/%s - 忽略",
		["inline"] = "内联",
		["list all aliases"] = "列出全部替换词",
		["listaliases"] = "替换词一览表",
		["matching aliases found: %d"] = "发现匹配替换词:%d",
		["module_desc"] = "添加命令/alias,用Unix alias command类似的方法替换来消减命令",
		["module_name"] = "替换词",
		["No aliases have been defined"] = "无替换名被定义",
		["noclobber"] = "无冲突",
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "无冲突设置-跳过新的替换词:/%s已经扩展到/%s",
		["Options"] = "选项",
		["Options for altering the behaviour of Alias"] = "变更替换词状况的选项",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "覆盖现有替换词\"/%s\"(替换为\"/%s\")",
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "拒绝替换词\"/%s\"的任何权利以不破坏重要的东西",
		["remove an alias"] = "移除一个替换词",
		["There is no alias current defined for \"%s\""] = "无任何替换词目前定义为\"%s\"",
		["total aliases: %d"] = "替换词总数:%d",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "模块未定义试图显示的替换词的值\"%s\".替换词!",
		["unalias"] = "无替换词",
		["verbose"] = "详细",
		["warnUser() called with nil argument!"] = "您注意()为无效参数!",
		["warnUser() called with zero length string!"] = "您注意()为零长度字符串!",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = " - lista todos los alias; proporciona una <palabra clave> para buscar alias coincidentes (cmd alias: /listallaliases)",
		["%s() called with blank string!"] = "%s() llamado con cadena vacía! ",
		["%s() called with nil argument!"] = "%s() llamado con argumento nulo! ",
		["/%s aliased to \"/%s\""] = "/%s alias de \"/%s\"",
		["/%s aliased to: /%s"] = "/%s alias de: /%s",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - eliminar el <alias> (cmd alias: /delalias, /remalias",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<comando> [<valor>] - alias <comando> a ejecutarse como <valor> o devolver el valor del alias definido actualmente para <comando> si <comando> no se ha asignado un valor. p.ej.: \"/alias /ejemplohola /decir hola allí\" - tecleando \"/ejemplohola\" hará que su carácter diga \"hola allí\"; \"/alias ejemplohola\" -s \"/ejemplohola es alias de /decir hola allí\" (cmd alias: /addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<palabra clave> - encontrar todos los alias coincidentes con <palabra clave> (cmd alias: /findalias",
		["add"] = "Añadir",
		["add an alias"] = "Añadir un alias",
		["alias \"/%s\" does not exist"] = "El alias \"/%s\" no existe",
		--[[Translation missing --]]
		["dealiasing command /%s to /%s"] = "dealiasing command /%s to /%s",
		--[[Translation missing --]]
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "deleting alias \"/%s\" (previously aliased as \"/%s\")",
		["Display extra information in the chat frame when commands are dealiased"] = "Muestra información extra en el marco de chat cuando los comandos no tienen alias",
		["Don't overwrite existing aliases when using /addalias"] = "No sobreescribir alias existentes usando /addalias",
		["Expand aliases as you are typing"] = "Expandir alias mientras tecleas",
		["find aliases matching a given search term"] = "encontrar alias que coinciden con un término de búsqueda dado",
		["findaliases"] = "encontraralias",
		["infinite loop detected for alias /%s - ignoring"] = "bucle infinito detectado por el alias /%s - ignorando",
		["inline"] = "en línea",
		["list all aliases"] = "Lista de todos los alias",
		["listaliases"] = "listaralias",
		["matching aliases found: %d"] = "alias coincidentes encontrados: %d",
		["module_desc"] = "Agrega el comando /alias, que puede utilizarse para comandos de la barra de alias de una manera similar a la orden de alias de UNIX.",
		["module_name"] = "Alias",
		["No aliases have been defined"] = "Ningún alias ha sido definido",
		--[[Translation missing --]]
		["noclobber"] = "noclobber",
		--[[Translation missing --]]
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "noclobber set - skipping new alias: /%s already expands to /%s",
		["Options"] = "Opciones",
		["Options for altering the behaviour of Alias"] = "Opciones para alterar el comportamiento de Alias",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "sobrescribiendo alias existente \"/%s\" (era alias de \"/%s\")",
		--[[Translation missing --]]
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up",
		["remove an alias"] = "Eliminar un alias",
		["There is no alias current defined for \"%s\""] = "No hay ningún alias definido para \"%s\"",
		["total aliases: %d"] = "total alias: %d",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "se ha intentado mostrar un valor para el alias \"%s\" pero no está definido en el módulo. ¡Crea un Alias!",
		["unalias"] = "sin alias",
		["verbose"] = "detallado",
		["warnUser() called with nil argument!"] = "warnUser() llamado con argumento nulo!",
		["warnUser() called with zero length string!"] = "warnUser() llamado con cadena de longitud cero!",
	}
}

PL:AddLocale(PRAT_MODULE, "esES", L)




L = {
	["Alias"] = {
		[" - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)"] = "- 列出所有別稱；提供 <keyword> 以搜尋所需的別稱（別稱指令：/listallaliases）",
		["%s() called with blank string!"] = "%s() 為空白字串！",
		["%s() called with nil argument!"] = "%s() 為無效參數！",
		["/%s aliased to \"/%s\""] = "/%s 別稱連結至 \"/%s\"",
		["/%s aliased to: /%s"] = "/%s 別稱連結至 \"/%s\"",
		["<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)"] = "<alias> - 移除別稱 <alias>（別稱指令： /delalias，/remalias)",
		["<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: \"/alias /examplehello /say hello there\" - typing \"/examplehello\" will now cause your character to say \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)"] = "<command>[ <value>] - 以代稱指令 <command> 來執行指令 <value>, 或當 <command> 後方沒有指定指令時通報目前設定給<command>之指定指令。 例如 \"/alias /examplehello /說 打招呼\" - 輸入 \"/examplehello\" 將使你的角色說 \"hello there\"; \"/alias examplehello\" - s \"/examplehello is aliased to /say hello there\" (cmd aliases: /addalias)",
		["<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)"] = "<keyword> - 搜尋所有符合<keyword>的別稱（別稱指令： /findalias）",
		["add"] = "新增",
		["add an alias"] = "新增別稱",
		["alias \"/%s\" does not exist"] = "別稱 \"/%s\" 不存在",
		["dealiasing command /%s to /%s"] = "別稱的指令範圍/%s到/%s",
		["deleting alias \"/%s\" (previously aliased as \"/%s\")"] = "刪除別稱 \"/%s\"（先前別稱為 \"/%s\"）",
		["Display extra information in the chat frame when commands are dealiased"] = "當候選字的指令執行時在聊天視窗中顯示額外的訊息",
		["Don't overwrite existing aliases when using /addalias"] = "當使用 /addalias 禁止複寫已存在別稱",
		["Expand aliases as you are typing"] = "輸入文字時提示別稱",
		["find aliases matching a given search term"] = "搜尋與特定搜尋條件相符合之別稱",
		["findaliases"] = "搜尋別稱",
		["infinite loop detected for alias /%s - ignoring"] = "無限循環檢測別稱 /%s - 忽視",
		["inline"] = "內建",
		["list all aliases"] = "列出所有別稱",
		["listaliases"] = "列出別稱",
		["matching aliases found: %d"] = "相符合別稱: %d",
		["module_desc"] = "新增命令 /alias，其可將被使用於快捷指令如同 Unix系統中別稱指令。",
		["module_name"] = "別稱",
		["No aliases have been defined"] = "尚未定義任何別稱",
		["noclobber"] = "禁止複寫",
		["noclobber set - skipping new alias: /%s already expands to /%s"] = "禁止複寫設定 - 跳過新別稱：/%s 已擴充至 /%s",
		["Options"] = "選項",
		["Options for altering the behaviour of Alias"] = "修改別稱執行狀態選項",
		["overwriting existing alias \"/%s\" (was aliased to \"/%s\")"] = "複寫已存在別稱 \"/%s\"（為 \"/%s\" 之別稱）",
		--[[Translation missing --]]
		["refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up"] = "refusing to alias \"/%s\" to anything in the interests of Not Buggering Everything Up",
		["remove an alias"] = "移除別稱",
		["There is no alias current defined for \"%s\""] = "\"%s\" 尚未定義至任何別稱",
		["total aliases: %d"] = "總計別稱：%d",
		["tried to show value for alias \"%s\" but undefined in module.Aliases!"] = "試圖顯示縮寫指令\"%s\"的結果，但在module.Aliases中並未定義!",
		["unalias"] = "無別稱",
		["verbose"] = "詳細",
		["warnUser() called with nil argument!"] = "warnUser() 為無效參數！",
		["warnUser() called with zero length string!"] = "warnUser() 為零字元字串！",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW", L)


end
--@end-non-debug@



  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
      aliases = {},
      verbose = false,
      inline = false,
      noclobber = false,

      -- things we won't alias
      wontalias = {
        unalias = 1,
        alias = 1,
        prat = 1,
        script = 1,
        run = 1,
        ace = 1,
        ace2 = 1,
        listaliases = 1,
        quit = 1,
        reload = 1,
        rl = 1,
      },
    }
  })


  Prat:SetModuleOptions(module, {
    name = PL["module_name"],
    desc = PL["module_desc"],
    type = "group",
    args = {
      add = {
        type = "input",
        name = PL["add"],
        desc = PL["add an alias"],
        --				usage	= PL['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'],

        get = false,
        set = function(info, argstr) return info.handler:setAlias(argstr) end,
        order = 210,
      },
      del = {
        name = PL["unalias"],
        desc = PL["remove an alias"],
        type = "select",
        --				usage	= PL['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'],
        values = function(info) return info.handler.db.profile.aliases end,
        set = function(info, aliastoremove) return info.handler:delAlias(aliastoremove) end,
        order = 220,
        disabled = function(info) return info.handler:NumAliases() == 0 end
      },
      find = {
        name = PL["findaliases"],
        desc = PL["find aliases matching a given search term"],
        type = 'input',
        set = function(info, q) return info.handler:listAliases(q) end,
        get = false,
        --				usage	= PL['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'],
        order = 230,
      },
      list = {
        name = PL["listaliases"],
        desc = PL["list all aliases"],
        type = 'execute',
        func = function(info) info.handler:listAliases() end,
        --				usage	= PL[' - list all aliases; suPLy <keyword> to search for matching aliases (cmd aliases: /listallaliases)'],
        order = 240,
      },
      blankheader = {
        name = "",
        order = 499,
        type = 'header',
      },
      --[[ OPTIONS ]] --
      optionsheader = {
        name = PL["Options"],
        desc = PL["Options for altering the behaviour of Alias"],
        type = 'header',
        order = 500,
      },
      inline = {
        name = PL['inline'],
        desc = PL['Expand aliases as you are typing'],
        type = 'toggle',
        order = 510,
      },
      noclobber = {
        name = PL['noclobber'],
        desc = PL["Don't overwrite existing aliases when using /addalias"],
        type = 'toggle',
        order = 520,
      },
      verbose = {
        name = PL['verbose'],
        desc = PL['Display extra information in the chat frame when commands are dealiased'],
        type = 'toggle',
        order = 530,
      },
    }
  })

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
  ------------------------------------------------]] --

  function module:splitAliasArgs(str)
    -- str should be "<command>[=value| value]"
    local name, value
    local args = {
      name = "",
      value = "",
    }

    -- if it doesn't match, args is left with default blank strings for values
    --for alias, command in str:find("(%w+)%s*=?%s*(.-)%s*$") do
    for alias, command in str:gmatch("/?(%w+)%s*[%s=]%s*/?(.-)$") do
      -- either matches both alias and command (may match command as a blank string)
      args['name'] = string.lower(alias)
      args['value'] = command or ""
      -- util:print('name ' .. args['name'])
      -- util:print('value ' .. args['value'])
    end

    return args
  end

  function module:checkArgStr(funcname, argstr)
    if argstr == nil then
      self:warnUser(string.format(PL["%s() called with nil argument!"], funcname))
      return false
    end

    if argstr == "" then
      self:warnUser(string.format(PL["%s() called with blank string!"], funcname))
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
      self:warnUser(string.format(PL['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'], clralias(alias['name'])))
      return false
    elseif self.db.profile.noclobber and self.Aliases[string.lower(alias['name'])] then
      self:warnUser(string.format(PL['noclobber set - skipping new alias: /%s already expands to /%s'], clralias(alias['name']), clrexpansion(alias['value'])))
      return false
    else
      -- it's not listed as bad, so create or update the aliases tables
      -- called as /alias <command> <value> - define alias <command> as <value>
      if self.Aliases[alias['name']] then
        -- specified alias already exists, warn user and print old setting
        self:warnUser(string.format(PL['overwriting existing alias "/%s" (was aliased to "/%s")'], clralias(alias['name']), clrexpansion(self.Aliases[alias['name']])))
      end

      -- now (re?)define the alias <command> to <value>
      self.Aliases[alias['name']] = alias['value']
      self.db.profile.aliases[alias['name']] = alias['value']

      table.sort(self.db.profile.aliases)
      table.sort(self.Aliases)

      LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")

      self:warnUser(string.format(PL["/%s aliased to: /%s"], clralias(alias['name']), clrexpansion(alias['value'])))
    end
  end

  function module:delAlias(aliasname)
    if not self:checkArgStr('delAlias', aliasname) then
      return false
    end

    -- remove unecessary /s at the beginning of the alias name
    aliasname = aliasname:gsub('^/*', '')

    if not self.Aliases[aliasname] then
      self:warnUser(string.format(PL['alias "/%s" does not exist'], clralias(aliasname)))
      return false
    end

    local oldalias = self.Aliases[aliasname]

    self:warnUser(string.format(PL['deleting alias "/%s" (previously aliased as "/%s")'], clralias(aliasname), clrexpansion(oldalias)))

    self.Aliases[aliasname] = nil
    self.db.profile.aliases[aliasname] = nil

    LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")

    return oldalias
  end

  function module:showAlias(aliasname)
    if not self:checkArgStr('showAlias', aliasname) then
      return false
    end

    -- check for undefined alias called aliasname
    if not self.Aliases[aliasname] then
      self:warnUser(string.format(PL['tried to show value for alias "%s" but undefined in module.Aliases!'], clralias(aliasname)))
      return false
    end

    -- everything OK; display value of alias "aliasname"
    self:warnUser(string.format(PL['/%s aliased to "/%s"'], clralias(aliasname), clrexpansion(self.Aliases[aliasname])))

    return true
  end

  function module:listAliases(q)
    if self.Aliases == {} then
      self:warnUser(PL["No aliases have been defined"])
      return false
    end

    local msg
    local count = 0

    table.sort(self.Aliases)

    for name, alias in pairs(self.Aliases) do
      if not q or (name:match(q)) then
        self:showAlias(name)
        count = count + 1
      end
    end

    if q then
      msg = PL['matching aliases found: %d']
    else
      msg = PL['total aliases: %d']
    end

    self:tellUser(string.format(msg, count))
  end


  function module:reportUndefinedAlias(name)
    return self:warnUser(string.format(PL['There is no alias current defined for "%s"'], clralias(name)))
  end

  function module:tellUser(str)
    return module:warnUser(str)
  end

  function module:NumAliases()
    local n = 0
    for name, alias in pairs(self.Aliases) do
      n = n + 1
    end
    return n
  end

  function module:warnUser(str)
    if str == nil then
      str = PL["warnUser() called with nil argument!"]
    elseif str == "" then
      str = PL["warnUser() called with zero length string!"]
    end

    Prat:Print(string.format("%s: %s", clrmodname(self.moduleName), str))

    return true
  end


  local fake = {}

  function module:ChatEdit_HandleChatType(editBox, msg, command, send, dealiased)
    dbg(msg, command, send, dealiased)
    local command = command or ""
    local alias = self.Aliases[string.lower(strsub(command, 2))]
    Prat.SplitMessageOut.DEALIASED = Prat.SplitMessageOut.DEALIASED or {}
    local dealiased = Prat.SplitMessageOut.DEALIASED
    local msg = msg or ""

    if dealiased[command] then
      -- skip commands we've already dealiased
      self:warnUser(string.format(PL['infinite loop detected for alias /%s - ignoring'], clralias(alias)))
    elseif alias and alias ~= "" then
      if (send == 1) and self.db.profile.verbose then
        self:warnUser(string.format(PL['dealiasing command /%s to /%s'], clralias(strsub(command, 2)), clrexpansion(alias)))
        editBox:AddHistoryLine(editBox:GetText())
      end

      dealiased[command] = true
      alias = Prat.ReplaceMatches(alias, 'OUTBOUND')

      local newcmd = strmatch(alias, "^/*([^%s]+)") or ""
      local premsg = strsub(alias, strlen(newcmd) + 2) or ""

      if premsg ~= "" then
        msg = premsg .. ' ' .. msg
      end

      command = '/' .. string.upper(newcmd) -- this needs to be upper
      local text = string.lower(command) -- this needs to be lower

      if msg and msg ~= "" then
        fake.MESSAGE = msg

        Prat.Addon:ProcessUserEnteredChat(fake)

        msg = fake.MESSAGE
        text = text .. ' ' .. msg
      end

      dbg(msg, command, send, dealiased, text)

      if (send == 1) then
        editBox:SetText(text)
        dbg("-> ChatEdit_ParseText")
        ChatEdit_ParseText(editBox, send)
        return true
      elseif (self.db.profile.inline) then
        editBox:SetText(text .. ' ')
      end

      --self:ChatEdit_HandleChatType(editBox,  msg, command, send, dealiased)


      return true
    end

    dbg("-> ChatEdit_HandleChatType", msg, command, send)
    return self.hooks["ChatEdit_HandleChatType"](editBox, msg, command, send)
  end


  return
end) -- Prat:AddModuleToLoad
