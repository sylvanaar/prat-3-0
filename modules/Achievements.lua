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
  local function dbg(...) end

  --[==[@debug@
  function dbg(...) Prat:PrintLiteral(...) end

  --@end-debug@]==]

  local PRAT_MODULE = Prat:RequestModuleName("Achievements")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE)

  -- define localized strings
  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "Achievements",
    ["module_desc"] = "Achievment related customizations",
    ["grats_link"] = "say grats",
    ["completed"] = "Completed %s",
    ["showCompletedDate_name"] = "Show completed date",
    ["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
    ["showGratsLink_name"] = "Show grats link",
    ["showGratsLink_desc"] = "Show a clickable link which sends a grats message",
    ["dontShowAchievements_name"] = "Don't show achievements",
    ["dontShowAchievements_desc"] = "Hide all achievement messages",
    ["customGrats_defualt"] = "Grats %s",
    ["customGrats_name"] = "Use Custom Grats Message",
    ["customGrats_desc"] = "Use a custom grats message instead of a random one",
    ["customGratsText_name"] = "Grats Message",
    ["customGratsText_desc"] = "Custom grats message. Type any text you wish for your grats message, if you want to include the player's name use '%s' as a placeholder",
    ["grats_have_1"] = "Grats %s",
    ["grats_have_2"] = "Gz %s, I have that one too",
    ["grats_have_3"] = "Wow %s that's great",
    ["grats_have_4"] = "Welcome to the club %s",
    ["grats_have_5"] = "I can still rememeber getting that one %s",
    ["grats_have_6"] = "That one is a rite of passge %s",
    ["grats_have_7"] = "I worked on that for ages %s, grats!",
    ["grats_have_8"] = "I remember doing that, %s, grats!",
    ["grats_have_9"] = "Nicely done %s",
    ["grats_have_10"] = "Good work %s, now we both have it",
    ["grats_donthave_1"] = "Grats %s",
    ["grats_donthave_2"] = "Gz %s, I still need that",
    ["grats_donthave_3"] = "I want that one %s, grats!",
    ["grats_donthave_4"] = "Wow %s that's great",
    ["grats_donthave_5"] = "I'm jealous %s, grats!",
    ["grats_donthave_6"] = "I have been working on that for ages %s",
    ["grats_donthave_7"] = "Still need that one %s, grats!",
    ["grats_donthave_8"] = "WTB your achievment %s",
    ["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
    ["grats_donthave_10"] = "I can't wait to get that one %s",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Achievements"] = {
		["completed"] = "Completed %s",
		["customGrats_defualt"] = "Grats %s",
		["customGrats_desc"] = "Use a custom grats message instead of a random one",
		["customGrats_name"] = "Use Custom Grats Message",
		["customGratsText_desc"] = "Custom grats message. Type any text you wish for your grats message, if you want to include the player's name use '%s' as a placeholder",
		["customGratsText_name"] = "Grats Message",
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		["dontShowAchievements_name"] = "Don't show achievements",
		["grats_donthave_1"] = "Grats %s",
		["grats_donthave_10"] = "I can't wait to get that one %s",
		["grats_donthave_2"] = "Gz %s, I still need that",
		["grats_donthave_3"] = "I want that one %s, grats!",
		["grats_donthave_4"] = "Wow %s that's great",
		["grats_donthave_5"] = "I'm jealous %s, grats!",
		["grats_donthave_6"] = "I have been working on that for ages %s",
		["grats_donthave_7"] = "Still need that one %s, grats!",
		["grats_donthave_8"] = "WTB your achievment %s",
		["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
		["grats_have_1"] = "Grats %s",
		["grats_have_10"] = "Good work %s, now we both have it",
		["grats_have_2"] = "Gz %s, I have that one too",
		["grats_have_3"] = "Wow %s that's great",
		["grats_have_4"] = "Welcome to the club %s",
		["grats_have_5"] = "I can still rememeber getting that one %s",
		["grats_have_6"] = "That one is a rite of passge %s",
		["grats_have_7"] = "I worked on that for ages %s, grats!",
		["grats_have_8"] = "I remember doing that, %s, grats!",
		["grats_have_9"] = "Nicely done %s",
		["grats_link"] = "say grats",
		["module_desc"] = "Achievment related customizations",
		["module_name"] = "Achievements",
		["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
		["showCompletedDate_name"] = "Show completed date",
		["showGratsLink_desc"] = "Show a clickable link which sends a grats message",
		["showGratsLink_name"] = "Show grats link",
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["Achievements"] = {
		--[[Translation missing --]]
		["completed"] = "Completed %s",
		--[[Translation missing --]]
		["customGrats_defualt"] = "Grats %s",
		--[[Translation missing --]]
		["customGrats_desc"] = "Use a custom grats message instead of a random one",
		--[[Translation missing --]]
		["customGrats_name"] = "Use Custom Grats Message",
		--[[Translation missing --]]
		["customGratsText_desc"] = "Custom grats message. Type any text you wish for your grats message, if you want to include the player's name use '%s' as a placeholder",
		--[[Translation missing --]]
		["customGratsText_name"] = "Grats Message",
		--[[Translation missing --]]
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		--[[Translation missing --]]
		["dontShowAchievements_name"] = "Don't show achievements",
		--[[Translation missing --]]
		["grats_donthave_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_donthave_10"] = "I can't wait to get that one %s",
		--[[Translation missing --]]
		["grats_donthave_2"] = "Gz %s, I still need that",
		--[[Translation missing --]]
		["grats_donthave_3"] = "I want that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_4"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_donthave_5"] = "I'm jealous %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_6"] = "I have been working on that for ages %s",
		--[[Translation missing --]]
		["grats_donthave_7"] = "Still need that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_8"] = "WTB your achievment %s",
		--[[Translation missing --]]
		["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
		--[[Translation missing --]]
		["grats_have_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_have_10"] = "Good work %s, now we both have it",
		--[[Translation missing --]]
		["grats_have_2"] = "Gz %s, I have that one too",
		--[[Translation missing --]]
		["grats_have_3"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_have_4"] = "Welcome to the club %s",
		--[[Translation missing --]]
		["grats_have_5"] = "I can still rememeber getting that one %s",
		--[[Translation missing --]]
		["grats_have_6"] = "That one is a rite of passge %s",
		--[[Translation missing --]]
		["grats_have_7"] = "I worked on that for ages %s, grats!",
		--[[Translation missing --]]
		["grats_have_8"] = "I remember doing that, %s, grats!",
		--[[Translation missing --]]
		["grats_have_9"] = "Nicely done %s",
		--[[Translation missing --]]
		["grats_link"] = "say grats",
		--[[Translation missing --]]
		["module_desc"] = "Achievment related customizations",
		--[[Translation missing --]]
		["module_name"] = "Achievements",
		--[[Translation missing --]]
		["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
		--[[Translation missing --]]
		["showCompletedDate_name"] = "Show completed date",
		--[[Translation missing --]]
		["showGratsLink_desc"] = "Show a clickable link which sends a grats message",
		--[[Translation missing --]]
		["showGratsLink_name"] = "Show grats link",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["Achievements"] = {
		--[[Translation missing --]]
		["completed"] = "Completed %s",
		--[[Translation missing --]]
		["customGrats_defualt"] = "Grats %s",
		--[[Translation missing --]]
		["customGrats_desc"] = "Use a custom grats message instead of a random one",
		--[[Translation missing --]]
		["customGrats_name"] = "Use Custom Grats Message",
		--[[Translation missing --]]
		["customGratsText_desc"] = "Custom grats message. Type any text you wish for your grats message, if you want to include the player's name use '%s' as a placeholder",
		--[[Translation missing --]]
		["customGratsText_name"] = "Grats Message",
		--[[Translation missing --]]
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		--[[Translation missing --]]
		["dontShowAchievements_name"] = "Don't show achievements",
		["grats_donthave_1"] = "Parabéns %s",
		["grats_donthave_10"] = "Não vejo a hora de ter esse, %s",
		["grats_donthave_2"] = "Boa %s, eu ainda preciso desse",
		["grats_donthave_3"] = "Eu também quero esse, %s. Parabéns!",
		["grats_donthave_4"] = "Nossa %s, que incrível.",
		--[[Translation missing --]]
		["grats_donthave_5"] = "I'm jealous %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_6"] = "I have been working on that for ages %s",
		--[[Translation missing --]]
		["grats_donthave_7"] = "Still need that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_8"] = "WTB your achievment %s",
		--[[Translation missing --]]
		["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
		--[[Translation missing --]]
		["grats_have_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_have_10"] = "Good work %s, now we both have it",
		--[[Translation missing --]]
		["grats_have_2"] = "Gz %s, I have that one too",
		--[[Translation missing --]]
		["grats_have_3"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_have_4"] = "Welcome to the club %s",
		--[[Translation missing --]]
		["grats_have_5"] = "I can still rememeber getting that one %s",
		--[[Translation missing --]]
		["grats_have_6"] = "That one is a rite of passge %s",
		--[[Translation missing --]]
		["grats_have_7"] = "I worked on that for ages %s, grats!",
		--[[Translation missing --]]
		["grats_have_8"] = "I remember doing that, %s, grats!",
		--[[Translation missing --]]
		["grats_have_9"] = "Nicely done %s",
		--[[Translation missing --]]
		["grats_link"] = "say grats",
		--[[Translation missing --]]
		["module_desc"] = "Achievment related customizations",
		--[[Translation missing --]]
		["module_name"] = "Achievements",
		--[[Translation missing --]]
		["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
		--[[Translation missing --]]
		["showCompletedDate_name"] = "Show completed date",
		--[[Translation missing --]]
		["showGratsLink_desc"] = "Show a clickable link which sends a grats message",
		--[[Translation missing --]]
		["showGratsLink_name"] = "Show grats link",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)



L = {
	["Achievements"] = {
		--[[Translation missing --]]
		["completed"] = "Completed %s",
		["customGrats_defualt"] = "GG %s !",
		["customGrats_desc"] = "Utiliser un message personnalisé à la place d'un message aléatoire ",
		["customGrats_name"] = "Utiliser un message personnalisé de félicitations",
		["customGratsText_desc"] = "Message de félicitations personnalisé. Tapez n'importe quel texte, vous pouvez ajouter le nom du joueur avec la variable '%s'",
		["customGratsText_name"] = "Message de gratification",
		--[[Translation missing --]]
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		--[[Translation missing --]]
		["dontShowAchievements_name"] = "Don't show achievements",
		["grats_donthave_1"] = "Félicitations %s !",
		["grats_donthave_10"] = "Il faut aussi que je fasse ce haut fait %s",
		["grats_donthave_2"] = "GG %s, je ne l'ai pas encore fini celui là",
		["grats_donthave_3"] = "Il faut aussi que je le fasse celui là %s, gg !",
		["grats_donthave_4"] = "Bien joué %s",
		["grats_donthave_5"] = "Je suis trop jaloux %s, gg !  :)",
		["grats_donthave_6"] = "Ça fait un baille que je tente de l'avoir celui là %s ^^",
		["grats_donthave_7"] = "Il me manque toujours celui là %s, gg !",
		["grats_donthave_8"] = "Tu ne veux pas aussi me le faire %s ? xD",
		["grats_donthave_9"] = "Vivement que je le fasse aussi %s, bien joué !",
		["grats_have_1"] = "Félicitations %s",
		["grats_have_10"] = "Bien joué %s, maintenant on l'a tous les deux :)",
		["grats_have_2"] = "GG %s, je l'ai aussi validé",
		["grats_have_3"] = "Waw %s, c'est bien joué !",
		["grats_have_4"] = "Bienvenue au club %s",
		["grats_have_5"] = "Je me souviens encore de la fois où j'ai réalisé ce HF %s",
		["grats_have_6"] = "Celui là est un incontournable %s",
		["grats_have_7"] = "J'ai mis du temps à l'obtenir celui là %s, gg !",
		["grats_have_8"] = "Je me souviens encore de la fois où je l'ai réalisé, %s, gg !",
		["grats_have_9"] = "Bien joué %s",
		["grats_link"] = "dire gg",
		--[[Translation missing --]]
		["module_desc"] = "Achievment related customizations",
		--[[Translation missing --]]
		["module_name"] = "Achievements",
		--[[Translation missing --]]
		["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
		--[[Translation missing --]]
		["showCompletedDate_name"] = "Show completed date",
		["showGratsLink_desc"] = "Montrer un lien clicable qui envoie des messages de félicitations",
		["showGratsLink_name"] = "Montrer un lien de félicitations",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR", L)



L = {
	["Achievements"] = {
		["completed"] = "Abgeschlossen %s",
		["customGrats_defualt"] = "Grats %s",
		["customGrats_desc"] = "Verwende eine eigene Glückwunsch-Nachricht anstelle einer zufälligen",
		["customGrats_name"] = "Verwende eine eigene Glückwunsch-Nachricht",
		["customGratsText_desc"] = "Eigene Glückwunsch-Nachricht. Gib einen beliebigen Text für die Glückwunsch-Nachricht ein. Wenn du den Namen des Spielers einfügen möchtest, verwende '%s' als Platzhalter.",
		["customGratsText_name"] = "Glückwunsch-Nachricht",
		["dontShowAchievements_desc"] = "Verstecke alle Erfolgsmeldungen",
		["dontShowAchievements_name"] = "Zeige keine Erfolge",
		["grats_donthave_1"] = "Grats %s",
		["grats_donthave_10"] = "Ich kann es kaum erwarten, diesen %s zu bekommen",
		["grats_donthave_2"] = "Gz %s, diesen brauche ich noch",
		["grats_donthave_3"] = "Ich will diesen auch %s, grats!",
		["grats_donthave_4"] = "Wow %s, der ist großartig",
		["grats_donthave_5"] = "Ich bin neidisch %s, grats!",
		["grats_donthave_6"] = "Daran arbeite ich schon seit Ewigkeiten %s",
		["grats_donthave_7"] = "Brauche den noch %s, grats!",
		["grats_donthave_8"] = "WTB dein Erfolg %s",
		["grats_donthave_9"] = "Ich freue mich darauf %s, gute Arbeit!",
		["grats_have_1"] = "Grats %s",
		["grats_have_10"] = "Gute Arbeit %s, jetzt haben wir beide den",
		["grats_have_2"] = "Gz %s, ich habe den auch",
		["grats_have_3"] = "Wow %s, der ist großartig",
		["grats_have_4"] = "Willkommen im Club %s",
		["grats_have_5"] = "Ich kann mich immer noch daran erinnern, diesen %s bekommen zu haben",
		["grats_have_6"] = "Dieser ist ein Übergangsritus %s",
		["grats_have_7"] = "Ich habe ewig daran gearbeitet %s, grats!",
		["grats_have_8"] = "Ich erinnere mich, als ich den gemacht habe, %s, grats!",
		["grats_have_9"] = "Schön gemacht %s",
		["grats_link"] = "sag grats",
		["module_desc"] = "Erfolgsbezogene Anpassungen",
		["module_name"] = "Erfolge",
		["showCompletedDate_desc"] = "Zeigt das Datum, an dem du den Erfolg abgeschlossen hast, neben dem Link an",
		["showCompletedDate_name"] = "Abschließungsdatum anzeigen",
		["showGratsLink_desc"] = "Zeigt einen anklickbaren Link an, der eine Grats-Nachricht sendet",
		["showGratsLink_name"] = "Grats Link anzeigen",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)



L = {
	["Achievements"] = {
		["completed"] = "%s 완료",
		["customGrats_defualt"] = "%s님 축하!",
		["customGrats_desc"] = "임의의 메시지 대신 사용자 정의 축하 메시지를 사용하십시오.",
		["customGrats_name"] = "사용자 정의 축하 메세지 사용",
		["customGratsText_desc"] = "사용자 정의 축하 메시지. 플레이어의 이름을 포함하려면 '%s' 변수를 사용하고 축하 메시지에 원하는 텍스트를 입력하십시오.",
		["customGratsText_name"] = "축하 메세지",
		["dontShowAchievements_desc"] = "모든 업적 메세지 숨기기",
		["dontShowAchievements_name"] = "업적 보이지 않기",
		["grats_donthave_1"] = "%s님 축하해요.",
		["grats_donthave_10"] = "난 하나뿐인 %s님을 얻기 위해 기다릴 수 없어요.",
		["grats_donthave_2"] = "%s님 축하, 난 아직도 그게 필요해요.",
		["grats_donthave_3"] = "나는 %s님을 원해요, 축하!",
		["grats_donthave_4"] = "와우 %s님 대단하심.",
		["grats_donthave_5"] = "난 %s님이 질투나, 축하!",
		["grats_donthave_6"] = "나는 %s님을 위해 그 작업을 해왔어요.",
		["grats_donthave_7"] = "아직 %s님이 필요함. 축하!",
		["grats_donthave_8"] = "%s님 업적을 사고싶어요.",
		["grats_donthave_9"] = "나도 %s님을 기대하고 있어요. 잘했어요!",
		["grats_have_1"] = "%s님 축하해요.",
		["grats_have_10"] = "%s님 잘했어요. 이제 우리 둘 다 갖고 있네요.",
		["grats_have_2"] = "%s님 축하! 나도 마찬가지죠.",
		["grats_have_3"] = "와우 %s님 대단하심.",
		["grats_have_4"] = "%s님 클럽에 오신 것을 환영합니다.",
		["grats_have_5"] = "나는 여전히 %s님께 받은 것을 기억할 수 있어요.",
		["grats_have_6"] = "저건 %s님의 통과 의례다.",
		["grats_have_7"] = "%s님 오랫동안 작업했죠. 축하해요!",
		["grats_have_8"] = "%s님 나도 기억나요. 축하!",
		["grats_have_9"] = "%s님 잘하셨어요.",
		["grats_link"] = "축하한다고 말함",
		["module_desc"] = "업적 관련 사용자 설정",
		["module_name"] = "업적 [Achievements]",
		["showCompletedDate_desc"] = "링크 옆에 업적을 완료 한 날짜 표시",
		["showCompletedDate_name"] = "완료 날짜 표시",
		["showGratsLink_desc"] = "축하 메시지를 보내는 클릭 가능한 링크 표시",
		["showGratsLink_name"] = "축하 링크 표시",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",  L)


L = {
	["Achievements"] = {
		--[[Translation missing --]]
		["completed"] = "Completed %s",
		--[[Translation missing --]]
		["customGrats_defualt"] = "Grats %s",
		--[[Translation missing --]]
		["customGrats_desc"] = "Use a custom grats message instead of a random one",
		--[[Translation missing --]]
		["customGrats_name"] = "Use Custom Grats Message",
		--[[Translation missing --]]
		["customGratsText_desc"] = "Custom grats message. Type any text you wish for your grats message, if you want to include the player's name use '%s' as a placeholder",
		--[[Translation missing --]]
		["customGratsText_name"] = "Grats Message",
		--[[Translation missing --]]
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		--[[Translation missing --]]
		["dontShowAchievements_name"] = "Don't show achievements",
		--[[Translation missing --]]
		["grats_donthave_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_donthave_10"] = "I can't wait to get that one %s",
		--[[Translation missing --]]
		["grats_donthave_2"] = "Gz %s, I still need that",
		--[[Translation missing --]]
		["grats_donthave_3"] = "I want that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_4"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_donthave_5"] = "I'm jealous %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_6"] = "I have been working on that for ages %s",
		--[[Translation missing --]]
		["grats_donthave_7"] = "Still need that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_8"] = "WTB your achievment %s",
		--[[Translation missing --]]
		["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
		--[[Translation missing --]]
		["grats_have_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_have_10"] = "Good work %s, now we both have it",
		--[[Translation missing --]]
		["grats_have_2"] = "Gz %s, I have that one too",
		--[[Translation missing --]]
		["grats_have_3"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_have_4"] = "Welcome to the club %s",
		--[[Translation missing --]]
		["grats_have_5"] = "I can still rememeber getting that one %s",
		--[[Translation missing --]]
		["grats_have_6"] = "That one is a rite of passge %s",
		--[[Translation missing --]]
		["grats_have_7"] = "I worked on that for ages %s, grats!",
		--[[Translation missing --]]
		["grats_have_8"] = "I remember doing that, %s, grats!",
		--[[Translation missing --]]
		["grats_have_9"] = "Nicely done %s",
		--[[Translation missing --]]
		["grats_link"] = "say grats",
		--[[Translation missing --]]
		["module_desc"] = "Achievment related customizations",
		--[[Translation missing --]]
		["module_name"] = "Achievements",
		--[[Translation missing --]]
		["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
		--[[Translation missing --]]
		["showCompletedDate_name"] = "Show completed date",
		--[[Translation missing --]]
		["showGratsLink_desc"] = "Show a clickable link which sends a grats message",
		--[[Translation missing --]]
		["showGratsLink_name"] = "Show grats link",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",  L)


L = {
	["Achievements"] = {
		["completed"] = "сделано",
		["customGrats_defualt"] = "Поздравляю %s ",
		["customGrats_desc"] = "Использовать персональное сообщение вместо рандомного ",
		["customGrats_name"] = "Использовать своё ПОЗДРАВИТЕЛЬНОЕ сообщение ",
		["customGratsText_desc"] = "Стандартное ГРАЦ сообщение. Напишите свой текст ГРАЦ сообщения. Если хотите включить имя игрока в сообщение - то добавьте %s  ",
		["customGratsText_name"] = "Поздравительное сообщение ",
		["dontShowAchievements_desc"] = "Скрыть все сообщения о достижениях",
		["dontShowAchievements_name"] = "Не показывать достижения ",
		["grats_donthave_1"] = "Поздравляю %s ",
		["grats_donthave_10"] = "Я не могу дождаться, когда тоже получу его %s ",
		["grats_donthave_2"] = "Гц %s, мне всё ещё нужно это достижение ",
		["grats_donthave_3"] = "Я тоже его хочу %s, гц! ",
		["grats_donthave_4"] = "Ого %s, гц!  ",
		["grats_donthave_5"] = "Как же я завидую %s, гц!  ",
		["grats_donthave_6"] = "Я столько лет работаю над ним %s, гц!  ",
		["grats_donthave_7"] = "Мне всё ещё нужно это достижение %s, гц! ",
		["grats_donthave_8"] = "Жду ещё достижений %s, гц!  ",
		["grats_donthave_9"] = "С нетерпением хочу получить такую же %s, гц! ",
		["grats_have_1"] = "Гц %s ",
		["grats_have_10"] = "Отличная работа %s, теперь у нас обоих есть это достижение ",
		["grats_have_2"] = "Гц %s, я такую уже сделал ",
		["grats_have_3"] = "Вау %s, зачётно! ",
		["grats_have_4"] = "Да светится сие достижение на глубине твоего моря ачив %s ",
		["grats_have_5"] = "Не могу забыть, как трудно получал её %s . ",
		["grats_have_6"] = "%s, сделал дело - гуляй смело!  ",
		["grats_have_7"] = "Я столько лет трудился над ним %s, гц! ",
		["grats_have_8"] = "Я помню, как это делалось,% s, Грац! ",
		["grats_have_9"] = "Красиво сделано %s",
		["grats_link"] = "GRATS ",
		["module_desc"] = "Индивидуальные настройки, связанные с достижениями ",
		["module_name"] = "Достижения ",
		["showCompletedDate_desc"] = "Показывать дату, когда вы сделали достижение, рядом с ссылкой ",
		["showCompletedDate_name"] = "Показывать дату завершения ",
		["showGratsLink_desc"] = "Показывать ссылку GRATS для поздравления ",
		["showGratsLink_name"] = "Показывать GRATS ссылку ",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",  L)


L = {
	["Achievements"] = {
		["completed"] = "已完成 %s",
		["customGrats_defualt"] = "恭喜 %s",
		["customGrats_desc"] = "使用自定义的恭喜消息替代随机的消息",
		["customGrats_name"] = "使用自定义的恭喜消息",
		["customGratsText_desc"] = "自定义恭喜消息。编辑输入任意文字成为你的恭喜消息，如果要包含玩家名字 请在文字中使用“％s”代替名字。",
		["customGratsText_name"] = "恭喜消息",
		["dontShowAchievements_desc"] = "隐藏所有与成就相关的消息",
		["dontShowAchievements_name"] = "不显示成就",
		["grats_donthave_1"] = "恭喜 %s",
		["grats_donthave_10"] = "我急切的希望收到那个 %s",
		["grats_donthave_2"] = "恭贺 %s, 我仍需完成",
		["grats_donthave_3"] = "我也想完成 %s, 恭喜!",
		["grats_donthave_4"] = "哇 %s 太棒了",
		["grats_donthave_5"] = "好羡慕 %s, 恭喜!",
		["grats_donthave_6"] = "这段时间我一直在努力 %s",
		["grats_donthave_7"] = "仍需努力完成 %s, 恭喜!",
		["grats_donthave_8"] = "好像拿到你获得的成就 %s",
		["grats_donthave_9"] = "期待自己是下一个完成的 %s, 好厉害!",
		["grats_have_1"] = "恭喜 %s",
		["grats_have_10"] = "好样的 %s, 现在我们都共享到了",
		["grats_have_2"] = "敬贺 %s, 我也有了",
		["grats_have_3"] = "哇 %s 太棒了",
		["grats_have_4"] = "欢迎加入成就党 %s",
		["grats_have_5"] = "我始终心心念念想获得那个 %s",
		["grats_have_6"] = "那是一种仪式般的历程 %s",
		["grats_have_7"] = "我已经做了很久了 %s, 恭喜!",
		["grats_have_8"] = "我一直没忘做那个, %s,恭喜!",
		["grats_have_9"] = "干得漂亮 %s",
		["grats_link"] = "表示恭喜",
		["module_desc"] = "与成就相关的自定义",
		["module_name"] = "成就",
		["showCompletedDate_desc"] = "在链接旁边显示你的成就完成日期",
		["showCompletedDate_name"] = "显示完成日期",
		["showGratsLink_desc"] = "显示发送恭喜消息的可点击链接",
		["showGratsLink_name"] = "显示恭喜链接",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",  L)


L = {
	["Achievements"] = {
		["completed"] = "Completado %s",
		["customGrats_defualt"] = "Felicidades %s",
		["customGrats_desc"] = "Usar un mensaje de felicitación personalizado en lugar de uno aleatorio",
		["customGrats_name"] = "Mensaje de felicitación personalizado",
		["customGratsText_desc"] = "Mensaje de felicitación personalizado. Escriba el mensaje de felicitación que usted desee, si quiere incluir el nombre del jugador use '%s' como indicador",
		["customGratsText_name"] = "Mensaje de felicitación",
		--[[Translation missing --]]
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		--[[Translation missing --]]
		["dontShowAchievements_name"] = "Don't show achievements",
		["grats_donthave_1"] = "Felicidades %s",
		["grats_donthave_10"] = "No puedo esperar a obtener ese %s",
		["grats_donthave_2"] = "Felicidades %s, yo aún necesito ese",
		--[[Translation missing --]]
		["grats_donthave_3"] = "I want that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_4"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_donthave_5"] = "I'm jealous %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_6"] = "I have been working on that for ages %s",
		--[[Translation missing --]]
		["grats_donthave_7"] = "Still need that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_8"] = "WTB your achievment %s",
		--[[Translation missing --]]
		["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
		--[[Translation missing --]]
		["grats_have_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_have_10"] = "Good work %s, now we both have it",
		--[[Translation missing --]]
		["grats_have_2"] = "Gz %s, I have that one too",
		--[[Translation missing --]]
		["grats_have_3"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_have_4"] = "Welcome to the club %s",
		--[[Translation missing --]]
		["grats_have_5"] = "I can still rememeber getting that one %s",
		--[[Translation missing --]]
		["grats_have_6"] = "That one is a rite of passge %s",
		--[[Translation missing --]]
		["grats_have_7"] = "I worked on that for ages %s, grats!",
		--[[Translation missing --]]
		["grats_have_8"] = "I remember doing that, %s, grats!",
		--[[Translation missing --]]
		["grats_have_9"] = "Nicely done %s",
		["grats_link"] = "Felicitar",
		["module_desc"] = "Ajustes relacionados a logros",
		["module_name"] = "Logros",
		["showCompletedDate_desc"] = "Muestra la fecha en la que se completo el logro luego del enlace",
		["showCompletedDate_name"] = "Mostrar fecha de finalización",
		["showGratsLink_desc"] = "Muestra a enlace clickable para enviar un mensaje de felicitación",
		["showGratsLink_name"] = "Mostrar enlace de felicitación",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",  L)


L = {
	["Achievements"] = {
		--[[Translation missing --]]
		["completed"] = "Completed %s",
		--[[Translation missing --]]
		["customGrats_defualt"] = "Grats %s",
		--[[Translation missing --]]
		["customGrats_desc"] = "Use a custom grats message instead of a random one",
		--[[Translation missing --]]
		["customGrats_name"] = "Use Custom Grats Message",
		--[[Translation missing --]]
		["customGratsText_desc"] = "Custom grats message. Type any text you wish for your grats message, if you want to include the player's name use '%s' as a placeholder",
		--[[Translation missing --]]
		["customGratsText_name"] = "Grats Message",
		--[[Translation missing --]]
		["dontShowAchievements_desc"] = "Hide all achievement messages",
		--[[Translation missing --]]
		["dontShowAchievements_name"] = "Don't show achievements",
		--[[Translation missing --]]
		["grats_donthave_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_donthave_10"] = "I can't wait to get that one %s",
		--[[Translation missing --]]
		["grats_donthave_2"] = "Gz %s, I still need that",
		--[[Translation missing --]]
		["grats_donthave_3"] = "I want that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_4"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_donthave_5"] = "I'm jealous %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_6"] = "I have been working on that for ages %s",
		--[[Translation missing --]]
		["grats_donthave_7"] = "Still need that one %s, grats!",
		--[[Translation missing --]]
		["grats_donthave_8"] = "WTB your achievment %s",
		--[[Translation missing --]]
		["grats_donthave_9"] = "Looking forward to that one myself %s, good job!",
		--[[Translation missing --]]
		["grats_have_1"] = "Grats %s",
		--[[Translation missing --]]
		["grats_have_10"] = "Good work %s, now we both have it",
		--[[Translation missing --]]
		["grats_have_2"] = "Gz %s, I have that one too",
		--[[Translation missing --]]
		["grats_have_3"] = "Wow %s that's great",
		--[[Translation missing --]]
		["grats_have_4"] = "Welcome to the club %s",
		--[[Translation missing --]]
		["grats_have_5"] = "I can still rememeber getting that one %s",
		--[[Translation missing --]]
		["grats_have_6"] = "That one is a rite of passge %s",
		--[[Translation missing --]]
		["grats_have_7"] = "I worked on that for ages %s, grats!",
		--[[Translation missing --]]
		["grats_have_8"] = "I remember doing that, %s, grats!",
		--[[Translation missing --]]
		["grats_have_9"] = "Nicely done %s",
		--[[Translation missing --]]
		["grats_link"] = "say grats",
		--[[Translation missing --]]
		["module_desc"] = "Achievment related customizations",
		--[[Translation missing --]]
		["module_name"] = "Achievements",
		--[[Translation missing --]]
		["showCompletedDate_desc"] = "Show the date you completed the acheievment next to the link",
		--[[Translation missing --]]
		["showCompletedDate_name"] = "Show completed date",
		--[[Translation missing --]]
		["showGratsLink_desc"] = "Show a clickable link which sends a grats message",
		--[[Translation missing --]]
		["showGratsLink_name"] = "Show grats link",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",  L)
end
--@end-non-debug@


  local repeatPrevention = {}


  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      dontShowAchievements = false,
      showCompletedDate = true,
      showGratsLink = false,
      customGrats = true,
      customGratsText = PL.customGrats_defualt
    }
  })

  Prat:SetModuleOptions(module.name, {
    name = PL.module_name,
    desc = PL.module_desc,
    type = "group",
    args = {
      dontShowAchievements = {
        name = PL.dontShowAchievements_name,
        desc = PL.dontShowAchievements_desc,
        type = "toggle",
        order = 90
      },
      showCompletedDate = {
        name = PL.showCompletedDate_name,
        desc = PL.showCompletedDate_desc,
        type = "toggle",
        order = 100
      },
      showGratsLink = {
        name = PL.showGratsLink_name,
        desc = PL.showGratsLink_desc,
        type = "toggle",
        order = 110
      },
      customGrats = {
        name = PL.customGrats_name,
        desc = PL.customGrats_desc,
        type = "toggle",
        order = 120
      },
      customGratsText = {
        name = PL.customGratsText_name,
        desc = PL.customGratsText_desc,
        type = "input",
        order = 130,
        disabled = function() return not module.db.profile.customGrats end
      }
    }
  })


  local gratsVariantsHave = {
    PL.grats_have_1,
    PL.grats_have_2,
    PL.grats_have_3,
    PL.grats_have_4,
    PL.grats_have_5,
    PL.grats_have_6,
    PL.grats_have_7,
    PL.grats_have_8,
    PL.grats_have_9,
    PL.grats_have_10,
  }
  local gratsVariantsDontHave = {
    PL.grats_donthave_1,
    PL.grats_donthave_2,
    PL.grats_donthave_3,
    PL.grats_donthave_4,
    PL.grats_donthave_5,
    PL.grats_donthave_6,
    PL.grats_donthave_7,
    PL.grats_donthave_8,
    PL.grats_donthave_9,
    PL.grats_donthave_10,
  }

  local function white(text)
    return Prat.CLR:Colorize("ffffff", text)
  end

  local regexp = "(|cffffff00|Hachievement:([0-9]+):(.+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+):([%-0-9]+)|h%[([^]]+)%]|h|r)"
  local gratsLinkType = "gratsl"

  local function buildGratsLink(name, group, channel, achievementId)
    if type(name) == "nil" or type(group) == "nil" then
    else
      return Prat.BuildLink(gratsLinkType, ("%s:%s:%s:%s"):format(name, group, channel or "", tostring(achievementId)), PL.grats_link, "2080a0")
    end

    return ""
  end

  local function ShowOurCompletion(...)
    --        dbg(...)
    local type = Prat.CurrentMessage.CHATTYPE
    if type == "WHISPER_INFORM" then return end

    local text, theirId, theirPlayerGuid, theirDone, theirMonth, theirDay, theirYear, _, _, _, _, theirAchievmentName, frame = ...

    if theirPlayerGuid == "0000000000000000" or not (tostring(theirPlayerGuid):len() > 3) then return end

    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(theirId)

    local _, _, _, _, _, theirName, _ = GetPlayerInfoByGUID(theirPlayerGuid)
    local group = Prat.CurrentMessage.CHATGROUP
    local channelNum = Prat.CurrentMessage.CHATTARGET

    --        dbg(Prat.CurrentMessage)
    if group == "CHANNEL" and not tonumber(channelNum) then return end

    if completed  then
      return Prat:RegisterMatch(text .. module:addDate(day, month, year) .. (theirDone and module:addGrats(theirName, group, channelNum, theirId, Prat.CurrentMessage)) or "")
    elseif theirDone then
      return Prat:RegisterMatch(text .. module:addGrats(theirName, group, channelNum, theirId, Prat.CurrentMessage))
    end
  end

  Prat:SetModulePatterns(module, {
    { pattern = regexp, matchfunc = ShowOurCompletion, priority = 42 },
  })

  function module:OnModuleEnable()
    Prat.EnableProcessingForEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
    Prat.EnableProcessingForEvent("CHAT_MSG_ACHIEVEMENT")
    Prat.RegisterChatEvent(self, "Prat_FrameMessage")
    Prat.RegisterLinkType({ linkid = gratsLinkType, linkfunc = self.OnGratsLink, handler = self }, self.name)
  end

  function module:OnModuleDisable()
    Prat.UnregisterAllChatEvents(self)
  end

  function module:addGrats(name, group, channel, achievementId, m)
    if self.db.profile.showGratsLink then
      return " " .. buildGratsLink(name, group, channel, achievementId)
    end

    return ""
  end

  function module:addDate(day, month, year)
    if self.db.profile.showCompletedDate then
      return " " .. white("(") .. PL.completed:format(FormatShortDate(day, month, year)) .. white(")")
    end

    return ""
  end

  function module:OnGratsLink(link)
    --        dbg(link)
    local theirName, group, channel, id = strsub(link, gratsLinkType:len() + 2):match("([^:]*):([^:]*):([^:]*):([^:]*)")

    local grats

    if self.db.profile.customGrats then
      grats = self.db.profile.customGratsText
    else
      id = tonumber(id)

      local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(id)

      local gratsVariants = wasEarnedByMe and gratsVariantsHave or gratsVariantsDontHave

      local last = repeatPrevention[wasEarnedByMe and 1 or 2]
      local next = math.random(#gratsVariants)

      while next == last do
        next = math.random(#gratsVariants)
      end

      grats = gratsVariants[next]
      repeatPrevention[wasEarnedByMe and 1 or 2] = last
    end

    if group == "WHISPER" or not Prat.CanSendChatMessage(group) then
      SendChatMessage(grats:format(theirName), "WHISPER", nil, theirName)
    elseif Prat.CanSendChatMessage(group) then
      SendChatMessage(grats:format(theirName), group)
    end

    return false
  end

  function module:Prat_FrameMessage(info, message, frame, event)
    if self.db.profile.dontShowAchievements and event == "CHAT_MSG_GUILD_ACHIEVEMENT" then
      message.DONOTPROCESS = true
    end
  end
end)