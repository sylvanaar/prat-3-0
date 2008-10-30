-- Translated by Argonavt-Arkona
local L = AceLibrary("AceLocale-2.2"):new("BigBrother")

L:RegisterTranslations("ruRU", function() return {
	["Flask Check"] = "Проверка фляг",
	["Checks for flasks, elixirs and food buffs."] = "Проверка фляг и элексиров",

	["Quick Check"] = "Быстрая проверка",
	["A quick report that shows who does not have flasks, elixirs or food."] = "Быстро сообщает, у кого нет фляг элексиров и еды.",

	["Self"] = "Сказать",
	["Reports result only to yourself."] = "Сообщает результат проверки ( сказав)",

	["Party"] = "Группе",
	["Reports result to your party."] = "Сообщает результат проверки в группу",

	["Raid"] = "Рейду",
	["Reports result to your raid."] = "Сообщает результат проверки в рейд",

	["Guild"] = "Гильдии",
	["Reports result to guild chat."] = "Сообщает результат проверки в гильд чат",

	["Officer"] = "Офицерам",
	["Reports result to officer chat."] = "Сообщает результат проверки офицерам",

	["Whisper"] = "Лично",
	["Reports result to the currently targeted individual."] = "Сообщает результат текущей цели  в шепетом",

	["Reports if and which player breaks crowd control effects (like polymorph, shackle undead, etc.) on enemies."] = "Сообщать если игрок сбивает эффекты контроля (сковывание, превращение,спячка,сковывание нежити.)",

	["Misdirect"] = "Перенаправление",
	["Reports who gains misdirection."] = "Сообщает на кого Перенаправлена Цель",

	["BuffCheck"] = "Проверка Баффов",
	["Pops up a window to check various raid/elixir buffs (drag the bottom to resize)."] = "Всплывающее окошко для проверки рейд/элексиров баффов (двигать кнопку для увеличения).",

	["Settings"] = "Настройки",
	["Mod Settings"] = "Настройки мода",
	["Raid Groups"] = "Рейд группы",
	["Set which raid groups are checked for buffs"] = "Настраивает рейд группу для проверки баффов",
	["Group 1"] = "Группа 1",
	["Group 2"] = "Группа 2",
	["Group 3"] = "Группа 3",
	["Group 4"] = "Группа 4",
	["Group 5"] = "Группа 5",
	["Group 6"] = "Группа 6",
	["Group 7"] = "Группа 7",
	["Group 8"] = "Группа 8",

	["Checks"] = "Проверка",
	["Set whether Flasks, Elixirs and Food are included in flaskcheck/quickcheck"] = "Показывает использованные фляги, Элексиры и еду по команде flaskcheck/quickcheck",
	["Flasks"] = "Фляги",
	["Elixirs"] = "Элексиры",
	["Food Buffs"] = "Баффы Еды",

	["No Flask"] = "Нет  Фляг",
	["No Flask or Elixir"] = "Нет Фляг или Элексиров",
	["Only One Elixir"] = "Только Один Элексир",
	["Well Fed"] = "Сытость",
	["\"Well Fed\""] = "\"Сытость\"",
	["Enlightened"] = "Просвящен",
	["Electrified"] = "Электролизован",
	["No Food Buff"] = "Нет баффов Еды",

	["%s cast %s on %s"] = "%s бросок %s на %s.",
	["Polymorph/Misdirect Output"] = "Превращение/Перенаправление на Цель неверны",
	["Set where the polymorph/misdirect output is sent"] = "Настр сообщений  если Превращение/Наведение на Цель неверны.",
	["Polymorph"] = "Превращение",
	["Shackle"] = "Сковывание",
	["Hibernate"] = "Спячка",
	["%s on %s removed by %s's %s"] = "%s на %s снято %s (%s).",
	["%s on %s removed by %s"] = "%s на %s удален %s.",
	["CC on %s removed too frequently.  Throttling announcements."] = "CC на %s удален слишком часто.  Заглушать сообщения",

	["Raid Buffs"] = "Баффы рейда",
	["Paladin Buffs"] = "Баффы палов",
	["Consumables"] = "Фляги, Химия",

	-- Consumables
	["Flask of Supreme Power"] = "Фляга Высшей Власти",
	["Shattrath Flask of Mighty Restoration"] = "Шаттар Фляга Могущественного Восстановления",
	["Shattrath Flask of Fortification"] = "Шаттар Фляга Фортификации",
	["Shattrath Flask of Relentless Assault"] = "Фляга Шаттар неустанного нападения",
	["Shattrath Flask of Supreme Power"] = "Шаттар Фляга Высшей Энергии",
	["Shattrath Flask of Pure Death"] = "Шаттар Фляга Чистой Смерти",
	["Shattrath Flask of Blinding Light"] = "Шаттар Фляга Сияющего света",

	--Battle Elixirs
	["Fel Strength Elixir"] = "Элексир Силы",
	["Onslaught Elixir"] = "Элексир Нападения",
	["Elixir of Major Strength"] = "Элексир Главной Силы",
	["Elixir of Major Agility"] = "Элексир Большой Ловкости",
	["Elixir of Mastery"] = "Элексир Мастерства",
	["Elixir of Major Firepower"] = "Элексир Огневой Мощи",
	["Elixir of Major Shadow Power"] = "Элексир Темной Магии",
	["Elixir of Major Frost Power"] = "Элексир магии Мороза",
	["Elixir of Healing Power"] = "Элексир Большого Лечения",
	["Elixir of the Mongoose"] = "Элексира Магуста",
	["Elixir of Greater Firepower"] = "Элексир Большого Огня",
	["Bloodberry Elixir"] = "Элексир ягод Крови",

	-- Guardian Elixirs
	["Elixir of Major Defense"] = "Элексир Главной защиты",
	["Elixir of Superior Defense"] = "Элексир Превосходной Защиты",
	["Elixir of Major Mageblood"] = "Элексир Волшебной Крови",
	["Mageblood Potion"] = "Микстура Волшебной Крови",
	["Elixir of Greater Intellect"] = "Элексир Большого Интелекта",
	["Elixir of Empowerment"] = "Элексир Полномочия",
} end)
