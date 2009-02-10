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
Name: PratPlayerNames
Author(s): Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
		   Sylvanaar (sylvanaar@mindspring.com)
Inspired by: idChat2_PlayerNames by Industrial
Description: Module for Prat that adds player name options.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("PlayerNames")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
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
    ["Use Channel Color"]  = true, 
    ["Color by Level Difference"] = true,
    ["How to color other player's level."] = true,
	["Show Group"] = true,
    ["Toggle raid group showing."] = true,
	["Show Raid Target Icon"] = true,
	["Toggle showing the raid target icon which is currently on the player."] = true,

	-- In the high-cpu pullout
	["coloreverywhere_name"] = "Color Names Everywhere",
	["coloreverywhere_desc"] = "Color player names if they appear in the text of the chat message",

    ["hoverhilight_name"] = "Hover Hilighting",
	["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",

    ["Keep Info"] = true,
    ["Keep Lots Of Info"] = true,
    ["Keep player information between session for all players except cross-server players"] = true,
    ["Keep player information between session, but limit it to friends and guild members."] = true,
    ["Player Color Mode"] = true,
    ["How to color player's name."] = true,
	["Unknown Common Color From TasteTheNaimbow"] = true,
    ["Let TasteTheNaimbow set the common color for unknown player names."] = true,   
	["Enable Alt-Invite"] = true,
    ["Toggle group invites by alt-clicking on player name."] = true,
    ["Enable Invite Links"] = true,
	["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = true,
    ["Brackets Common Color"] = true,
    ["Sets common color of brackets to use around player names."] = true,
    ["Brackets Use Common Color"] = true,
    ["Toggle using a common color for brackets around player names."] = true,
    ["linkifycommon_name"] = "Linkify Common Messages",
    ["linkifycommon_desc"] = "Linkify Common Messages",
    ["Prat_Playernames: Stored Player Data Cleared"] = true,

	["tabcomplete_name"] = "Possible Names",
    ["Tab completion : "] = true,
    ["Too many matches (%d possible)"] = true,
    ["Actively Query Player Info"] = true,
    ["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = true,    
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="PlayerNames")@
)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0", "AceHook-3.0", "AceTimer-3.0")
module.L = L


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
		coloreverywhere = true,
	    usecommoncolor = true,
	    altinvite = false,
	    linkinvite = false,
	    bracketscommoncolor = true,
	    linkifycommon = true,
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
        
        UnitPopupButtons["WHOIS"]    = { text ="Who Is?", dist = 0 , func = function()
        	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
        	local name = dropdownFrame.name

            if name then 
            	SendWho(name)
            end
        end}
        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"WHOIS");

        function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
        	for i=1, UIDROPDOWNMENU_MAXBUTTONS do
        		button = getglobal("DropDownList"..UIDROPDOWNMENU_MENU_LEVEL.."Button"..i);
        
        		-- Patch our handler function back in
        		if  button.value == "WHOIS" then
        		    button.func = UnitPopupButtons["WHOIS"].func
        		end
        	end
        end

        self:SecureHook("UnitPopup_ShowMenu")

        -- ends here gonna make a control for it
	end
)





module.pluginopts = {}

Prat:SetModuleOptions(module, {
        name = L["PlayerNames"],
        desc = L["Player name formating options."],
        type = "group",
		plugins = module.pluginopts,
        args = {
            brackets = {
                name = L["Brackets"],
                desc = L["Sets style of brackets to use around player names."],
                type = "select",
                order = 110,
                values = {["Square"] = L["Square"], ["Angled"] = L["Angled"], ["None"] = L["None"]}
            },
            bracketscommoncolor = {
                name = L["Brackets Use Common Color"],
                desc = L["Toggle using a common color for brackets around player names."],
                type = "toggle",
                order = 111,
            },
            bracketscolor = {
                name = L["Brackets Common Color"],
                desc = L["Sets common color of brackets to use around player names."],
                type = "color",
                order = 112,
                get = "GetColorValue",
                set = "SetColorValue",
                disabled = function(info) return not info.handler.db.profile.bracketscommoncolor end,
            },
            usecommoncolor = {
                name = L["Unknown Use Common Color"],
                desc = L["Toggle using a common color for unknown player names."],
                type = "toggle",
                order = 120,
            },
            color = {
                name = L["Unknown Common Color"],
                desc = L["Set common color of unknown player names."],
                type = "color",
                order = 121,
                get = "GetColorValue",
                set = "SetColorValue",
                disabled = function(info) if not info.handler.db.profile.usecommoncolor then return true else return false end end,
            },
            useTTN = {
                name = L["Unknown Common Color From TasteTheNaimbow"],
                desc = L["Let TasteTheNaimbow set the common color for unknown player names."],
                type = "toggle",
                order = 122,
                hidden = function(info) if TasteTheNaimbow_Loaded then return false else return true end end,
                disabled = function(info) if not info.handler.db.profile.usecommoncolor then return true else return false end end,
            },
            colormode = {
                name = L["Player Color Mode"],
                desc = L["How to color player's name."],
                type = "select",
                order = 130,
                values = {["RANDOM"] = L["Random"], ["CLASS"] = L["Class"], ["NONE"] = L["None"]}
            },
            levelcolor = {
                name = L["Level Color Mode"],
                desc = L["How to color other player's level."],
                type = "select",
                order = 131,
                values = {["PLAYER"] = L["Use Player Color"], ["CHANNEL"] = L["Use Channel Color"], ["DIFFICULTY"] = L["Color by Level Difference"], ["NONE"] = L["No additional coloring"]}
            },            
            level = {
                name = L["Show Level"],
                desc = L["Toggle level showing."],
                type = "toggle",
                order = 140,
            },
            subgroup = {
                name = L["Show Group"],
                desc = L["Toggle raid group showing."],
                type = "toggle",
                order = 141,
            },
            showtargeticon = {
                name = L["Show Raid Target Icon"],
                desc = L["Toggle showing the raid target icon which is currently on the player."],
                type = "toggle",
                order = 142,
            },

            tabcomplete = {
                name = L["Enable TabComplete"],
                desc = L["Toggle tab completion of player names."],
                type = "toggle",
                order = 150,
                get = function(info) return info.handler.db.profile.tabcomplete end,
                set = function(info, v) info.handler.db.profile.tabcomplete = v; info.handler:TabComplete(v) end
            },
            altinvite = {
                name = L["Enable Alt-Invite"],
                desc = L["Toggle group invites by alt-clicking on player name."],
                type = "toggle",
                order = 151,
            },            
            linkinvite = {
                name = L["Enable Invite Links"],
                desc = L["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."],
                type = "toggle",
                order = 152,
            },             
            keep = {
                name = L["Keep Info"],
                desc = L["Keep player information between session, but limit it to friends and guild members."],
                type = "toggle",
                order = 200,
            },
            keeplots = {
                name = L["Keep Lots Of Info"],
                desc = L["Keep player information between session for all players except cross-server players"],
                type = "toggle",
                order = 201,
                disabled = function(info) return not info.handler.db.profile.keep end,
            },
            
            usewho = {
                name = L["Actively Query Player Info"],
                desc = L["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."],
                type = "toggle",
                order = 202,
                hidden = function(info) if LibStub:GetLibrary("LibWho-2.0", true) then return false end return true end
            },
			reset = {
				name = L["Reset Settings"],
				desc = L["Restore default settings, and delete stored character data."],
				type = "execute",
				order = 250,
				func = "resetStoredData"
			},              
        }
    }
)
    
function module:OnValueChanged(info, b)
	local field = info[#info]
	if field == "altinvite" or field == "linkinvite" then
		self:SetAltInvite()
	elseif field == "usewho" then
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
    
	self:SetAltInvite()

	Prat.RegisterMessageItem("PREPLAYERDELIM", "PLAYER", "before")
	Prat.RegisterMessageItem("POSTPLAYERDELIM", "PLAYER", "after")

	Prat.RegisterMessageItem("PLAYERTARGETICON", "PLAYER", "after")

	Prat.EnableProcessingForEvent("CHAT_MSG_GUILD_ACHIEVEMENT")

	Prat.RegisterMessageItem("PLAYERLEVEL", "PREPLAYERDELIM", "before")
	Prat.RegisterMessageItem("PLAYERGROUP", "POSTPLAYERDELIM", "after")

    self:RegisterEvent("FRIENDLIST_UPDATE", "updateFriends")
    self:RegisterEvent("GUILD_ROSTER_UPDATE", "updateGuild")
    self:RegisterEvent("RAID_ROSTER_UPDATE", "updateRaid") 
    self:RegisterEvent("PLAYER_LEVEL_UP", "updatePlayerLevel")
    self:RegisterEvent("PARTY_MEMBERS_CHANGED", "updateParty")
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "updateTarget")
    self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", "updateMouseOver")
    self:RegisterEvent("WHO_LIST_UPDATE", "updateWho") 
	self:RegisterEvent("CHAT_MSG_SYSTEM", "updateWho") -- for short /who command

    self:RegisterEvent("PLAYER_LEAVING_WORLD", "EmptyDataCache")

	if self.db.profile.usewho then 
		self.wholib = LibStub:GetLibrary("LibWho-2.0", true)
	end

    self:updatePlayer()   
    self.NEEDS_INIT = true

    if IsInGuild() == 1 then
        GuildRoster()
    end

    self:TabComplete(self.db.profile.tabcomplete)   
    
    Prat.RegisterLinkType(  { linkid="invplr", linkfunc=self.Invite_Link, handler=self }, self.name)    
    Prat.RegisterLinkType(  { linkid="player", linkfunc=self.Player_Link, handler=self }, self.name)    
end

function module:OnModuleDisable()
	self:UnhookAll()
    self:TabComplete(false)
	self:UnregisterAllEvents()
	Prat.UnregisterAllChatEvents(self)
end


function module:Prat_Ready()
    self:updateAll()
end

local cache = { module.Levels,
                module.Classes,
                module.Subgroups }


function module:EmptyDataCache(force)  
    for k,v in pairs(cache) do
        wipe(v)
    end 

    self:updatePlayer()   
    self.NEEDS_INIT = true
	self:OnPlayerDataChanged()
end


--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:updateAll()
    self:updatePlayer()
	self:updateParty()
	
    if MiniMapBattlefieldFrame.status == "active" then
        self:updateBG()
    else
    	self:updateRaid()
    end
    	
	self:updateFriends()

    self.NEEDS_INIT = nil

	self:updateGuild(self.db.profile.keeplots)
end


function module:updateGF()
	if IsInGuild() == 1 then GuildRoster() end
    self:updateFriends()
    if MiniMapBattlefieldFrame.status == "active" then 
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
        Name, Level, Class = GetFriendInfo(i)  -- name, level, class, area, connected, status 
        self:addName(Name, nil, Class, Level, nil, "FRIEND")
    end
end



function module:updateGuild()
    if IsInGuild() == 1 then
        GuildRoster()
        
        local Name, Class, Level, _
        for i = 1, GetNumGuildMembers(true) do
            Name, _, _, Level, _, _, _, _, _, _, Class  = GetGuildRosterInfo(i)
            self:addName(Name, nil, Class, Level, nil,"GUILD")
        end
    end
end

function module:updateRaid()
  --  self:Debug("updateRaid -->")
    local Name, Class, SubGroup, Level, Server
	local _, zone, online, isDead, role, isML
	for k,v in pairs(self.Subgroups) do
	    self.Subgroups[k] = nil
	end
    for i = 1, GetNumRaidMembers() do
		_, rank, SubGroup, Level, _, Class, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
        Name, Server = UnitName("raid" .. i)
        self:addName(Name, Server, Class, Level, SubGroup, "RAID")
    end
end

function module:updateParty()
    local Class, Unit, Name, Server, _
    for i = 1, GetNumPartyMembers() do
        Unit = "party" .. i
        _, Class = UnitClass(Unit)
        Name, Server = UnitName(Unit)
        self:addName(Name, Server, Class, UnitLevel(Unit), nil, "PARTY")
    end
end

function module:updateTarget()
    local Class, Name, Server
    if not UnitIsPlayer("target") or not UnitIsFriend("player", "target") then
        return
    end
    Class = select(2, UnitClass("target"))
    Name, Server = UnitName("target")
    self:addName(Name, Server, Class, UnitLevel("target"), nil,  "TARGET")
end

function module:updateMouseOver(event)
    local Class, Name, Server
    if not UnitIsPlayer("mouseover") or not UnitIsFriend("player", "mouseover") then
        return
    end
    Class = select(2, UnitClass("mouseover"))
    Name, Server = UnitName("mouseover")
    self:addName(Name, Server, Class, UnitLevel("mouseover"), nil,  "MOUSE")
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
	    local name, killingBlows, honorKills, deaths, honorGained, faction, rank, race, class, filename, damageDone, healingDone = GetBattlefieldScore(i);

        if name then
            local plr, svr = strsplit("-", name)
            self:addName(plr, svr, class, nil, nil, "BATTLEFIELD")
            self:addName(plr, nil, class, nil, nil, "BATTLEFIELD")
        end
	end    
    self:updateRaid()  
end


function module:resetStoredData()
    self.db.realm.classes = {}
    self.db.realm.levels = {}

    self:EmptyDataCache(true)
    
    Prat:Print(L["Prat_Playernames: Stored Player Data Cleared"])
end

--
-- Coloring Functions
--
local CLR = Prat.CLR
function CLR:Bracket(text) return self:Colorize(module:GetBracketCLR(), text) end
function CLR:Common(text) return self:Colorize(module:GetCommonCLR(), text) end
function CLR:Random(text, seed) return self:Colorize(module:GetRandomCLR(seed), text) end
function CLR:Class(text, class) return self:Colorize(self:GetClassColor(class), text) end
function CLR:Level(text, level, name, class) 
    local mode = module.db.profile.levelcolor
    if mode and type(level) == "number" and level > 0 then
        if mode == "DIFFICULTY" then 
            local diff = GetDifficultyColor(level)
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


function module:addName(Name, Server, Class, Level, SubGroup, Source)
  if Name then
    local nosave
    
--	Prat.Print("Add n="..Name.." c="..Class.." s="..Source)
    -- Messy negations, but this says dont save data from 
    -- sources other than guild or friends unless you enable
    -- the keeplots option
    if Source ~= "GUILD" and Source ~= "FRIEND" and Source ~= "PLAYER" then
        nosave = not self.db.profile.keeplots
    end

    if Server and Server:len() > 0 then 
        nosave = true
    end
   

    Name = Name..(Server and Server:len()>0 and ("-"..Server) or "")

	local changed
	if Level and Level > 0 then
		self.Levels[Name:lower()] = Level
        if ((not nosave) and  self.db.profile.keep) then	
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
        if ((not nosave) and   self.db.profile.keep ) then self.db.realm.classes[Name:lower()] = Class end

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

    if self.wholib and not(class and level) then
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
	return CLR:Player(Name, Name, self:getClass(Name))
end



function module:FormatPlayer(message, Name, frame)
    if not Name or Name:len() == 0 then return end
    
    local class, level, subgroup = self:GetData(Name, frame)

    -- Add level information if needed
    if level and self.db.profile.level then
		message.PLAYERLEVEL = CLR:Level(tostring(level), level, Name, class)
    	message.PREPLAYERDELIM = ":"
    end

    -- Add raid subgroup information if needed
    if subgroup and self.db.profile.subgroup and (GetNumRaidMembers() > 0) then
		message.POSTPLAYERDELIM = ":"
		message.PLAYERGROUP = subgroup
    end

	-- Add raid target icon
	if self.db.profile.showtargeticon then 
		local icon = UnitExists(Name) and GetRaidTargetIndex(Name)
		if icon then
            icon = ICON_LIST[icon]

            if icon and icon:len() > 0 then
                message.PLAYERTARGETICON = icon .."0|t"
            end
		end
	end

    -- Add the player name in the proper color
    message.PLAYER = CLR:Player(message.PLAYER, Name, class)


    -- Add the correct bracket style and color
    local prof_brackets = self.db.profile.brackets
    if prof_brackets == "Angled" then
        message.pP = CLR:Bracket("<")..message.pP
        message.Pp  = message.Pp..CLR:Bracket(">")
    elseif prof_brackets == "None" then
    else
        message.pP = CLR:Bracket("[")..message.pP
        message.Pp  = message.Pp..CLR:Bracket("]")
    end
end



--ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h[%s]|h has come online."
local _, _, FRIEND_ONLINE = string.match(ERR_FRIEND_ONLINE_SS, "|Hplayer:(.-)|h%[(.-)%]|h(.+)")

--ERR_BG_PLAYER_JOINED_SS = "|Hplayer:%s|h[%s]|h has joined the battle";
local _, _, BG_JOIN = string.match(ERR_BG_PLAYER_JOINED_SS, "|Hplayer:(.-)|h%[(.-)%]|h(.+)")

--
-- Prat Event Implementation
--
local EVENTS_FOR_RECHECK = {
 ["CHAT_MSG_GUILD"] = module.updateGF,
 ["CHAT_MSG_OFFICER"] = module.updateGuild,
 ["CHAT_MSG_PARTY"] = module.updateParty,
 ["CHAT_MSG_RAID"] = module.updateRaid,
 ["CHAT_MSG_RAID_LEADER"] = module.updateRaid,
 ["CHAT_MSG_RAID_WARNING"] = module.updateRaid,
 ["CHAT_MSG_BATTLEGROUND"] = module.updateBG,
 ["CHAT_MSG_BATTLEGROUND_LEADER"] = module.updateBG,
 ["CHAT_MSG_SYSTEM"] = module.updateGF,
}


local RAID_JOIN =  string.gsub( ERR_RAID_MEMBER_ADDED_S, "%%s(.*)", "(.+)(%1)")
local RAID_LEAVE =  string.gsub( ERR_RAID_MEMBER_REMOVED_S, "%%s(.*)", "(.+)(%1)")

function module:AddPlayerLinks(message, frame, event)
    local name, rest
    
    if event == "CHAT_MSG_SYSTEM" then 
        name, rest = string.match(message.MESSAGE, RAID_JOIN) 
        if name then self:MakePlayer(message, name) message.MESSAGE = rest return end

        name, rest = string.match(message.MESSAGE, RAID_LEAVE) 
        if name then self:MakePlayer(message, name) message.MESSAGE = rest return end

    end
end

function module:MakePlayer(message, name)
    if type(name) == "string" then
        local plr, svr = strsplit("-", name)
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
    if self.NEEDS_INIT then
        self:updateAll()
    end
        
	local Name = message.PLAYERLINK or ""
	message.Pp = ""
	message.pP = ""
--	if strlen(Name) == 0 then
----        if self.db.profile.linkifycommon then
----            self:AddPlayerLinks(message, frame, event)
----        end	    
--
--        Name = message.PLAYERLINK or ""
--        
--        if strlen(Name) == 0 then  
--	        return
--	    end
--	end


    local class, level, subgroup = self:GetData(Name)
  
    local fx = EVENTS_FOR_RECHECK[event]
    if fx~=nil and (level==nil or level==0 or class==nil) then        
        fx(self)
    end
    
    self:FormatPlayer(message, Name, frame)
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
	for i=1,string.len(Name) do
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
        if not AceTab:IsTabCompletionRegistered(L["tabcomplete_name"]) then
            AceTab:RegisterTabCompletion(L["tabcomplete_name"], nil,
                function(t, text, pos)
                    for name in pairs(self.Classes) do
                        table.insert(t, name)
                    end
                end,
                function(u, cands, ...)
                	local candcount = #cands
                	if candcount <= self.db.profile.tabcompletelimit then
						local text
	                    for _, cand in pairs(cands) do
							cand = self:addInfo(cand)								

							text = text and (text .. ", " .. cand) or cand
	                    end
	                    return "   "..text
	                else
	                	return "   "..L["Too many matches (%d possible)"]:format(candcount)
	                end
                end,
				nil,
				function(name)
					return name:gsub(Prat.MULTIBYTE_FIRST_CHAR, string.upper, 1)
				end
            )
        end
    else
        if AceTab:IsTabCompletionRegistered(L["tabcomplete_name"]) then
            AceTab:UnregisterTabCompletion(L["tabcomplete_name"])
        end
    end
end

function module:SetAltInvite()
	local enabled = self.db.profile.linkinvite or self.db.profile.altinvite

	if enabled then
        for _,v in pairs(Prat.GetModulePatterns(self)) do
            Prat:RegisterPattern(v, self.name)
        end
	else
        Prat:UnregisterAllPatterns(self.name)
	end
end

local EVENTS_FOR_INVITE = {
 ["CHAT_MSG_GUILD"] = true,
 ["CHAT_MSG_OFFICER"] = true,
 ["CHAT_MSG_PARTY"] = true,
 ["CHAT_MSG_RAID"] = true,
 ["CHAT_MSG_RAID_LEADER"] = true,
 ["CHAT_MSG_RAID_WARNING"] = true,
 ["CHAT_MSG_SAY"] = true,
 ["CHAT_MSG_YELL"] = true,
 ["CHAT_MSG_WHISPER"] = true,
 ["CHAT_MSG_CHANNEL"] = true,
}

local function Invite(text, ...)
	if module.db.profile.linkinvite then
    	return module:ScanForLinks(text, Prat.SplitMessage.PLAYERLINK)
	end
end

local INVALID_NAMES = {
    ["meh"] = true,
    ["now"] = true,
    ["plz"] = true,
    ["pls"] = true,
    ["please"] = true,
    ["when"] = true,
    ["group"] = true,    
    ["raid"] = true,    
    ["grp"] = true,    
}

local INVALID_NAME_REFERENCE = {
    ["him"] = true,
    ["her"] = true,
    ["them"] = true,
    ["someone"] = true,    
}

local function InviteSomone(text, name)
	if module.db.profile.linkinvite and name then
        name = name:lower()  -- TODO Use UTF8Lib
        if name:len()>2 and not INVALID_NAMES[name] then 
            if INVALID_NAME_REFERENCE[name] then
                return Prat:RegisterMatch(text)
            else
                return module:ScanForLinks(text, name)
            end
        end
	end
end


Prat:SetModulePatterns(module, {
    { pattern = "(send%s+invite%s+to%s+"..Prat.AnyNamePattern..")", matchfunc=InviteSomone },
    { pattern = "(invi?t?e?%s+"..Prat.AnyNamePattern..")", matchfunc=InviteSomone },
    { pattern = "("..Prat.GetNamePattern("invites?%??")..")", matchfunc=Invite },
    { pattern = "("..Prat.GetNamePattern("inv%??")..")", matchfunc=Invite },
    { pattern = "(초대)", matchfunc=Invite },
    { pattern = "(組%??)$", matchfunc=Invite },
    { pattern = "(組我%??)$", matchfunc=Invite },
})

function module:Invite_Link(link, text, button, ...)
    if self.db.profile.linkinvite then
		local name = strsub(link, 8);
		if ( name and (strlen(name) > 0) ) then
			local begin = string.find(name, "%s[^%s]+$");
			if ( begin ) then
				name = strsub(name, begin+1);
			end
			if ( button == "LeftButton" ) then
				InviteUnit(name);
			end
		end
		
    end

    return false
end

function module:Player_Link(link, text, button, ...)
    if self.db.profile.altinvite then
		local name = strsub(link, 8);
		if ( name and (strlen(name) > 0) ) then
		    local begin, nend = string.find(name, "%s*[^%s:]+");
			if ( begin ) then
			name = strsub(name, begin, nend);
			end
			if ( IsAltKeyDown() ) then
				InviteUnit(name);
				ChatEdit_OnEscapePressed(this.editBox)
				return false;
			end
		end
    end
    
    return true
end

function module:ScanForLinks(text, name)
    if text == nil then 
        return ""
    end

	local enabled = self.db.profile.linkinvite

    	if enabled and CanGroupInvite() then

		if EVENTS_FOR_INVITE[event] then
       			return  self:InviteLink(text, name)
    		end
	end

	return text
end



function module:InviteLink(link, name)
    return Prat:RegisterMatch( ("|cff%s|Hinvplr:%s|h[%s]|h|r"):format("ffff00", name, link) )
end



  return
end ) -- Prat:AddModuleToLoad
