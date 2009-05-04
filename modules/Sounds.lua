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
Name: PratSounds
Revision: $Revision: 80553 $
Author(s): Sylvanaar - Copy/Pasted from ChatSounds hy TotalPackage
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Filtering
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: A port of the Chatsounds addon to the Prat framework. (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Sounds")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["Sounds"] = true,
	["A module to play sounds on certain chat messages."] = true,
	["Add a custom channel"] = true,
	["Play a sound for a certain channel name (can be a substring)"] = true,
	["Remove a custom channel"] = true,
	["Reset settings"] = true,
	["Restore default settings and resets custom channel list"] = true,
	["Incoming Sounds"] = true,
	["Sound selection for incoming chat messages"] = true,
	["party_name"] = "Party",
	["party_desc"] = "Sound for %s party messages",
	["raid_name"] = "Raid",
	["raid_desc"] = "Sound for %s raid or battleground group/leader messages",
	["guild_name"] = "Guild",
	["guild_desc"] = "Sound for %s guild messages",
	["officer_name"] = "Officer",
	["officer_desc"] = "Sound for %s officer channel messages",
	["whisper_name"] = "Whisper",
	["whisper_desc"] = "Sound for %s whisper messages",
	["incoming"] = true,
	["outgoing"] = true,
	["Outgoing Sounds"] = true,
	["Sound selection for outgoing (from you) chat messages"] = true,
	["Custom Channels"] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Sounds")@
)
--@end-non-debug@]===]




----[[
--	Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80553 $
--]]
--

--

--

--

--




-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "AceEvent-3.0")


Prat:SetModuleDefaults(module.name, {
	profile = {
		on	= false,
		["incoming"] = {
			["GUILD"] = "Kachink",
			["OFFICER"] = "Link",
			["PARTY"] = "Text1",
			["RAID"] = "Text2",
			["WHISPER"] = "Heart",
		},
		["outgoing"] = {
			["GUILD"] = "None",
			["OFFICER"] = "None",
			["PARTY"] = "None",
			["RAID"] = "None",
			["WHISPER"] = "None",
		},
		["customlist"] = GetLocale() == "zhTW" and {
		}
		or { ["*"] = "None" },
	}
})



local media, SOUND

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
-- things to do when the module is enabled
function module:OnModuleEnable()
	media = Prat.Media    
	SOUND = media.MediaType.SOUND
	self:BuildSoundList()
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE", "RefreshOptions")
    self:RefreshOptions()

    -- Remove older options
	for cname,value in pairs(self.db.profile.customlist) do
        if type(cname) == "number" then -- bad data
            self.db.profile.customlist[cname] = nil
        end
    end

	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)

	media.RegisterCallback(self, "LibSharedMedia_Registered", "SharedMedia_Registered")
	media.RegisterCallback(self, "LibSharedMedia_SetGlobal", "SharedMedia_Registered")
end



-- things to do when the module is disabled
function module:OnModuleDisable()
    self:UnregisterAllEvents()
	Prat.UnregisterAllChatEvents(self)
	media.UnregisterAllCallbacks(self)
end

local soundslist = {}


function module:BuildSoundList()
	if not media then return end

    for i,v in ipairs(soundslist) do
        soundslist[i] = nil
    end
    
    for k,v in pairs(media.MediaTable[SOUND]) do
        soundslist[k]=k
    end
end

function module:SharedMedia_Registered(mediatype, name)
    if mediatype == SOUND then
        self:BuildSoundList()
    end
end

do
	local optionGroup_mt = {
			type = "select",
			get = "GetChanOptValue",
			set = "SetChanOptValue",
			dialogControl = 'LSM30_Sound',
			values = AceGUIWidgetLSMlists.sound,
		}

	local optionGroup_mt = { __index = optionGroup_mt }
	
	local function newOptionGroup(text, incoming)
		local t= setmetatable({}, optionGroup_mt)
		t.name = L[text.."_name"]
		t.desc = (L[text.."_desc"]):format(incoming and L["incoming"] or L["outgoing"])
		return t
	end

    local customchans = {}

    function module:RefreshOptions()   
        local o = customchans
        local t = Prat.GetChannelTable()
        for _, n in pairs(t) do
            if type(n) == "string" then
                if not o[n] then
                    o[n] = 	setmetatable({ name = n, desc = n }, optionGroup_mt)
                end
            end
        end    
    end
	
	Prat:SetModuleOptions(module.name, {
	        name = L["Sounds"],
	        desc = L["A module to play sounds on certain chat messages."],
	        type = "group",
			childGroups  = "tab",
			args = {
				customlist = {
					type = "group",
					order = 40,
					name = L["Custom Channels"],
					desc = L["Custom Channels"],
					args = customchans
				},
				incoming = {
					type = "group",
					name = L["Incoming Sounds"],
					desc = L["Sound selection for incoming chat messages"],
					order = 20,
					args = {
						party = newOptionGroup("party", true),
						raid = newOptionGroup("raid", true),
						guild = newOptionGroup("guild", true),
						officer = newOptionGroup("officer", true),
						whisper = newOptionGroup("whisper", true),
					},
				},
				outgoing = {
					type = "group",
					name = L["Outgoing Sounds"],
					desc = L["Sound selection for outgoing (from you) chat messages"],
					order = 30,
					args = {
						party = newOptionGroup("party"),
						raid = newOptionGroup("raid"),
						guild = newOptionGroup("guild"),
						officer = newOptionGroup("officer"),
						whisper = newOptionGroup("whisper"),
					},
				},
			},
		}
	)	
end

function module:GetChanOptValue(info, ...)
	return self.db.profile[info[#info-1]][info[#info]:upper()]
end

function module:SetChanOptValue(info, val, ...)
	Prat:PlaySound(val)
	self.db.profile[info[#info-1]][info[#info]:upper()] = val
end

function module:GetCChanOptValue(info, ...)
	return self.db.profile.customlist[info[#info]]
end

function module:SetCChanOptValue(info, val, ...)
	self.db.profile.customlist[info[#info]] = val
end




--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    if Prat.EVENT_ID and Prat.EVENT_ID == self.lastevent and self.lasteventtype == event then return end
    
	local msgtype = string.sub(event, 10)
	local plr, svr = strsplit("-", (message.PLAYERLINK or ""))
	local outgoing = (plr == UnitName("player")) and true or false
	local sndprof = outgoing and self.db.profile.outgoing or self.db.profile.incoming
    
    if msgtype == "CHANNEL" then 
	    local chan = string.lower(message.ORG.CHANNEL)
		for cname,value in pairs(self.db.profile.customlist) do
			if strlen(cname) > 0 and chan == cname:lower() then
                self:PlaySound(value)
			end
		end
    else 
		if msgtype == "WHISPER_INFORM" then
		    msgtype = "WHISPER"
		    sndprof = self.db.profile.outgoing
		elseif msgtype == "WHISPER" then
		    sndprof = self.db.profile.incoming
		end
		
		if msgtype == "RAID_LEADER" or msgtype == "BATTLEGROUND" or msgtype == "BATTLEGROUND_LEADER" then
			msgtype = "RAID"
		end
 
		self:PlaySound(sndprof[msgtype], event)
    end
end


function module:PlaySound(sound, event)
    self.lasteventtype = event
    self.lastevent = Prat.EVENT_ID
    Prat:PlaySound(sound)
end

  return
end ) -- Prat:AddModuleToLoad