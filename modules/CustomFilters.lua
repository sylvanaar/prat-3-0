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

  local PRAT_MODULE = Prat:RequestModuleName("CustomFilters")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "CustomFilters",
    ["module_desc"] = "Module to support custom filters.",
    ["Add Pattern"] = true,
    ["Add a pattern to search for."] = true,
    ["Remove Pattern"] = true,
    ["Remove an existing pattern."] = true,
    ["Pattern Options"] = true,
    ["Inbound"] = true,
    ["Outbound"] = true,
    ["Search Pattern"] = true,
    ["Search Format String"] = true,
    ["Supplied pattern is a format string instead of a pattern"] = true,
    ["<string>"] = true,
    ["Replacement Text"] = true,
    ["Block Message"] = true,
    ["Prevent the message from being displayed"] = true,
    ["Hilight Match Text"] = true,
    ["Hilight Color"] = true,
    ["Secondary Output"] = true,
    ["Send to a secondary output"] = true,
    ["Play Sound"] = true,
    ["Play a sound when this message is output to the chatframe"] = true,
    ["Forward"] = true,
    ["ForwardMessage"] = true,
    ["Forward the message to a chat channel."] = true,
    ["Output Channel"] = true,
    ["Channel to send output text to."] = true,
    ["Channel Data"] = true,
    ["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = true,
    ["Output Message Only"] = true;
    ["Only output the message portion of the chat text, leave out the channel, and playername etc."] = true,
    ["Your name for this filter"] = true,
    ["Filter Name"] = true,
    ["Enabled"] = true,
    ["Is this pattern enabled for use?"] = true,
    ["Pattern Info"] = true,
    ["Match Options"] = true,
    ["inchannels_name"] = "Search Channels",
    ["inchannels_desc"] = "Search in certain channels",
    ["ForwardCustom"] = true,
    ["ForwardMessageCustom"] = "Private Channel",
    ["Forward the message to a custom chat channel."] = "Output to a private chat channel",
    chatframesink_name = "Chatframe",
    chatframesink_desc = "Output to a chat window"
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/

  --@non-debug@
do
    local L


L = {
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = true,
		["Add Pattern"] = true,
		["Block Message"] = true,
		["Channel Data"] = true,
		["Channel to send output text to."] = true,
		["chatframesink_desc"] = "Output to a chat window",
		["chatframesink_name"] = "Chatframe",
		["Enabled"] = true,
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = true,
		["Filter Name"] = true,
		["Forward"] = true,
		["Forward the message to a chat channel."] = true,
		["Forward the message to a custom chat channel."] = "Output to a private chat channel",
		["ForwardCustom"] = true,
		["ForwardMessage"] = true,
		["ForwardMessageCustom"] = "Private Channel",
		["Hilight Color"] = true,
		["Hilight Match Text"] = true,
		["Inbound"] = true,
		["inchannels_desc"] = "Search in certain channels",
		["inchannels_name"] = "Search Channels",
		["Is this pattern enabled for use?"] = true,
		["Match Options"] = true,
		["module_desc"] = "Module to support custom filters.",
		["module_name"] = "CustomFilters",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = true,
		["Outbound"] = true,
		["Output Channel"] = true,
		["Output Message Only"] = true,
		["Pattern Info"] = true,
		["Pattern Options"] = true,
		["Play a sound when this message is output to the chatframe"] = true,
		["Play Sound"] = true,
		["Prevent the message from being displayed"] = true,
		["Remove an existing pattern."] = true,
		["Remove Pattern"] = true,
		["Replacement Text"] = true,
		["Search Format String"] = true,
		["Search Pattern"] = true,
		["Secondary Output"] = true,
		["Send to a secondary output"] = true,
		["Supplied pattern is a format string instead of a pattern"] = true,
		["Your name for this filter"] = true,
	}
}


  PL:AddLocale(PRAT_MODULE, "enUS",L)



L = {
	["CustomFilters"] = {
		--[[Translation missing --]]
		["<string>"] = "<string>",
		--[[Translation missing --]]
		["Add a pattern to search for."] = "Add a pattern to search for.",
		--[[Translation missing --]]
		["Add Pattern"] = "Add Pattern",
		--[[Translation missing --]]
		["Block Message"] = "Block Message",
		--[[Translation missing --]]
		["Channel Data"] = "Channel Data",
		--[[Translation missing --]]
		["Channel to send output text to."] = "Channel to send output text to.",
		--[[Translation missing --]]
		["chatframesink_desc"] = "Output to a chat window",
		--[[Translation missing --]]
		["chatframesink_name"] = "Chatframe",
		["Enabled"] = "Activé",
		--[[Translation missing --]]
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Extra data for WHISPER (target) and CHANNEL (channel name or num)",
		["Filter Name"] = "Nom du filtre",
		["Forward"] = "Transférer",
		["Forward the message to a chat channel."] = "Transférer le message sur un canal de discussion.",
		["Forward the message to a custom chat channel."] = "Transférer vers un canal de discussion privé",
		--[[Translation missing --]]
		["ForwardCustom"] = "ForwardCustom",
		--[[Translation missing --]]
		["ForwardMessage"] = "ForwardMessage",
		["ForwardMessageCustom"] = "Canal privé",
		--[[Translation missing --]]
		["Hilight Color"] = "Hilight Color",
		--[[Translation missing --]]
		["Hilight Match Text"] = "Hilight Match Text",
		--[[Translation missing --]]
		["Inbound"] = "Inbound",
		--[[Translation missing --]]
		["inchannels_desc"] = "Search in certain channels",
		--[[Translation missing --]]
		["inchannels_name"] = "Search Channels",
		--[[Translation missing --]]
		["Is this pattern enabled for use?"] = "Is this pattern enabled for use?",
		--[[Translation missing --]]
		["Match Options"] = "Match Options",
		--[[Translation missing --]]
		["module_desc"] = "Module to support custom filters.",
		--[[Translation missing --]]
		["module_name"] = "CustomFilters",
		--[[Translation missing --]]
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Only output the message portion of the chat text, leave out the channel, and playername etc.",
		--[[Translation missing --]]
		["Outbound"] = "Outbound",
		--[[Translation missing --]]
		["Output Channel"] = "Output Channel",
		--[[Translation missing --]]
		["Output Message Only"] = "Output Message Only",
		--[[Translation missing --]]
		["Pattern Info"] = "Pattern Info",
		--[[Translation missing --]]
		["Pattern Options"] = "Pattern Options",
		--[[Translation missing --]]
		["Play a sound when this message is output to the chatframe"] = "Play a sound when this message is output to the chatframe",
		--[[Translation missing --]]
		["Play Sound"] = "Play Sound",
		--[[Translation missing --]]
		["Prevent the message from being displayed"] = "Prevent the message from being displayed",
		--[[Translation missing --]]
		["Remove an existing pattern."] = "Remove an existing pattern.",
		--[[Translation missing --]]
		["Remove Pattern"] = "Remove Pattern",
		--[[Translation missing --]]
		["Replacement Text"] = "Replacement Text",
		--[[Translation missing --]]
		["Search Format String"] = "Search Format String",
		--[[Translation missing --]]
		["Search Pattern"] = "Search Pattern",
		--[[Translation missing --]]
		["Secondary Output"] = "Secondary Output",
		--[[Translation missing --]]
		["Send to a secondary output"] = "Send to a secondary output",
		--[[Translation missing --]]
		["Supplied pattern is a format string instead of a pattern"] = "Supplied pattern is a format string instead of a pattern",
		--[[Translation missing --]]
		["Your name for this filter"] = "Your name for this filter",
	}
}


  PL:AddLocale(PRAT_MODULE, "frFR",L)



L = {
	["CustomFilters"] = {
		["<string>"] = "<Zeichenfolge>",
		["Add a pattern to search for."] = "Fügt ein Muster hinzu, nach dem gesucht werden soll.",
		["Add Pattern"] = "Muster hinzufügen",
		["Block Message"] = "Nachricht blockieren",
		["Channel Data"] = "Kanal-Daten",
		["Channel to send output text to."] = "Kanal, an den der Ausgabetext gesendet werden soll.",
		["chatframesink_desc"] = "Ausgabe in ein Chatfenster",
		["chatframesink_name"] = "Chatrahmen",
		["Enabled"] = "Aktiviert",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Zusätzliche Daten für FLÜSTERN (Ziel) und KANAL (Kanalname oder Nummer)",
		["Filter Name"] = "Name filtern",
		["Forward"] = "Weiterleiten",
		["Forward the message to a chat channel."] = "Leitet die Nachricht an einen Chat-Kanal weiter.",
		["Forward the message to a custom chat channel."] = "Ausgabe an einen privaten Chat-Kanal",
		["ForwardCustom"] = true,
		["ForwardMessage"] = "Nachricht weiterleiten",
		["ForwardMessageCustom"] = "Privater Kanal",
		["Hilight Color"] = "Farbe für Hervorhebungen",
		["Hilight Match Text"] = "Text hervorheben, der Suchbegriff entspricht",
		["Inbound"] = "Eingehend",
		["inchannels_desc"] = "Suche in bestimmten Kanälen",
		["inchannels_name"] = "Suche Kanäle",
		["Is this pattern enabled for use?"] = "Ist das Muster zur Anwendung aktiviert?",
		["Match Options"] = "Übereinstimmungsoptionen",
		["module_desc"] = "Modul zur Unterstützung eigener Filter.",
		["module_name"] = "CustomFilters",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Gibt nur den Nachrichtenteil des Chat-Textes aus, lässt den Kanal- und Spielernamen usw. weg.",
		["Outbound"] = "Ausgehend",
		["Output Channel"] = "Ausgabekanal",
		["Output Message Only"] = "Nur Nachricht ausgeben",
		["Pattern Info"] = "Muster-Informationen",
		["Pattern Options"] = "Optionen für Muster",
		["Play a sound when this message is output to the chatframe"] = "Einen Ton abspielen, wenn diese Nachricht an das Chatfenster ausgegeben wurde.",
		["Play Sound"] = "Ton abspielen",
		["Prevent the message from being displayed"] = "Verhindert, dass die Nachricht angezeigt wird",
		["Remove an existing pattern."] = "Ein vorhandenes Muster entfernen.",
		["Remove Pattern"] = "Muster entfernen",
		["Replacement Text"] = "Ersatztext",
		["Search Format String"] = "Suche Formatierungs-String",
		["Search Pattern"] = "Suchmuster",
		["Secondary Output"] = "Sekundäre Ausgabe",
		["Send to a secondary output"] = "Versende eine sekundäre Ausgabe",
		["Supplied pattern is a format string instead of a pattern"] = "Geliefertes Muster ist eine Formatierungsvariable anstatt eines Musters.",
		["Your name for this filter"] = "Dein Name für diesen Filter",
	}
}


  PL:AddLocale(PRAT_MODULE, "deDE",L)



L = {
	["CustomFilters"] = {
		["<string>"] = "<내용>",
		["Add a pattern to search for."] = "검색할 패턴을 추가합니다.",
		["Add Pattern"] = "패턴 추가",
		["Block Message"] = "메시지 차단",
		["Channel Data"] = "채널 데이터",
		["Channel to send output text to."] = "출력 내용을 보낼 채널.",
		["chatframesink_desc"] = "대화창으로 출력",
		["chatframesink_name"] = "대화창",
		["Enabled"] = "사용",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "귓속말 (대상)과 채널 (채널 이름 또는 숫자)의 추가 데이터",
		["Filter Name"] = "필터 이름",
		["Forward"] = "보내기",
		["Forward the message to a chat channel."] = "메시지를 대화 채널로 보내기.",
		["Forward the message to a custom chat channel."] = "사설 채널로 출력",
		["ForwardCustom"] = "사설 채널로 보내기",
		["ForwardMessage"] = "메시지 보내기",
		["ForwardMessageCustom"] = "사설 채널",
		["Hilight Color"] = "색상 강조",
		["Hilight Match Text"] = "일치하는 문자 강조",
		["Inbound"] = "받는 메시지",
		["inchannels_desc"] = "특정 채널에서 검색",
		["inchannels_name"] = "채널 검색",
		["Is this pattern enabled for use?"] = "이 패턴을 사용하기 위해 활성화 할까요?",
		["Match Options"] = "일치 옵션",
		["module_desc"] = "사용자 설정 필터를 지원하는 모듈입니다.",
		["module_name"] = "사용자 설정 필터 [CustomFilters]",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "대화 문자열, 채널 나감, 플레이어 이름 등의 메시지 부분만 출력합니다.",
		["Outbound"] = "보낸 메시지",
		["Output Channel"] = "출력 채널",
		["Output Message Only"] = "출력 메시지만",
		["Pattern Info"] = "패턴 정보",
		["Pattern Options"] = "패턴 옵션",
		["Play a sound when this message is output to the chatframe"] = "이 메시지가 대화창에 출력되면 소리를 재생합니다",
		["Play Sound"] = "소리 재생",
		["Prevent the message from being displayed"] = "표시 중인 메시지 차단하기",
		["Remove an existing pattern."] = "저장 중인 패턴을 제거합니다.",
		["Remove Pattern"] = "패턴 삭제",
		["Replacement Text"] = "대체 텍스트",
		["Search Format String"] = "형식 구문 검색",
		["Search Pattern"] = "패턴 검색",
		["Secondary Output"] = "보조 출력",
		["Send to a secondary output"] = "보조 출력으로 전송하기",
		["Supplied pattern is a format string instead of a pattern"] = "제공된 패턴은 패턴이 아닌 형식 구문입니다",
		["Your name for this filter"] = "이 필터의 이름",
	}
}


  PL:AddLocale(PRAT_MODULE, "koKR",L)



L = {
	["CustomFilters"] = {
		--[[Translation missing --]]
		["<string>"] = "<string>",
		--[[Translation missing --]]
		["Add a pattern to search for."] = "Add a pattern to search for.",
		--[[Translation missing --]]
		["Add Pattern"] = "Add Pattern",
		--[[Translation missing --]]
		["Block Message"] = "Block Message",
		--[[Translation missing --]]
		["Channel Data"] = "Channel Data",
		--[[Translation missing --]]
		["Channel to send output text to."] = "Channel to send output text to.",
		--[[Translation missing --]]
		["chatframesink_desc"] = "Output to a chat window",
		--[[Translation missing --]]
		["chatframesink_name"] = "Chatframe",
		--[[Translation missing --]]
		["Enabled"] = "Enabled",
		--[[Translation missing --]]
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Extra data for WHISPER (target) and CHANNEL (channel name or num)",
		--[[Translation missing --]]
		["Filter Name"] = "Filter Name",
		--[[Translation missing --]]
		["Forward"] = "Forward",
		--[[Translation missing --]]
		["Forward the message to a chat channel."] = "Forward the message to a chat channel.",
		--[[Translation missing --]]
		["Forward the message to a custom chat channel."] = "Output to a private chat channel",
		--[[Translation missing --]]
		["ForwardCustom"] = "ForwardCustom",
		--[[Translation missing --]]
		["ForwardMessage"] = "ForwardMessage",
		--[[Translation missing --]]
		["ForwardMessageCustom"] = "Private Channel",
		--[[Translation missing --]]
		["Hilight Color"] = "Hilight Color",
		--[[Translation missing --]]
		["Hilight Match Text"] = "Hilight Match Text",
		--[[Translation missing --]]
		["Inbound"] = "Inbound",
		--[[Translation missing --]]
		["inchannels_desc"] = "Search in certain channels",
		--[[Translation missing --]]
		["inchannels_name"] = "Search Channels",
		--[[Translation missing --]]
		["Is this pattern enabled for use?"] = "Is this pattern enabled for use?",
		--[[Translation missing --]]
		["Match Options"] = "Match Options",
		--[[Translation missing --]]
		["module_desc"] = "Module to support custom filters.",
		--[[Translation missing --]]
		["module_name"] = "CustomFilters",
		--[[Translation missing --]]
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Only output the message portion of the chat text, leave out the channel, and playername etc.",
		--[[Translation missing --]]
		["Outbound"] = "Outbound",
		--[[Translation missing --]]
		["Output Channel"] = "Output Channel",
		--[[Translation missing --]]
		["Output Message Only"] = "Output Message Only",
		--[[Translation missing --]]
		["Pattern Info"] = "Pattern Info",
		--[[Translation missing --]]
		["Pattern Options"] = "Pattern Options",
		--[[Translation missing --]]
		["Play a sound when this message is output to the chatframe"] = "Play a sound when this message is output to the chatframe",
		--[[Translation missing --]]
		["Play Sound"] = "Play Sound",
		--[[Translation missing --]]
		["Prevent the message from being displayed"] = "Prevent the message from being displayed",
		--[[Translation missing --]]
		["Remove an existing pattern."] = "Remove an existing pattern.",
		--[[Translation missing --]]
		["Remove Pattern"] = "Remove Pattern",
		--[[Translation missing --]]
		["Replacement Text"] = "Replacement Text",
		--[[Translation missing --]]
		["Search Format String"] = "Search Format String",
		--[[Translation missing --]]
		["Search Pattern"] = "Search Pattern",
		--[[Translation missing --]]
		["Secondary Output"] = "Secondary Output",
		--[[Translation missing --]]
		["Send to a secondary output"] = "Send to a secondary output",
		--[[Translation missing --]]
		["Supplied pattern is a format string instead of a pattern"] = "Supplied pattern is a format string instead of a pattern",
		--[[Translation missing --]]
		["Your name for this filter"] = "Your name for this filter",
	}
}


  PL:AddLocale(PRAT_MODULE, "esMX",L)



L = {
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "Добавить образец для поиска.",
		["Add Pattern"] = "Добавить образец",
		["Block Message"] = "Блокировка сообщения",
		["Channel Data"] = "Канал данных",
		["Channel to send output text to."] = "Канал для отсылки выходящего текста.",
		["chatframesink_desc"] = "Вывод в окно чата",
		["chatframesink_name"] = "Чатфрейм ",
		["Enabled"] = "Включено",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Добавочные данные для ШЕПОТА (цель) и КАНАЛА (название канала или номер)",
		["Filter Name"] = "Название фильтра",
		["Forward"] = "Пересылать",
		["Forward the message to a chat channel."] = "Пересылать сообщение в канал чата.",
		["Forward the message to a custom chat channel."] = "Вывод в частный канал",
		["ForwardCustom"] = true,
		["ForwardMessage"] = true,
		["ForwardMessageCustom"] = "Частный канал",
		["Hilight Color"] = "Цвет выделения",
		["Hilight Match Text"] = "Выделение текста",
		["Inbound"] = "Входящие",
		["inchannels_desc"] = "Поиск в определённых каналах",
		["inchannels_name"] = "Поиск канала",
		["Is this pattern enabled for use?"] = "Включить в использование данный шаблон?",
		["Match Options"] = "Опции совпадения",
		["module_desc"] = "Модуль поддерживающий пользовательские фильтры.",
		["module_name"] = "CustomFilters",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Вывод только части сообщений, выход с канала, имя игрока и т.д.",
		["Outbound"] = "Исходящие",
		["Output Channel"] = "Канал вывода",
		["Output Message Only"] = "Только вывод сообщения",
		["Pattern Info"] = "Шаблон",
		["Pattern Options"] = "Настройки образца",
		["Play a sound when this message is output to the chatframe"] = "Проиграть звук когда данное сообщение выводится в окно чата.",
		["Play Sound"] = "Проиграть звук",
		["Prevent the message from being displayed"] = "Предотвращает отображение сообщения",
		["Remove an existing pattern."] = "Удалить существующий образец.",
		["Remove Pattern"] = "Удалить образец",
		["Replacement Text"] = "Замена текста",
		["Search Format String"] = "Формат строки поиска",
		["Search Pattern"] = "Образец поиска",
		["Secondary Output"] = "Вторичный вывод",
		["Send to a secondary output"] = "Отослать на вторичный вывод",
		["Supplied pattern is a format string instead of a pattern"] = "Поставляется оброзец формата строки вместо шаблона",
		["Your name for this filter"] = "Ваше имя для данного фильтра",
	}
}


  PL:AddLocale(PRAT_MODULE, "ruRU",L)



L = {
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "添加一个搜索模板",
		["Add Pattern"] = "添加模板",
		["Block Message"] = "消息阻止",
		["Channel Data"] = "频道数据",
		["Channel to send output text to."] = "频道发送输出文本",
		--[[Translation missing --]]
		["chatframesink_desc"] = "Output to a chat window",
		--[[Translation missing --]]
		["chatframesink_name"] = "Chatframe",
		["Enabled"] = "启用",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "密语(目标)和频道(频道名称或数字)的扩展数据",
		["Filter Name"] = "过滤器名字",
		["Forward"] = "转发",
		["Forward the message to a chat channel."] = "转发信息到聊天频道",
		["Forward the message to a custom chat channel."] = "输出到一个私人频道",
		["ForwardCustom"] = "自定义传送",
		["ForwardMessage"] = "信息转发",
		["ForwardMessageCustom"] = "私有频道",
		["Hilight Color"] = "颜色高亮",
		["Hilight Match Text"] = "高亮匹配文本",
		["Inbound"] = "输入范围",
		["inchannels_desc"] = "在当前频道搜索",
		["inchannels_name"] = "搜索频道",
		["Is this pattern enabled for use?"] = "这个样式启用了吗？",
		["Match Options"] = "适配选项",
		["module_desc"] = "支持自定义过滤的模块",
		["module_name"] = "自定义过滤",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "仅在聊天文本中输出部分信息，移除频道和玩家姓名等",
		["Outbound"] = "输出范围",
		["Output Channel"] = "输出频道",
		["Output Message Only"] = "只输出信息",
		["Pattern Info"] = "样式信息",
		["Pattern Options"] = "模块选项",
		["Play a sound when this message is output to the chatframe"] = "当信息在聊天框输出时播放声音",
		["Play Sound"] = "播放声音",
		["Prevent the message from being displayed"] = "阻止信息被现实",
		["Remove an existing pattern."] = "移除现有模板",
		["Remove Pattern"] = "移除模板",
		["Replacement Text"] = "替换文本",
		["Search Format String"] = "搜索格式字符串",
		["Search Pattern"] = "搜索模板",
		["Secondary Output"] = "二次输出",
		["Send to a secondary output"] = "发送二次输出",
		["Supplied pattern is a format string instead of a pattern"] = "支持模板是格式字符串而非模板",
		["Your name for this filter"] = "这个过滤器的名字",
	}
}


  PL:AddLocale(PRAT_MODULE, "zhCN",L)



L = {
	["CustomFilters"] = {
		["<string>"] = "<cadena>",
		["Add a pattern to search for."] = "Añadir un patrón de búsqueda.",
		["Add Pattern"] = "Añadir Patrón",
		["Block Message"] = "Bloque de Mensaje",
		["Channel Data"] = "Datos de Canal",
		["Channel to send output text to."] = "Canal a enviar el texto de salida",
		--[[Translation missing --]]
		["chatframesink_desc"] = "Output to a chat window",
		--[[Translation missing --]]
		["chatframesink_name"] = "Chatframe",
		["Enabled"] = "Activado",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Datos extra para SUSURRAR (objetivo) y CANAL (nombre de canal o número)",
		["Filter Name"] = "Nombre del Filtro",
		["Forward"] = "Reenviar",
		["Forward the message to a chat channel."] = "Reenviar el mensaje a un canal de chat.",
		["Forward the message to a custom chat channel."] = "Salida a un canal privado de chat",
		["ForwardCustom"] = "Reenviar Personalizado",
		["ForwardMessage"] = "ReenviarMensaje",
		["ForwardMessageCustom"] = "Canal Privado",
		["Hilight Color"] = "Color Resaltado",
		["Hilight Match Text"] = "Texto Coincidente Resaltado",
		["Inbound"] = "Entrante",
		["inchannels_desc"] = "Buscar en algunos canales",
		["inchannels_name"] = "Buscar canales",
		["Is this pattern enabled for use?"] = "¿Está habilitado este patrón para su uso?",
		["Match Options"] = "Opciones de Coincidencias",
		["module_desc"] = "Módulo para soportar filtros personalizados.",
		["module_name"] = "Filtros Personalizados",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Sólo mostrar la parte del mensaje del chat de texto, omitir el canal, nombre de jugador, etc.",
		["Outbound"] = "Saliente",
		["Output Channel"] = "Canal de Salida",
		["Output Message Only"] = "Solo Mensajes Salientes",
		["Pattern Info"] = "Patrón de Información",
		["Pattern Options"] = "Opciones de Patrón",
		["Play a sound when this message is output to the chatframe"] = "Reproducir un sonido cuando este mensaje sale en el marco de chat",
		["Play Sound"] = "Reproducir Sonido",
		["Prevent the message from being displayed"] = "Impedir que el mensaje sea visualizado",
		["Remove an existing pattern."] = "Elimina un patrón existente.",
		["Remove Pattern"] = "Eliminar Patrón",
		["Replacement Text"] = "Sustitución de texto",
		["Search Format String"] = "Cadena de Formato de Búsqueda",
		["Search Pattern"] = "Patrón de Búsqueda",
		["Secondary Output"] = "Salida Secundaria",
		["Send to a secondary output"] = "Enviar a un salida secundaria",
		["Supplied pattern is a format string instead of a pattern"] = "El patrón suministrado es una cadena de formato en lugar de un patrón",
		["Your name for this filter"] = "Su nombre para este filtro",
	}
}


  PL:AddLocale(PRAT_MODULE, "esES",L)



L = {
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "新增模式搜索。",
		["Add Pattern"] = "新增樣式",
		["Block Message"] = "屏蔽訊息",
		["Channel Data"] = "頻道資料",
		["Channel to send output text to."] = "頻道發送輸出文字至。",
		--[[Translation missing --]]
		["chatframesink_desc"] = "Output to a chat window",
		--[[Translation missing --]]
		["chatframesink_name"] = "Chatframe",
		["Enabled"] = "已啟用",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "額外資料密話(目標)和頻道(頻道名稱或數字)",
		["Filter Name"] = "過濾名稱",
		["Forward"] = "轉送",
		["Forward the message to a chat channel."] = "轉送訊息至聊天頻道",
		["Forward the message to a custom chat channel."] = "轉送名稱至自訂聊天頻道",
		["ForwardCustom"] = "自訂轉送",
		["ForwardMessage"] = "轉送訊息",
		["ForwardMessageCustom"] = "私人頻道",
		["Hilight Color"] = "高亮提示色彩",
		["Hilight Match Text"] = "符合高亮提示文字",
		["Inbound"] = "傳入",
		["inchannels_desc"] = "搜尋某些頻道",
		["inchannels_name"] = "搜尋頻道",
		--[[Translation missing --]]
		["Is this pattern enabled for use?"] = "Is this pattern enabled for use?",
		["Match Options"] = "匹配選項",
		["module_desc"] = "支援自訂過濾的模組",
		["module_name"] = "自定義過濾",
		--[[Translation missing --]]
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Only output the message portion of the chat text, leave out the channel, and playername etc.",
		["Outbound"] = "傳出",
		["Output Channel"] = "輸出頻道",
		["Output Message Only"] = "僅輸出訊息",
		["Pattern Info"] = "樣式資訊",
		["Pattern Options"] = "模式選項",
		--[[Translation missing --]]
		["Play a sound when this message is output to the chatframe"] = "Play a sound when this message is output to the chatframe",
		["Play Sound"] = "播放音效",
		--[[Translation missing --]]
		["Prevent the message from being displayed"] = "Prevent the message from being displayed",
		["Remove an existing pattern."] = "替換文本",
		["Remove Pattern"] = "移除模板",
		["Replacement Text"] = "替換文字",
		["Search Format String"] = "搜尋格式字串",
		["Search Pattern"] = "搜尋樣式",
		["Secondary Output"] = "次要輸出",
		["Send to a secondary output"] = "發送次要輸出",
		--[[Translation missing --]]
		["Supplied pattern is a format string instead of a pattern"] = "Supplied pattern is a format string instead of a pattern",
		["Your name for this filter"] = "你的名字此過濾",
	}
}


  PL:AddLocale(PRAT_MODULE, "zhTW",L)


end
--@end-non-debug@


  local eventMap = {
    CHAT_MSG_CHANNEL_LIST = true,
    CHAT_MSG_SAY = true,
    CHAT_MSG_GUILD = true,
    CHAT_MSG_WHISPER_INFORM = true,
    CHAT_MSG_WHISPER = true,
    CHAT_MSG_YELL = true,
    CHAT_MSG_PARTY = true,
    CHAT_MSG_PARTY_LEADER = true,
    CHAT_MSG_OFFICER = true,
    CHAT_MSG_RAID = true,
    CHAT_MSG_RAID_LEADER = true,
    CHAT_MSG_INSTANCE_CHAT = true,
    CHAT_MSG_INSTANCE_CHAT_LEADER = true,
  }

  local eventTypes = {}
  local function getTypes()
    for k, v in pairs(ChatTypeGroup) do
      eventTypes[k] = _G["CHAT_MSG_" .. k]
    end
    for _, v in ipairs(Prat.GetChannelTable()) do
        eventTypes[v] = "Channel: " .. v
    end
    eventTypes.WHISPER_INFORM = CHAT_MSG_WHISPER_INFORM
    eventTypes.CHANNEL = CHANNEL
    return eventTypes
  end

  local newmap = {}
  for i, v in ipairs(eventMap) do
    newmap[v] = v
  end

  eventMap, newmap = newmap




  local patterndefaults = {
    ["*"] = {
      enabled = true,
      sink20OutputSink = "None",
      replacement_is_code = false,
      outputmessageonly = true,
      inchannels = {
        SYSTEM = true,
        SAY = true,
        EMOTE = true,
        YELL = true,
        WHISPER = true,
        WHISPER_INFORM = true,
        PARTY = true,
        RAID = true,
        RAID_LEADER = true,
        RAID_WARNING = true,
        INSTANCE_CHAT = true,
        INSTANCE_CHAT_LEADER = true,
        GUILD = true,
        GUILD_OFFICER = true,
        MONSTER_SAY = true,
        MONSTER_YELL = true,
        MONSTER_EMOTE = true,
        MONSTER_WHISPER = true,
        MONSTER_BOSS_EMOTE = true,
        MONSTER_BOSS_WHISPER = true,
        ERRORS = true,
        AFK = true,
        DND = true,
        IGNORED = true,
        BG_HORDE = true,
        BG_ALLIANCE = true,
        BG_NEUTRAL = true,
        COMBAT_XP_GAIN = true,
        COMBAT_HONOR_GAIN = true,
        COMBAT_FACTION_CHANGE = true,
        SKILL = true,
        MONEY = true,
        OPENING = true,
        TRADESKILLS = true,
        PET_INFO = true,
        COMBAT_MISC_INFO = true,
        ACHIEVEMENT = true,
        GUILD_ACHIEVEMENT = true,
        CHANNEL = true,
      }
    }
  }
  Prat:SetModuleDefaults(module, {
    profile = {
      on = false,
      inbound = patterndefaults,
      outbound = patterndefaults,
      outputchannel = CHAT_MSG_SAY,
      outputchanneldata = "",
      sinkoptions = {}
    }
  })

  local modeOptions = {
    mode = {
      inbound = {
        type = "group",
        name = PL["Inbound"],
        desc = PL["Inbound"],
        args = {}
      },
      outbound = {
        type = "group",
        name = PL["Outbound"],
        desc = PL["Outbound"],
        args = {}
      },
    }
  }

  Prat:SetModuleOptions(module, {
    name = PL["module_name"],
    desc = PL["module_desc"],
    type = "group",
    plugins = modeOptions,
    args = {
      outputchannel = {
        type = "select",
        name = PL["Output Channel"],
        desc = PL["Channel to send output text to."],
        order = 110,
        values = eventMap,
      },
      outputchanneldata = {
        type = "input",
        order = 115,
        name = PL["Channel Data"],
        desc = PL["Extra data for WHISPER (target) and CHANNEL (channel name or num)"],
        usage = "<string>",
        disabled = function(info) return not (info.handler.db.profile.outputchannel == CHAT_MSG_WHISPER_INFORM or
          info.handler.db.profile.outputchannel == CHAT_MSG_CHANNEL_LIST)
        end
      },
      outputmessageonly = {
        type = "toggle",
        name = PL["Output Message Only"],
        desc = PL["Only output the message portion of the chat text, leave out the channel, and playername etc."],
        order = 118,
      }
    }
  })


  function module:BuildModeOptions(mode, opts)
    local mode = mode
    local po = opts[mode].args


    self[mode] = {}
    self[mode].validate = {}

    --    po.pathdr = {
    --        type = "header",
    --        name = PL["Pattern Options"],
    --        order = 80,
    --    }

    for k, v in pairs(self.db.profile[mode]) do
      self:AddPatternOptions(po, v.name or k, mode, k)
      self[mode].validate[k] = v.name or k
    end

    --    po.opspc = {
    --        type = "header",
    --        order = 94,
    --    }

    po.addpattern = {
      name = PL["Add Pattern"],
      desc = PL["Add a pattern to search for."],
      type = "input",
      usage = PL["<string>"],
      get = false,
      set = "AddPattern"
    }

    po.removepattern = {
      name = PL["Remove Pattern"],
      desc = PL["Remove an existing pattern."],
      type = "select",
      get = function(info) return "" end,
      set = "RemovePattern",
      values = self[mode].validate,
      disabled = function(info)
        local mode = info[#info - 1]
        for k, v in pairs(info.handler.db.profile[mode]) do
          return false
        end return true
      end,
    }
  end

  function module:DisableOutputOption(info)
    return not self.db.profile[info[#info - 3]][info[#info - 2]].tosink
  end

  function module:AddPatternOptions(o, pattern, mode, key)
    key = key or pattern
    o[key] = o[key] or {}
    local po = o[key]
    local settings = self.db.profile[mode][key]
    local mode = mode
    local pattern = pattern
    po.type = "group"
    po.name = pattern
    po.desc = pattern
    po.order = 90

    po.args = {
      name = {
        order = 1,
        type = "input",
        name = PL["Filter Name"],
        desc = PL["Your name for this filter"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
      },
      enabled = {
        order = 5,
        type = "toggle",
        name = PL["Enabled"],
        desc = PL["Is this pattern enabled for use?"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
      },
      opspc9 = {
        name = PL["Pattern Info"],
        type = "header",
        order = 9,
      },
      searchfor = {
        order = 10,
        type = "input",
        name = PL["Search Pattern"],
        desc = PL["Search Pattern"],
        usage = PL["<string>"],
        get = "GetPatternValue",
        set = "UpdatePatternValue"
      },
      inchannels = {
        name = PL["inchannels_name"],
        desc = PL["inchannels_desc"],
        type = "multiselect",
        order = 110,
        values = getTypes(),
        get = "GetChannelPatternSubValue",
        set = "SetChannelPatternSubValue",
      },
      --        searchfordeformat = {
      --            type = "toggle",
      --            name = PL["Search Format String"],
      --            desc = PL["SuPLied pattern is a format string instead of a pattern"],
      --            get = "GetPatternValue",
      --            set = "UpdatePatternValue"
      --            },
      replacewith = {
        order = 20,
        type = "input",
        name = PL["Replacement Text"],
        desc = PL["Replacement Text"],
        usage = PL["<string>"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
        disabled = "GetDisableReplace",
      },
      opspc29 = {
        name = PL["Match Options"],
        type = "header",
        order = 29,
      },
      block = {
        type = "toggle",
        name = PL["Block Message"],
        desc = PL["Prevent the message from being displayed"],
        get = "GetPatternValue",
        set = "SetPatternValue"
      },
      tosink = {
        type = "toggle",
        name = PL["Secondary Output"],
        desc = PL["Send to a secondary output"],
        get = "GetPatternValue",
        set = "SetPatternValue"
      },
      sound = {
        type = "select",
        name = PL["Play Sound"],
        desc = PL["Play a sound when this message is output to the chatframe"],
        dialogControl = 'LSM30_Sound',
        get = "GetPatternValue",
        set = "SetPatternValue",
        values = AceGUIWidgetLSMlists.sound,
      },
      hilight = {
        type = "toggle",
        name = PL["Hilight Match Text"],
        desc = PL["Hilight Match Text"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
        disabled = "GetBlockMessage",
      },
      hilight_color = {
        type = "color",
        name = PL["Hilight Color"],
        desc = PL["Hilight Color"],
        get = "GetPatternColorValue",
        set = "SetPatternColorValue",
        disabled = "GetBlockMessage",
      },
      replacement_is_code = {
        type = "toggle",
        get = "GetPatternValue",
        set = "SetPatternValue",
        name = "Replacement is Lua code",
        desc = "Replacement is Lua code",
      }
    }

    self.SetSinkStorage(settings, settings)

    po.args.outputmessageonly = {
      type = "toggle",
      name = PL["Output Message Only"],
      desc = PL["Only output the message portion of the chat text, leave out the channel, and playername etc."],
      order = 190,
      get = "GetPatternValue",
      set = "UpdatePatternValue",
    }
    po.args.output = self.GetSinkAce3OptionsDataTable(settings)
    po.args.output.inline = true
    po.args.output.order = 200
    po.args.output.disabled = "DisableOutputOption"
  end

  local CLR = Prat.CLR

  local function match(text, matchopts, mode)
    if (not matchopts) or (not matchopts.enabled) then return end

    local matchtype
    if mode == "inbound" then
      matchtype = "FRAME"
    else
      matchtype = "OUTBOUND"
    end

    local textout = text

    if mode == "inbound" then
      local chatype = Prat.SplitMessage.CHATTYPE
      local typeopt = matchopts.inchannels[chatype]

      if Prat.SplitMessage.CHATTYPE == "CHANNEL" then
        local channelopt = matchopts.inchannels[Prat.SplitMessage.ORG.CHANNEL]

        if channelopt == false then return end
        if channelopt == nil and not typeopt then return end
      else
        if typeopt == false then
          return
        end
      end
    end

    if matchopts.replacewith and matchopts.replacewith ~= matchopts.searchfor then
      if matchopts.replacement_is_code then
        textout = loadstring(matchopts.replacewith)(text)
      else
        textout = textout:gsub(matchopts.searchfor, matchopts.replacewith)
      end
    end

    if matchopts.hilight then
      local hexcolor = CLR:GetHexColor(matchopts.hilight_color)
      textout = CLR:Colorize(hexcolor, textout)
    end

    if matchopts.sink20OutputSink then
      if mode == "inbound" then
        Prat.SplitMessage.CF_SINK_OUT = matchopts
      else
        Prat.SplitMessageOut.CF_SINK_OUT = matchopts
      end
    end

    if matchopts.tosink then
      if mode == "inbound" then
        Prat.SplitMessage.CF_SINK = true
      else
        Prat.SplitMessageOut.CF_SINK = true
      end
    end

    if matchopts.sound then
      if mode == "inbound" then
        Prat.SplitMessage.CF_SOUND = matchopts.sound
      else
        Prat.SplitMessageOut.CF_SOUND = matchopts.sound
      end
    end

    if matchopts.block then
      if mode == "inbound" then
        Prat.SplitMessage.DONOTPROCESS = true
      else
        Prat.SplitMessageOut.DONOTPROCESS = true
      end
    end


    textout = Prat:RegisterMatch(textout, matchtype)
    --  end

    return textout
  end



  function module:RegisterPattern(matchopts, mode)
    local mode = mode
    local matchopts = matchopts
    local matchtype
    if mode == "inbound" then
      matchtype = "FRAME"
    else
      matchtype = "OUTBOUND"
    end
    local patterninfo = {
      pattern = matchopts.searchfor,
      matchopts = matchopts,
      matchfunc =
      function(text, ...)
        local mode = mode
        local matchopts = matchopts
        return match(text, matchopts, mode)
      end,
      type = matchtype,
      deformat = matchopts.deformat,
      priority = 46
    }

    Prat.RegisterPattern(patterninfo, self.name)

    table.insert(self.modulePatterns, patterninfo)
  end

  function module:UnregisterPattern(matchopts)
    local patterninfo
    for _, v in pairs(self.modulePatterns) do
      if v.matchopts == matchopts then
        patterninfo = v
      end
    end

    if patterninfo == nil then return end

    if patterninfo.idx then
      Prat.UnregisterPattern(patterninfo.idx)
    end

    local idx
    for k, v in pairs(self.modulePatterns) do
      if v == patterninfo then
        idx = k
      end
    end

    table.remove(self.modulePatterns, idx)
  end

  function module:UpdatePattern(matchopts)
    local patterninfo
    for _, v in pairs(self.modulePatterns) do
      if v.matchopts == matchopts then
        patterninfo = v
      end
    end

    if patterninfo == nil then return end

    local mode
    local matchopts = matchopts
    if patterninfo.type == "FRAME" then
      mode = "inbound"
    else
      mode = "outbound"
    end

    patterninfo.pattern = matchopts.searchfor
    patterninfo.deformat = matchopts.deformat
    patterninfo.matchfunc =
    function(text, ...)
      return match(text, matchopts, mode)
    end
  end

  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  Prat:SetModuleInit(module,
    function(self)
      --      local function tailChan(t, cnum, cname, ...)
      --        if not cnum then return t end
      --        if Prat.IsPrivateChannel(cnum) then
      --          t[#t + 1] = cname
      --        end
      --        return tailChan(t, ...)
      --      end
      --
      --      self:RegisterSink(PL["ForwardCustom"],
      --        PL["ForwardMessageCustom"],
      --        PL["Forward the message to a custom chat channel."],
      --        "ForwardCustom",
      --        function() return tailChan({}, GetChannelList()) end)

      self:RegisterSink(PL.chatframesink_name,
        PL.chatframesink_name,
        PL.chatframesink_desc,
        "ChatframeSink",
        function()
          local keys = {}
          for k, v in pairs(Prat.HookedFrames) do
            if not v.isTemporary and (v:IsShown() or v.isDocked) then
              keys[#keys + 1] = v.name or k
            end
          end

          return keys
        end)


      local modeOpts = modeOptions.mode
      for k, v in pairs(modeOpts) do
        self:BuildModeOptions(k, modeOpts)
      end

      self:SetSinkStorage(self.db.profile.sinkoptions)
      modeOpts.output = self:GetSinkAce3OptionsDataTable()
      modeOpts.output.inline = true
    end)

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    self.modulePatterns = {}
    local modeOpts = modeOptions.mode
    local mode
    for mode, _ in pairs(modeOpts) do
      if type(self.db.profile[mode]) == "table" then
        local patopts
        for _, patopts in pairs(self.db.profile[mode]) do
          if patopts.enabled then
            self:RegisterPattern(patopts, mode)
          end
        end
      end
    end

    Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)
    Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE_BLOCKED, "Prat_PostAddMessage")
  end


  function module:OnModuleDisable()
    self.modulePatterns = nil
    Prat.UnregisterAllChatEvents(self)
  end

  function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    local uid = message.LINE_ID
    if uid and
      uid == self.lastevent and
      self.lasteventtype == event then
      return
    end

    self.lasteventtype = event
    self.lastevent = uid

    if message.CF_SINK or message.CF_SINK_OUT then
      if message.CF_SINK_OUT.outputmessageonly then
        self.Pour(message.CF_SINK_OUT or self, message.MESSAGE, r, g, b)
      else
        self.Pour(message.CF_SINK_OUT or self, text, r, g, b)
      end
    end

    if message.CF_SOUND then
      Prat:PlaySound(message.CF_SOUND)
    end
  end


  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  function module:GetPatternValue(info)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
  end

  function module:UpdatePatternValue(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
    self:UpdatePattern(self.db.profile[info[#info - 2]][info[#info - 1]])
  end

  function module:SetPatternValue(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
  end

  function module:GetPatternSubValue(info, val)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]][val]
  end

  function module:SetPatternSubValue(info, val, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]][val] = v
  end

  function module:GetChannelPatternSubValue(info, val)
    local v = self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]][val]

    if ChatTypeGroup[val] or v ~= nil then return v end

    return  self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]["CHANNEL"]
  end

  function module:SetChannelPatternSubValue(info, val, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]][val] = v
  end

  function module:SetPatternName(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
  end

  local defclr = { r = 1, b = 1, g = 1, a = 1 }
  function module:GetPatternColorValue(info)
    local c = self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
    if c == nil then
      self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = { r = 1, g = 1, b = 1, a = 1 }
      c = self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
    end
    return c.r, c.g, c.b, c.a
  end

  function module:SetPatternColorValue(info, r, g, b, a)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = { r = r, g = g, b = b, a = a }
  end


  function module:GetPatternSearch(info)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
  end

  function module:SetPatternSearch(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
    self:UpdatePattern(self.db.profile[info[#info - 2]][info[#info - 1]])
  end

  function module:GetPatternReplace(info)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
  end

  function module:SetPatternReplace(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
    self:UpdatePattern(self.db.profile[info[#info - 2]][info[#info - 1]])
  end

  function module:GetPatternHilight(p)
    return p.hilight
  end

  function module:SetPatternHilight(p, v)
    p.hilight = v

    self:UpdatePattern(p)
  end

  function module:GetDisableReplace(p)
    return p.block or p.tosink
  end

  function module:GetBlockMessage(p)
    return p.block
  end

  function module:SetBlockMessage(p, v)
    p.block = v
  end

  function module:GetSinkMessage(p)
    return p.tosink
  end

  function module:SetSinkMessage(p, v)
    p.tosink = v
  end

  function module:GetSoundMessage(p)
    return p.sound
  end

  function module:SetSoundMessage(p, v)
    p.sound = v

    Prat:PlaySound(v)
  end


  local white_clr = { r = 1.0, b = 1.0, g = 1.0 }
  function module:GetPatternHilightClr(p)
    local h = p.hilight_color or white_clr
    return h.r or 1.0, h.g or 1.0, h.b or 1.0
  end

  function module:SetPatternHilightClr(p, r, g, b)
    p.hilight_color = p.hilight_color or {}
    local h = p.hilight_color
    h.r, h.g, h.b = r, g, b

    self:UpdatePattern(p)
  end



  function module:AddPattern(info, pattern)
    local mode = info[#info - 1]
    local p = self.db.profile[mode]

    for k, v in pairs(p) do
      if v.name == pattern then
        return
      end
    end


    self[mode].validate = self[mode].validate or {}
    local v = self[mode].validate


    local num = 0
    while rawget(p, "pat" .. num) ~= nil do
      num = num + 1
    end

    local key = "pat" .. num

    p[key] = p[key] or {}
    p[key].name = pattern
    p[key].searchfor = pattern
    p[key].replacewith = "%1"

    v[key] = pattern

    local o = modeOptions.mode[mode].args
    self:AddPatternOptions(o, pattern, mode, key)

    self:RegisterPattern(p[key], mode)

    self:RefreshOptions()
  end

  function module:RemovePattern(info, pattern)
    local mode = info[#info - 1]
    local p = self.db.profile[mode]

    local v = self[mode].validate
    local key, name

    if type(pattern) == "number" then
      name = v[pattern]
    else
      name = pattern
    end


    for k, v in pairs(p) do
      if k == name then
        key = k
        break
      end

      if v.name == name then
        key = k
        break
      end
    end

    if key == nil then return end

    self:UnregisterPattern(p[key])

    p[key] = nil

    modeOptions.mode[mode].args = {}

    self:BuildModeOptions(mode, modeOptions.mode)

    self:RefreshOptions()
  end

  function module:RefreshOptions()
    LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")
  end

  --  local sink
  --  function module:ForwardCustom(source, text, ...)
  --    sink = sink or LibStub("LibSink-2.0")
  --    local s = sink.storageForAddon[source]
  --    local loc = s and s.sink20ScrollArea or ""
  --    local cnum = Prat.GetChannelName(loc)
  --
  --    if cnum and cnum > 0 then
  --      local cleantext = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
  --
  --      SendChatMessage(cleantext, "CHANNEL", GetDefaultLanguage("player"), cnum)
  --    end
  --  end
  --
  --  --msg, chatType, language, channel)
  --  function module:Forward(source, text, r, g, b, ...)
  --    local cleantext = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
  --
  --    if self.db.profile.outputchannel == CHAT_MSG_WHISPER_INFORM then
  --      SendChatMessage(cleantext, "WHISPER", GetDefaultLanguage("player"), self.db.profile.outputchanneldata)
  --    elseif self.db.profile.outputchannel == CHAT_MSG_CHANNEL_LIST then
  --      SendChatMessage(cleantext, "CHANNEL", GetDefaultLanguage("player"), Prat.GetChannelName(self.db.profile.outputchanneldata))
  --    else
  --      local chatType = strsub(self.db.profile.outputchannel, 10)
  --      SendChatMessage(cleantext, chatType, GetDefaultLanguage("player"))
  --    end
  --  end

  function module:ChatframeSink(source, text, r, g, b, ...)
    local sink = LibStub("LibSink-2.0")
    local s = sink.storageForAddon[source]
    local name = s and s.sink20ScrollArea or ""

    for k, v in pairs(Prat.HookedFrames) do
      if k == name or v.name == name then
        v:AddMessage(text, r, g, b)
        return
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad