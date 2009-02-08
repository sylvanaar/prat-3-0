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
Name: PratSubstitutions
Revision: $Revision: 80784 $
Author(s): Sylvanaar
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Substitutions
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Based on: CFE2 by Satrina. (http://www.wowinterface.com/downloads/info6885-ChatFrameExtender2.html
Dependencies: Prat
Description: A module to provide basic chat substitutions. (default=off).
]]

Prat:AddModuleToLoad(function() 


local PRAT_MODULE = Prat:RequestModuleName("Substitutions")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
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
	["Current value: '%s'\nClick to paste into the chat."] = true,
	['no substitution name given'] = true,
	['no value given for subtitution "%s"'] = true,
	['|cffff0000warning:|r subtitution "%s" already defined as "%s", overwriting'] = true,
	['defined %s: expands to => %s'] = true,
	['no substitution name supplied for deletion'] = true,
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
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Substitutions")@
)
--@end-non-debug@]===]




----Chinese Translate by Ananhaid(NovaLOG)@CWDG
----CWDG site: http://Cwowaddon.com

--

--

--

--

--

local module = Prat:NewModule(PRAT_MODULE)

Prat:SetModuleDefaults(module.name, {
	profile = {
		on		= false,
	}
})


local patternPlugins = { patterns={} }

Prat:SetModuleOptions(module.name, {
	name	= L["Substitutions"],
	desc	= L["A module to provide basic chat substitutions."],
	type	= 'group',
	plugins = patternPlugins,
	args = {}
	}
)

local function subDesc(info) return info.handler:GetSubstDescription(info) end


--[[------------------------------------------------
Core Functions
------------------------------------------------]]--
function module:OnModuleEnable()
	self:BuildModuleOptions(patternPlugins.patterns)
end

function module:BuildModuleOptions(args)
	local modulePatterns = Prat.GetModulePatterns(self)

	local order	= 500

	self.buildingMenu = true

	for k,v in pairs(modulePatterns) do
		local name	= v.optname
		local pat	= v.pattern:gsub("%%%%", "%%")

		order	= order + 10

		args[name] = args[name] or {}
		local d = args[name]

		d.name = name.." "..pat
		d.desc = subDesc
		d.type	= "execute"
		d.func	= "DoPat"
		d.order	= order
	end

	self.buildingMenu = false
end


function module:GetSubstDescription(info)
	local val = self:InfoToPattern(info)

	self.buildingMenu = true

	val = val and val.matchfunc and val.matchfunc() or L["NO MATCHFUNC FOUND"]	
	val = L["Current value: '%s'\nClick to paste into the chat."]:format("|cff80ff80"..tostring( val ).."|r"):gsub("%%%%", "%%")

	self.buildingMenu = false

	return val
end

function module:InfoToPattern(info)
	local modulePatterns = Prat.GetModulePatterns(self)
	local name = info[#info] or ""
	
	if modulePatterns then
		for k,v in pairs(modulePatterns) do
			if v.optname == name then
				return v
			end
		end
	end
end		

function  module:DoPat(info)
	local pat = self:InfoToPattern(info)
	pat = pat and pat.pattern or ""
	local e = ChatFrameEditBox
	if not e:IsVisible() then
		return
	end

	e:SetText((e:GetText() or "")..pat:gsub("[%(%)]", ""):gsub("%%%%", "%%"))
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
		return prat_match(GetZoneText())
	end
	
	local function Loc(...)
		return prat_match(GetMinimapZoneText())
	end
	
	local function Pos()
		local x,y = GetPlayerMapPosition("player")
		local str = "("..math.floor((x * 100) + 0.5)..","..math.floor((y * 100) + 0.5)..")"
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
		return prat_match(UnitMana("player"))
	end
	
	local function PlayerMaxMana()
		return prat_match(UnitManaMax("player"))
	end
	
	local function PlayerPercentMana()
		return prat_match(string.format("%.0f%%%%",
		floor(100 * (UnitMana("player")/UnitManaMax("player")))))
	end
	
	local function PlayerManaDeficit()
		return prat_match(UnitManaMax("player") - UnitMana("player"))
	end
	
	
	
	local function TargetPercentHP()
		local str = L["<notarget>"]
		if UnitExists("target") then
			str = string.format("%.0f%%%%", floor(100 * (UnitHealth("target") / UnitHealthMax("target"))))
		end
	
		return prat_match(str)
	end
	
	local function TargetHealth()
		local str = L["<notarget>"]
		if UnitExists("target") then
			str = UnitHealth("target")
		end
	
		return prat_match(str)
	end
	
	local function TargetHealthDeficit()
		local str = L["<notarget>"]
		if UnitExists("target") then
			str = UnitHealthMax("target") - UnitHealth("target")
		end
	
		return prat_match(str)
	end
	
	local function TargetManaDeficit()
		local str = L["<notarget>"]
		if UnitExists("target") then
			str = UnitManaMax("target") - UnitMana("target")
		end
	
		return prat_match(str)
	end
	
	
	local function TargetClass()
		local class = L["<notarget>"]
		if UnitExists("target") then
			class = UnitClass("target")
		end
	
		return prat_match(class)
	end
	
	local raidiconpfx = ICON_TAG_RAID_TARGET_STAR1:sub(1,-2) or "rt"
	
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
		local race = L["<notarget>"]
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
		local sex = L["<notarget>"]
		if UnitExists("target") then
			s = UnitSex("target")
			if(s == 2) then
				sex = L["male"]
			elseif (s == 3) then
				sex = L["female"]
			else
				sex = L["unknown sex"]
			end
		end
	
		return prat_match(sex)
	end
	
	local function TargetLevel()
		local level = L["<notarget>"]
		if UnitExists("target") then
			level = UnitLevel("target")
		end
		return prat_match(level)
	end
	
	local function TargetGuild()
		local guild = L["<notarget>"]
		if UnitExists("target") then
			guild = L["<noguild>"]
			if IsInGuild("target") then
				guild = GetGuildInfo("target") or ""
			end
		end
		return prat_match(guild)
	end
	
	-- %tps (possesive)
	local function TargetPossesive()
		local p = L["<notarget>"]
		if UnitExists("target") then
			local s = UnitSex("target")
			if(s == 2) then
				p = L["his"]
			elseif (s == 3) then
				p = L["hers"]
			else
				p = L["its"]
			end
		end
	
		return prat_match(p)
	end
	
	-- %tpn (pronoun)
	local function TargetPronoun()
		local p = L["<notarget>"]
		if UnitExists("target") then
			local s = UnitSex("target")
			if(s == 2) then
				p = L["him"]
			elseif (s == 3) then
				p = L["her"]
			else
				p = L["it"]
			end
		end
		return prat_match(p)
	end
	
	-- %tn (target)
	local function TargetName()
		local t = L['<notarget>']
	
		if UnitExists("target") then
			t = UnitName("target")
		end
	
		return prat_match(t)
	end
	
	-- %tt (target)
	local function TargetTargetName()
		local t = L['<notarget>']
	
		if UnitExists("targettarget") then
			t = UnitName("targettarget")
		end
	
		return prat_match(t)
	end
	
	-- %pn (player)
	local function PlayerName()
		local p = GetUnitName("player") or ""
		return prat_match(p)
	end
	
	local function Rand()
		return math.random(1, 100)
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
	--]]
	
	Prat:SetModulePatterns(module, {
			{ pattern = "(%%thd)", matchfunc=TargetHealthDeficit, optname=L["TargetHealthDeficit"], type = "OUTBOUND"},
			{ pattern = "(%%thp)", matchfunc=TargetPercentHP, optname=L["TargetPercentHP"],  type = "OUTBOUND"},
			{ pattern = "(%%tpn)", matchfunc=TargetPronoun, optname=L["TargetPronoun"],  type = "OUTBOUND"},
	
			{ pattern = "(%%hc)", matchfunc=PlayerHP, optname=L["PlayerHP"],  type = "OUTBOUND"},
			{ pattern = "(%%pn)", matchfunc=PlayerName, optname=L["PlayerName"], type = "OUTBOUND"},
			{ pattern = "(%%hm)", matchfunc=PlayerMaxHP, optname=L["PlayerMaxHP"],  type = "OUTBOUND"},
			{ pattern = "(%%hd)", matchfunc=PlayerHealthDeficit, optname=L["PlayerHealthDeficit"], type = "OUTBOUND"},
			{ pattern = "(%%hp)", matchfunc=PlayerPercentHP, optname=L["PlayerPercentHP"],  type = "OUTBOUND"},
			{ pattern = "(%%mc)", matchfunc=PlayerCurrentMana, optname=L["PlayerCurrentMana"],  type = "OUTBOUND"},
			{ pattern = "(%%mm)", matchfunc=PlayerMaxMana, optname=L["PlayerMaxMana"],  type = "OUTBOUND"},
			{ pattern = "(%%mp)", matchfunc=PlayerPercentMana, optname=L["PlayerPercentMana"],  type = "OUTBOUND"},
			{ pattern = "(%%pmd)", matchfunc=PlayerManaDeficit, optname=L["PlayerManaDeficit"], type = "OUTBOUND"},
	
			{ pattern = "(%%tn)", matchfunc=TargetName, optname=L["TargetName"], type = "OUTBOUND"},
			{ pattern = "(%%tt)", matchfunc=TargetTargetName, optname=L["TargetTargetName"], type = "OUTBOUND"},
			{ pattern = "(%%tc)", matchfunc=TargetClass, optname=L["TargetClass"], type = "OUTBOUND"},
			{ pattern = "(%%th)", matchfunc=TargetHealth, optname=L["TargetHealth"], type = "OUTBOUND"},
			{ pattern = "(%%tr)", matchfunc=TargetRace, optname=L["TargetRace"],  type = "OUTBOUND"},
			{ pattern = "(%%ts)", matchfunc=TargetGender, optname=L["TargetGender"],  type = "OUTBOUND"},
			{ pattern = "(%%ti)", matchfunc=TargetIcon, optname=L["TargetIcon"],  type = "OUTBOUND"},
			{ pattern = "(%%tl)", matchfunc=TargetLevel, optname=L["TargetLevel"],  type = "OUTBOUND"},
			{ pattern = "(%%tps)", matchfunc=TargetPossesive, optname=L["TargetPossesive"],  type = "OUTBOUND"},
			{ pattern = "(%%tmd)", matchfunc=TargetManaDeficit, optname=L["TargetManaDeficit"], type = "OUTBOUND"},
			{ pattern = "(%%tg)", matchfunc=TargetGuild, optname=L["TargetGuild"], type = "OUTBOUND"},
	
	
			{ pattern = "(%%zon)", matchfunc=Zone, optname=L["MapZone"],  type = "OUTBOUND"},
			{ pattern = "(%%loc)", matchfunc=Loc, optname=L["MapLoc"],  type = "OUTBOUND"},
			{ pattern = "(%%pos)", matchfunc=Pos, optname=L["MapPos"],  type = "OUTBOUND"},
			{ pattern = "(%%ypos)", matchfunc=Ypos, optname=L["MapYPos"],  type = "OUTBOUND"},
			{ pattern = "(%%xpos)", matchfunc=Xpos, optname=L["MapXPos"],  type = "OUTBOUND"},
			{ pattern = "(%%rnd)", matchfunc=Rand, optname=L["RandNum"], type = "OUTBOUND"},
	
			--~	 { pattern = "(%%tn)", matchfunc=TargetName, optname="Target", type = "OUTBOUND"},
			--~	 { pattern = "(%%pn)", matchfunc=PlayerName, optname="Player", type = "OUTBOUND"}
			}
	
			--[[ TODO:
			%%fhp - focus health
			%%fr
			%%fc
			%%fs
			%%fl
			%%fvr
			%%fvn
			]]
		
	)
end


--function module:userSubIdx(subname)
--	if not subname then return false end
--
--	local usersubs_idx	= self.usersubs_idx or {}
--
--	if usersubs_idx[subname] then
--		return usersubs_idx[subname]
--	end
--
--	local tmpsubname
--
--	for idx, pattern in module.modulePatterns do
--		tmpsubname = pattern.optname:gsub('^user_', '')
--
--		if usersubs[tmpsubname] then
--			usersubs_idx[tmpsubname] = idx
--
--			return idx
--		end
--	end
--
--	return false
--end
--
--
--function module:addUserSubs()
--	self.usersubs_idx = {}
--
--	for subname, expandsto in pairs(self.db.profile.usersubs) do
--		local pattable = self:patternTable(subname, expandsto)
--
--		table.insert(self.modulePatterns, pattable)
--
--		self.usersubs_idx = pattable.idx
--	end
--end
--
--function module:buildUserSubsIndex()
--	local usersubs		= self.db.profile.usersubs
--	local modpats		= self.modulePatterns
--
--	self.usersubs_idx = {}
--
--	if not modpats then
--		self:print(L['module:buildUserSubsIndex(): warning: module patterns not defined!'])
--		return false
--	end
--
--	for idx, pattern in ipairs(modpats) do
--		local subname = pattern.optname:gsub('^user_', '')
--
--		if usersubs[subname] then
--			usersubs_idx[subname]				= idx
--			module.usersubs_idx[subname]	= idx
--		end
--	end
--
--	return usersubs_idx
--end


  return
end ) -- Prat:AddModuleToLoad