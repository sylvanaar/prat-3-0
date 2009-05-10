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
Name: module
Revision: $Revision: 80572 $
Author(s):  Sylvanaar (sylvanaar@mindspring.com)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#CustomFilters
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module to support custom filters. (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("CustomFilters")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
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
    ["ForwardMessageCustom"] = true, 
    ["Forward the message to a custom chat channel."] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="CustomFilters")@
)
--@end-non-debug@]===]


local eventMap = {
    CHAT_MSG_CHANNEL_LIST,
    CHAT_MSG_SAY,
    CHAT_MSG_GUILD,
    CHAT_MSG_WHISPER_INFORM,
    CHAT_MSG_YELL,
    CHAT_MSG_PARTY,
    CHAT_MSG_OFFICER,
    CHAT_MSG_RAID,
    CHAT_MSG_RAID_LEADER,
    CHAT_MSG_BATTLEGROUND,
    CHAT_MSG_BATTLEGROUND_LEADER,
}

local newmap = {}
for i,v in ipairs(eventMap) do
	newmap[v] = v
end

eventMap, newmap = newmap



local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")


Prat:SetModuleDefaults(module, {
	profile = {
		on	= false, 

		inbound = { ["*"] = { enabled = true, sink20OutputSink="None" }
		},
		outbound = { ["*"] = { enabled = true, sink20OutputSink="None" }
		},
		
		outputchannel = CHAT_MSG_SAY,
		outputchanneldata = "",
		sinkoptions = {}
	}
} )

local modeOptions = {	
    mode = {
    	    inbound = {
    		        type = "group",
    		        name = L["Inbound"],
    		        desc = L["Inbound"],
    		        args = {  
    		        }
    		    },
    	    outbound = {
    	        type = "group",
    	        name = L["Outbound"],
    	        desc = L["Outbound"],
    	        args = {
    	        }
    	    },		
    	}
}

Prat:SetModuleOptions(module, {
		name	= L["module_name"],
		desc	= L["module_desc"],
		type	= "group",
		plugins = modeOptions,
		args = {
           		   
 
   			outputchannel = {
		        type = "select",
		        name = L["Output Channel"],
		        desc = L["Channel to send output text to."],
 		        order = 110,
                values = eventMap,
		    },
			outputchanneldata = {
 		        type = "input",
 		        order = 115,
		        name = L["Channel Data"],
		        desc = L["Extra data for WHISPER (target) and CHANNEL (channel name or num)"],
                usage = "<string>",
                disabled = function(info)  return not (info.handler.db.profile.outputchannel == CHAT_MSG_WHISPER_INFORM or info.handler.db.profile.outputchannel == CHAT_MSG_CHANNEL_LIST) end              
		    },
    		outputmessageonly = {
		        type = "toggle",
		        name = L["Output Message Only"],
		        desc = L["Only output the message portion of the chat text, leave out the channel, and playername etc."],
 		        order = 118,
		    }
		}
	}
)

    
function module:BuildModeOptions(mode, opts)
    local mode = mode  
    local po = opts[mode].args
    

    self[mode] = {}
    self[mode].validate = {}
    
--    po.pathdr = {
--        type = "header",
--        name = L["Pattern Options"],
--        order = 80,
--    }

    for k,v in pairs(self.db.profile[mode]) do 
        self:AddPatternOptions(po, v.name or k, mode, k)
    	self[mode].validate[k] = v.name or k      
    end

--    po.opspc = {
--        type = "header",
--        order = 94,
--    }

    po.addpattern = {
        name = L["Add Pattern"],
        desc = L["Add a pattern to search for."],
        type = "input",
        usage = L["<string>"],
        get = false,
        set = "AddPattern"
    }

    po.removepattern = {
        name = L["Remove Pattern"],
        desc = L["Remove an existing pattern."],
        type = "select",
    	get = function(info) return "" end,
    	set = "RemovePattern",
    	values = self[mode].validate,
        disabled = function(info) 
			local mode = info[#info-1]
            for k,v in pairs(info.handler.db.profile[mode]) do 
                return false             
            end return true end,
    }
    
end
 
function module:DisableOutputOption(info)
    return self.db.profile[info[#info-3]][info[#info-2]].tosink
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
            name = L["Filter Name"],
            desc = L["Your name for this filter"],
            get = "GetPatternValue",
            set = "UpdatePatternValue",
        },
        enabled = {
            order = 5,
            type = "toggle",
            name = L["Enabled"],
            desc = L["Is this pattern enabled for use?"],
            get = "GetPatternValue",
            set = "UpdatePatternValue",
        },
        opspc9 = {
            name = L["Pattern Info"],
            type = "header",
            order = 9,
        },
        searchfor = {
             order = 10,
            type = "input",
            name = L["Search Pattern"],
            desc = L["Search Pattern"],
            usage = L["<string>"],
            get = "GetPatternValue",
            set = "UpdatePatternValue"
        },
--        inchannels = {
--            name = L["inchannels_name"],
--            desc = L["inchannels_desc"],
--            type = "multiselect",
--			tristate = true,
--            order = 110,
--			values = Prat.FrameList,
--			get = "GetPatternSubValue",
--			set = "SetPatternSubValue",
--        },
--        searchfordeformat = {
--            type = "toggle",
--            name = L["Search Format String"],
--            desc = L["Supplied pattern is a format string instead of a pattern"],
--            get = "GetPatternValue",
--            set = "UpdatePatternValue"
--            },        
        replacewith = {
            order = 20,
            type = "input",
            name = L["Replacement Text"],
            desc = L["Replacement Text"],
            usage = L["<string>"],
            get = "GetPatternValue",
            set = "UpdatePatternValue",
            disabled = "GetDisableReplace",            
        },
        opspc29 = {
            name = L["Match Options"],
            type = "header",
            order = 29,
        },
        block = {
            type = "toggle",
            name = L["Block Message"],
            desc = L["Prevent the message from being displayed"],
            get = "GetPatternValue",
            set = "SetPatternValue"
        },  
        tosink = {
            type = "toggle",
            name = L["Secondary Output"],
            desc = L["Send to a secondary output"],
            get = "GetPatternValue",
            set = "SetPatternValue"
        },     
        sound = {
            type = "select",
            name = L["Play Sound"],
            desc = L["Play a sound when this message is output to the chatframe"],
			dialogControl = 'LSM30_Sound',
            get = "GetPatternValue",
            set = "SetPatternValue",
            values = AceGUIWidgetLSMlists.sound,
        },                      
        hilight = {
            type = "toggle",
            name = L["Hilight Match Text"],
            desc = L["Hilight Match Text"],
            get = "GetPatternValue",
            set = "UpdatePatternValue",
            disabled = "GetBlockMessage",
        },
        hilight_color = {
            type = "color",
            name = L["Hilight Color"],
            desc = L["Hilight Color"],
            get = "GetPatternColorValue",
            set = "SetPatternColorValue",
            disabled = "GetBlockMessage",
        },

		
    } 

	self.SetSinkStorage(settings, settings)

	po.args.output =  self.GetSinkAce3OptionsDataTable(settings)     
    po.args.output.inline = true
    po.args.output.order = 200
    po.args.output.disabled = "DisableOutputOption"
end

local CLR = Prat.CLR

local function match(text, matchopts, mode)
    if not matchopts then return end

    local matchtype
    if mode == "inbound" then 
        matchtype = "FRAME"
    else
        matchtype = "OUTBOUND"
    end
    
    local textout = text
    
    -- in the deformat case, prat hasnt matched anythign
    -- we have to do it here
 --   if matchopts.deformat then
--		deformat = deformat or PRAT_LIBRARY(LIB.PARSING)
--        local d = { deformat:Deformat(text, matchopts.searchfor) }
--       
--        if #d > 0 then        
--            for i=1,#d do
--                if matchopts.hilight then 
--                    local hexcolor = CLR:GetHexColor(matchopts.hilight_color)
--                    textout = textout:gsub(d[i], Prat:RegisterMatch(CLR:Colorize(hexcolor, d[i]), matchtype))
--                end 
--            end
--        end               
 --   else        

        if matchopts.replacewith and matchopts.replacewith ~= matchopts.searchfor then
            textout = matchopts.replacewith
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
                Prat.SplitMessage.CF_SOUND =  matchopts.sound
            else
                Prat.SplitMessageOut.CF_SOUND =  matchopts.sound
            end            
        end   

        if matchopts.block then 
            if mode == "inbound" then
                Prat.SplitMessage.DONOTPROCESS = true
            else
                Prat.SplitMessageOut.MESSAGE = ""
            end
        end


        textout =  Prat:RegisterMatch(textout, matchtype)        
  --  end
    
    return textout
end

module.modulePatterns = {}

function module:RegisterPattern(matchopts, mode)
    local mode = mode
    local matchopts = matchopts
    if mode == "inbound" then 
        matchtype = "FRAME"
    else
        matchtype = "OUTBOUND"
    end    
    local patterninfo = { pattern = matchopts.searchfor,
                        matchopts = matchopts,
                      matchfunc = 
                        function(text, ...)
                            return match(text, matchopts, mode)
                        end,
                      type = matchtype,
                      deformat = matchopts.deformat }                                             

    Prat.RegisterPattern(patterninfo, self.name)
   
    table.insert(self.modulePatterns, patterninfo)
end

function module:UnregisterPattern(matchopts)
    local patterninfo 
    for _,v in pairs (self.modulePatterns) do
        if v.matchopts == matchopts then 
            patterninfo = v
        end
    end
    
    if patterninfo == nil then return end

    if patterninfo.idx then 
        Prat.UnregisterPattern(patterninfo.idx)
    end
    
    local idx
    for k,v in pairs(self.modulePatterns) do
        if v == patterninfo then
            idx = k
        end
    end
    
    table.remove(self.modulePatterns, idx)
end

function module:UpdatePattern(matchopts)
    local patterninfo 
    for _,v in pairs (self.modulePatterns) do
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
------------------------------------------------]]--

Prat:SetModuleInit(module, 
	function(self)
        local function tailChan(t, cnum, cname, ...)
            if not cnum then return t end
            t[#t+1] = cname
            return tailChan(t, ...)
        end
    	self:RegisterSink(
    	    L["Forward"], 
    	    L["ForwardMessage"], 
    	    L["Forward the message to a chat channel."],
    	    "Forward"
    	)

    	self:RegisterSink(
    	    L["ForwardCustom"], 
    	    L["ForwardMessageCustom"], 
    	    L["Forward the message to a custom chat channel."],
    	    "ForwardCustom",
            function() return tailChan({}, GetChannelList()) end            
    	)

	    local modeOpts = modeOptions.mode
	    for k,v in pairs(modeOpts) do 
	        self:BuildModeOptions(k, modeOpts)
	    end

		self:SetSinkStorage(self.db.profile.sinkoptions)
		modeOpts.output = self:GetSinkAce3OptionsDataTable()
		modeOpts.output.inline = true
	end
)

-- things to do when the module is enabled
function module:OnModuleEnable()
    local modeOpts = modeOptions.mode
    local mode
    for mode,_ in pairs(modeOpts) do 
        if type(self.db.profile[mode]) == "table" then 
            local patopts
            for _,patopts in pairs(self.db.profile[mode]) do
                if patopts.enabled then
                    self:RegisterPattern(patopts, mode) 
                end
            end
        end 
    end
    
	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)
end


function module:OnModuleDisable()
	Prat.UnregisterAllChatEvents(self)
end

function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    local uid = Prat.EVENT_ID
    if uid and 
       uid == self.lastevent and 
       self.lasteventtype == event then 
       return 
    end

    self.lasteventtype = event
    self.lastevent = uid	


	if message.CF_SINK or message.CF_SINK_OUT then	
		if self.db.profile.outputmessageonly then
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
------------------------------------------------]]--

function module:GetPatternValue(info)
    return self.db.profile[info[#info-2]][info[#info-1]][info[#info]]
end

function module:UpdatePatternValue(info, v)
	self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = v
	self:UpdatePattern(self.db.profile[info[#info-2]][info[#info-1]])
end

function module:SetPatternValue(info, v)
	self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = v
end


function module:SetPatternName(info, v)
	self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = v
end

local defclr = { r=1, b=1, g=1, a=1 }
function module:GetPatternColorValue(info)
	local c = self.db.profile[info[#info-2]][info[#info-1]][info[#info]]
	if c == nil then 
		self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = { r=1, g=1, b=1, a=1 } 
		c = self.db.profile[info[#info-2]][info[#info-1]][info[#info]]
	end
	return c.r, c.g, c.b, c.a
end	
function module:SetPatternColorValue(info, r,g,b,a)
	self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = { r=r, g=g, b=b, a=a } 
end


function module:GetPatternSearch(info)
    return self.db.profile[info[#info-2]][info[#info-1]][info[#info]]
end
function module:SetPatternSearch(info, v)
	self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = v    
    self:UpdatePattern(self.db.profile[info[#info-2]][info[#info-1]])
end
function module:GetPatternReplace(info)
    return self.db.profile[info[#info-2]][info[#info-1]][info[#info]]
end
function module:SetPatternReplace(info, v)
	self.db.profile[info[#info-2]][info[#info-1]][info[#info]] = v    
    self:UpdatePattern(self.db.profile[info[#info-2]][info[#info-1]])
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


local white_clr = {r=1.0, b=1.0, g=1.0}
function module:GetPatternHilightClr(p)
    local h = p.hilight_color or white_clr
    return h.r or 1.0, h.g or 1.0, h.b or 1.0
end
function module:SetPatternHilightClr(p, r,g,b)
    p.hilight_color = p.hilight_color or {}
    local h = p.hilight_color
    h.r, h.g, h.b = r, g, b
    
    self:UpdatePattern(p)
end



function module:AddPattern(info, pattern)
	local mode = info[#info-1]
    local p = self.db.profile[mode]
    
	for k, v in pairs(p) do
		if v.name == pattern then
			return
		end
	end


	self[mode].validate = self[mode].validate or {}
	local v = self[mode].validate


    local num = 0
    while rawget(p, "pat"..num) ~= nil do
        num = num + 1
    end

    local key = "pat"..num

    p[key] = p[key] or {}
    p[key].name = pattern
    p[key].searchfor = pattern
    p[key].replacewith = pattern 

    v[key] = pattern
	
	local o = modeOptions.mode[mode].args
    self:AddPatternOptions(o, pattern, mode, key)
    
    self:RegisterPattern(p[key], mode)

    self:RefreshOptions()
end

function module:RemovePattern(info, pattern)
	local mode = info[#info-1]
    local p = self.db.profile[mode]

	local v = self[mode].validate
	local key, name

    if type(pattern) == "number" then
        name = v[pattern]
--        idx, key = pattern, v[pattern]
    else	    
        name = pattern
--    	for i, vp  in ipairs(v) do 
--            if pattern == vp then 
--                idx, key = i, vp 
--                break
--            end 
--        end
    end


	for k, v in pairs(p) do
        if k == name then
            key = k
            break
        end

		if v.name == name then
--            print(name, k, v)
			key = k
            break
		end
	end

    if key==nil then return end

    self:UnregisterPattern(p[key])

    p[key] = nil

    modeOptions.mode[mode].args = {}

    self:BuildModeOptions(mode, modeOptions.mode)

    self:RefreshOptions()
end    

function module:RefreshOptions()
	LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")
end

local sink
function module:ForwardCustom(source, text, ...)
    sink = sink or LibStub("LibSink-2.0")
    local s = sink.storageForAddon[source]
	local loc = s and s.sink20ScrollArea or ""
    local cnum = GetChannelName(loc)

    if cnum and cnum > 0 then
        local cleantext = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")

    	SendChatMessage(cleantext, "CHANNEL", GetDefaultLanguage("player"), cnum)
    end
end
--msg, chatType, language, channel)
function module:Forward(source, text, r,g,b, ...)
    local cleantext = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
        
    if self.db.profile.outputchannel == CHAT_MSG_WHISPER_INFORM then
        SendChatMessage(cleantext, "WHISPER",  GetDefaultLanguage("player"), self.db.profile.outputchanneldata)
    elseif self.db.profile.outputchannel == CHAT_MSG_CHANNEL_LIST then 
        SendChatMessage(cleantext, "CHANNEL",  GetDefaultLanguage("player"), GetChannelName(self.db.profile.outputchanneldata))
    else
        local chatType = strsub(self.db.profile.outputchannel, 10) 
        SendChatMessage(cleantext, chatType, GetDefaultLanguage("player"))
    end
end


  return
end ) -- Prat:AddModuleToLoad