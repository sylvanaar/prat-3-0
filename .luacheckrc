std = "lua51"
max_line_length = false
exclude_files = {
	"**/libraries/**/*.lua",
	".luacheckrc",
}
ignore = {
	"11./SLASH_.*", -- Setting an undefined (Slash handler) global variable
	"11./BINDING_.*", -- Setting an undefined (Keybinding header) global variable
	"21.", -- Unused argument
}
globals = {
  -- Saved Variables
  "Prat3CharDB",
  "Prat3HighCPUPerCharDB",

  -- Prat / Libraries
  "Prat",
  "Prat_PopupFrame",
  "Prat_PopupFrameText",
  "LibStub",

  -- Lua
  "date",
  "table.wipe",
  "time",

  -- Utility functions
  "geterrorhandler",
  "strsplit",
  "tinsert",
  "tremove",

  -- WoW
  "ACCEPT",
  "CANCEL",
  "CHAT_MSG_BN_WHISPER_INFORM",
  "CHAT_MSG_CHANNEL_LIST",
  "CHAT_MSG_INSTANCE_CHAT",
  "CHAT_MSG_INSTANCE_CHAT_LEADER",
  "CHAT_MSG_SAY",
  "CHAT_MSG_WHISPER_INFORM",
  "DEFAULT_CHAT_FRAME",
  "LE_PARTY_CATEGORY_INSTANCE",
  "LE_REALM_RELATION_SAME",
  "NUM_CHAT_WINDOWS",
  "SELECTED_CHAT_FRAME",

  "ChatEdit_ChooseBoxForSend",
  "ChatEdit_GetActiveWindow",
  "ChatFrame1",
  "ChatFrame1EditBox",
  "ChatFrameChannelButton",
  "ChatFrameMenuButton",
  "ChatFrameToggleVoiceDeafenButton",
  "ChatFrameToggleMuteButton",
  "ChatFrame_OpenChat",
  "GameFontNormal",
  "UIParent",
  "SlashCmdList",
  "StaticPopupDialogs",
  "StaticPopup_Show",

  "Ambiguate",
  "BNGetFriendInfo", -- Classic
  "BNGetFriendInfoByID", -- Classic
  "BNGetGameAccountInfo", -- Classic
  "BNGetNumFriends",
  "ChatTypeInfo",
  "CreateFrame",
  "GameTooltip",
  "GetAverageItemLevel",
  "GetBattlefieldScore",
  "GetCVar",
  "GetLocale",
  "GetGuildRosterInfo",
  "GetNumBattlefieldScores",
  "GetNmGroupMembers",
  "GetNumGuildMembers",
  "GetMinimapZoneText",
  "GetPlayerInfoByGUID",
  "GetRaidTargetIndex",
  "GetRealmName",
  "GetRealZoneText",
  "GetServerTime",
  "GetTime",
  "GetUnitName",
  "IsCombatLog",
  "IsControlKeyDown",
  "IsInGroup",
  "IsInGuild",
  "IsInInstance",
  "IsInRaid",
  "IsShiftKeyDown",
  "LoggingChat",
  "LoggingCombat",
  "PlaySound",
  "UnitClass",
  "UnitCreatureFamily",
  "UnitCreatureType",
  "UnitGUID",
  "UnitExists",
  "UnitHealth",
  "UnitHealthMax",
  "UnitIsFriend",
  "UnitIsPlayer",
  "UnitLevel",
  "UnitName",
  "UnitPower",
  "UnitPowerMax",
  "UnitRace",
  "UnitSex",
  "UnitRealmRelationship",
}
