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

  local PRAT_MODULE = Prat:RequestModuleName("PlayerNames")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

  -- define localized strings
  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["PlayerNames"] = true,
    ["Player name formating options."] = true,
    ["Brackets"] = true,
    ["Square"] = true,
    ["Angled"] = true,
    ["None"] = true,
    ["Class"] = true,
    ["Random"] = true,
    ["Reset Settings"] = true,
    ["No additional coloring"] = true,
    ["Restore default settings, and delete stored character data."] = true,
    ["Sets style of brackets to use around player names."] = true,
    ["Unknown Use Common Color"] = true,
    ["Toggle using a common color for unknown player names."] = true,
    ["Unknown Common Color"] = true,
    ["Set common color of unknown player names."] = true,
    ["Enable TabComplete"] = true,
    ["Toggle tab completion of player names."] = true,
    ["Show Level"] = true,
    ["Toggle level showing."] = true,
    ["Level Color Mode"] = true,
    ["Use Player Color"] = true,
    ["Use Channel Color"] = true,
    ["Color by Level Difference"] = true,
    ["How to color other player's level."] = true,
    ["Show Group"] = true,
    ["Toggle raid group showing."] = true,
    ["Show Raid Target Icon"] = true,
    ["Toggle showing the raid target icon which is currently on the player."] = true,
    ["Use toon name for RealID"] = true,

    -- In the high-cpu pullout
    ["coloreverywhere_name"] = "Color Names Everywhere",
    ["coloreverywhere_desc"] = "Color player names if they appear in the text of the chat message",
    ["hoverhilight_name"] = "Hover Hilighting",
    ["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",
    ["realidcolor_name"] = "RealID Coloring",
    ["realidcolor_desc"] = "RealID Name Coloring",
    ["Keep Info"] = true,
    ["Keep Lots Of Info"] = true,
    ["Keep player information between session for all players except cross-server players"] = true,
    ["Keep player information between session, but limit it to friends and guild members."] = true,
    ["Player Color Mode"] = true,
    ["How to color player's name."] = true,
    ["Unknown Common Color From TasteTheNaimbow"] = true,
    ["Let TasteTheNaimbow set the common color for unknown player names."] = true,
    ["Brackets Common Color"] = true,
    ["Sets common color of brackets to use around player names."] = true,
    ["Brackets Use Common Color"] = true,
    ["Toggle using a common color for brackets around player names."] = true,
    ["linkifycommon_name"] = "Linkify Common Messages",
    ["linkifycommon_desc"] = "Linkify Common Messages",
    msg_stored_data_cleared = "Stored Player Data Cleared",
    ["tabcomplete_name"] = "Possible Names",
    ["Tab completion : "] = true,
    ["Too many matches (%d possible)"] = true,
    ["Actively Query Player Info"] = true,
    ["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = true,
    bnetclienticon_name = "Show BNet Client Icon",
    bnetclienticon_desc = "Show an icon indicating which game or client the Battle.Net friend is using"
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --@non-debug@
  do
      local L

  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = true,
		["Angled"] = true,
		["bnetclienticon_desc"] = "Show an icon indicating which game or client the Battle.Net friend is using",
		["bnetclienticon_name"] = "Show BNet Client Icon",
		["Brackets"] = true,
		["Brackets Common Color"] = true,
		["Brackets Use Common Color"] = true,
		["Class"] = true,
		["Color by Level Difference"] = true,
		["coloreverywhere_desc"] = "Color player names if they appear in the text of the chat message",
		["coloreverywhere_name"] = "Color Names Everywhere",
		["Enable Alt-Invite"] = true,
		["Enable Invite Links"] = true,
		["Enable TabComplete"] = true,
		["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",
		["hoverhilight_name"] = "Hover Hilighting",
		["How to color other player's level."] = true,
		["How to color player's name."] = true,
		["Keep Info"] = true,
		["Keep Lots Of Info"] = true,
		["Keep player information between session for all players except cross-server players"] = true,
		["Keep player information between session, but limit it to friends and guild members."] = true,
		["Let TasteTheNaimbow set the common color for unknown player names."] = true,
		["Level Color Mode"] = true,
		["linkifycommon_desc"] = "Linkify Common Messages",
		["linkifycommon_name"] = "Linkify Common Messages",
		["msg_stored_data_cleared"] = "Stored Player Data Cleared",
		["No additional coloring"] = true,
		["None"] = true,
		["Player Color Mode"] = true,
		["Player name formating options."] = true,
		["PlayerNames"] = true,
		["Prat_Playernames: Stored Player Data Cleared"] = true,
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = true,
		["Random"] = true,
		["realidcolor_desc"] = "RealID Name Coloring",
		["realidcolor_name"] = "RealID Coloring",
		["Reset Settings"] = true,
		["Restore default settings, and delete stored character data."] = true,
		["Set common color of unknown player names."] = true,
		["Sets common color of brackets to use around player names."] = true,
		["Sets style of brackets to use around player names."] = true,
		["Show Group"] = true,
		["Show Level"] = true,
		["Show Raid Target Icon"] = true,
		["Square"] = true,
		["Tab completion : "] = true,
		["tabcomplete_name"] = "Possible Names",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = true,
		["Toggle group invites by alt-clicking on player name."] = true,
		["Toggle level showing."] = true,
		["Toggle raid group showing."] = true,
		["Toggle showing the raid target icon which is currently on the player."] = true,
		["Toggle tab completion of player names."] = true,
		["Toggle using a common color for brackets around player names."] = true,
		["Toggle using a common color for unknown player names."] = true,
		["Too many matches (%d possible)"] = true,
		["Unknown Common Color"] = true,
		["Unknown Common Color From TasteTheNaimbow"] = true,
		["Unknown Use Common Color"] = true,
		["Use Channel Color"] = true,
		["Use Player Color"] = true,
		["Use toon name for RealID"] = true,
	}
}


    PL:AddLocale(PRAT_MODULE, "enUS",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Interroger activement les joueurs",
		["Angled"] = "Chevrons",
		--[[Translation missing --]]
		["bnetclienticon_desc"] = "Show an icon indicating which game or client the Battle.Net friend is using",
		--[[Translation missing --]]
		["bnetclienticon_name"] = "Show BNet Client Icon",
		["Brackets"] = "Crochets",
		["Brackets Common Color"] = "Couleur des crochets",
		["Brackets Use Common Color"] = "Couleur des crochets",
		["Class"] = "Classe du joueur",
		["Color by Level Difference"] = "Différence de niveau",
		["coloreverywhere_desc"] = "Colorier le nom des joueurs si ils apparaissent dans le texte des messages.",
		["coloreverywhere_name"] = "Couleur partout",
		["Enable Alt-Invite"] = "Invitation avec Alt",
		["Enable Invite Links"] = "Liens d'invitation",
		["Enable TabComplete"] = "Complétion avec Tab",
		["hoverhilight_desc"] = "Mettre en surbrillance les lignes de chat d'un joueur spécifique quand la souris survole un lien vers ce joueur",
		["hoverhilight_name"] = "Surbrillance de noms survolés",
		["How to color other player's level."] = "Définit la couleur du niveau des autres joueurs.",
		["How to color player's name."] = "Définit la couleur du nom des joueurs.",
		["Keep Info"] = "Garder les info.",
		["Keep Lots Of Info"] = "Garder beaucoup d'info.",
		["Keep player information between session for all players except cross-server players"] = "Garder les informations sur tous les joueurs entre les sessions sauf pour les joueurs inter-serveurs.",
		["Keep player information between session, but limit it to friends and guild members."] = "Garder les informations sur les joueurs entre les sessions, mais seulement pour les amis et membres de la guilde.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Laisser TasteTheNaimbow définir la couleur des joueurs inconnus.",
		["Level Color Mode"] = "Couleur des niveaux",
		--[[Translation missing --]]
		["linkifycommon_desc"] = "Linkify Common Messages",
		--[[Translation missing --]]
		["linkifycommon_name"] = "Linkify Common Messages",
		--[[Translation missing --]]
		["msg_stored_data_cleared"] = "Stored Player Data Cleared",
		["No additional coloring"] = "Pas de couleur",
		["None"] = "Aucun",
		["Player Color Mode"] = "Couleur des joueurs",
		["Player name formating options."] = "Options de formatage pour les noms des joueurs.",
		["PlayerNames"] = "Nom des joueurs",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Informations des joueurs réinitialisées.",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Interroge le serveur pour tous les noms de joueurs que nous ne connaissons pas. Note : Cela peut être très lent, et les informations ne sont pas sauvegardées.",
		["Random"] = "Aléatoire",
		["realidcolor_desc"] = "Couleur des noms RealID.",
		["realidcolor_name"] = "Couleur RealID",
		["Reset Settings"] = "Réinitialiser",
		["Restore default settings, and delete stored character data."] = "Remets les options par défaut, et supprime toutes les informations enregistrées sur les joueurs.",
		["Set common color of unknown player names."] = "Définit la couleur pour les noms de joueurs inconnus.",
		["Sets common color of brackets to use around player names."] = "Définit la couleur des crochets autour du noms des joueurs.",
		["Sets style of brackets to use around player names."] = "Définit le style des crochets autour du nom des joueurs.",
		["Show Group"] = "Montrer le groupe",
		["Show Level"] = "Montrer le niveau",
		["Show Raid Target Icon"] = "Montrer l'icône de raid",
		["Square"] = "Crochets",
		["Tab completion : "] = "Auto-complétion :",
		["tabcomplete_name"] = "Noms possibles",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Active/Désactive l'invitation de groupe en faisant Alt+clic sur des mots-clé hyperliens comme 'inviter'.",
		["Toggle group invites by alt-clicking on player name."] = "Active/Désactive l'invitation de groupe en faisant Alt+clic sur le nom d'un joueur.",
		["Toggle level showing."] = "Active/Désactive l'affichage du niveau.",
		["Toggle raid group showing."] = "Active/Désactive l'affichage du groupe de raid.",
		["Toggle showing the raid target icon which is currently on the player."] = "Active/Désactive l'affichage de l'icône de raid qui est sur le joueur.",
		["Toggle tab completion of player names."] = "Active/Désactive l'auto-complétion du nom des joueurs.",
		["Toggle using a common color for brackets around player names."] = "Active/Désactive l'utilisation d'une couleur commune pour les crochets autour du nom des joueurs.",
		["Toggle using a common color for unknown player names."] = "Active/Désactive l'utilisation d'une couleur commune pour les joueurs inconnus.",
		["Too many matches (%d possible)"] = "Trop de résultats (%d possibles)",
		["Unknown Common Color"] = "Couleur pour inconnu",
		--[[Translation missing --]]
		["Unknown Common Color From TasteTheNaimbow"] = "Unknown Common Color From TasteTheNaimbow",
		["Unknown Use Common Color"] = "Couleur pour inconnu",
		["Use Channel Color"] = "Couleur du canal",
		["Use Player Color"] = "Couleur du joueur",
		--[[Translation missing --]]
		["Use toon name for RealID"] = "Use toon name for RealID",
	}
}


    PL:AddLocale(PRAT_MODULE, "frFR",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Spielerinformationen aktiv abfragen",
		["Angled"] = "Abgewinkelt",
		["bnetclienticon_desc"] = "Zeigt ein Symbol an, das angibt, welches Spiel oder welchen Client der Battle.Net-Freund verwendet",
		["bnetclienticon_name"] = "BNet-Client Symbol anzeigen",
		["Brackets"] = "Klammern",
		["Brackets Common Color"] = "Standardfarbe der Klammern",
		["Brackets Use Common Color"] = "Klammern verwenden die Standardfarbe",
		["Class"] = "Klasse",
		["Color by Level Difference"] = "Farbe nach Stufenunterschied",
		["coloreverywhere_desc"] = "Spielernamen einfärben, wenn diese im Text einer Chat-Mitteilung auftreten.",
		["coloreverywhere_name"] = "Namen überall einfärben",
		["Enable Alt-Invite"] = "Alternative Einladung aktivieren",
		["Enable Invite Links"] = "Einladungs-Links aktivieren",
		["Enable TabComplete"] = "TabComplete aktivieren",
		["hoverhilight_desc"] = "Chat-Zeilen eines bestimmten Spielers hervorheben, wenn die Maus über den Spielerlink gelegt wird.",
		["hoverhilight_name"] = "Schwebendes Hervorheben",
		["How to color other player's level."] = "Wie die Stufen anderer Spieler eingefärbt werden sollen.",
		["How to color player's name."] = "Wie die Namen der Spieler eingefärbt werden sollen.",
		["Keep Info"] = "Informationen merken",
		["Keep Lots Of Info"] = "Viele Informationen speichern",
		["Keep player information between session for all players except cross-server players"] = "Spielerinformationen aller Spieler außer Spielern anderer Server zwischen Sitzungen merken.",
		["Keep player information between session, but limit it to friends and guild members."] = "Spielerinformationen zwischen Sitzungen speichern, aber schränke dies ein auf Freunde und Gildenmitglieder.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Lasse TasteTheNaimbow die übliche Farbe für unbekannte Spielernamen einstellen.",
		["Level Color Mode"] = "Stufenfarbe-Modus",
		["linkifycommon_desc"] = "Allgemeine Mitteilungen in Links umwandeln",
		["linkifycommon_name"] = "Allgemeine Mitteilungen in Links umwandeln",
		["msg_stored_data_cleared"] = "Gespeicherte Spielerdaten gelöscht",
		["No additional coloring"] = "Keine zusätzliche Einfärbung",
		["None"] = "Keine",
		["Player Color Mode"] = "Spieler Farbmodus",
		["Player name formating options."] = "Formatierungsoptionen für Spielernamen.",
		["PlayerNames"] = "Spielernamen",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Gespeicherte Spielerdaten gelöscht",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Alle uns unbekannten Spielernamen beim Server abfragen. Merke: dies passiert ziemlich langsam und diese Daten sind nicht gespeichert.",
		["Random"] = "Zufällig",
		["realidcolor_desc"] = "RealID-Namenseinfärbung",
		["realidcolor_name"] = "RealID-Einfärbung",
		["Reset Settings"] = "Einstellungen zurücksetzen",
		["Restore default settings, and delete stored character data."] = "Standardeinstellungen wiederherstellen und gespeicherte Charakterdaten löschen.",
		["Set common color of unknown player names."] = "Allgemein übliche Farbe bei unbekannten Spielernamen einstellen.",
		["Sets common color of brackets to use around player names."] = "Allgemein übliche Farbe der Klammern bei Spielernamen einstellen.",
		["Sets style of brackets to use around player names."] = "Stil der Klammern bei Spielernamen einstellen.",
		["Show Group"] = "Gruppe anzeigen",
		["Show Level"] = "Stufe anzeigen",
		["Show Raid Target Icon"] = "Zielmarkierungssymbol anzeigen",
		["Square"] = "Quadrat",
		["Tab completion : "] = "Tab-Ergänzung:",
		["tabcomplete_name"] = "Mögliche Namen",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Gruppeneinladungen umschalten, indem Hyperlinks von Stichworten wie \"invite\" bei gleichzeitigem Drücken der Alt-Taste angeklickt werden.",
		["Toggle group invites by alt-clicking on player name."] = "Gruppeneinladungen umschalten, indem Spielernamen bei gleichzeitigem Drücken der Alt-Taste angeklickt werden.",
		["Toggle level showing."] = "Stufenanzeige umschalten.",
		["Toggle raid group showing."] = "Schlachtzugsgruppenanzeige umschalten.",
		["Toggle showing the raid target icon which is currently on the player."] = "Anzeige von Schlachtzugsziel-Symbol, welches gegenwärtig dem Spieler zugewiesen ist, umschalten.",
		["Toggle tab completion of player names."] = "Tag-Ergänzung von Spielernamen umschalten.",
		["Toggle using a common color for brackets around player names."] = "Die Verwendung der allgemein üblichen Farbe für Klammern bei Spielernamen umschalten.",
		["Toggle using a common color for unknown player names."] = "Die Verwendung der allgemein üblichen Farbe für unbekannte Spielernamen umschalten.",
		["Too many matches (%d possible)"] = "Zu viele Entsprechungen (%d möglich)",
		["Unknown Common Color"] = "Unbekannte übliche Farbe",
		["Unknown Common Color From TasteTheNaimbow"] = "Unbekannte übliche Farbe von TasteTheNaimbow",
		["Unknown Use Common Color"] = "Unbekannt - übliche Farbe verwenden",
		["Use Channel Color"] = "Kanalfarbe verwenden",
		["Use Player Color"] = "Spielerfarbe verwenden",
		["Use toon name for RealID"] = "Charakternamen statt RealID verwenden",
	}
}


    PL:AddLocale(PRAT_MODULE, "deDE",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "적극적인 플레이어 정보 요청",
		["Angled"] = "<플레이어>",
		["bnetclienticon_desc"] = "Battle.Net 친구가 사용중인 게임 또는 클라이언트를 나타내는 아이콘 표시",
		["bnetclienticon_name"] = "베틀넷 클라이언트 아이콘 표시",
		["Brackets"] = "괄호 선택",
		["Brackets Common Color"] = "괄호 색상",
		["Brackets Use Common Color"] = "괄호에 색상 사용",
		["Class"] = "직업",
		["Color by Level Difference"] = "레벨 차이에 의한 색상",
		["coloreverywhere_desc"] = "대화 메시지에 나타나는 플레이어 이름에 색상 적용",
		["coloreverywhere_name"] = "모든 곳의 이름에 색상 사용",
		["Enable Alt-Invite"] = "Alt-초대 켜기",
		["Enable Invite Links"] = "초대 링크 켜기",
		["Enable TabComplete"] = "탭 완성 켜기",
		["hoverhilight_desc"] = "플레이어 링크에 마우스를 올리면 특정 플레이어의 대화 내용을 강조합니다",
		["hoverhilight_name"] = "마우스 오버 강조",
		["How to color other player's level."] = "다른 플레이어의 레벨 색상화 방법을 설정합니다.",
		["How to color player's name."] = "플레이어의 이름 색상화 방법을 설정합니다.",
		["Keep Info"] = "친구/길드원 정보 저장",
		["Keep Lots Of Info"] = "모든 플레이어 정보 저장",
		["Keep player information between session for all players except cross-server players"] = "다른 서버를 제외한 모든 플레이어의 정보를 세션 간 유지합니다",
		["Keep player information between session, but limit it to friends and guild members."] = "친구와 길드원의 정보를 세션 간 유지합니다",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "알 수 없는 플레이어 이름에 대한 색상으로 TasteTheNaimBow 애드온의 설정을 사용합니다.",
		["Level Color Mode"] = "레벨 색상 설정",
		["linkifycommon_desc"] = "일반 메시지 링크",
		["linkifycommon_name"] = "일반 메시지 링크",
		["msg_stored_data_cleared"] = "저장된 플레이어 데이터가 지워짐",
		["No additional coloring"] = "사용 안함",
		["None"] = "안함",
		["Player Color Mode"] = "플레이어 색상 설정",
		["Player name formating options."] = "플레이어 이름 형식화 설정입니다.",
		["PlayerNames"] = "플레이어 이름",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: 저장된 플레이어 정보 초기화",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "모르는 모든 플레이어 이름 정보를 서버에 요청합니다. 주의: 작동 시 느려질 수 있으며, 수집된 정보들은 저장되지 않습니다.",
		["Random"] = "무작위",
		["realidcolor_desc"] = "실명ID 이름에 색을 입힙니다",
		["realidcolor_name"] = "실명ID 색 입히기",
		["Reset Settings"] = "설정 초기화",
		["Restore default settings, and delete stored character data."] = "기본 설정을 복구하고 저장된 캐릭터 설정을 지웁니다.",
		["Set common color of unknown player names."] = "알 수 없는 플레이어 이름의 색상을 설정합니다.",
		["Sets common color of brackets to use around player names."] = "플레이어 이름 주위에 사용할 괄호의 색상을 설정합니다.",
		["Sets style of brackets to use around player names."] = "플레이어 이름 주위에 사용할 괄호의 모양을 설정합니다.",
		["Show Group"] = "그룹 표시",
		["Show Level"] = "레벨 표시",
		["Show Raid Target Icon"] = "전술 아이콘 표시",
		["Square"] = "사각형",
		["Tab completion : "] = "탭 완성 :",
		["tabcomplete_name"] = "가능한 이름",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "'초대' 같은 링크된 단어를 Alt-클릭하여 초대합니다.",
		["Toggle group invites by alt-clicking on player name."] = "플레이어 이름을 Alt-클릭하여 초대합니다.",
		["Toggle level showing."] = "레벨을 표시합니다.",
		["Toggle raid group showing."] = "공격대 파티를 표시합니다.",
		["Toggle showing the raid target icon which is currently on the player."] = "플레이어에게 지정된 전술 아이콘을 표시합니다.",
		["Toggle tab completion of player names."] = "플레이어 이름의 탭 완성을 켭니다.",
		["Toggle using a common color for brackets around player names."] = "플레이어 이름 주위 괄호에 색상을 입힙니다.",
		["Toggle using a common color for unknown player names."] = "알 수 없는 플레이어 이름에 색상을 입힙니다.",
		["Too many matches (%d possible)"] = "너무 많은 일치 (%d 가능)",
		["Unknown Common Color"] = "알 수 없는 색상",
		["Unknown Common Color From TasteTheNaimbow"] = "알 수 없는 이름에 TasteTheNaimbow 색상 사용",
		["Unknown Use Common Color"] = "알 수 없는 이름에 색상 사용",
		["Use Channel Color"] = "채널 색상 사용",
		["Use Player Color"] = "플레이어 색상 사용",
		["Use toon name for RealID"] = "실명ID에 별명 사용",
	}
}


    PL:AddLocale(PRAT_MODULE, "koKR",L)


  
L = {
	["PlayerNames"] = {
		--[[Translation missing --]]
		["Actively Query Player Info"] = "Actively Query Player Info",
		--[[Translation missing --]]
		["Angled"] = "Angled",
		--[[Translation missing --]]
		["bnetclienticon_desc"] = "Show an icon indicating which game or client the Battle.Net friend is using",
		--[[Translation missing --]]
		["bnetclienticon_name"] = "Show BNet Client Icon",
		--[[Translation missing --]]
		["Brackets"] = "Brackets",
		--[[Translation missing --]]
		["Brackets Common Color"] = "Brackets Common Color",
		--[[Translation missing --]]
		["Brackets Use Common Color"] = "Brackets Use Common Color",
		--[[Translation missing --]]
		["Class"] = "Class",
		--[[Translation missing --]]
		["Color by Level Difference"] = "Color by Level Difference",
		--[[Translation missing --]]
		["coloreverywhere_desc"] = "Color player names if they appear in the text of the chat message",
		--[[Translation missing --]]
		["coloreverywhere_name"] = "Color Names Everywhere",
		--[[Translation missing --]]
		["Enable Alt-Invite"] = "Enable Alt-Invite",
		--[[Translation missing --]]
		["Enable Invite Links"] = "Enable Invite Links",
		--[[Translation missing --]]
		["Enable TabComplete"] = "Enable TabComplete",
		--[[Translation missing --]]
		["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",
		--[[Translation missing --]]
		["hoverhilight_name"] = "Hover Hilighting",
		--[[Translation missing --]]
		["How to color other player's level."] = "How to color other player's level.",
		--[[Translation missing --]]
		["How to color player's name."] = "How to color player's name.",
		--[[Translation missing --]]
		["Keep Info"] = "Keep Info",
		--[[Translation missing --]]
		["Keep Lots Of Info"] = "Keep Lots Of Info",
		--[[Translation missing --]]
		["Keep player information between session for all players except cross-server players"] = "Keep player information between session for all players except cross-server players",
		--[[Translation missing --]]
		["Keep player information between session, but limit it to friends and guild members."] = "Keep player information between session, but limit it to friends and guild members.",
		--[[Translation missing --]]
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Let TasteTheNaimbow set the common color for unknown player names.",
		--[[Translation missing --]]
		["Level Color Mode"] = "Level Color Mode",
		--[[Translation missing --]]
		["linkifycommon_desc"] = "Linkify Common Messages",
		--[[Translation missing --]]
		["linkifycommon_name"] = "Linkify Common Messages",
		--[[Translation missing --]]
		["msg_stored_data_cleared"] = "Stored Player Data Cleared",
		--[[Translation missing --]]
		["No additional coloring"] = "No additional coloring",
		--[[Translation missing --]]
		["None"] = "None",
		--[[Translation missing --]]
		["Player Color Mode"] = "Player Color Mode",
		--[[Translation missing --]]
		["Player name formating options."] = "Player name formating options.",
		--[[Translation missing --]]
		["PlayerNames"] = "PlayerNames",
		--[[Translation missing --]]
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Stored Player Data Cleared",
		--[[Translation missing --]]
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved.",
		--[[Translation missing --]]
		["Random"] = "Random",
		--[[Translation missing --]]
		["realidcolor_desc"] = "RealID Name Coloring",
		--[[Translation missing --]]
		["realidcolor_name"] = "RealID Coloring",
		--[[Translation missing --]]
		["Reset Settings"] = "Reset Settings",
		--[[Translation missing --]]
		["Restore default settings, and delete stored character data."] = "Restore default settings, and delete stored character data.",
		--[[Translation missing --]]
		["Set common color of unknown player names."] = "Set common color of unknown player names.",
		--[[Translation missing --]]
		["Sets common color of brackets to use around player names."] = "Sets common color of brackets to use around player names.",
		--[[Translation missing --]]
		["Sets style of brackets to use around player names."] = "Sets style of brackets to use around player names.",
		--[[Translation missing --]]
		["Show Group"] = "Show Group",
		--[[Translation missing --]]
		["Show Level"] = "Show Level",
		--[[Translation missing --]]
		["Show Raid Target Icon"] = "Show Raid Target Icon",
		--[[Translation missing --]]
		["Square"] = "Square",
		--[[Translation missing --]]
		["Tab completion : "] = "Tab completion : ",
		--[[Translation missing --]]
		["tabcomplete_name"] = "Possible Names",
		--[[Translation missing --]]
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Toggle group invites by alt-clicking hyperlinked keywords like 'invite'.",
		--[[Translation missing --]]
		["Toggle group invites by alt-clicking on player name."] = "Toggle group invites by alt-clicking on player name.",
		--[[Translation missing --]]
		["Toggle level showing."] = "Toggle level showing.",
		--[[Translation missing --]]
		["Toggle raid group showing."] = "Toggle raid group showing.",
		--[[Translation missing --]]
		["Toggle showing the raid target icon which is currently on the player."] = "Toggle showing the raid target icon which is currently on the player.",
		--[[Translation missing --]]
		["Toggle tab completion of player names."] = "Toggle tab completion of player names.",
		--[[Translation missing --]]
		["Toggle using a common color for brackets around player names."] = "Toggle using a common color for brackets around player names.",
		--[[Translation missing --]]
		["Toggle using a common color for unknown player names."] = "Toggle using a common color for unknown player names.",
		--[[Translation missing --]]
		["Too many matches (%d possible)"] = "Too many matches (%d possible)",
		--[[Translation missing --]]
		["Unknown Common Color"] = "Unknown Common Color",
		--[[Translation missing --]]
		["Unknown Common Color From TasteTheNaimbow"] = "Unknown Common Color From TasteTheNaimbow",
		--[[Translation missing --]]
		["Unknown Use Common Color"] = "Unknown Use Common Color",
		--[[Translation missing --]]
		["Use Channel Color"] = "Use Channel Color",
		--[[Translation missing --]]
		["Use Player Color"] = "Use Player Color",
		--[[Translation missing --]]
		["Use toon name for RealID"] = "Use toon name for RealID",
	}
}


    PL:AddLocale(PRAT_MODULE, "esMX",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Активный запрос инфы о игроке",
		["Angled"] = "Треугольные",
		["bnetclienticon_desc"] = "Показывать значок, указывающий, какую игру или клиент использует ваш друг в Battle.Net",
		["bnetclienticon_name"] = "Показать иконку клиента BNet",
		["Brackets"] = "Скобки",
		["Brackets Common Color"] = "Основной цвет скобок",
		["Brackets Use Common Color"] = "Скобки общего цвета",
		["Class"] = "Класс",
		["Color by Level Difference"] = "Окрашивание по отличию в уровне",
		["coloreverywhere_desc"] = "Окраска текст сообщения в цвет имени игрока, если цвет задан",
		["coloreverywhere_name"] = "Цвет имени везде",
		["Enable Alt-Invite"] = "Включить приглашение с кнопкой Alt",
		["Enable Invite Links"] = "Включить приглашение по ссылкам",
		["Enable TabComplete"] = "Включить TabComplete",
		["hoverhilight_desc"] = "Подсвечивает строки чата от определенных игроков при наведении мышкой на их никнейм.",
		["hoverhilight_name"] = "Подсветка при наведении мышкой",
		["How to color other player's level."] = "Как окрашивать уповень игрока.",
		["How to color player's name."] = "Как окрашивать имя игрока.",
		["Keep Info"] = "Хранить информацию",
		["Keep Lots Of Info"] = "Хранить большое количество информации",
		["Keep player information between session for all players except cross-server players"] = "Хранить информацию о всех собеседниках между сессиями за исключением игроков с других серверов",
		["Keep player information between session, but limit it to friends and guild members."] = "Хранить информацию о собеседниках между сессиями, но ограничить этот список только друзьями и членами гильдии.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Позволить TasteTheNaimbow установить общий цветдля неизвестных играков.",
		["Level Color Mode"] = "Режим окрашивания уровня",
		["linkifycommon_desc"] = "Общие сообщения с сылками",
		["linkifycommon_name"] = "Общие сообщения с сылками",
		["msg_stored_data_cleared"] = "Сохраненные данные игрока очищены",
		["No additional coloring"] = "Отключить дополнительное цвето-выделение",
		["None"] = "Нет",
		["Player Color Mode"] = "Режим цвета игрока",
		["Player name formating options."] = "Настройки форматирования имени собеседника.",
		["PlayerNames"] = "Имя игрока",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Информация о собеседниках очищена",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Запрос сервера для всех неизвестных играков. Заметка: Это происходит дастаточно медленно, и их данные не сохраняются.",
		["Random"] = "Случайно",
		["realidcolor_desc"] = "Окрашивание имен RealID",
		["realidcolor_name"] = "RealID Цвет",
		["Reset Settings"] = "Сброс настроек",
		["Restore default settings, and delete stored character data."] = "Восстановить настройки по умолчанию и удалить сохраненную информацию о собеседниках.",
		["Set common color of unknown player names."] = "Выбор цвета, которым будут окрашены неизвестные игроки.",
		["Sets common color of brackets to use around player names."] = "Установить цвет скобок, окружающих имя игрока.",
		["Sets style of brackets to use around player names."] = "Установить стиль скобок вокруг имени собеседника.",
		["Show Group"] = "Показывать группу",
		["Show Level"] = "Показывать уровень",
		["Show Raid Target Icon"] = "Показать иконку цели рейда",
		["Square"] = "Квадратные",
		["Tab completion : "] = "Завершение закладки : ",
		["tabcomplete_name"] = "Возможные имена",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Вкл/выкл приглашение в группу с помощью alt+клик по ключевому слову типа: 'инвайт'.",
		["Toggle group invites by alt-clicking on player name."] = "Включить режим, в котором можно пригласить игрока в группу щелкнув по его имени  с нажатой клавишей Alt.",
		["Toggle level showing."] = "Вкл/выкл отображения уровня собеседника.",
		["Toggle raid group showing."] = "Вкл/выкл отображения рейдовой группы.",
		["Toggle showing the raid target icon which is currently on the player."] = "Вкл/Выкл отображение иконки цели рейда которой помечен игрок.",
		["Toggle tab completion of player names."] = "Вкл/выкл завершение закладки именами играка.",
		["Toggle using a common color for brackets around player names."] = "Включить окрашивание скобок вокруг имени игрока общим, выбранным цветом.",
		["Toggle using a common color for unknown player names."] = "Включить окрашивание имен всех неизвестных собеседников в общий цвет.",
		["Too many matches (%d possible)"] = "За много совпадение (%d возможных)",
		["Unknown Common Color"] = "Общий цвет неизвестных",
		["Unknown Common Color From TasteTheNaimbow"] = "Общая окраска неизвестных из TasteTheNaimbow",
		["Unknown Use Common Color"] = "Общий цвет для неизвестных",
		["Use Channel Color"] = "Использовать цвет канала",
		["Use Player Color"] = "Использовать цвет игрока",
		["Use toon name for RealID"] = "Использовать имя персонажа вместо RealID",
	}
}


    PL:AddLocale(PRAT_MODULE, "ruRU",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "活跃的查询玩家信息",
		["Angled"] = "折角",
		--[[Translation missing --]]
		["bnetclienticon_desc"] = "Show an icon indicating which game or client the Battle.Net friend is using",
		--[[Translation missing --]]
		["bnetclienticon_name"] = "Show BNet Client Icon",
		["Brackets"] = "括号",
		["Brackets Common Color"] = "同一颜色括号",
		["Brackets Use Common Color"] = "使用同一颜色括号",
		["Class"] = "职业",
		["Color by Level Difference"] = "彩色的等级差别",
		["coloreverywhere_desc"] = "彩色显示聊天信息中出现的玩家姓名",
		["coloreverywhere_name"] = "彩色显示姓名在所有地方",
		["Enable Alt-Invite"] = "启用Alt-邀请",
		["Enable Invite Links"] = "启用邀请链接",
		["Enable TabComplete"] = "启用Tab键补全",
		["hoverhilight_desc"] = "当悬停在玩家链接上时高亮该玩家的聊天语句",
		["hoverhilight_name"] = "悬停高亮",
		["How to color other player's level."] = "如何着色其他玩家的等级",
		["How to color player's name."] = "如何着色玩家的名称",
		["Keep Info"] = "保持信息",
		["Keep Lots Of Info"] = "保持大量的信息",
		["Keep player information between session for all players except cross-server players"] = "为除跨服玩家外的所有玩家在会话间保持玩家信息",
		["Keep player information between session, but limit it to friends and guild members."] = "在会话间保持玩家信息,但仅限于朋友和公会成员",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "让TasteTheNaimbow(插件)为未知玩家名称设置公共颜色",
		["Level Color Mode"] = "等级着色模式",
		["linkifycommon_desc"] = "自助链接公共信息",
		["linkifycommon_name"] = "自助链接公共信息",
		--[[Translation missing --]]
		["msg_stored_data_cleared"] = "Stored Player Data Cleared",
		["No additional coloring"] = "无额外着色",
		["None"] = "无",
		["Player Color Mode"] = "玩家着色模式",
		["Player name formating options."] = "玩家名称格式选项",
		["PlayerNames"] = "玩家名称",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_玩家名称: 玩家数据存储已清除",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "为所有未知玩家查询服务器,注意:这将非常缓慢,并且数据不会被存储",
		["Random"] = "随机",
		["realidcolor_desc"] = "实名名字颜色",
		["realidcolor_name"] = "实名颜色",
		["Reset Settings"] = "重置设置",
		["Restore default settings, and delete stored character data."] = "恢复默认设置并删除已存角色数据",
		["Set common color of unknown player names."] = "设置未知玩家名称共有颜色",
		["Sets common color of brackets to use around player names."] = "设置用来围绕玩家名称的括号颜色",
		["Sets style of brackets to use around player names."] = "设置用来围绕玩家名称的括号类型",
		["Show Group"] = "显示团队",
		["Show Level"] = "显示等级",
		["Show Raid Target Icon"] = "显示团队目标图标",
		["Square"] = "直角",
		["Tab completion : "] = "Tab键补全",
		["tabcomplete_name"] = "可能的名称",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "组队邀请用alt-点击超链接的关键词如'邀请'",
		["Toggle group invites by alt-clicking on player name."] = "组队邀请用alt-点击玩家名称",
		["Toggle level showing."] = "等级显示",
		["Toggle raid group showing."] = "团队分组显示",
		["Toggle showing the raid target icon which is currently on the player."] = "显示当前玩家的团队目标图标",
		["Toggle tab completion of player names."] = "Tab键补全玩家姓名",
		["Toggle using a common color for brackets around player names."] = "为括号内玩家姓名使用公共颜色",
		["Toggle using a common color for unknown player names."] = "为位置未知玩家名称使用公共颜色",
		["Too many matches (%d possible)"] = "太多的匹配 (%d可能的)",
		["Unknown Common Color"] = "未知公共颜色",
		["Unknown Common Color From TasteTheNaimbow"] = "未知公共颜色自TasteTheNaimbow",
		["Unknown Use Common Color"] = "未知使用公共颜色",
		["Use Channel Color"] = "使用频道颜色",
		["Use Player Color"] = "使用玩家颜色",
		["Use toon name for RealID"] = "使用角色名代替战网ID",
	}
}


    PL:AddLocale(PRAT_MODULE, "zhCN",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Pedir Información de Jugador Activamente",
		["Angled"] = "Angulo",
		--[[Translation missing --]]
		["bnetclienticon_desc"] = "Show an icon indicating which game or client the Battle.Net friend is using",
		--[[Translation missing --]]
		["bnetclienticon_name"] = "Show BNet Client Icon",
		["Brackets"] = "Corchetes",
		["Brackets Common Color"] = "Color Común Corchetes",
		["Brackets Use Common Color"] = "Utilizar Color Común Corchetes",
		["Class"] = "Clase",
		["Color by Level Difference"] = "Color por Diferencia de Nivel",
		["coloreverywhere_desc"] = "Colorear nombres de jugadores si ellos aparecen en el texto de los mensajes del chat.",
		["coloreverywhere_name"] = "Colorear Nombres Siempre",
		["Enable Alt-Invite"] = "Habilitar Alt-Invitar",
		["Enable Invite Links"] = "Habilitar Enlaces Invitar",
		["Enable TabComplete"] = "Habilitar Ficha completa",
		["hoverhilight_desc"] = "Resaltar líneas de chat de un jugador al situarse sobre su enlace de jugador",
		--[[Translation missing --]]
		["hoverhilight_name"] = "Hover Hilighting",
		["How to color other player's level."] = "Cómo el color de otro jugador de nivel.",
		["How to color player's name."] = "Cómo el color de nombre del jugador.",
		["Keep Info"] = "Mantener Información",
		["Keep Lots Of Info"] = "Mantener Mucha Información",
		["Keep player information between session for all players except cross-server players"] = "Mantiene información de jugadores entre sesiones para todos los jugadores excepto entre servidores",
		["Keep player information between session, but limit it to friends and guild members."] = "Mantiene información de jugadores entre sesiones, pero lo limita a amigos y miembros de la hermandad.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Deje a TasteTheNaimbow establecer el color común para nombres de jugador desconocidos.",
		["Level Color Mode"] = "Modo Color por Nivel",
		["linkifycommon_desc"] = "Linkify Common Messages",
		["linkifycommon_name"] = "Enlazar Mensajes Comunes",
		--[[Translation missing --]]
		["msg_stored_data_cleared"] = "Stored Player Data Cleared",
		["No additional coloring"] = "Sin color adicional",
		["None"] = "Ninguno",
		["Player Color Mode"] = "Modo Color del Jugador",
		["Player name formating options."] = "Opciones de formato del nombre de jugador.",
		["PlayerNames"] = "Nombre del Jugador",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Limpiados los Datos de Jugador Guardados",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Consulta el servidor para todos los nombres de jugador que desconocemos. Nota: esto sucede muy lentamente, y estos datos no se guardan.",
		["Random"] = "Aleatorio",
		--[[Translation missing --]]
		["realidcolor_desc"] = "RealID Name Coloring",
		--[[Translation missing --]]
		["realidcolor_name"] = "RealID Coloring",
		["Reset Settings"] = "Restablecer Ajustes",
		["Restore default settings, and delete stored character data."] = "Restablece ajustes por defecto, y eliminar información del jugador guardada.",
		["Set common color of unknown player names."] = "Establece el color común para los nombres de jugadores desconocidos.",
		["Sets common color of brackets to use around player names."] = "Establece el color común de los corchetes a utilizar en torno a los nombres de jugador.",
		["Sets style of brackets to use around player names."] = "Establece el estilo de los corchetes a utilizar en torno a los nombres de jugador.",
		["Show Group"] = "Mostrar Grupo",
		["Show Level"] = "Mostrar Nivel",
		["Show Raid Target Icon"] = "Mostrar Icono Objetivo Banda",
		["Square"] = "Cuadrado",
		["Tab completion : "] = "Finalización de Pestaña : ",
		["tabcomplete_name"] = "Nombres Posibles",
		--[[Translation missing --]]
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Toggle group invites by alt-clicking hyperlinked keywords like 'invite'.",
		["Toggle group invites by alt-clicking on player name."] = "Activa invitar a grupo al hacer alt-click en el nombre del jugador.",
		["Toggle level showing."] = "Alterna mostrar nivel.",
		["Toggle raid group showing."] = "Alterna mostrar grupo de raid.",
		["Toggle showing the raid target icon which is currently on the player."] = "Altterna mostrar el icono de objetivo de banda que está en el jugador.",
		["Toggle tab completion of player names."] = "Alterna la finalización de la pestaña de nombres de jugador.",
		["Toggle using a common color for brackets around player names."] = "Alterna utilizar un color común de corchetes en torno a los nombres de jugador.",
		["Toggle using a common color for unknown player names."] = "Alterna el utilizar un color común para los nombres de jugadores desconocidos.",
		["Too many matches (%d possible)"] = "Demasiadas coincidencias (%d posibles)",
		["Unknown Common Color"] = "Color Común Desconocido",
		["Unknown Common Color From TasteTheNaimbow"] = "Color Común Desconocido de TasteTheNaimbow",
		["Unknown Use Common Color"] = "Desconocido Color de Uso Común",
		["Use Channel Color"] = "Utilizar Color Canal",
		["Use Player Color"] = "Utilizar Color Jugador",
		--[[Translation missing --]]
		["Use toon name for RealID"] = "Use toon name for RealID",
	}
}


    PL:AddLocale(PRAT_MODULE, "esES",L)


  
L = {
	["PlayerNames"] = {
		["Actively Query Player Info"] = "主動查詢玩家資訊",
		["Angled"] = "角",
		--[[Translation missing --]]
		["bnetclienticon_desc"] = "Show an icon indicating which game or client the Battle.Net friend is using",
		--[[Translation missing --]]
		["bnetclienticon_name"] = "Show BNet Client Icon",
		["Brackets"] = "括號",
		["Brackets Common Color"] = "括號通用色彩",
		["Brackets Use Common Color"] = "括號使用的通用色彩",
		["Class"] = "職業",
		["Color by Level Difference"] = "等級差異色彩",
		["coloreverywhere_desc"] = "當玩家名稱出現在聊天訊息文字中時，為其上色。",
		["coloreverywhere_name"] = "顏色名字到處",
		["Enable Alt-Invite"] = "啟用 Alt 按鍵邀請",
		["Enable Invite Links"] = "啟用邀請連結",
		["Enable TabComplete"] = "啟用 TabComplete",
		--[[Translation missing --]]
		["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",
		["hoverhilight_name"] = "滑鼠懸停高亮",
		["How to color other player's level."] = "如何為玩家等級著色",
		["How to color player's name."] = "如何為玩家名稱著色",
		["Keep Info"] = "保存資訊",
		["Keep Lots Of Info"] = "保存大量資訊",
		["Keep player information between session for all players except cross-server players"] = "保存此階段所有玩家資訊，除了跨伺服器人物。",
		["Keep player information between session, but limit it to friends and guild members."] = "保存此階段玩家資訊，但限制為好友以及公會成員。",
		--[[Translation missing --]]
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Let TasteTheNaimbow set the common color for unknown player names.",
		["Level Color Mode"] = "等級色彩模式",
		["linkifycommon_desc"] = "製作連結共同的訊息",
		["linkifycommon_name"] = "製作連結共同的訊息",
		--[[Translation missing --]]
		["msg_stored_data_cleared"] = "Stored Player Data Cleared",
		["No additional coloring"] = "無額外著色",
		["None"] = "無",
		["Player Color Mode"] = "玩家色彩模式",
		["Player name formating options."] = "玩家名稱格式化選項。",
		["PlayerNames"] = "玩家名稱",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames：已清除儲存的玩家資料",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "查詢所有此伺服器我們不知道的角色名稱。備註：這個程序相當緩慢且並不會儲存此資料。",
		["Random"] = "隨機",
		["realidcolor_desc"] = "RealID 名稱著色",
		["realidcolor_name"] = "RealID 著色",
		["Reset Settings"] = "重置設定",
		["Restore default settings, and delete stored character data."] = "恢復至預設值且刪除儲存的角色資料。",
		["Set common color of unknown player names."] = "設定未知角色的顯示色彩",
		["Sets common color of brackets to use around player names."] = "設定用來圍繞玩家名稱的括號顏色。",
		["Sets style of brackets to use around player names."] = "設定用來圍繞玩家名稱的括號類型。",
		["Show Group"] = "顯示隊伍編號",
		["Show Level"] = "顯示等級",
		["Show Raid Target Icon"] = "顯示團隊標記",
		["Square"] = "方框",
		["Tab completion : "] = "標籤完成:",
		["tabcomplete_name"] = "可能的名稱 ",
		--[[Translation missing --]]
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Toggle group invites by alt-clicking hyperlinked keywords like 'invite'.",
		["Toggle group invites by alt-clicking on player name."] = "組隊邀請用alt-點擊玩家名稱。",
		["Toggle level showing."] = "切換等級顯示。",
		["Toggle raid group showing."] = "切換團隊組隊顯示。",
		["Toggle showing the raid target icon which is currently on the player."] = "顯示當前玩家的團隊目標圖標",
		["Toggle tab completion of player names."] = "切換玩家名稱的標籤完成。",
		["Toggle using a common color for brackets around player names."] = "選擇是否為玩家名稱外的括號使用一個通用顏色",
		["Toggle using a common color for unknown player names."] = "切換未知玩家以一般色彩顯示",
		["Too many matches (%d possible)"] = "太多符合 (可能 %d)",
		["Unknown Common Color"] = "未知的文字通用顏色",
		["Unknown Common Color From TasteTheNaimbow"] = "來自TasteTheNaimbow 的未知的文字通用顏色",
		["Unknown Use Common Color"] = "未知的文字使用通用顏色",
		["Use Channel Color"] = "使用頻道文字顏色",
		["Use Player Color"] = "使用腳色名稱文字色彩",
		--[[Translation missing --]]
		["Use toon name for RealID"] = "Use toon name for RealID",
	}
}


    PL:AddLocale(PRAT_MODULE, "zhTW",L)


  end
  --@end-non-debug@

  module.Classes = {}
  module.Levels = {}
  module.Subgroups = {}

  local NOP = function(self) return end

  module.OnPlayerDataChanged = NOP


  Prat:SetModuleDefaults(module.name, {
    realm = {
      classes = {},
      levels = {}
    },
    profile = {
      on = true,
      brackets = "Square",
      tabcomplete = true,
      tabcompletelimit = 20,
      level = true,
      levelcolor = "DIFFICULTY",
      subgroup = true,
      showtargeticon = false,
      keep = false,
      keeplots = false,
      colormode = "CLASS",
      realidcolor = "CLASS",
      realidname = false,
      coloreverywhere = true,
      usecommoncolor = true,
      bracketscommoncolor = true,
      linkifycommon = true,
      bnetclienticon = true,
      bracketscolor = {
        r = 0.85,
        g = 0.85,
        b = 0.85,
        a = 1.0
      },
      useTTN = true,
      usewho = false,
      color = {
        r = 0.65,
        g = 0.65,
        b = 0.65,
        a = 1.0
      },
    }
  })


  Prat:SetModuleInit(module,
    function(self)
      -- Right click - who

      --      UnitPopupButtons["WHOIS"] = {
      --        text = "Who Is?",
      --        func = function()
      --          local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
      --          local name = dropdownFrame.name
      --
      --          if name then
      --            SendWho(name)
      --          end
      --        end
      --      }
      --  tinsert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"] - 1, "WHOIS");

      --Prat:RegisterDropdownButton("WHOIS")
    end)

  module.pluginopts = {}

  Prat:SetModuleOptions(module, {
    name = PL["PlayerNames"],
    desc = PL["Player name formating options."],
    type = "group",
    plugins = module.pluginopts,
    args = {
      brackets = {
        name = PL["Brackets"],
        desc = PL["Sets style of brackets to use around player names."],
        type = "select",
        order = 110,
        values = { ["Square"] = PL["Square"], ["Angled"] = PL["Angled"], ["None"] = PL["None"] }
      },
      bracketscommoncolor = {
        name = PL["Brackets Use Common Color"],
        desc = PL["Toggle using a common color for brackets around player names."],
        type = "toggle",
        order = 111,
      },
      bracketscolor = {
        name = PL["Brackets Common Color"],
        desc = PL["Sets common color of brackets to use around player names."],
        type = "color",
        order = 112,
        get = "GetColorValue",
        set = "SetColorValue",
        disabled = function(info) return not info.handler.db.profile.bracketscommoncolor end,
      },
      usecommoncolor = {
        name = PL["Unknown Use Common Color"],
        desc = PL["Toggle using a common color for unknown player names."],
        type = "toggle",
        order = 120,
      },
      color = {
        name = PL["Unknown Common Color"],
        desc = PL["Set common color of unknown player names."],
        type = "color",
        order = 121,
        get = "GetColorValue",
        set = "SetColorValue",
        disabled = function(info) if not info.handler.db.profile.usecommoncolor then return true else return false
        end
        end,
      },
      useTTN = {
        name = PL["Unknown Common Color From TasteTheNaimbow"],
        desc = PL["Let TasteTheNaimbow set the common color for unknown player names."],
        type = "toggle",
        order = 122,
        hidden = function(info) if TasteTheNaimbow_Loaded then return false else return true end end,
        disabled = function(info) if not info.handler.db.profile.usecommoncolor then return true else return false
        end
        end,
      },
      colormode = {
        name = PL["Player Color Mode"],
        desc = PL["How to color player's name."],
        type = "select",
        order = 130,
        values = { ["RANDOM"] = PL["Random"], ["CLASS"] = PL["Class"], ["NONE"] = PL["None"] }
      },
      realidcolor = {
        name = PL["realidcolor_name"],
        desc = PL["realidcolor_desc"],
        type = "select",
        order = 135,
        values = { ["RANDOM"] = PL["Random"], ["CLASS"] = PL["Class"], ["NONE"] = PL["None"] }
      },
      realidname = {
        name = PL["Use toon name for RealID"],
        desc = PL["Use toon name for RealID"],
        type = "toggle",
        order = 136,
      },
      bnetclienticon = {
        name = PL.bnetclienticon_name,
        desc = PL.bnetclienticon_desc,
        type = "toggle",
        order = 137,
      },
      levelcolor = {
        name = PL["Level Color Mode"],
        desc = PL["How to color other player's level."],
        type = "select",
        order = 131,
        values = {
          ["PLAYER"] = PL["Use Player Color"],
          ["CHANNEL"] = PL["Use Channel Color"],
          ["DIFFICULTY"] = PL["Color by Level Difference"],
          ["NONE"] = PL["No additional coloring"]
        }
      },
      level = {
        name = PL["Show Level"],
        desc = PL["Toggle level showing."],
        type = "toggle",
        order = 140,
      },
      subgroup = {
        name = PL["Show Group"],
        desc = PL["Toggle raid group showing."],
        type = "toggle",
        order = 141,
      },
      showtargeticon = {
        name = PL["Show Raid Target Icon"],
        desc = PL["Toggle showing the raid target icon which is currently on the player."],
        type = "toggle",
        order = 142,
      },
      tabcomplete = {
        name = PL["Enable TabComplete"],
        desc = PL["Toggle tab completion of player names."],
        type = "toggle",
        order = 150,
        get = function(info) return info.handler.db.profile.tabcomplete end,
        set = function(info, v) info.handler.db.profile.tabcomplete = v; info.handler:TabComplete(v) end
      },
      keep = {
        name = PL["Keep Info"],
        desc = PL["Keep player information between session, but limit it to friends and guild members."],
        type = "toggle",
        order = 200,
      },
      keeplots = {
        name = PL["Keep Lots Of Info"],
        desc = PL["Keep player information between session for all players except cross-server players"],
        type = "toggle",
        order = 201,
        disabled = function(info) return not info.handler.db.profile.keep end,
      },
      usewho = {
        name = PL["Actively Query Player Info"],
        desc = PL["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."],
        type = "toggle",
        order = 202,
        hidden = function(info)
          if LibStub:GetLibrary("LibWho-2.0", true) then
            return false
          end

          if GetAddOnInfo("LibWho-2.0") then
            return false
          end

          return true
        end
      },
      reset = {
        name = PL["Reset Settings"],
        desc = PL["Restore default settings, and delete stored character data."],
        type = "execute",
        order = 250,
        func = "resetStoredData"
      },
    }
  })

  function module:OnValueChanged(info, b)
    local field = info[#info]
    if field == "altinvite" or field == "linkinvite" then
      self:SetAltInvite()
    elseif field == "usewho" then
      if b and not LibStub:GetLibrary("LibWho-2.0", true) then
        LoadAddOn("LibWho-2.0")
      end
      self.wholib = b and LibStub:GetLibrary("LibWho-2.0", true)
      self:updateAll()
    elseif field == "coloreverywhere" then
      self:OnPlayerDataChanged(b and UnitName("player") or nil)
    end
  end

  local mt_GuildClass = {}


  function module:OnModuleEnable()
    Prat.RegisterChatEvent(self, "Prat_FrameMessage")
    Prat.RegisterChatEvent(self, "Prat_Ready")

    Prat.RegisterMessageItem("PREPLAYERDELIM", "PLAYER", "before")
    Prat.RegisterMessageItem("POSTPLAYERDELIM", "Ss", "after")

    Prat.RegisterMessageItem("PLAYERTARGETICON", "Ss", "after")

    Prat.EnableProcessingForEvent("CHAT_MSG_GUILD_ACHIEVEMENT")
    Prat.EnableProcessingForEvent("CHAT_MSG_ACHIEVEMENT")

    Prat.RegisterMessageItem("PLAYERLEVEL", "PREPLAYERDELIM", "before")
    Prat.RegisterMessageItem("PLAYERGROUP", "POSTPLAYERDELIM", "after")

    Prat.RegisterMessageItem("PLAYERCLIENTICON", "PLAYERLEVEL", "before")

    self:RegisterEvent("FRIENDLIST_UPDATE", "updateFriends")
    self:RegisterEvent("GUILD_ROSTER_UPDATE", "updateGuild")
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "updateGroup")
    self:RegisterEvent("PLAYER_LEVEL_UP", "updatePlayerLevel")
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "updateTarget")
    self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", "updateMouseOver")
    self:RegisterEvent("WHO_LIST_UPDATE", "updateWho")
    self:RegisterEvent("CHAT_MSG_SYSTEM", "updateWho") -- for short /who command

    self:RegisterEvent("PLAYER_LEAVING_WORLD", "EmptyDataCache")

    if self.db.profile.usewho then
      if not LibStub:GetLibrary("LibWho-2.0", true) then
        LoadAddOn("LibWho-2.0")
      end
      self.wholib = LibStub:GetLibrary("LibWho-2.0", true)
    end

    self:updatePlayer()
    self.NEEDS_INIT = true

    if IsInGuild() then
      self.GuildRoster()
    end

    self:TabComplete(self.db.profile.tabcomplete)
  end

  function module:OnModuleDisable()
    self:TabComplete(false)
    self:UnregisterAllEvents()
    Prat.UnregisterAllChatEvents(self)
  end


  function module:Prat_Ready()
    self:updateAll()
  end

  local cache = {
    module.Levels,
    module.Classes,
    module.Subgroups
  }


  function module:EmptyDataCache(force)
    for k, v in pairs(cache) do
      wipe(v)
    end

    self:updatePlayer()
    self.NEEDS_INIT = true
    self:OnPlayerDataChanged()
  end

  --[[------------------------------------------------
    Fill Functions
  ------------------------------------------------]] --

  -- Use C_FriendList.GetNumWhoResults instead
  local GetNumWhoResults = C_FriendList.GetNumWhoResults;

  -- Use C_FriendList.GetWhoInfo instead
  local function GetWhoInfo(index)
    local info = C_FriendList.GetWhoInfo(index);
    return info.fullName,
    info.fullGuildName,
    info.level,
    info.raceStr,
    info.classStr,
    info.area,
    info.filename,
    info.gender;
  end

  -- Use C_FriendList.SendWho instead
  local SendWho = C_FriendList.SendWho;

  local function GetNumFriends()
    return C_FriendList.GetNumFriends(),
    C_FriendList.GetNumOnlineFriends();
  end

  -- Use C_FriendList.GetFriendInfo or C_FriendList.GetFriendInfoByIndex instead
  local function GetFriendInfo(friend)
    local info;
    if type(friend) == "number" then
      info = C_FriendList.GetFriendInfoByIndex(friend);
    elseif type(friend) == "string" then
      info = C_FriendList.GetFriendInfo(friend);
    end

    if info then
      local chatFlag = "";
      if info.dnd then
        chatFlag = CHAT_FLAG_DND;
      elseif info.afk then
        chatFlag = CHAT_FLAG_AFK;
      end
      return info.name,
      info.level,
      info.className,
      info.area,
      info.connected,
      chatFlag,
      info.notes,
      info.referAFriend,
      info.guid;
    end
  end

  local GetToonInfoByBnetID
  if Prat.IsClassic then
    GetToonInfoByBnetID = function(bnetAccountID)
      if not bnetAccountID then return end

      local _, _, _, _, _, gameAccountID = BNGetFriendInfoByID(bnetAccountID)
      if gameAccountID then
        local _, toonName, client, realmName, _, faction, race, class, _, zoneName, level, gameText,
        broadcastText, broadcastTime = BNGetGameAccountInfo(gameAccountID)
        -- Pre-8.2.5 API returns empty strings if friend is online on non-WoW client
        -- We return only non-empty strings for consistency with other "no data" situations
        if toonName ~= "" then
          return toonName, level, class
        end
      end
    end
  else
    GetToonInfoByBnetID = function(bnetAccountID)
      if not bnetAccountID then return end

      local accountInfo = C_BattleNet.GetAccountInfoByID(bnetAccountID)
      if accountInfo then
        return accountInfo.gameAccountInfo.characterName,
        accountInfo.gameAccountInfo.characterLevel,
        accountInfo.gameAccountInfo.className
      end
    end
  end

  local GetBnetClientByID
  if Prat.IsClassic then
    GetBnetClientByID = function(bnetAccountID)
      if not bnetAccountID then return end

      local _, _, _, _, _, gameAccountID = BNGetFriendInfoByID(bnetAccountID)
      if gameAccountID then
        local _, toonName, client, realmName, _, faction, race, class, _, zoneName, level, gameText,
        broadcastText, broadcastTime = BNGetGameAccountInfo(gameAccountID)
        -- Pre-8.2.5 API returns empty strings if friend is online on non-WoW client
        -- We return only non-empty strings for consistency with other "no data" situations
        if client ~= "" then
          return client
        end
      end
    end
  else
    GetBnetClientByID = function(bnetAccountID)
      if not bnetAccountID then return end

      local accountInfo = C_BattleNet.GetAccountInfoByID(bnetAccountID)
      if accountInfo then
        return accountInfo.gameAccountInfo.clientProgram
      end
    end
  end

  -- This function is a wrapper for the Blizzard GuildRoster function, to account for the differences between Retail and Classic
  function module:GuildRoster(...)
    if Prat.IsRetail then
      return C_GuildInfo.GuildRoster(...)
    else
      return GuildRoster(...)
    end
  end



  --[[------------------------------------------------
    Core Functions
  ------------------------------------------------]] --
  function module:GetDescription()
    return PL["Player name formating options."]
  end

  function module:updateAll()
    self:updatePlayer()

    self:updateGroup()

    self:updateFriends()

    self.NEEDS_INIT = nil

    self:updateGuild(self.db.profile.keeplots)
  end


  function module:updateGF()
    if IsInGuild() then self.GuildRoster() end
    self:updateFriends()
    if GetNumBattlefieldScores() > 0 then
      self:updateBG()
    end
    self:updateWho()
    self:updateGuild()
  end

  function module:updatePlayer()
    local PlayerClass = select(2, UnitClass("player"))
    local Name, Server = UnitName("player")
    self:addName(Name, Server, PlayerClass, UnitLevel("player"), nil, "PLAYER")
  end

  function module:updatePlayerLevel(event, level, hp, mp, talentPoints, str, agi, sta, int, spi)
    local PlayerClass = select(2, UnitClass("player"))
    local Name, Server = UnitName("player")
    self:addName(Name, Server, PlayerClass, level, nil, "PLAYER")
  end


  function module:updateFriends()
    local Name, Class, Level
    for i = 1, GetNumFriends() do
      Name, Level, Class = GetFriendInfo(i) -- name, level, class, area, connected, status
      self:addName(Name, nil, Class, Level, nil, "FRIEND")
    end
  end



  function module:updateGuild()
    if IsInGuild() then
      self.GuildRoster()

      local Name, Class, Level, _
      for i = 1, GetNumGuildMembers(true) do
        Name, _, _, Level, _, _, _, _, _, _, Class = GetGuildRosterInfo(i)

        local plr, svr = Name:match("([^%-]+)%-?(.*)")

        self:addName(plr, nil, Class, Level, nil, "GUILD")
        self:addName(plr, svr, Class, Level, nil, "GUILD")
      end
    end
  end

  function module:updateRaid()
    --  self:Debug("updateRaid -->")
    local Name, Class, SubGroup, Level, Server, rank
    local _, zone, online, isDead, role, isML
    for k, v in pairs(self.Subgroups) do
      self.Subgroups[k] = nil
    end

    for i = 1, GetNumGroupMembers() do
      _, rank, SubGroup, Level, _, Class, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
      Name, Server = UnitName("raid" .. i)
      self:addName(Name, Server, Class, Level, SubGroup, "RAID")
    end
  end

  function module:updateParty()
    local Class, Unit, Name, Server, _
    for i = 1, GetNumSubgroupMembers() do
      Unit = "party" .. i
      _, Class = UnitClass(Unit)
      Name, Server = UnitName(Unit)
      self:addName(Name, Server, Class, UnitLevel(Unit), nil, "PARTY")
    end
  end

  function module:updateGroup()
  	if IsInRaid() then
  		self:updateRaid()
  	elseif IsInGroup() then
  		self:updateParty()
  	end
  end

  function module:updateTarget()
    local Class, Name, Server
    if not UnitIsPlayer("target") or not UnitIsFriend("player", "target") then
      return
    end
    Class = select(2, UnitClass("target"))
    Name, Server = UnitName("target")
    self:addName(Name, Server, Class, UnitLevel("target"), nil, "TARGET")
  end

  function module:updateMouseOver(event)
    local Class, Name, Server
    if not UnitIsPlayer("mouseover") or not UnitIsFriend("player", "mouseover") then
      return
    end
    Class = select(2, UnitClass("mouseover"))
    Name, Server = UnitName("mouseover")
    self:addName(Name, Server, Class, UnitLevel("mouseover"), nil, "MOUSE")
  end


  function module:updateWho()
    if self.wholib then return end

    local Name, Class, Level, Server, _
    for i = 1, GetNumWhoResults() do
      Name, _, Level, _, _, _, Class = GetWhoInfo(i)
      self:addName(Name, Server, Class, Level, nil, "WHO")
    end
  end

  function module:updateBG()
    for i = 1, GetNumBattlefieldScores() do
      local name, killingBlows, honorKills, deaths, honorGained, faction, rank, race, class, filename, damageDone,
      healingDone = GetBattlefieldScore(i);

      if name then
        local plr, svr = name:match("([^%-]+)%-?(.*)")
        self:addName(plr, svr, class, nil, nil, "BATTLEFIELD")
        self:addName(plr, nil, class, nil, nil, "BATTLEFIELD")
      end
    end
    self:updateGroup()
  end


  function module:resetStoredData()
    self.db.realm.classes = {}
    self.db.realm.levels = {}

    self:EmptyDataCache(true)

    self:Output(PL.msg_stored_data_cleared)
  end

  --
  -- Coloring Functions
  --
  local CLR = Prat.CLR
  function CLR:Bracket(text) return self:Colorize(module:GetBracketCLR(), text) end

  function CLR:Common(text) return self:Colorize(module:GetCommonCLR(), text) end

  function CLR:Random(text, seed) return self:Colorize(module:GetRandomCLR(seed), text) end

  function CLR:Class(text, class) return self:Colorize(module:GetClassColor(class), text) end

  local colorFunc = GetQuestDifficultyColor or GetDifficultyColor
  function CLR:Level(text, level, name, class, mode)
    local mode = mode or module.db.profile.levelcolor
    if mode and type(level) == "number" and level > 0 then
      if mode == "DIFFICULTY" then
        local diff = colorFunc(level)
        return self:Colorize(CLR:GetHexColor(CLR:Desaturate(diff)), text)
      elseif mode == "PLAYER" then
        return self:Player(text, name, class)
      end
    end

    return text
  end

  function CLR:Player(text, name, class)
    return self:Colorize(module:GetPlayerCLR(name, class), text)
  end

  local servernames

  function module:addName(Name, Server, Class, Level, SubGroup, Source)
    if Name then
      local nosave
      Source = Source or "UNKNOWN"

      -- Messy negations, but this says dont save data from
      -- sources other than guild or friends unless you enable
      -- the keeplots option
      if Source ~= "GUILD" and Source ~= "FRIEND" and Source ~= "PLAYER" then
        nosave = not self.db.profile.keeplots
      end

      if Server and Server:len() > 0 then
        nosave = true
        servernames = servernames or Prat.Addon:GetModule("ServerNames", true)

        if servernames then
          servernames:GetServerKey(Server)
        end
      end


      Name = Name .. (Server and Server:len() > 0 and ("-" .. Server) or "")

      local changed
      if Level and Level > 0 then
        self.Levels[Name:lower()] = Level
        if ((not nosave) and self.db.profile.keep) then
          self.db.realm.levels[Name:lower()] = Level
        else -- Update it if it exists
          if self.db.realm.levels[Name:lower()] then
            self.db.realm.levels[Name:lower()] = Level
          end
        end

        changed = true
      end
      if Class and Class ~= UNKNOWN then
        self.Classes[Name:lower()] = Class
        if ((not nosave) and self.db.profile.keep) then self.db.realm.classes[Name:lower()] = Class end

        changed = true
      end
      if SubGroup then
        module.Subgroups[Name:lower()] = SubGroup

        changed = true
      end

      if changed then
        self:OnPlayerDataChanged(Name)
      end
    end
  end

  function module:getClass(player)
    return self.Classes[player:lower()] or self.db.realm.classes[player:lower()] or self.db.realm.classes[player]
  end

  function module:getLevel(player)
    return self.Levels[player:lower()] or self.db.realm.levels[player:lower()] or self.db.realm.levels[player]
  end

  function module:getSubgroup(player)
    return self.Subgroups[player:lower()]
  end

  function module:GetData(player, frame)
    local class = self:getClass(player)
    local level = self:getLevel(player)

    if level == 0 then level = nil end
    if class == UNKNOWN then class = nil end

    if self.wholib and not (class and level) then
      local user, cachetime = self.wholib:UserInfo(player, { timeout = 20 })

      if user then
        level = user.Level or level
        class = user.NoLocaleClass or user.Class or class
      end
    end
    return class, level, self:getSubgroup(player)
  end

  function module:GetClassColor(class)
    return CLR:GetHexColor(Prat.GetClassGetColor(class))
  end

  function module:addInfo(Name, Server)
    return
  end



  function module:FormatPlayer(message, Name, frame, class)
    if not Name or Name:len() == 0 then return end



    local storedclass, level, subgroup = self:GetData(Name, frame)
    if class == nil then
      class = storedclass
    end

    -- Add level information if needed
    if level and self.db.profile.level then
      message.PLAYERLEVEL = CLR:Level(tostring(level), level, Name, class)
      message.PREPLAYERDELIM = ":"
    end

    -- Add raid subgroup information if needed
    if subgroup and self.db.profile.subgroup and (GetNumGroupMembers() > 0) then
      message.POSTPLAYERDELIM = ":"
      message.PLAYERGROUP = subgroup
    end

    -- Add raid target icon
    if self.db.profile.showtargeticon then
      local icon = UnitExists(Name) and GetRaidTargetIndex(Name)
      if icon then
        icon = ICON_LIST[icon]

        if icon and icon:len() > 0 then
          -- since you cant have icons in links end the link before the icon
          message.PLAYERTARGETICON = "|h" .. icon .. "0|t"
          message.Ll = ""
        end
      end
    end

    if message.PLAYERLINKDATA and (message.PLAYERLINKDATA:find("BN_") and message.PLAYER ~= UnitName("player")) then
      if self.db.profile.realidcolor == "CLASS" then
        local toonName, level, class = GetToonInfoByBnetID(message.PRESENCE_ID)
        if toonName and self.db.profile.realidname then
          message.PLAYER = toonName
          if level and self.db.profile.level then
            message.PLAYERLEVEL = CLR:Level(tostring(level), tonumber(level), nil, nil, "DIFFICULTY")
            message.PREPLAYERDELIM = ":"
          end
        end
        message.PLAYER = CLR:Class(message.PLAYER, class or "") -- Empty string to get default gray color
      elseif self.db.profile.realidcolor == "RANDOM" then
        message.PLAYER = CLR:Random(message.PLAYER, message.PLAYER:lower())
      end

      if self.db.profile.bnetclienticon then
        local client = GetBnetClientByID(message.PRESENCE_ID)
        if client then
          local texture
          if BNet_GetClientAtlas then
            texture = BNet_GetClientAtlas(client)
          else
            texture = BNet_GetClientTexture(client)
          end
          message.PLAYERCLIENTICON = ("|T%s:%d:%d:%d:%d|t"):format(texture, 14)
        end
      end
    else
      -- Add the player name in the proper color
      message.PLAYER = CLR:Player(message.PLAYER, Name, class)
    end

    -- Add the correct bracket style and color
    if message.pP then
      local prof_brackets = self.db.profile.brackets
      if prof_brackets == "Angled" then
        message.pP = CLR:Bracket("<") .. message.pP
        message.Pp = message.Pp .. CLR:Bracket(">")
      elseif prof_brackets == "None" then
      else
        message.pP = CLR:Bracket("[") .. message.pP
        message.Pp = message.Pp .. CLR:Bracket("]")
      end
    end
  end


  --
  -- Prat Event Implementation
  --
  local EVENTS_FOR_RECHECK = {
    ["CHAT_MSG_GUILD"] = module.updateGF,
    ["CHAT_MSG_INSTANCE_CHAT"] = module.updateBG,
    ["CHAT_MSG_INSTANCE_CHAT_LEADER"] = module.updateBG,
    ["CHAT_MSG_SYSTEM"] = module.updateGF,
  }

  local EVENTS_FOR_CACHE_GUID_DATA = {
    CHAT_MSG_PARTY = true,
    CHAT_MSG_PARTY_LEADER = true,
    CHAT_MSG_RAID = true,
    CHAT_MSG_RAID_WARNING = true,
    CHAT_MSG_RAID_LEADER = true,
    CHAT_MSG_INSTANCE_CHAT = true,
    CHAT_MSG_INSTANCE_CHAT_LEADER = true,
  }


  function module:MakePlayer(message, name)
    if type(name) == "string" then
      local plr, svr = name:match("([^%-]+)%-?(.*)")
      --     self:Debug("MakePlayer", name, plr, svr)

      message.lL = "|Hplayer:"
      message.PLAYERLINK = name
      message.LL = "|h"
      message.PLAYER = plr
      message.Ll = "|h"

      if svr and strlen(svr) > 0 then
        message.sS = "-"
        message.SERVER = svr
      end
    end
  end


  function module:Prat_FrameMessage(info, message, frame, event)
    local _
    if self.NEEDS_INIT then
      self:updateAll()
    end

    -- This name is used to lookup playerdata, not for display
    local Name = message.PLAYERLINK or ""
    message.Pp = ""
    message.pP = ""

    -- If there is no playerlink, then we have nothing to do
    if Name:len() == 0 then
      return
    end

    Name = Ambiguate(Name, "all")

    local class, level, subgroup = self:GetData(Name)

    if (class == nil) and message and message.ORG and message.ORG.GUID and message.ORG.GUID:len() > 0 and message.ORG.GUID ~= "0000000000000000" then
      _, class = GetPlayerInfoByGUID(message.ORG.GUID)

      if class ~= nil and EVENTS_FOR_CACHE_GUID_DATA[event] then
        self:addName(Name, message.SERVER, class, level, subgroup, "GUID")
      end
    end
    local fx = EVENTS_FOR_RECHECK[event]
    if fx ~= nil and (level == nil or level == 0) then
      fx(self)
    end

    self:FormatPlayer(message, Name, frame, class)
  end

  function module:GetPlayerCLR(name, class, mode)
    if not mode then mode = module.db.profile.colormode end

    if name and strlen(name) > 0 then
      if class and mode == "CLASS" then
        return self:GetClassColor(class)
      elseif mode == "RANDOM" then
        return self:GetRandomCLR(name)
      else
        return self:GetCommonCLR()
      end
    end
  end

  function module:GetBracketCLR()
    if not self.db.profile.bracketscommoncolor then
      return CLR.COLOR_NONE
    else
      local color = self.db.profile.bracketscolor
      return CLR:GetHexColor(color)
    end
  end

  function module:GetCommonCLR()
    local color = CLR.COLOR_NONE
    if self.db.profile.usecommoncolor then
      if self.db.profile.useTTN and TasteTheNaimbow_Loaded then
        color = TasteTheNaimbowExternalColor(name)
      else
        color = CLR:GetHexColor(self.db.profile.color)
      end
    end
    return color
  end

  function module:GetRandomCLR(Name)
    local hash = 17
    for i = 1, string.len(Name) do
      hash = hash * 37 * string.byte(Name, i);
    end

    local r = math.floor(math.fmod(hash / 97, 255));
    local g = math.floor(math.fmod(hash / 17, 255));
    local b = math.floor(math.fmod(hash / 227, 255));

    if ((r * 299 + g * 587 + b * 114) / 1000) < 105 then
      r = math.abs(r - 255);
      g = math.abs(g - 255);
      b = math.abs(b - 255);
    end

    return string.format("%02x%02x%02x", r, g, b)
  end


  function module:TabComplete(enabled)
    local AceTab = LibStub("AceTab-3.0")

    if enabled then
      servernames = servernames or Prat.Addon:GetModule("ServerNames", true)

      if not AceTab:IsTabCompletionRegistered(PL["tabcomplete_name"]) then
        local foundCache = {}
        AceTab:RegisterTabCompletion(PL["tabcomplete_name"], nil,
          function(t, text, pos)
            for name in pairs(self.Classes) do
              table.insert(t, name)
            end
          end,
          function(u, cands, ...)
            local candcount = #cands
            if candcount <= self.db.profile.tabcompletelimit then
              local text
              for key, cand in pairs(cands) do
                if servernames then
                  local plr, svr = key:match("([^%-]+)%-?(.*)")

                  cand = CLR:Player(cand, plr, self:getClass(key))

                  if svr then
                    svr = servernames:FormatServer(nil, servernames:GetServerKey(svr))
                    cand = cand .. (svr and ("-" .. svr) or "")
                  end
                else
                  cand = CLR:Player(cand, cand, self:getClass(cand))
                end


                text = text and (text .. ", " .. cand) or cand
              end
              return "   " .. text
            else
              return "   " .. PL["Too many matches (%d possible)"]:format(candcount)
            end
          end,
          nil,
          function(name)
            return name:gsub(Prat.MULTIBYTE_FIRST_CHAR, string.upper, 1):match("^[^%-]+")
          end)
      end
    else
      if AceTab:IsTabCompletionRegistered(PL["tabcomplete_name"]) then
        AceTab:UnregisterTabCompletion(PL["tabcomplete_name"])
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad
