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
  local PRAT_MODULE = Prat:RequestModuleName("Substitutions")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE)

  -- define localized strings
  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["Substitutions"] = true,
    ["A module to provide basic chat substitutions."] = true,
    ['User defined substitutions'] = true,
    ['Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = true,
    ['Set substitution'] = true,
    ['Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).'] = true,
    ['subname = text after expansion -- NOTE: sub name without the prefix "%"'] = true,
    ['List substitutions'] = true,
    ['Lists all current subtitutions in the default chat frame'] = true,
    ['Delete substitution'] = true,
    ['Deletes a user defined substitution'] = true,
    ['subname -- NOTE: sub name without the prefix \'%\''] = true,
    ['Are you sure?'] = true,
    ['Delete all'] = true,
    ['Deletes all user defined substitutions'] = true,
    ['Are you sure - this will delete all user defined substitutions and reset defaults?'] = true,
    ['List of available substitutions'] = true,
    ['List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)'] = true,
    ["NO MATCHFUNC FOUND"] = true,
    ["current-prompt"] = "Current value: '%s'\nClick to paste into the chat.",
    ['no substitution name given'] = true,
    ['no value given for subtitution "%s"'] = true,
    ['|cffff0000warning:|r subtitution "%s" already defined as "%s", overwriting'] = true,
    ['defined %s: expands to => %s'] = true,
    ['no substitution name suPLied for deletion'] = true,
    ['no user defined subs found'] = true,
    ['user defined substition "%s" not found'] = true,
    ["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = true,
    ["can't find substitution index for a substitution named '%s'"] = true,
    ['removing user defined substitution "%s"; previously expanded to => "%s"'] = true,
    ['substitution: %s defined as => %s'] = true,
    ['%d total user defined substitutions'] = true,
    ['module:buildUserSubsIndex(): warning: module patterns not defined!'] = true,
    ["<notarget>"] = true,
    ["male"] = true,
    ["female"] = true,
    ["unknown sex"] = true,
    ["<noguild>"] = true,
    ["his"] = true,
    ["hers"] = true,
    ["its"] = true,
    ["him"] = true,
    ["her"] = true,
    ["it"] = true,
    ['usersub_'] = true,
    ["TargetHealthDeficit"] = true,
    ["TargetPercentHP"] = true,
    ["TargetPronoun"] = true,
    ["PlayerHP"] = true,
    ["PlayerName"] = true,
    ["PlayerMaxHP"] = true,
    ["PlayerHealthDeficit"] = true,
    ["PlayerPercentHP"] = true,
    ["PlayerCurrentMana"] = true,
    ["PlayerMaxMana"] = true,
    ["PlayerPercentMana"] = true,
    ["PlayerManaDeficit"] = true,
    ["TargetName"] = true,
    ["TargetTargetName"] = true,
    ["MouseoverTargetName"] = true,
    ["TargetClass"] = true,
    ["TargetHealth"] = true,
    ["TargetRace"] = true,
    ["TargetGender"] = true,
    ["TargetLevel"] = true,
    ["TargetPossesive"] = true,
    ["TargetManaDeficit"] = true,
    ["TargetGuild"] = true,
    ["TargetIcon"] = true,
    ["MapZone"] = true,
    ["MapLoc"] = true,
    ["MapPos"] = true,
    ["MapYPos"] = true,
    ["MapXPos"] = true,
    ["RandNum"] = true,
    ["PlayerAverageItemLevel"] = true,
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = true,
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = true,
		["<noguild>"] = true,
		["<notarget>"] = true,
		["A module to provide basic chat substitutions."] = true,
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = true,
		["Are you sure?"] = true,
		["can't find substitution index for a substitution named '%s'"] = true,
		["current-prompt"] = [=[Current value: '%s' 
Click to paste into the chat.]=],
		["defined %s: expands to => %s"] = true,
		["Delete all"] = true,
		["Delete substitution"] = true,
		["Deletes a user defined substitution"] = true,
		["Deletes all user defined substitutions"] = true,
		["female"] = true,
		["her"] = true,
		["hers"] = true,
		["him"] = true,
		["his"] = true,
		["it"] = true,
		["its"] = true,
		["List of available substitutions"] = true,
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = true,
		["List substitutions"] = true,
		["Lists all current subtitutions in the default chat frame"] = true,
		["male"] = true,
		["MapLoc"] = true,
		["MapPos"] = true,
		["MapXPos"] = true,
		["MapYPos"] = true,
		["MapZone"] = true,
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = true,
		["MouseoverTargetName"] = true,
		["NO MATCHFUNC FOUND"] = true,
		["no substitution name given"] = true,
		["no substitution name supplied for deletion"] = true,
		["no user defined subs found"] = true,
		["no value given for subtitution \"%s\""] = true,
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = true,
		["PlayerAverageItemLevel"] = true,
		["PlayerCurrentMana"] = true,
		["PlayerHealthDeficit"] = true,
		["PlayerHP"] = true,
		["PlayerManaDeficit"] = true,
		["PlayerMaxHP"] = true,
		["PlayerMaxMana"] = true,
		["PlayerName"] = true,
		["PlayerPercentHP"] = true,
		["PlayerPercentMana"] = true,
		["RandNum"] = true,
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = true,
		["Set substitution"] = true,
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = true,
		["subname -- NOTE: sub name without the prefix '%'"] = true,
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = true,
		["substitution: %s defined as => %s"] = true,
		["Substitutions"] = true,
		["TargetClass"] = true,
		["TargetGender"] = true,
		["TargetGuild"] = true,
		["TargetHealth"] = true,
		["TargetHealthDeficit"] = true,
		["TargetIcon"] = true,
		["TargetLevel"] = true,
		["TargetManaDeficit"] = true,
		["TargetName"] = true,
		["TargetPercentHP"] = true,
		["TargetPossesive"] = true,
		["TargetPronoun"] = true,
		["TargetRace"] = true,
		["TargetTargetName"] = true,
		["unknown sex"] = true,
		["user defined substition \"%s\" not found"] = true,
		["User defined substitutions"] = true,
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = true,
		["usersub_"] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)

L = {
	["Substitutions"] = {
		--[[Translation missing --]]
		["%d total user defined substitutions"] = "%d total user defined substitutions",
		--[[Translation missing --]]
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting",
		--[[Translation missing --]]
		["<noguild>"] = "<noguild>",
		--[[Translation missing --]]
		["<notarget>"] = "<notarget>",
		--[[Translation missing --]]
		["A module to provide basic chat substitutions."] = "A module to provide basic chat substitutions.",
		--[[Translation missing --]]
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "Are you sure - this will delete all user defined substitutions and reset defaults?",
		--[[Translation missing --]]
		["Are you sure?"] = "Are you sure?",
		--[[Translation missing --]]
		["can't find substitution index for a substitution named '%s'"] = "can't find substitution index for a substitution named '%s'",
		--[[Translation missing --]]
		["current-prompt"] = [=[Current value: '%s' 
Click to paste into the chat.]=],
		--[[Translation missing --]]
		["defined %s: expands to => %s"] = "defined %s: expands to => %s",
		--[[Translation missing --]]
		["Delete all"] = "Delete all",
		--[[Translation missing --]]
		["Delete substitution"] = "Delete substitution",
		--[[Translation missing --]]
		["Deletes a user defined substitution"] = "Deletes a user defined substitution",
		--[[Translation missing --]]
		["Deletes all user defined substitutions"] = "Deletes all user defined substitutions",
		--[[Translation missing --]]
		["female"] = "female",
		--[[Translation missing --]]
		["her"] = "her",
		--[[Translation missing --]]
		["hers"] = "hers",
		--[[Translation missing --]]
		["him"] = "him",
		--[[Translation missing --]]
		["his"] = "his",
		--[[Translation missing --]]
		["it"] = "it",
		--[[Translation missing --]]
		["its"] = "its",
		--[[Translation missing --]]
		["List of available substitutions"] = "List of available substitutions",
		--[[Translation missing --]]
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		--[[Translation missing --]]
		["List substitutions"] = "List substitutions",
		--[[Translation missing --]]
		["Lists all current subtitutions in the default chat frame"] = "Lists all current subtitutions in the default chat frame",
		--[[Translation missing --]]
		["male"] = "male",
		--[[Translation missing --]]
		["MapLoc"] = "MapLoc",
		--[[Translation missing --]]
		["MapPos"] = "MapPos",
		--[[Translation missing --]]
		["MapXPos"] = "MapXPos",
		--[[Translation missing --]]
		["MapYPos"] = "MapYPos",
		--[[Translation missing --]]
		["MapZone"] = "MapZone",
		--[[Translation missing --]]
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): warning: module patterns not defined!",
		--[[Translation missing --]]
		["MouseoverTargetName"] = "MouseoverTargetName",
		--[[Translation missing --]]
		["NO MATCHFUNC FOUND"] = "NO MATCHFUNC FOUND",
		--[[Translation missing --]]
		["no substitution name given"] = "no substitution name given",
		--[[Translation missing --]]
		["no substitution name supplied for deletion"] = "no substitution name supplied for deletion",
		--[[Translation missing --]]
		["no user defined subs found"] = "no user defined subs found",
		--[[Translation missing --]]
		["no value given for subtitution \"%s\""] = "no value given for subtitution \"%s\"",
		--[[Translation missing --]]
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		--[[Translation missing --]]
		["PlayerAverageItemLevel"] = "PlayerAverageItemLevel",
		--[[Translation missing --]]
		["PlayerCurrentMana"] = "PlayerCurrentMana",
		--[[Translation missing --]]
		["PlayerHealthDeficit"] = "PlayerHealthDeficit",
		--[[Translation missing --]]
		["PlayerHP"] = "PlayerHP",
		--[[Translation missing --]]
		["PlayerManaDeficit"] = "PlayerManaDeficit",
		--[[Translation missing --]]
		["PlayerMaxHP"] = "PlayerMaxHP",
		--[[Translation missing --]]
		["PlayerMaxMana"] = "PlayerMaxMana",
		--[[Translation missing --]]
		["PlayerName"] = "PlayerName",
		--[[Translation missing --]]
		["PlayerPercentHP"] = "PlayerPercentHP",
		--[[Translation missing --]]
		["PlayerPercentMana"] = "PlayerPercentMana",
		--[[Translation missing --]]
		["RandNum"] = "RandNum",
		--[[Translation missing --]]
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "removing user defined substitution \"%s\"; previously expanded to => \"%s\"",
		--[[Translation missing --]]
		["Set substitution"] = "Set substitution",
		--[[Translation missing --]]
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).",
		--[[Translation missing --]]
		["subname -- NOTE: sub name without the prefix '%'"] = "subname -- NOTE: sub name without the prefix '%'",
		--[[Translation missing --]]
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subname = text after expansion -- NOTE: sub name without the prefix \"%\"",
		--[[Translation missing --]]
		["substitution: %s defined as => %s"] = "substitution: %s defined as => %s",
		--[[Translation missing --]]
		["Substitutions"] = "Substitutions",
		--[[Translation missing --]]
		["TargetClass"] = "TargetClass",
		--[[Translation missing --]]
		["TargetGender"] = "TargetGender",
		--[[Translation missing --]]
		["TargetGuild"] = "TargetGuild",
		--[[Translation missing --]]
		["TargetHealth"] = "TargetHealth",
		--[[Translation missing --]]
		["TargetHealthDeficit"] = "TargetHealthDeficit",
		--[[Translation missing --]]
		["TargetIcon"] = "TargetIcon",
		--[[Translation missing --]]
		["TargetLevel"] = "TargetLevel",
		--[[Translation missing --]]
		["TargetManaDeficit"] = "TargetManaDeficit",
		--[[Translation missing --]]
		["TargetName"] = "TargetName",
		--[[Translation missing --]]
		["TargetPercentHP"] = "TargetPercentHP",
		--[[Translation missing --]]
		["TargetPossesive"] = "TargetPossesive",
		--[[Translation missing --]]
		["TargetPronoun"] = "TargetPronoun",
		--[[Translation missing --]]
		["TargetRace"] = "TargetRace",
		--[[Translation missing --]]
		["TargetTargetName"] = "TargetTargetName",
		--[[Translation missing --]]
		["unknown sex"] = "unknown sex",
		--[[Translation missing --]]
		["user defined substition \"%s\" not found"] = "user defined substition \"%s\" not found",
		--[[Translation missing --]]
		["User defined substitutions"] = "User defined substitutions",
		--[[Translation missing --]]
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "user substitutions index (usersubs_idx) doesn't exist! oh dear.",
		--[[Translation missing --]]
		["usersub_"] = "usersub_",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "%d substituições definidas pelo usuário",
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000warning:|r substituindo. \"%s\" já definido como\"%s\", sobrescrevendo",
		--[[Translation missing --]]
		["<noguild>"] = "<noguild>",
		--[[Translation missing --]]
		["<notarget>"] = "<notarget>",
		--[[Translation missing --]]
		["A module to provide basic chat substitutions."] = "A module to provide basic chat substitutions.",
		--[[Translation missing --]]
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "Are you sure - this will delete all user defined substitutions and reset defaults?",
		--[[Translation missing --]]
		["Are you sure?"] = "Are you sure?",
		--[[Translation missing --]]
		["can't find substitution index for a substitution named '%s'"] = "can't find substitution index for a substitution named '%s'",
		--[[Translation missing --]]
		["current-prompt"] = [=[Current value: '%s' 
Click to paste into the chat.]=],
		--[[Translation missing --]]
		["defined %s: expands to => %s"] = "defined %s: expands to => %s",
		--[[Translation missing --]]
		["Delete all"] = "Delete all",
		--[[Translation missing --]]
		["Delete substitution"] = "Delete substitution",
		--[[Translation missing --]]
		["Deletes a user defined substitution"] = "Deletes a user defined substitution",
		--[[Translation missing --]]
		["Deletes all user defined substitutions"] = "Deletes all user defined substitutions",
		--[[Translation missing --]]
		["female"] = "female",
		--[[Translation missing --]]
		["her"] = "her",
		--[[Translation missing --]]
		["hers"] = "hers",
		--[[Translation missing --]]
		["him"] = "him",
		--[[Translation missing --]]
		["his"] = "his",
		--[[Translation missing --]]
		["it"] = "it",
		--[[Translation missing --]]
		["its"] = "its",
		--[[Translation missing --]]
		["List of available substitutions"] = "List of available substitutions",
		--[[Translation missing --]]
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		--[[Translation missing --]]
		["List substitutions"] = "List substitutions",
		--[[Translation missing --]]
		["Lists all current subtitutions in the default chat frame"] = "Lists all current subtitutions in the default chat frame",
		--[[Translation missing --]]
		["male"] = "male",
		--[[Translation missing --]]
		["MapLoc"] = "MapLoc",
		--[[Translation missing --]]
		["MapPos"] = "MapPos",
		--[[Translation missing --]]
		["MapXPos"] = "MapXPos",
		--[[Translation missing --]]
		["MapYPos"] = "MapYPos",
		--[[Translation missing --]]
		["MapZone"] = "MapZone",
		--[[Translation missing --]]
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): warning: module patterns not defined!",
		--[[Translation missing --]]
		["MouseoverTargetName"] = "MouseoverTargetName",
		--[[Translation missing --]]
		["NO MATCHFUNC FOUND"] = "NO MATCHFUNC FOUND",
		--[[Translation missing --]]
		["no substitution name given"] = "no substitution name given",
		--[[Translation missing --]]
		["no substitution name supplied for deletion"] = "no substitution name supplied for deletion",
		--[[Translation missing --]]
		["no user defined subs found"] = "no user defined subs found",
		--[[Translation missing --]]
		["no value given for subtitution \"%s\""] = "no value given for subtitution \"%s\"",
		--[[Translation missing --]]
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		--[[Translation missing --]]
		["PlayerAverageItemLevel"] = "PlayerAverageItemLevel",
		--[[Translation missing --]]
		["PlayerCurrentMana"] = "PlayerCurrentMana",
		--[[Translation missing --]]
		["PlayerHealthDeficit"] = "PlayerHealthDeficit",
		--[[Translation missing --]]
		["PlayerHP"] = "PlayerHP",
		--[[Translation missing --]]
		["PlayerManaDeficit"] = "PlayerManaDeficit",
		--[[Translation missing --]]
		["PlayerMaxHP"] = "PlayerMaxHP",
		--[[Translation missing --]]
		["PlayerMaxMana"] = "PlayerMaxMana",
		--[[Translation missing --]]
		["PlayerName"] = "PlayerName",
		--[[Translation missing --]]
		["PlayerPercentHP"] = "PlayerPercentHP",
		--[[Translation missing --]]
		["PlayerPercentMana"] = "PlayerPercentMana",
		--[[Translation missing --]]
		["RandNum"] = "RandNum",
		--[[Translation missing --]]
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "removing user defined substitution \"%s\"; previously expanded to => \"%s\"",
		--[[Translation missing --]]
		["Set substitution"] = "Set substitution",
		--[[Translation missing --]]
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).",
		--[[Translation missing --]]
		["subname -- NOTE: sub name without the prefix '%'"] = "subname -- NOTE: sub name without the prefix '%'",
		--[[Translation missing --]]
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subname = text after expansion -- NOTE: sub name without the prefix \"%\"",
		--[[Translation missing --]]
		["substitution: %s defined as => %s"] = "substitution: %s defined as => %s",
		--[[Translation missing --]]
		["Substitutions"] = "Substitutions",
		--[[Translation missing --]]
		["TargetClass"] = "TargetClass",
		--[[Translation missing --]]
		["TargetGender"] = "TargetGender",
		--[[Translation missing --]]
		["TargetGuild"] = "TargetGuild",
		--[[Translation missing --]]
		["TargetHealth"] = "TargetHealth",
		--[[Translation missing --]]
		["TargetHealthDeficit"] = "TargetHealthDeficit",
		--[[Translation missing --]]
		["TargetIcon"] = "TargetIcon",
		--[[Translation missing --]]
		["TargetLevel"] = "TargetLevel",
		--[[Translation missing --]]
		["TargetManaDeficit"] = "TargetManaDeficit",
		--[[Translation missing --]]
		["TargetName"] = "TargetName",
		--[[Translation missing --]]
		["TargetPercentHP"] = "TargetPercentHP",
		--[[Translation missing --]]
		["TargetPossesive"] = "TargetPossesive",
		--[[Translation missing --]]
		["TargetPronoun"] = "TargetPronoun",
		--[[Translation missing --]]
		["TargetRace"] = "TargetRace",
		--[[Translation missing --]]
		["TargetTargetName"] = "TargetTargetName",
		--[[Translation missing --]]
		["unknown sex"] = "unknown sex",
		--[[Translation missing --]]
		["user defined substition \"%s\" not found"] = "user defined substition \"%s\" not found",
		["User defined substitutions"] = "Substituições definidas pelo usuário",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "índice de substituição do úsuario (usersubs_idx) não existe! Oh não!",
		["usersub_"] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "%s substitutions personnalisées totales",
		--[[Translation missing --]]
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting",
		["<noguild>"] = "<pas de guilde>",
		["<notarget>"] = "<pas de cible>",
		["A module to provide basic chat substitutions."] = "Un module qui propose quelques substitutions basiques.",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "Etes-vous sûr ? Cela supprimera toutes les substitutions personnalisées et réinitialisera les valeurs par défaut.",
		["Are you sure?"] = "Êtes-vous sûr ?",
		--[[Translation missing --]]
		["can't find substitution index for a substitution named '%s'"] = "can't find substitution index for a substitution named '%s'",
		["current-prompt"] = [=[Valeur actuelle : '%s'
Cliquez pour coller dans le chat.]=],
		--[[Translation missing --]]
		["defined %s: expands to => %s"] = "defined %s: expands to => %s",
		["Delete all"] = "Tout supprimer",
		["Delete substitution"] = "Supprimer la substitution",
		["Deletes a user defined substitution"] = "Supprime une substitution personnalisée",
		["Deletes all user defined substitutions"] = "Supprime toutes les substitutions personnalisées",
		["female"] = "femme",
		--[[Translation missing --]]
		["her"] = "her",
		--[[Translation missing --]]
		["hers"] = "hers",
		--[[Translation missing --]]
		["him"] = "him",
		--[[Translation missing --]]
		["his"] = "his",
		--[[Translation missing --]]
		["it"] = "it",
		--[[Translation missing --]]
		["its"] = "its",
		["List of available substitutions"] = "Liste des substitution disponibles",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Liste toutes les substitutions disponibles définies par ce module. (NB: l'utilisateur peut définir des valeurs personnalisées pour les substitutions existantes, mais celles-ci seront remisent à leurs valeurs par défaut si les options sont réinitialisées.)",
		["List substitutions"] = "Liste des substitutions",
		["Lists all current subtitutions in the default chat frame"] = "Liste toutes les substitutions dans la fenêtre de discussion",
		--[[Translation missing --]]
		["male"] = "male",
		["MapLoc"] = "Localisation",
		["MapPos"] = "Position",
		["MapXPos"] = "Position X",
		["MapYPos"] = "Position Y",
		["MapZone"] = "Zone",
		--[[Translation missing --]]
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): warning: module patterns not defined!",
		--[[Translation missing --]]
		["MouseoverTargetName"] = "MouseoverTargetName",
		["NO MATCHFUNC FOUND"] = "PAS DE FONCTION ASSOCIÉE TROUVÉE",
		--[[Translation missing --]]
		["no substitution name given"] = "no substitution name given",
		--[[Translation missing --]]
		["no substitution name supplied for deletion"] = "no substitution name supplied for deletion",
		--[[Translation missing --]]
		["no user defined subs found"] = "no user defined subs found",
		--[[Translation missing --]]
		["no value given for subtitution \"%s\""] = "no value given for subtitution \"%s\"",
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Options pour ajouter ou enlever les substitutions définies par l'utilisateur. (NB: les utilisateurs peuvent changer la valeur des substitutions existantes, mais elles seront remisent à leur valeur par défaut si les préférences de l'utilisateur sont supprimés.)",
		--[[Translation missing --]]
		["PlayerAverageItemLevel"] = "PlayerAverageItemLevel",
		["PlayerCurrentMana"] = "Mana actuelle",
		["PlayerHealthDeficit"] = "Déficit de vie",
		["PlayerHP"] = "HP actuel",
		["PlayerManaDeficit"] = "Déficit de mana",
		["PlayerMaxHP"] = "HP Max",
		["PlayerMaxMana"] = "Mana Max",
		["PlayerName"] = "Nom joueur",
		["PlayerPercentHP"] = "Pourcentage HP",
		["PlayerPercentMana"] = "Pourcentage Mana",
		["RandNum"] = "Nombre aléatoire",
		--[[Translation missing --]]
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "removing user defined substitution \"%s\"; previously expanded to => \"%s\"",
		["Set substitution"] = "Paramétrer une substitution",
		--[[Translation missing --]]
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).",
		--[[Translation missing --]]
		["subname -- NOTE: sub name without the prefix '%'"] = "subname -- NOTE: sub name without the prefix '%'",
		--[[Translation missing --]]
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subname = text after expansion -- NOTE: sub name without the prefix \"%\"",
		--[[Translation missing --]]
		["substitution: %s defined as => %s"] = "substitution: %s defined as => %s",
		["Substitutions"] = true,
		["TargetClass"] = "Cible Classe",
		["TargetGender"] = "Cible Sexe",
		["TargetGuild"] = "Cible Guilde",
		["TargetHealth"] = "Santé Cible",
		["TargetHealthDeficit"] = "Déficit Vie Cible",
		["TargetIcon"] = "CibleIcone",
		["TargetLevel"] = "CibleNiveau",
		["TargetManaDeficit"] = "CibleManqueDeMana",
		--[[Translation missing --]]
		["TargetName"] = "TargetName",
		--[[Translation missing --]]
		["TargetPercentHP"] = "TargetPercentHP",
		--[[Translation missing --]]
		["TargetPossesive"] = "TargetPossesive",
		--[[Translation missing --]]
		["TargetPronoun"] = "TargetPronoun",
		--[[Translation missing --]]
		["TargetRace"] = "TargetRace",
		--[[Translation missing --]]
		["TargetTargetName"] = "TargetTargetName",
		["unknown sex"] = "sexe inconnue",
		--[[Translation missing --]]
		["user defined substition \"%s\" not found"] = "user defined substition \"%s\" not found",
		--[[Translation missing --]]
		["User defined substitutions"] = "User defined substitutions",
		--[[Translation missing --]]
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "user substitutions index (usersubs_idx) doesn't exist! oh dear.",
		--[[Translation missing --]]
		["usersub_"] = "usersub_",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "%d Benutzerdefinierte Ersetzungen insgesamt",
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000Warnung:|r Ersetzung \"%s\" wurde bereits definiert als \"%s\", überschreibe",
		["<noguild>"] = " <keinegilde>",
		["<notarget>"] = "<keinziel>",
		["A module to provide basic chat substitutions."] = "Ein Modul zur Bereitstellung grundlegender Chat-Ersetzungen.",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "Bist du sicher - dies wird alle vom Benutzer definierten Ersetzungen löschen und auf Standard zurücksetzen.",
		["Are you sure?"] = "Bist du sicher?",
		["can't find substitution index for a substitution named '%s'"] = "Es kann kein Ersatzindex für eine Ersetzung mit dem Namen '%s' gefunden werden.",
		["current-prompt"] = "Aktueller Wert: '%s' Anklicken, um in den Chat einzufügen.",
		["defined %s: expands to => %s"] = "definiert %s: erweitert zu => %s",
		["Delete all"] = "Alles löschen",
		["Delete substitution"] = "Ersetzung löschen",
		["Deletes a user defined substitution"] = "Löscht eine vom Benutzer definierte Ersetzung",
		["Deletes all user defined substitutions"] = "Löscht alle vom Benutzer definierten Ersetzungen",
		["female"] = "weiblich",
		["her"] = "ihr",
		["hers"] = "ihr/ihre",
		["him"] = "ihn/ihm",
		["his"] = "sein/seine",
		["it"] = "es",
		["its"] = "sein",
		["List of available substitutions"] = "Liste der verfügbaren Ersetzungen",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Die List der verfügbaren Ersetzungen wird von diesem Modul definiert. (NB: Benutzer können gebräuchliche Werte für vorhandene Ersetzungen definieren, aber sie werden auf ihre Standardwerte zurückgesetzt, falls die Definitionen des Benutzers gelöscht wurde.)",
		["List substitutions"] = "Ersetzungen auflisten",
		["Lists all current subtitutions in the default chat frame"] = "Alle gegenwärtigen Ersetzungen im Standard-Chatfenster auflisten.",
		["male"] = "männlich",
		["MapLoc"] = "KarteOrt",
		["MapPos"] = "KartePos",
		["MapXPos"] = "KarteXPos",
		["MapYPos"] = "KarteYPos",
		["MapZone"] = "KarteZone",
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = true,
		["MouseoverTargetName"] = "Maus über Zielnamen fahren",
		["NO MATCHFUNC FOUND"] = "KEINE ÜBEREINSTIMMUNGSFUNKTION GEFUNDEN",
		["no substitution name given"] = "kein Ersetzungsname vergeben",
		["no substitution name supplied for deletion"] = "kein Ersetzungsname für Löschung geliefert",
		["no user defined subs found"] = "keine benutzerdefinierten Ersetzungen gefunden",
		["no value given for subtitution \"%s\""] = "kein Wert für Ersetzung \"%s\" gegeben",
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Optionen zum Einstellen und Entfernen benutzerdefinierter Ersetzungen. (NB: Benutzer können eigeneWerte für vorhandene Ersetzungen definieren, aber diese werden auf ihre Standardwerte zurückgesetzt, wenn die Definition des Benutzers gelöscht wurde.)",
		["PlayerAverageItemLevel"] = "Durchschnittliche Gegenstandsstufe des Spielers",
		["PlayerCurrentMana"] = "SpielerAktuellesMana",
		["PlayerHealthDeficit"] = "Gesundheitsdefizit des Spielers",
		["PlayerHP"] = "SpielerHP",
		["PlayerManaDeficit"] = "SpielerManaDefizit",
		["PlayerMaxHP"] = "SpielerMaxHP",
		["PlayerMaxMana"] = "SpielerMaxMana",
		["PlayerName"] = "Spielername",
		["PlayerPercentHP"] = "SpielerProzentHP",
		["PlayerPercentMana"] = "SpielerProzentMana",
		["RandNum"] = "ZufNum",
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "Benutzerdefinierte Ersetzung \"%s\" wird entfernt; zuvor erweitert zu => \"%s\"",
		["Set substitution"] = "Ersetzung einstellen",
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Den Wert für eine benutzerdefinierte Ersetzung einstellen. (NB: dies kann einer vorhandenen Standardersetzung gleichen; um sie auf Standard zurückzusetzen, einfach die vom Benutzer erschaffene Definition entfernen.)",
		["subname -- NOTE: sub name without the prefix '%'"] = "Subname -- MERKE: Subname ohne den Vorsatz '%'",
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "Subname = Text nach Erweiterung -- MERKE: Subname ohne den Vorsatz \"%\"",
		["substitution: %s defined as => %s"] = "Ersetzung: %s definiert als => %s",
		["Substitutions"] = "Ersetzungen",
		["TargetClass"] = "ZielKlasse",
		["TargetGender"] = "ZielGeschlecht",
		["TargetGuild"] = "ZielGilde",
		["TargetHealth"] = "Zielgesundheit",
		["TargetHealthDeficit"] = "Zielgesundheitsdefizit",
		["TargetIcon"] = "ZielSymbol",
		["TargetLevel"] = "ZielStufe",
		["TargetManaDeficit"] = "ZielManaDefizit",
		["TargetName"] = "ZielName",
		["TargetPercentHP"] = "ZielProzentHP",
		["TargetPossesive"] = "ZielGierig",
		["TargetPronoun"] = "ZielPronomen",
		["TargetRace"] = "ZielVolk",
		["TargetTargetName"] = "ZielZielName",
		["unknown sex"] = "Geschlecht unbekannt",
		["user defined substition \"%s\" not found"] = "Benutzerdefinierte Ersetzung \"%s\" nicht gefunden",
		["User defined substitutions"] = "Benutzerdefinierte Ersetzungen",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "Ersetzungsindex des Benutzers (usersubs_idx) existiert nicht! Oh weh!",
		["usersub_"] = "Benutzerersatz_",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "총 %d개의 사용자 설정 대용어",
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000경고:|r 대용어 \"%s\"|1은;는; 이미 \"%s\"|1으로;로; 정의 되었습니다, 덮어씁니다",
		["<noguild>"] = "<길드없음>",
		["<notarget>"] = "<대상없음>",
		["A module to provide basic chat substitutions."] = "기본적인 대화 대용어를 제공하는 모듈입니다.",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "정말로 모든 사용자 정의 대용어를 삭제하고 기본값으로 초기화할까요?",
		["Are you sure?"] = "동의합니까?",
		["can't find substitution index for a substitution named '%s'"] = "'%s' 대용어의 값을 찾을 수 없습니다",
		["current-prompt"] = [=[현재 값: '%s'
클릭하면 대화창에 붙여 넣습니다.]=],
		["defined %s: expands to => %s"] = "'%s' 정의: 확장됨 => %s",
		["Delete all"] = "전부 삭제",
		["Delete substitution"] = "대용어 삭제",
		["Deletes a user defined substitution"] = "사용자 정의 대용어를 삭제합니다",
		["Deletes all user defined substitutions"] = "모든 사용자 정의 대용어를 삭제합니다",
		["female"] = "여자",
		["her"] = "그녀의",
		["hers"] = "그녀의 것",
		["him"] = "그",
		["his"] = "그의",
		["it"] = "그것",
		["its"] = "그것의",
		["List of available substitutions"] = "사용 가능한 대용어 목록",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "이 모듈로 사용 가능한 대용어 목록입니다. (NB: 존재하는 대용어에 사용자 설정 값을 정의 할 수 있지만, 사용자 설정 값이 삭제되면 기본 값으로 전환됩니다.)",
		["List substitutions"] = "대용어 목록",
		["Lists all current subtitutions in the default chat frame"] = "기본 대화창에 현재 모든 대용어 목록 표시",
		["male"] = "남자",
		["MapLoc"] = "지도 위치",
		["MapPos"] = "지도 좌표",
		["MapXPos"] = "지도 X좌표",
		["MapYPos"] = "지도 Y좌표",
		["MapZone"] = "지도 지역",
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): 경고: 모듈 패턴이 정의되지 않았습니다!",
		["MouseoverTargetName"] = "마우스 오버 대상 이름",
		["NO MATCHFUNC FOUND"] = "MATCHFUNC 찾을 수 없음",
		["no substitution name given"] = "주어진 대용어 이름 없음",
		["no substitution name supplied for deletion"] = "삭제할 대용어 이름 없음",
		["no user defined subs found"] = "사용자 정의 대용어 찾을 수 없음",
		["no value given for subtitution \"%s\""] = "\"%s\" 대용어에 주어진 값 없음",
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "사용자 정의 대용어을 설정하거나 제거하는 옵션입니다. (NB: 존재하는 대용어에 사용자 설정 값을 정의 할 수 있지만, 사용자 설정 값을 삭제하면 기본값으로 전환됩니다.)",
		["PlayerAverageItemLevel"] = "플레이어 평균 아이템 레벨",
		["PlayerCurrentMana"] = "플레이어 현재 마나",
		["PlayerHealthDeficit"] = "플레이어 생명력 결손치",
		["PlayerHP"] = "플레이어 생명력",
		["PlayerManaDeficit"] = "플레이어 마나 결손치",
		["PlayerMaxHP"] = "플레이어 최대 생명력",
		["PlayerMaxMana"] = "플레이어 최대 마나",
		["PlayerName"] = "플레이어 이름",
		["PlayerPercentHP"] = "플레이어 생명력 백분율",
		["PlayerPercentMana"] = "플레이어 마나 백분율",
		["RandNum"] = "무작위 숫자",
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "\"%s\" 사용자 정의 대용어를 제거합니다, 이전 값으로 복원 => \"%s\"",
		["Set substitution"] = "대용어 설정",
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "사용자 정의 대용어 값 설정 (NB: 존재하는 기본 대용어와 같으면; 기본값으로 초기화하며, 사용자가 생성한 정의를 제거합니다.)",
		["subname -- NOTE: sub name without the prefix '%'"] = "대체이름 -- 참고: 접두사 '%' 없이 대체 이름",
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "대체이름 = 확장 후 문자 -- 참고: 접두사 '%' 없이 대체 이름",
		["substitution: %s defined as => %s"] = "대용어: %s 정의됨 => %s",
		["Substitutions"] = "대용어",
		["TargetClass"] = "대상 직업",
		["TargetGender"] = "대상 성별",
		["TargetGuild"] = "대상 길드",
		["TargetHealth"] = "대상 생명력",
		["TargetHealthDeficit"] = "대상 생명력 결손치",
		["TargetIcon"] = "대상 아이콘",
		["TargetLevel"] = "대상 레벨",
		["TargetManaDeficit"] = "대상 마나 결손치",
		["TargetName"] = "대상 이름",
		["TargetPercentHP"] = "대상 생명력 백분율",
		["TargetPossesive"] = "대상 소유격",
		["TargetPronoun"] = "대상 대명사",
		["TargetRace"] = "대상 종족",
		["TargetTargetName"] = "대상의 대상 이름",
		["unknown sex"] = "알 수 없는 성별",
		["user defined substition \"%s\" not found"] = "사용자 설정 대용어 \"%s\" 찾을 수 없음",
		["User defined substitutions"] = "사용자 정의 대용어",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "사용자 대용어 값 (usersubs_idx) 존재하지 않습니다!",
		["usersub_"] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "koKR", L)

L = {
	["Substitutions"] = {
		--[[Translation missing --]]
		["%d total user defined substitutions"] = "%d total user defined substitutions",
		--[[Translation missing --]]
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting",
		--[[Translation missing --]]
		["<noguild>"] = "<noguild>",
		--[[Translation missing --]]
		["<notarget>"] = "<notarget>",
		--[[Translation missing --]]
		["A module to provide basic chat substitutions."] = "A module to provide basic chat substitutions.",
		--[[Translation missing --]]
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "Are you sure - this will delete all user defined substitutions and reset defaults?",
		--[[Translation missing --]]
		["Are you sure?"] = "Are you sure?",
		--[[Translation missing --]]
		["can't find substitution index for a substitution named '%s'"] = "can't find substitution index for a substitution named '%s'",
		--[[Translation missing --]]
		["current-prompt"] = [=[Current value: '%s' 
Click to paste into the chat.]=],
		--[[Translation missing --]]
		["defined %s: expands to => %s"] = "defined %s: expands to => %s",
		--[[Translation missing --]]
		["Delete all"] = "Delete all",
		--[[Translation missing --]]
		["Delete substitution"] = "Delete substitution",
		--[[Translation missing --]]
		["Deletes a user defined substitution"] = "Deletes a user defined substitution",
		--[[Translation missing --]]
		["Deletes all user defined substitutions"] = "Deletes all user defined substitutions",
		--[[Translation missing --]]
		["female"] = "female",
		--[[Translation missing --]]
		["her"] = "her",
		--[[Translation missing --]]
		["hers"] = "hers",
		--[[Translation missing --]]
		["him"] = "him",
		--[[Translation missing --]]
		["his"] = "his",
		--[[Translation missing --]]
		["it"] = "it",
		--[[Translation missing --]]
		["its"] = "its",
		--[[Translation missing --]]
		["List of available substitutions"] = "List of available substitutions",
		--[[Translation missing --]]
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		--[[Translation missing --]]
		["List substitutions"] = "List substitutions",
		--[[Translation missing --]]
		["Lists all current subtitutions in the default chat frame"] = "Lists all current subtitutions in the default chat frame",
		--[[Translation missing --]]
		["male"] = "male",
		--[[Translation missing --]]
		["MapLoc"] = "MapLoc",
		--[[Translation missing --]]
		["MapPos"] = "MapPos",
		--[[Translation missing --]]
		["MapXPos"] = "MapXPos",
		--[[Translation missing --]]
		["MapYPos"] = "MapYPos",
		--[[Translation missing --]]
		["MapZone"] = "MapZone",
		--[[Translation missing --]]
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): warning: module patterns not defined!",
		--[[Translation missing --]]
		["MouseoverTargetName"] = "MouseoverTargetName",
		--[[Translation missing --]]
		["NO MATCHFUNC FOUND"] = "NO MATCHFUNC FOUND",
		--[[Translation missing --]]
		["no substitution name given"] = "no substitution name given",
		--[[Translation missing --]]
		["no substitution name supplied for deletion"] = "no substitution name supplied for deletion",
		--[[Translation missing --]]
		["no user defined subs found"] = "no user defined subs found",
		--[[Translation missing --]]
		["no value given for subtitution \"%s\""] = "no value given for subtitution \"%s\"",
		--[[Translation missing --]]
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		--[[Translation missing --]]
		["PlayerAverageItemLevel"] = "PlayerAverageItemLevel",
		--[[Translation missing --]]
		["PlayerCurrentMana"] = "PlayerCurrentMana",
		--[[Translation missing --]]
		["PlayerHealthDeficit"] = "PlayerHealthDeficit",
		--[[Translation missing --]]
		["PlayerHP"] = "PlayerHP",
		--[[Translation missing --]]
		["PlayerManaDeficit"] = "PlayerManaDeficit",
		--[[Translation missing --]]
		["PlayerMaxHP"] = "PlayerMaxHP",
		--[[Translation missing --]]
		["PlayerMaxMana"] = "PlayerMaxMana",
		--[[Translation missing --]]
		["PlayerName"] = "PlayerName",
		--[[Translation missing --]]
		["PlayerPercentHP"] = "PlayerPercentHP",
		--[[Translation missing --]]
		["PlayerPercentMana"] = "PlayerPercentMana",
		--[[Translation missing --]]
		["RandNum"] = "RandNum",
		--[[Translation missing --]]
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "removing user defined substitution \"%s\"; previously expanded to => \"%s\"",
		--[[Translation missing --]]
		["Set substitution"] = "Set substitution",
		--[[Translation missing --]]
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).",
		--[[Translation missing --]]
		["subname -- NOTE: sub name without the prefix '%'"] = "subname -- NOTE: sub name without the prefix '%'",
		--[[Translation missing --]]
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subname = text after expansion -- NOTE: sub name without the prefix \"%\"",
		--[[Translation missing --]]
		["substitution: %s defined as => %s"] = "substitution: %s defined as => %s",
		--[[Translation missing --]]
		["Substitutions"] = "Substitutions",
		--[[Translation missing --]]
		["TargetClass"] = "TargetClass",
		--[[Translation missing --]]
		["TargetGender"] = "TargetGender",
		--[[Translation missing --]]
		["TargetGuild"] = "TargetGuild",
		--[[Translation missing --]]
		["TargetHealth"] = "TargetHealth",
		--[[Translation missing --]]
		["TargetHealthDeficit"] = "TargetHealthDeficit",
		--[[Translation missing --]]
		["TargetIcon"] = "TargetIcon",
		--[[Translation missing --]]
		["TargetLevel"] = "TargetLevel",
		--[[Translation missing --]]
		["TargetManaDeficit"] = "TargetManaDeficit",
		--[[Translation missing --]]
		["TargetName"] = "TargetName",
		--[[Translation missing --]]
		["TargetPercentHP"] = "TargetPercentHP",
		--[[Translation missing --]]
		["TargetPossesive"] = "TargetPossesive",
		--[[Translation missing --]]
		["TargetPronoun"] = "TargetPronoun",
		--[[Translation missing --]]
		["TargetRace"] = "TargetRace",
		--[[Translation missing --]]
		["TargetTargetName"] = "TargetTargetName",
		--[[Translation missing --]]
		["unknown sex"] = "unknown sex",
		--[[Translation missing --]]
		["user defined substition \"%s\" not found"] = "user defined substition \"%s\" not found",
		--[[Translation missing --]]
		["User defined substitutions"] = "User defined substitutions",
		--[[Translation missing --]]
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "user substitutions index (usersubs_idx) doesn't exist! oh dear.",
		--[[Translation missing --]]
		["usersub_"] = "usersub_",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "всего %d пользовательских замен",
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000предупреждение:|r замена \"%s\" уже определена как \"%s\", переписываем",
		["<noguild>"] = "<без гильдии>",
		["<notarget>"] = "<нет цели>",
		["A module to provide basic chat substitutions."] = "Модуль для простых замен текста в чате.",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "Вы уверены - будут удалены все пользовательские замены и установлены значения по умолчанию?",
		["Are you sure?"] = "Ты уверен?",
		["can't find substitution index for a substitution named '%s'"] = "не могу найти номер замены в списке замен для '%s'",
		["current-prompt"] = [=[Текущее значение: '%s'
Кликнуть для копирования в чат.]=],
		["defined %s: expands to => %s"] = "определено %s: раскрывается в => %s",
		["Delete all"] = "Удалить все",
		["Delete substitution"] = "Удалить замену",
		["Deletes a user defined substitution"] = "Удаляет пользовательскую замену",
		["Deletes all user defined substitutions"] = "Удалить все замены заданные пользователем",
		["female"] = "женский",
		["her"] = "её",
		["hers"] = "ей",
		["him"] = "им",
		["his"] = "его",
		["it"] = "это",
		["its"] = "его",
		["List of available substitutions"] = "Список доступных замен",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Список доступных подмен, определённых в этом модуле. (Примечание: пользователи могут присваивать собственные значения существующим подменам, но они вернутся в значения по умолчанию, если пользовательское определение будет удалено.",
		["List substitutions"] = "Вывести список замен",
		["Lists all current subtitutions in the default chat frame"] = "Вывести все текущие замены в основное окно чата",
		["male"] = "мужской",
		["MapLoc"] = "Блокировка карты",
		["MapPos"] = "Позиция на карте",
		["MapXPos"] = "Позиция Х на карте",
		["MapYPos"] = "Поз.по Y",
		["MapZone"] = "Зона карты",
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): предупреждение: шаблоны модуля не определены!",
		["MouseoverTargetName"] = true,
		["NO MATCHFUNC FOUND"] = "Нет соответствующих ",
		["no substitution name given"] = "не задано имя замены",
		["no substitution name supplied for deletion"] = "не задано имя замены для удаления",
		["no user defined subs found"] = "не найдено замен определяемых пользователем",
		["no value given for subtitution \"%s\""] = "не задано значение для замены \"%s\"",
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Опции для назначения и отмены пользовательских замен. (Внимание: пользователи могут назначать свои значения для существующих замен, однако будет использовано значение по умолчанию если определение пользователя удалено).",
		["PlayerAverageItemLevel"] = true,
		["PlayerCurrentMana"] = "текушая мана игрока",
		["PlayerHealthDeficit"] = true,
		["PlayerHP"] = true,
		["PlayerManaDeficit"] = "нехватка маны",
		["PlayerMaxHP"] = true,
		["PlayerMaxMana"] = true,
		["PlayerName"] = "Имя игрока",
		["PlayerPercentHP"] = true,
		["PlayerPercentMana"] = true,
		["RandNum"] = true,
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "удаляется определяемая пользователем замена \"%s\", раскрывавшаяся в => \"%s\"",
		["Set substitution"] = "Назначить замену",
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Установить значение для определяемой пользователем замены (Внимание: может совпадать с существующей заменой по умолчанию; чтобы сбросить к первоначальному значению удалите пользовательское определение).",
		["subname -- NOTE: sub name without the prefix '%'"] = "subname -- ВАЖНО: sub name указывать без префикса '%'",
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subname = text after expansion -- ВАЖНО: sub name указывать без префикса '%'",
		["substitution: %s defined as => %s"] = "замена: %s определен как => %s",
		["Substitutions"] = "Замены",
		["TargetClass"] = true,
		["TargetGender"] = true,
		["TargetGuild"] = "показать гильдию",
		["TargetHealth"] = "показать жизнь",
		["TargetHealthDeficit"] = "Деф. здоровья цели",
		["TargetIcon"] = "показать иконку",
		["TargetLevel"] = "показать уровень",
		["TargetManaDeficit"] = "Деф. маны цели",
		["TargetName"] = "показать имя",
		["TargetPercentHP"] = "% здоровья цели",
		["TargetPossesive"] = true,
		["TargetPronoun"] = true,
		["TargetRace"] = "Раса цели",
		["TargetTargetName"] = "Имя цели цели",
		["unknown sex"] = "неизвестный пол",
		["user defined substition \"%s\" not found"] = "пользовательская замена \"%s\" не найдена",
		["User defined substitutions"] = "Пользовательские подмены",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "таблица пользовательских замен (usersubs_idx) не существует! о боже.",
		["usersub_"] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "%d 全部用户定义的置换",
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000注意:|r 置换\"%s\"已定义为\"%s\",覆盖",
		["<noguild>"] = "<无公会>",
		["<notarget>"] = "<无目标>",
		["A module to provide basic chat substitutions."] = "提供基础聊天替换的模块",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "您确定? - 这样将删除全部用户定义的替换并恢复默认",
		["Are you sure?"] = "您确定？",
		["can't find substitution index for a substitution named '%s'"] = "无法为置换名称 '%s' 找到置换索引",
		["current-prompt"] = "当前值: '%s'Click to paste into the chat.",
		["defined %s: expands to => %s"] = "定义 %s: 扩展到 => %s",
		["Delete all"] = "删除全部",
		["Delete substitution"] = "删除置换",
		["Deletes a user defined substitution"] = "删除用户定义的置换",
		["Deletes all user defined substitutions"] = "删除所有用户定义的置换",
		["female"] = "女",
		["her"] = "她",
		["hers"] = "她的",
		["him"] = "他",
		["his"] = "他的",
		["it"] = "它",
		["its"] = "它的",
		["List of available substitutions"] = "列出有效替换",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "在此模块列出有效替换定义..(注:用户可以为已存在的置换定义自定义值,如果用户定义被删除将恢复默认值)",
		["List substitutions"] = "替换列表",
		["Lists all current subtitutions in the default chat frame"] = "在默认聊天框体列出所有当前替换",
		["male"] = "男",
		["MapLoc"] = "地图地点",
		["MapPos"] = "地图坐标",
		["MapXPos"] = "地图X坐标",
		["MapYPos"] = "地图Y坐标",
		["MapZone"] = "地图区域",
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "模块:buildUserSubsIndex(): 警告: 模块模板未定义!",
		["MouseoverTargetName"] = "鼠标滑过目标名",
		["NO MATCHFUNC FOUND"] = "未发现匹配函数",
		["no substitution name given"] = "无特定置换名称",
		["no substitution name supplied for deletion"] = "没有删除部分的替换名称支持",
		["no user defined subs found"] = "未发现用户定义置换",
		["no value given for subtitution \"%s\""] = "置换 \"%s\"没有赋值",
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "设置和移除用户定义置换的选项.(注:用户可以为已存在的置换定义自定义值,如果用户定义被删除将恢复默认值)",
		["PlayerAverageItemLevel"] = "替换",
		["PlayerCurrentMana"] = "玩家当前法力",
		["PlayerHealthDeficit"] = "玩家生命不足",
		["PlayerHP"] = "玩家血量",
		["PlayerManaDeficit"] = "玩家法力不足",
		["PlayerMaxHP"] = "玩家血量上限",
		["PlayerMaxMana"] = "玩家法力上限",
		["PlayerName"] = "玩家名称",
		["PlayerPercentHP"] = "玩家血量百分比",
		["PlayerPercentMana"] = "玩家法力百分比",
		["RandNum"] = "随机数字",
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "移除用户定义的置换 \"%s\"; 以前扩展到=> \"%s\"",
		["Set substitution"] = "设置置换",
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "设置用户定义替换的值(注:这可能与现有的默认替换相同;若重置为默认,仅移除用户创建的定义)",
		["subname -- NOTE: sub name without the prefix '%'"] = "置换名称 -- 注意: 置换名称无前缀 '%'",
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "置换名称 = 扩展后文本-- 注意: 置换名称无前缀 \"%\"",
		["substitution: %s defined as => %s"] = "替换: %s 定义为 => %s",
		["Substitutions"] = "置换",
		["TargetClass"] = "目标等级",
		["TargetGender"] = "目标性别",
		["TargetGuild"] = "目标公会",
		["TargetHealth"] = "目标生命",
		["TargetHealthDeficit"] = "目标生命不足",
		["TargetIcon"] = "目标图标",
		["TargetLevel"] = "目标等级",
		["TargetManaDeficit"] = "目标法力不足",
		["TargetName"] = "目标名称",
		["TargetPercentHP"] = "目标血量百分比",
		["TargetPossesive"] = "目标阵营",
		["TargetPronoun"] = "目标代词",
		["TargetRace"] = "目标种族",
		["TargetTargetName"] = "目标的目标名称",
		["unknown sex"] = "未知性别",
		["user defined substition \"%s\" not found"] = "未发现用户定义替换\"%s\" ",
		["User defined substitutions"] = "用户自定义置换",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "用户替换指数(子用户_索引) 不存在!哦,亲爱的.",
		["usersub_"] = "子用户_",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "Total de sustituciones definidas por el usuario %d",
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000advertencia:|r sustitución \"%s\" ya definida como \"%s\", sobrescribiendo",
		["<noguild>"] = "<sin hermandad>",
		["<notarget>"] = "<sin objetivo>",
		["A module to provide basic chat substitutions."] = "Un módulo que proporciona sustituciones básicas del chat.",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "¿Está seguro - esto eliminará todas las sustituciones definidas por el usuario y restablece los valores predeterminados?",
		["Are you sure?"] = "¿Está seguro?",
		["can't find substitution index for a substitution named '%s'"] = "No se encuentra el índice de sustitución para una sustitución con el nombre '%s'",
		["current-prompt"] = [=[Valor actual: '%s'
Click para pegar en el chat.]=],
		["defined %s: expands to => %s"] = "definido %s: se expande a => %s",
		["Delete all"] = "Eliminar todo",
		["Delete substitution"] = "Eliminar sustitución",
		["Deletes a user defined substitution"] = "Elimina una sustitución del usuario",
		["Deletes all user defined substitutions"] = "Elimina todas las sustituciones del usuario",
		["female"] = "Femenino",
		["her"] = "ella",
		["hers"] = "suya",
		["him"] = "él",
		["his"] = "suyo",
		--[[Translation missing --]]
		["it"] = "it",
		--[[Translation missing --]]
		["its"] = "its",
		["List of available substitutions"] = "Listado de sustituciones disponibles",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Lista de sustituciones definidas por este módulo. (Nota: los usuarios pueden definir valores personalizados para las sustituciones, pero volverá al valor por defecto si la definición del usuario se suprime.)",
		["List substitutions"] = "Listado de sustituciones",
		["Lists all current subtitutions in the default chat frame"] = "Lista todas las sustituciones actuales en el marco de chat por defecto.",
		["male"] = "Masculino",
		["MapLoc"] = true,
		["MapPos"] = true,
		["MapXPos"] = true,
		["MapYPos"] = true,
		["MapZone"] = "MapZona",
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "módulo: buildUserSubsIndex(): advertencia: ¡patrones del módulo no definidos!",
		--[[Translation missing --]]
		["MouseoverTargetName"] = "MouseoverTargetName",
		["NO MATCHFUNC FOUND"] = "SIN FUNCIONCOINCIDENCIAS ENCONTRADA",
		["no substitution name given"] = "ningún nombre de sustitución dado",
		["no substitution name supplied for deletion"] = "ningún nombre de sustitución proporcionado para su eliminación",
		["no user defined subs found"] = "sustituciones definidas por el usuario no encontradas",
		["no value given for subtitution \"%s\""] = "ningún valor dado para sustitución \"%s\"",
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Opciones para establecer y eliminar sustituciones definidas por el usuario. (Nota: los usuarios pueden definir valores personalizados para las sustituciones, pero volverán al valor por defecto si las definiciones del usuario son suprimidas.)",
		--[[Translation missing --]]
		["PlayerAverageItemLevel"] = "PlayerAverageItemLevel",
		["PlayerCurrentMana"] = "ManaActualJugador",
		["PlayerHealthDeficit"] = "DéficitSaludJugador",
		["PlayerHP"] = "VidaJugador",
		["PlayerManaDeficit"] = "DéficitManaJugador",
		["PlayerMaxHP"] = "VidaMaxJugador",
		["PlayerMaxMana"] = "ManaMaxJugador",
		["PlayerName"] = "NombreJugador",
		["PlayerPercentHP"] = "PorcentVidaJugador",
		["PlayerPercentMana"] = "PorcentManaJugador",
		["RandNum"] = "NumAleat",
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "Quitando sustitución definida por el usuario \"%s\"; anteriormente ampliada a => \"%s\"",
		["Set substitution"] = "Establecer sustitución",
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Establecer el valor de una sustitución definida por el usuario (Nota: puede ser la misma que una sustitución predeterminada, para restablecerla a la predeterminada, sólo quitar la definición de usuario creada).",
		["subname -- NOTE: sub name without the prefix '%'"] = "subnombre -- NOTA: sub nombre sin el prefijo '%'",
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subnombre = texto después de expansión --NOTA: sub nombre sin el prefijo \"%\"",
		["substitution: %s defined as => %s"] = "sustitución: %s definido como => %s",
		["Substitutions"] = "Sustituciones",
		["TargetClass"] = "ClaseObjetivo",
		["TargetGender"] = "GéneroObjetivo",
		["TargetGuild"] = "HermandadObjetivo",
		["TargetHealth"] = "SaludObjetivo",
		["TargetHealthDeficit"] = "DéficitSaludObjetivo",
		["TargetIcon"] = "IconoObjetivo",
		["TargetLevel"] = "NivelObjetivo",
		["TargetManaDeficit"] = "DéficitManaObjetivo",
		["TargetName"] = "NombreObjetivo",
		["TargetPercentHP"] = "PorcentVidaObjetivo",
		["TargetPossesive"] = "PosesiónObjetivo",
		["TargetPronoun"] = "PronombreObjetivo",
		["TargetRace"] = "RazaObjetivo",
		["TargetTargetName"] = "ObjetivoObjetivoNombre",
		["unknown sex"] = "Sexo desconocido",
		["user defined substition \"%s\" not found"] = "sustitución definida por el usuario \"%s\" no encontrada",
		["User defined substitutions"] = "Sustituciones definidas por el usuario",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "¡no existe un índice de sustituciones de usuario (usersubs_idx)!.",
		["usersub_"] = "sub usuario_",
	}
}

PL:AddLocale(PRAT_MODULE, "esES", L)

L = {
	["Substitutions"] = {
		["%d total user defined substitutions"] = "%d 總使用者定義代替",
		--[[Translation missing --]]
		["|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting"] = "|cffff0000warning:|r subtitution \"%s\" already defined as \"%s\", overwriting",
		["<noguild>"] = "<無公會>",
		["<notarget>"] = "<無目標>",
		["A module to provide basic chat substitutions."] = "提供基本聊天標題的模組",
		["Are you sure - this will delete all user defined substitutions and reset defaults?"] = "你確定嗎 - 這將刪除所有使用者替換且重置至預設值？",
		["Are you sure?"] = "你確定嗎？",
		--[[Translation missing --]]
		["can't find substitution index for a substitution named '%s'"] = "can't find substitution index for a substitution named '%s'",
		["current-prompt"] = [=[當前值：%s
點擊以在聊天視窗中貼上]=],
		["defined %s: expands to => %s"] = "定義 %s：擴張至 => %s",
		["Delete all"] = "刪除所有",
		["Delete substitution"] = "刪除標題",
		["Deletes a user defined substitution"] = "刪除一個由使用者自定義的標題",
		["Deletes all user defined substitutions"] = "刪除所有由使用者自定義的標題",
		["female"] = "女性",
		["her"] = "她",
		["hers"] = "她的",
		["him"] = "他",
		["his"] = "他的",
		["it"] = "它",
		["its"] = "它的",
		["List of available substitutions"] = "可用標題清單",
		["List of available substitutions defined by this module. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "由此模組定義的可用標題之清單",
		["List substitutions"] = "標題清單",
		["Lists all current subtitutions in the default chat frame"] = "默認聊天框中所有現用標題清單",
		["male"] = "男性",
		["MapLoc"] = true,
		["MapPos"] = "地圖位置",
		["MapXPos"] = "地圖X軸",
		["MapYPos"] = "地圖Y軸",
		["MapZone"] = "地圖地區",
		--[[Translation missing --]]
		["module:buildUserSubsIndex(): warning: module patterns not defined!"] = "module:buildUserSubsIndex(): warning: module patterns not defined!",
		["MouseoverTargetName"] = "鼠標懸停目標名字",
		["NO MATCHFUNC FOUND"] = true,
		--[[Translation missing --]]
		["no substitution name given"] = "no substitution name given",
		--[[Translation missing --]]
		["no substitution name supplied for deletion"] = "no substitution name supplied for deletion",
		["no user defined subs found"] = "找不到使用者定義的代替",
		--[[Translation missing --]]
		["no value given for subtitution \"%s\""] = "no value given for subtitution \"%s\"",
		--[[Translation missing --]]
		["Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)"] = "Options for setting and removing user defined substitutions. (NB: users may define custom values for existing substitutions, but they will revert to the default value if the user definition is deleted.)",
		["PlayerAverageItemLevel"] = true,
		["PlayerCurrentMana"] = "玩家當前法力值",
		["PlayerHealthDeficit"] = "玩家生命不足",
		["PlayerHP"] = "玩家生命值",
		["PlayerManaDeficit"] = "玩家法力不足",
		["PlayerMaxHP"] = "玩家最大血量",
		["PlayerMaxMana"] = "玩家最大法力",
		["PlayerName"] = "玩家名字",
		["PlayerPercentHP"] = "玩家百分比血量",
		["PlayerPercentMana"] = "玩家百分比法力",
		["RandNum"] = true,
		--[[Translation missing --]]
		["removing user defined substitution \"%s\"; previously expanded to => \"%s\""] = "removing user defined substitution \"%s\"; previously expanded to => \"%s\"",
		["Set substitution"] = "設定代替",
		--[[Translation missing --]]
		["Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition)."] = "Set the value of a user defined substitution (NB: this may be the same as an existing default substitution; to reset it to the default, just remove the user created definition).",
		--[[Translation missing --]]
		["subname -- NOTE: sub name without the prefix '%'"] = "subname -- NOTE: sub name without the prefix '%'",
		--[[Translation missing --]]
		["subname = text after expansion -- NOTE: sub name without the prefix \"%\""] = "subname = text after expansion -- NOTE: sub name without the prefix \"%\"",
		["substitution: %s defined as => %s"] = "代替: %s 定義為 => %s",
		["Substitutions"] = "代替",
		["TargetClass"] = "目標職業",
		["TargetGender"] = "目標性別",
		["TargetGuild"] = "目標公會",
		["TargetHealth"] = "目標生命",
		["TargetHealthDeficit"] = "目標生命不足",
		["TargetIcon"] = "目標圖示",
		["TargetLevel"] = "目標等級",
		["TargetManaDeficit"] = "目標法力不足",
		["TargetName"] = "目標名字",
		["TargetPercentHP"] = "目標百比分血量",
		--[[Translation missing --]]
		["TargetPossesive"] = "TargetPossesive",
		["TargetPronoun"] = "目標代名詞",
		["TargetRace"] = "目標種族",
		["TargetTargetName"] = "目標的目標名字",
		["unknown sex"] = "未知的性別",
		["user defined substition \"%s\" not found"] = "未搜尋到使用者自定義替換 \"%s\"",
		["User defined substitutions"] = "使用者自定義的替換",
		["user substitutions index (usersubs_idx) doesn't exist! oh dear."] = "親愛的使用者自替換索引(usersubs_idx)並不存在。",
		["usersub_"] = true,
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW", L)
end
--@end-non-debug@


  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
    }
  })


  local patternPlugins = { patterns = {} }

  Prat:SetModuleOptions(module.name, {
    name = PL["Substitutions"],
    desc = PL["A module to provide basic chat substitutions."],
    type = 'group',
    plugins = patternPlugins,
    args = {}
  })

  local function subDesc(info) return info.handler:GetSubstDescription(info) end


  --[[------------------------------------------------
  Core Functions
  ------------------------------------------------]] --
  function module:OnModuleEnable()
    self:BuildModuleOptions(patternPlugins.patterns)
  end

  function module:BuildModuleOptions(args)
    local modulePatterns = Prat.GetModulePatterns(self)

    self.buildingMenu = true

    for _, v in pairs(modulePatterns) do
      if v then
        local name = v.optname
        local pat = v.pattern:gsub("%%%%", "%%")

        args[name] = args[name] or {}
        local d = args[name]

        d.name = name .. " " .. pat
        d.desc = subDesc
        d.type = "execute"
        d.func = "DoPat"
      end
    end

    self.buildingMenu = false
  end

  function module:GetDescription()
    return PL["A module to provide basic chat substitutions."]
  end

  function module:GetSubstDescription(info)
    local val = self:InfoToPattern(info)

    self.buildingMenu = true

    val = val and val.matchfunc and val.matchfunc() or PL["NO MATCHFUNC FOUND"]
    val = PL["current-prompt"]:format("|cff80ff80" .. tostring(val) .. "|r"):gsub("%%%%", "%%")

    self.buildingMenu = false

    return val
  end

  function module:InfoToPattern(info)
    local modulePatterns = Prat.GetModulePatterns(self)
    local name = info[#info] or ""

    if modulePatterns then
      for _, v in pairs(modulePatterns) do
        if v and v.optname == name then
          return v
        end
      end
    end
  end

  function module:DoPat(info)
    local pat = self:InfoToPattern(info)
    pat = pat and pat.pattern or ""
    local e = ChatEdit_GetActiveWindow()
    if not e or not e:IsVisible() then
      return
    end

    e:SetText((e:GetText() or "") .. pat:gsub("[%(%)]", ""):gsub("%%%%", "%%"))
  end

  do
    local function prat_match(text)
      local text = text or ""

      if module.buildingMenu then
        return text
      end

      return Prat:RegisterMatch(text, "OUTBOUND")
    end

    local function Zone(...)
      return prat_match(GetRealZoneText())
    end

    local function Loc(...)
      return prat_match(GetMinimapZoneText())
    end

    local function GetPlayerMapPosition(unit)
      return C_Map.GetPlayerMapPosition(C_Map.GetBestMapForUnit(unit), unit):GetXY()
    end

    local function Pos()
      local x, y = GetPlayerMapPosition("player")
      local str = "(" .. math.floor((x * 100) + 0.5) .. "," .. math.floor((y * 100) + 0.5) .. ")"
      return prat_match(str)
    end

    local function Ypos()
      local x, y = GetPlayerMapPosition("player")
      local y = tostring(math.floor((y * 100) + 0.5))
      return prat_match(y)
    end

    local function Xpos()
      local x, y = GetPlayerMapPosition("player")
      local x = tostring(math.floor((x * 100) + 0.5))
      return prat_match(x)
    end

    local function PlayerHP(...)
      return prat_match(UnitHealth("player"))
    end

    local function PlayerMaxHP(...)
      return prat_match(UnitHealthMax("player"))
    end

    local function PlayerPercentHP()
      return prat_match(floor(100 * (UnitHealth("player") / UnitHealthMax("player"))))
    end

    local function PlayerHealthDeficit()
      return prat_match(UnitHealthMax("player") - UnitHealth("player"))
    end

    local function PlayerCurrentMana()
      return prat_match(UnitPower("player"))
    end

    local function PlayerMaxMana()
      return prat_match(UnitPowerMax("player"))
    end

    local function PlayerPercentMana()
      return prat_match(string.format("%.0f%%%%",
        floor(100 * (UnitPower("player") / UnitPowerMax("player")))))
    end

    local function PlayerManaDeficit()
      return prat_match(UnitPowerMax("player") - UnitPower("player"))
    end



    local function TargetPercentHP()
      local str = PL["<notarget>"]
      if UnitExists("target") then
        str = string.format("%.0f%%%%", floor(100 * (UnitHealth("target") / UnitHealthMax("target"))))
      end

      return prat_match(str)
    end

    local function TargetHealth()
      local str = PL["<notarget>"]
      if UnitExists("target") then
        str = UnitHealth("target")
      end

      return prat_match(str)
    end

    local function TargetHealthDeficit()
      local str = PL["<notarget>"]
      if UnitExists("target") then
        str = UnitHealthMax("target") - UnitHealth("target")
      end

      return prat_match(str)
    end

    local function TargetManaDeficit()
      local str = PL["<notarget>"]
      if UnitExists("target") then
        str = UnitPowerMax("target") - UnitPower("target")
      end

      return prat_match(str)
    end


    local function TargetClass()
      local class = PL["<notarget>"]
      if UnitExists("target") then
        class = UnitClass("target")
      end

      return prat_match(class)
    end

    local raidiconpfx = ICON_TAG_RAID_TARGET_STAR1:sub(1, -2) or "rt"

    local function TargetIcon()
      local icon = ""
      if UnitExists("target") then
        local iconnum = GetRaidTargetIndex("target")

        if type(iconnum) ~= "nil" then
          icon = ("{%s%d}"):format(raidiconpfx, tostring(iconnum))
        end
      end

      return prat_match(icon)
    end


    local function TargetRace()
      local race = PL["<notarget>"]
      if UnitExists("target") then
        if UnitIsPlayer("target") then
          race = UnitRace("target")
        else
          race = UnitCreatureFamily("target")
          if not race then
            race = UnitCreatureType("target")
          end
        end
      end
      return prat_match(race)
    end

    local function TargetGender()
      local sex = PL["<notarget>"]
      if UnitExists("target") then
        local s = UnitSex("target")
        if (s == 2) then
          sex = PL["male"]
        elseif (s == 3) then
          sex = PL["female"]
        else
          sex = PL["unknown sex"]
        end
      end

      return prat_match(sex)
    end

    local function TargetLevel()
      local level = PL["<notarget>"]
      if UnitExists("target") then
        level = UnitLevel("target")
      end
      return prat_match(level)
    end

    local function TargetGuild()
      local guild = PL["<notarget>"]
      if UnitExists("target") then
        guild = PL["<noguild>"]
        if IsInGuild("target") then
          guild = GetGuildInfo("target") or ""
        end
      end
      return prat_match(guild)
    end

    -- %tps (possesive)
    local function TargetPossesive()
      local p = PL["<notarget>"]
      if UnitExists("target") then
        local s = UnitSex("target")
        if (s == 2) then
          p = PL["his"]
        elseif (s == 3) then
          p = PL["hers"]
        else
          p = PL["its"]
        end
      end

      return prat_match(p)
    end

    -- %tpn (pronoun)
    local function TargetPronoun()
      local p = PL["<notarget>"]
      if UnitExists("target") then
        local s = UnitSex("target")
        if (s == 2) then
          p = PL["him"]
        elseif (s == 3) then
          p = PL["her"]
        else
          p = PL["it"]
        end
      end
      return prat_match(p)
    end

    -- %tn (target)
    local function TargetName()
      local t = PL['<notarget>']

      if UnitExists("target") then
        t = UnitName("target")
      end

      return prat_match(t)
    end

    -- %tt (target)
    local function TargetTargetName()
      local t = PL['<notarget>']

      if UnitExists("targettarget") then
        t = UnitName("targettarget")
      end

      return prat_match(t)
    end

    -- %mn (mouseover)
    local function MouseoverName()
      local t = PL['<notarget>']

      if UnitExists("mouseover") then
        t = UnitName("mouseover")
      end

      return prat_match(t)
    end

    -- %pn (player)
    local function PlayerName()
      local p = GetUnitName("player") or ""
      return prat_match(p)
    end


    local function PlayerAverageItemLevel()
      local avgItemLevel = GetAverageItemLevel();
      avgItemLevel = floor(avgItemLevel);

      return prat_match(avgItemLevel)
    end

    local function Rand()
      return prat_match(math.random(1, 100))
    end

    --[[
     * %tn = current target
     * %pn = player name
     * %hc = your current health
     * %hm = your max health
     * %hp = your percentage health
     * %hd = your current health deficit
     * %mc = your current mana
     * %mm = your max mana
     * %mp = your percentage mana
     * %md = your current mana deficit
     * %thp = target's percentage health
     * %th = target's current health
     * %td = target's health deficit
     * %tc = class of target
     * %tr = race of target
     * %ts = sex of target
     * %tl = level of target
     * %ti = raid icon of target
     * %tps = possesive for target (his/hers/its)
     * %tpn = pronoun for target (him/her/it)
     * %fhp = focus's percentage health
     * %fc = class of focus
     * %fr = race of focus
     * %fs = sex of focus
     * %fl = level of focus
     * %fps = possesive for focus (his/hers/its)
     * %fpn = pronoun for focus (him/her/it)
     * %tt = target of target
     * %zon = your current zone (Dun Morogh, Hellfire Peninsula, etc.)
     * %loc = your current subzone (as shown on the minimap)
     * %pos = your current coordinates (x,y)
     * %ypos = your current y coordinate
     * %xpos = your current x coordinate
     * %rnd = a random number between 1 and 100
     * %ail = your average item level
     --]]

    Prat:SetModulePatterns(module, {
      { pattern = "(%%thd)", matchfunc = TargetHealthDeficit, optname = PL["TargetHealthDeficit"], type = "OUTBOUND" },
      {
        pattern = "(%%thp)",
        matchfunc = TargetPercentHP,
        priority = 51,
        optname = PL["TargetPercentHP"],
        type = "OUTBOUND"
      },
      { pattern = "(%%tpn)", matchfunc = TargetPronoun, optname = PL["TargetPronoun"], type = "OUTBOUND" },

      { pattern = "(%%hc)", matchfunc = PlayerHP, optname = PL["PlayerHP"], type = "OUTBOUND" },
      { pattern = "(%%pn)", matchfunc = PlayerName, optname = PL["PlayerName"], type = "OUTBOUND" },
      { pattern = "(%%hm)", matchfunc = PlayerMaxHP, optname = PL["PlayerMaxHP"], type = "OUTBOUND" },
      { pattern = "(%%hd)", matchfunc = PlayerHealthDeficit, optname = PL["PlayerHealthDeficit"], type = "OUTBOUND" },
      { pattern = "(%%hp)", matchfunc = PlayerPercentHP, optname = PL["PlayerPercentHP"], type = "OUTBOUND" },
      { pattern = "(%%mc)", matchfunc = PlayerCurrentMana, optname = PL["PlayerCurrentMana"], type = "OUTBOUND" },
      { pattern = "(%%mm)", matchfunc = PlayerMaxMana, optname = PL["PlayerMaxMana"], type = "OUTBOUND" },
      { pattern = "(%%mp)", matchfunc = PlayerPercentMana, optname = PL["PlayerPercentMana"], type = "OUTBOUND" },
      { pattern = "(%%pmd)", matchfunc = PlayerManaDeficit, optname = PL["PlayerManaDeficit"], type = "OUTBOUND" },

      GetAverageItemLevel and {
        pattern = "(%%ail)",
        matchfunc = PlayerAverageItemLevel,
        optname = PL["PlayerAverageItemLevel"],
        type = "OUTBOUND"
      },

      { pattern = "(%%tn)", matchfunc = TargetName, optname = PL["TargetName"], type = "OUTBOUND" },
      { pattern = "(%%tt)", matchfunc = TargetTargetName, optname = PL["TargetTargetName"], type = "OUTBOUND" },
      { pattern = "(%%tc)", matchfunc = TargetClass, optname = PL["TargetClass"], type = "OUTBOUND" },
      { pattern = "(%%th)", matchfunc = TargetHealth, optname = PL["TargetHealth"], type = "OUTBOUND" },
      { pattern = "(%%tr)", matchfunc = TargetRace, optname = PL["TargetRace"], type = "OUTBOUND" },
      { pattern = "(%%ts)", matchfunc = TargetGender, optname = PL["TargetGender"], type = "OUTBOUND" },
      { pattern = "(%%ti)", matchfunc = TargetIcon, optname = PL["TargetIcon"], type = "OUTBOUND" },
      { pattern = "(%%tl)", matchfunc = TargetLevel, optname = PL["TargetLevel"], type = "OUTBOUND" },
      { pattern = "(%%tps)", matchfunc = TargetPossesive, optname = PL["TargetPossesive"], type = "OUTBOUND" },
      { pattern = "(%%tmd)", matchfunc = TargetManaDeficit, optname = PL["TargetManaDeficit"], type = "OUTBOUND" },
      { pattern = "(%%tg)", matchfunc = TargetGuild, optname = PL["TargetGuild"], type = "OUTBOUND" },

      { pattern = "(%%mn)", matchfunc = MouseoverName, optname = PL["MouseoverTargetName"], type = "OUTBOUND" },

      { pattern = "(%%zon)", matchfunc = Zone, optname = PL["MapZone"], type = "OUTBOUND" },
      { pattern = "(%%loc)", matchfunc = Loc, optname = PL["MapLoc"], type = "OUTBOUND" },
      { pattern = "(%%pos)", matchfunc = Pos, optname = PL["MapPos"], type = "OUTBOUND" },
      { pattern = "(%%ypos)", matchfunc = Ypos, optname = PL["MapYPos"], type = "OUTBOUND" },
      { pattern = "(%%xpos)", matchfunc = Xpos, optname = PL["MapXPos"], type = "OUTBOUND" },
      { pattern = "(%%rnd)", matchfunc = Rand, optname = PL["RandNum"], type = "OUTBOUND" },
    }

    --[[ TODO:
             %%fhp - focus health
             %%fr
             %%fc
             %%fs
             %%fl
             %%fvr
             %%fvn
             ]])
  end


  return
end) -- Prat:AddModuleToLoad