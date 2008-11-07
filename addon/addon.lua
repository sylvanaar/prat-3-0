---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat modification
--        and a collection of modules which utilize the framework
--
-- Copyright (C) 2006-2008  Prat Development Team
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
Name: Prat 3.0 (addon.lua)
Revision: $Revision: 82149 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
           Fin (fin@instinct.org)
           Curney (asml8ed@gmail.com)
           Krtek (krtek4@gmail.com)
           and others (see invidual modules)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat
Forum: http://www.wowace.com/forums/index.php?topic=6243.0
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: The main addon source module
]]


--[[ BEGIN STANDARD HEADER ]]--

-- Imports


local _G = _G
local LibStub = LibStub
local tonumber = tonumber
local tostring = tostring
local pairs = pairs
local ipairs = ipairs
local type = type
local select = select
local Prat = Prat
local setmetatable = setmetatable
local strfind = strfind
local IsSecureCmd = IsSecureCmd


-- Isolate the environment
setfenv(1, Prat)

--[[ END STANDARD HEADER ]]--

-- Thanks CKKnight!
WOTLK = select(4, _G.GetBuildInfo()) >= 30000


-- Debug
--PrintMainChunkUse=true

--ChunkSizes = {}



Prat.Prat3 = true

local function debug(...) end

Localizations = GetLocalizer({})
local L = Localizations

Frames = {
    ["ChatFrame1"]=_G.ChatFrame1, ["ChatFrame2"]=_G.ChatFrame2, ["ChatFrame3"]=_G.ChatFrame3,
    ["ChatFrame4"]=_G.ChatFrame4, ["ChatFrame5"]=_G.ChatFrame5, ["ChatFrame6"]=_G.ChatFrame6, ["ChatFrame7"]=_G.ChatFrame7
}
HookedFrames = {
    ["ChatFrame1"]=_G.ChatFrame1, ["ChatFrame3"]=_G.ChatFrame3,
    ["ChatFrame4"]=_G.ChatFrame4, ["ChatFrame5"]=_G.ChatFrame5, ["ChatFrame6"]=_G.ChatFrame6, ["ChatFrame7"]=_G.ChatFrame7
}

ExternalFrames = {
}

ServerChannels = { _G.EnumerateServerChannels() }


Prat.PlayerNameBlackList = { "you" }

local builtinSounds = {
    ["Bell"] = "Interface\\AddOns\\Prat-3.0\\sounds\\Bell.mp3",
	["Chime"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Chime.mp3",
	["Heart"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Heart.wav",
	["IM"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\IM.mp3",
	["Info"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Info.mp3",
	["Kachink"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Kachink.wav",
	["popup"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Link.wav",
	["Text1"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Text1.wav",
	["Text2"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Text2.wav",
	["Xylo"] = "Interface\\AddOns\\Prat-3.0\\Sounds\\Xylo.mp3",
}


-- Symbolic names for all the events which Prat uses
Events = {
    MODULE_ENABLED = "Prat_ModuleCreated",
    DISABLED = "Prat_Disabled",
    ENABLING = "Prat_Starting",
    ENABLED = "Prat_Ready",
    STARTUP = "Prat_Initialized",
    DEBUG_UPDATE = "Prat_DebugModeChanged",
    PRE_OUTBOUND = "Prat_PreOutboundChat",
    OUTBOUND = "Prat_OutboundChat",
    PRE_ADDMESSAGE = "Prat_PreAddMessage",
    POST_ADDMESSAGE = "Prat_PostAddMessage",
    FRAME_MESSAGE = "Prat_FrameMessage",
    SECTIONS_UPDATED = "Prat_ChatSectionsUpdated",
}

EnableTasks = {}

local addon = LibStub("AceAddon-3.0"):NewAddon("Prat", "AceConsole-3.0", "AceTimer-3.0", "AceHook-3.0")
Addon = addon

--local  callbacks

--[[ 1 = no load, 2 = disabled, 3 = enabled (this is temporary, a better format will be forthcoming]]
--  What I need to do is return the module's own value if the option isn't 1
-- but one problem is if the module was "no-load", and then is set to "enabled" but it thinks it should be "disabled"
local defaults = {
	profile = {
		modules = {
			["Clear"] = 1,
			["AddonMsgs"] = 1,
			["CustomFilters"] = 1,
			["EventNames"] = 1,
			["ServerNames"] = 1,
			["Substitutions"] = 1,
			["Experimental"] = 1,
			["Filtering"] = 1,
			["KeyBindings"] = 1,
			["*"] = 3 
		}
	}
}
local dbg,SOUND
function addon:OnInitialize()
	if _G.IsAddOnLoaded("Prat") == 1 then 
		Print(("Prat 2.0 was detected, and disabled. Please %s your UI."):format(GetReloadUILink()))
	end

	Prat.db = LibStub("AceDB-3.0"):New("Prat3DB", defaults, "Default")

	callbacks = LibStub("CallbackHandler-1.0"):New(Prat, "RegisterChatEvent", "UnregisterChatEvent", "UnregisterAllChatEvents")

	Options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(Prat.db)
	Options.args.profiles.order = tonumber(-1)

	Media = LibStub("LibSharedMedia-3.0")
	SOUND = Media.MediaType.SOUND

    for k,v in pairs(builtinSounds) do
        Media:Register(SOUND, k, v)
    end

	AddonName = self.baseName

	builtinSounds = nil

	Prat.db.RegisterCallback(self, "OnProfileChanged", "UpdateProfile")
	Prat.db.RegisterCallback(self, "OnProfileCopied", "UpdateProfile")
	Prat.db.RegisterCallback(self, "OnProfileReset", "UpdateProfile")

--	_G.collectgarbage('collect')
--	Print("Pre-Module-Load Memory Use: "..MemoryUse())

	LoadModules()

--	_G.collectgarbage('collect')
--	Print("Post-Module-Load Memory Use: "..MemoryUse())

	self.OnInitalize = nil
end

local DEF_INFO = { r=1, g=1, b=1, id=1 }
function Format(smf, event, color, ...)
   local PRE_ADDMESSAGE = "Prat_PreAddMessage"
   local POST_ADDMESSAGE = "Prat_PostAddMessage"
   local FRAME_MESSAGE = "Prat_FrameMessage"
   local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ...;
   local this = smf
   local formattedText = ""
   local message, info = Prat.SplitChatMessage(smf, event, ...)

    local m = Prat.SplitMessage
    Prat.CurrentMsg = m

    m.DONOTPROCESS = nil
	local process = true

    callbacks:Fire(FRAME_MESSAGE, message, this, event)

    if not m.DONOTPROCESS then
	    color = color or DEF_INFO
        local r,g,b,id = color.r or 1, color.g or 1, color.b or 1, 1

        -- Remove all the pattern matches ahead of time
        m.MESSAGE = Prat.MatchPatterns(m.MESSAGE)

        callbacks:Fire(PRE_ADDMESSAGE, message, this, event, Prat.BuildChatText(message), r,g,b,id )

        -- Pattern Matches Put Back IN
        m.MESSAGE = Prat.ReplaceMatches(m.MESSAGE)

        if process then
            -- We are about to send the message
            m.OUTPUT  = Prat.BuildChatText(message) -- Combine all the chat sections
        else
            if type(m.OUTPUT) == "string" then
                -- Now we have the chatstring that the client was planning to output
                -- For now just do it. (Tack on POST too)
                m.OUTPUT  = (m.PRE or "")..m.OUTPUT..(m.POST or "")
            end
		end			

        -- Allow for message blocking during the patern match phase
        if not m.DONOTPROCESS then 
			formattedText = m.OUTPUT
        end
        
        -- We have called addmessage by now, or we have skipped it
		-- regardless, we call postaddmessage. This was changed to allow
        -- for more flexibility in the customfilters module, speficially
        -- it allows for replacements to occur in blocked messages

        callbacks:Fire(POST_ADDMESSAGE,  m, this, event, m.OUTPUT, r,g,b,id)

    end

    m.CAPTUREOUTPUT = nil
    m.OUTPUT  = nil
    m.INFO = nil

    CurrentMessage = nil

	return formattedText
end

function addon:OnEnable()	
	for i,v in ipairs(EnableTasks) do
		v(self)
	end
	EnableTasks = nil

	RegisterLinkType(  { linkid="rldui", linkfunc=function(...) _G.ReloadUI() return false end }, "Prat")

	self:ScheduleTimer("PostEnable", 0)
end


function addon:UpdateProfile()
	self:ScheduleTimer("UpdateProfileDelayed", 0)
end

function addon:UpdateProfileDelayed()
	for k, v in self:IterateModules() do
		if v:IsEnabled() then
			v:Disable()
			v:Enable()
		end
	end
end	

function GetReloadUILink(Requestor)
    return BuildLink("rldui", Requestor or "Prat", "Reload", "ffa0a0")
end

local module = {}

--@debug@ 
Version = "Prat |cff8080ff3.0|r |cffff8080Beta Version|r (|cff8080ff".."DEBUG".."|r)"
--@end-debug@
--[===[@non-debug@ 
Version = "Prat |cff8080ff3.0|r |cffff8080Beta Version|r (|cff8080ff".."@project-revision@".."|r)"
--@end-non-debug@]===]


function addon:PostEnable()
	Print(Version)

	-- 2.4 Changes
--	self:RegisterEvent("CVAR_UPDATE")

    -- Inbound Hooking
    self:RawHook("ChatFrame_MessageEventHandler", true)

    -- Outbound hooking
    self:SecureHook("ChatEdit_ParseText")

    -- Display Hooking
    for _,v in pairs(HookedFrames) do
        self:RawHook(v, "AddMessage", true)
    end

    -- ItemRef Hooking
	self:RawHook("SetItemRef", true)

--    -- This event fires after Prat's hooks are installed
--    -- Prat's core wont operate until after this event
	callbacks:Fire(Events.SECTIONS_UPDATED)
	callbacks:Fire(Events.ENABLED)

--	if ChunkSizes then
--		local last = 0
--		for i, v in ipairs(ChunkSizes) do
--			self:Print("Chunk #"..tostring(i)..":"..("|cff80ffff%.0f|r KB"):format(v-last))
--			last = v
--		end
--		self:Print("Total Size: "..("|cff80ffff%.0f|r KB"):format(ChunkSizes[#ChunkSizes]))
--		ChunkSizes = nil
--	end

	if Modules then
		local total, loaded, enabled = 0,0,0
		for k, v in pairs(Modules) do
			total = total + 1
			if v ~= "EXISTS" then
				loaded = loaded + 1 
			end
			if v == "ENABLED" then
				enabled = enabled + 1
			end
		end
	
		self:Print(("Module Count: |cff80ffff%d|r total |cff80ffff%d|r loaded, |cff80ffff%d|r enabled"):format(total, loaded, enabled))
	end

	if MemoryUse then 
		self:Print("Memory Use: "..MemoryUse())
	end
end

function addon:SetItemRef(...)
	return SetItemRefHook(self.hooks.SetItemRef, ...)
end


function addon:ChatEdit_ParseText(editBox, send)
    local command = editBox:GetText()

-- this is what blizzard does
	local cmd = command:match("^(#%s*[Ss][Hh][Oo][Ww]:*)%s[^%s]") or
	                command:match("^(#%s*[Ss][Hh][Oo][Ww][Tt][Oo][Oo][Ll][Tt][Ii][Pp]:*)%s[^%s]") or
	                command:match("^(/[^%s]+)");

-- Hack from blizzard's code
	if ( cmd and strfind(cmd, "^#") ) then
		-- This is a hack, but the "USE" code below handles bags and slots
		cmd = SLASH_USE1;
	end

    if cmd and IsSecureCmd(cmd) then
		return
	end

    local m = Prat.SplitMessageOut
    CurrentMsg = m


    m.MESSAGE = command

    m.CTYPE = editBox:GetAttribute("chatType")
    m.TARGET = editBox:GetAttribute("tellTarget")
    m.CHANNEL = editBox:GetAttribute("channelTarget")
    m.LANGUAGE = editBox.language
    m.SEND = send

    if send ~= 1 then
        return
    end

    self:ProcessUserEnteredChat(m)

    editBox:SetAttribute("chatType", m.CTYPE)
    editBox:SetAttribute("tellTarget", m.TARGET)
    editBox:SetAttribute("channelTarget", m.CHANNEL)


    editBox:SetText(m.MESSAGE)
    
   CurrentMsg = nil
end


function addon:ProcessUserEnteredChat(m)
    if (m.MESSAGE:len() <= 0) then
    	return
    end

	callbacks:Fire(Events.PRE_OUTBOUND, m)

    -- Remove all the pattern matches ahead of time
    m.MESSAGE = MatchPatterns(m.MESSAGE, "OUTBOUND")

    callbacks:Fire(Events.OUTBOUND, m)

   -- Pattern Matches Put Back IN
    m.MESSAGE = ReplaceMatches(m.MESSAGE, "OUTBOUND")
end


function addon:ChatFrame_MessageEventHandler(this, event, ...)
--function addon:ChatFrame_MessageEventHandler(event, ...)
    local PRE_ADDMESSAGE = "Prat_PreAddMessage"
    local POST_ADDMESSAGE = "Prat_PostAddMessage"
    local FRAME_MESSAGE = "Prat_FrameMessage"

	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ... 

    if not HookedFrames[this:GetName()] then
		return self.hooks["ChatFrame_MessageEventHandler"](this, event, ...)
    end
	
    local message, info
    local process = EventIsProcessed(event)

    local CMEResult
	
	if type(arg1) == "string" and (arg1):find("\r") then	 -- Stupid exploit. Protect our users.
		arg1 = arg1:gsub("\r", " ")
	end

	-- Create a message table. This table contains the chat message in a non-concatenated form
    -- so that it can be modified easily without lots of complex gsub's
    message, info = SplitChatMessage(this, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)

	-- Handle Default-UI filtering: Since the default UI now provides filtering functions 
	-- similar to the way Prat's pattern registry works, we need to be sure not to call the 
    -- filtering functions twice by calling back into the hook chain - otherwise you could
    -- have side effects of the handler functions being called more than once for a given event.
    -- I don't see any way around this.
	if type(message) == "boolean" and message == true then
		return true	
	end

    if not info then
    	return self.hooks["ChatFrame_MessageEventHandler"](this, event, ...)
    else
        local m = SplitMessage
        CurrentMsg = m

        -- Prat_FrameMessage is fired for every message going to the
        -- chatframe which is displayable (has a chat infotype)
        -- It may not be displayed, in which case no Pre/Post Addmessage
        -- events will fire
        -- Any addons which hook things will operate following this event
        -- but before Prat_PreAddMessage, OUTPUT will contain the chat line
        -- it may be modified by other addons.
        --
        -- Right now, prat will discard the chat line for chat types that
        -- it is handling
        --
        m.OUTPUT  = nil

        m.DONOTPROCESS = nil

--        DUMP_OUTPUT_EX(this, "Prat_FrameMessage", nil, nil, m.CAPTUREOUTPUT, m.OUTPUT)

        callbacks:Fire(FRAME_MESSAGE, message, this, event)

        -- A return value of true means that the message was processed
        -- normally this would result in the OnEvent returning
        -- for that chatframe
        m.CAPTUREOUTPUT = this
		if WOTLK then
	    	CMEResult =  self.hooks["ChatFrame_MessageEventHandler"](this, event, ...)
		else
       		CMEResult =  self.hooks["ChatFrame_MessageEventHandler"](event, ...)
		end

        m.CAPTUREOUTPUT = false

--        DBG_OUTPUT("CMEResult", CMEResult)
        if type(m.OUTPUT) == "string" and not m.DONOTPROCESS then
            local r,g,b,id = self.INFO.r, self.INFO.g, self.INFO.b, self.INFO.id

            -- Remove all the pattern matches ahead of time
            m.MESSAGE = MatchPatterns(m.MESSAGE)

            callbacks:Fire(PRE_ADDMESSAGE, message, this, event, BuildChatText(message), r,g,b,id )

            -- Pattern Matches Put Back IN
            m.MESSAGE = ReplaceMatches(m.MESSAGE)

            if process then
                -- We are about to send the message
                m.OUTPUT  = BuildChatText(message) -- Combine all the chat sections
            else
                if type(m.OUTPUT) == "string" then
                    -- Now we have the chatstring that the client was planning to output
                    -- For now just do it. (Tack on POST too)
                    m.OUTPUT  = (m.PRE or "")..m.OUTPUT..(m.POST or "")
                end
			end			

            -- Allow for message blocking during the patern match phase
            if not m.DONOTPROCESS then 
				this:AddMessage(m.OUTPUT, r,g,b,id);
            end
            
            -- We have called addmessage by now, or we have skipped it
			-- regardless, we call postaddmessage. This was changed to allow
            -- for more flexibility in the customfilters module, speficially
            -- it allows for replacements to occur in blocked messages

            callbacks:Fire(POST_ADDMESSAGE,  m, this, event, m.OUTPUT, r,g,b,id)

        end

        m.CAPTUREOUTPUT = nil
        m.OUTPUT  = nil
        m.INFO = nil

        CurrentMessage = nil
    end

    return CMEResult
end


addon.INFO = {r = 1.0, g = 1.0, b = 1.0, id = 0 }
	
function addon:AddMessage(frame, text, r, g, b, id, ...)
    local s = SplitMessage
    if s.OUTPUT == nil and s.CAPTUREOUTPUT == frame --[[ and Prat.dumping == false]] then
        self.INFO.r, self.INFO.g, self.INFO.b, self.INFO.id = r, g, b, id
        s.OUTPUT = text
        s.INFO = self.INFO
    else
        self.hooks[frame].AddMessage(frame, text, r, g, b, id, ...)
    end
end

local wowsounds = {
	["TellMessage"] = "TellMessage",
}

function PlaySound(self, sound)
	if not sound then return end

	if wowsounds[sound] then
		_G.PlaySound(wowsounds[sound])
	else
    	local play
    	if play == nil then
    	    play = Media:Fetch(SOUND, sound)
    	end
    	if play == nil then return end

		_G.PlaySoundFile(play)
	end
end



function RegisterChatCommand(cmd, func)
	addon:RegisterChatCommand(cmd, func)
end