--[[
Name: Prat 3.0 (chatsections.lua)
Revision: $Revision: 79217 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat
Forum: http://www.wowace.com/forums/index.php?topic=6243.0
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: Implements the chat string sectioning service
]]

--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local LibStub = LibStub

local setmetatable = setmetatable
local pairs, ipairs = pairs, ipairs
local tinsert, tremove, tconcat = table.insert, table.remove, table.concat
local string = string
local strsub = string.sub 
local strsplit = strsplit
local tonumber, tostring = tonumber, tostring
local strlower = strlower
local strlen = strlen
local type = type
local next = next

-- arg1, filterthisout = RunMessageEventFilters(event, arg1)
local function RunMessageEventFilters(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
	local filter = false
	local chatFilters = _G.ChatFrame_GetMessageEventFilters and _G.ChatFrame_GetMessageEventFilters(event)
    local newarg1 = arg1

	if chatFilters then
		for _, filterFunc in next, chatFilters do
			filter, newarg1 = filterFunc(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
			arg1 = newarg1 or arg1
			if filter then
				return true
			end
		end
	end

    return filter, arg1
end


-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]]--


-- This is the structure of the chat message once it is split
-- section delimiters are uppercase inside and lower case outside
-- ie.   cC CHANNEL Cc =  [ channame ]
SplitMessageSrc = {  -- todo, incidicate which module uses which field, and remove unused fields
    PRE = "",

	nN = "",
	CHANLINK = "",
	NN = "",

    cC = "",
        CHANNELNUM = "",
        CC = "",
        CHANNEL = "",
        zZ = "",
            ZONE = "",
        Zz = "",
    Cc = "",

    TYPEPREFIX = "",

	Nn = "",

    fF = "",
        FLAG = "",
    Ff = "",

    pP = "",
        lL = "",  -- link start
        PLAYERLINK= "",
        PLAYERLINKDATA = "",
        LL = "", --  link text start
        PLAYER = "",

        sS = "",
            SERVER = "",
        Ss = "",
        Ll = "",  -- link text end
    Pp = "",

    TYPEPOSTFIX = "",

    mM = "",
        gG = "",
        LANGUAGE = "",
        Gg = "",
        MESSAGE = "",
    Mm = "",

    POST = "",
}

SplitMessageIdx = {
    "PRE",
	"nN",
	"CHANLINK",
	"NN",
    "cC",
        "CHANNELNUM",
        "CC",
        "CHANNEL",
-- Zone is not usually included
--      "zZ",
--          "ZONE",
--      "Zz",

    "Cc",
    "TYPEPREFIX",
	"Nn",

    "fF",
        "FLAG",
    "Ff",
    "pP",
        "lL",
            "PLAYERLINK",
            "PLAYERLINKDATA",
        "LL",
        "PLAYER",
        "sS",
            "SERVER",
        "Ss",
        "Ll",
    "Pp",
    "TYPEPOSTFIX",
    "mM",
        "gG",
        "LANGUAGE",
        "Gg",
        "MESSAGE",
    "Mm",
    "POST",
}

SplitMessage = {}
SplitMessageOrg = {}

SplitMessageOut = {
    MESSAGE = "",
    TYPE = "",
    TARGET = "",
    CHANNEL = "",
    LANGUAGE = "",
}

setmetatable(SplitMessageOrg, { __index="" }) 
setmetatable(SplitMessageOut, { __index="" }) 

setmetatable(SplitMessage, { __index=SplitMessageOrg })


do 
	local t = {}
	function BuildChatText(message, index)
	    local index = index or SplitMessageIdx  --todo
	    local s = message
	
	    for k in pairs(t) do
	        t[k] = nil
	    end
	
	    for i,v in ipairs(index) do
            tinsert(t, s[v])
	    end
	
	    return tconcat(t, "")
	end
end

function RegisterMessageItem(itemname, anchorvar, relativepos)
	--[[ RegisterMessageItem:

		API to allow other modules to inject new items into the components
		making up a chat message. Primarily intended to help resolve
		conflicts between modules.

		 - itemname  = name of the variable to be injected

		 - aftervar  = the position in the chat message after which the item
		               will be displayed

		 - relativepos = "before" or "after"
		Leave aftervar blank to position the item at the beginning of the list.

		If you would like to change the item's position in the chat message,
		call :RegisterMessageItem() again with a different value for aftervar.

		Example:
		--------

		The mod Prat_ExampleMod counts the number of times people
		say the word "Example" and you would like to display the count
		for a player before their name in a chat message. Default chat
		message structure contains:

			... cC CHANNEL Cc .. pP PLAYER Pp ...

		This means that the module should use the following:

			RegisterMessageItem('NUMEXAMPLES', 'Cc')

		Which would then alter the structure of chat messages to be:

			.. CHANNEL Cc .. NUMEXAMPLES .. pP PLAYER ...

]]

	local pos = 1

	if SplitMessageSrc[itemname] then
--		ResetSeparators(itemname)

		local oldpos = GetMessageItemIdx(itemname)

		if oldpos ~= 0 then
			tremove(SplitMessageIdx, oldpos)
		end
	end

	if anchorvar then 
		pos = GetMessageItemIdx(anchorvar) + (relativepos == "before" and 0 or 1)
	end

	tinsert(SplitMessageIdx, pos, itemname)
	SplitMessageSrc[itemname] = ""
end


function GetMessageItemIdx(itemname)
	for i, v in ipairs(SplitMessageIdx) do
		if v == itemname then
			return i
		end
	end

	return 0
end


function ClearChatSections(message)
    for k,v in pairs(message) do
        message[k] = SplitMessageSrc[k] and nil
    end
end

local function safestr(s) return s or "" end

function SplitChatMessage(frame, event, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ...
    
	ClearChatSections(SplitMessageOrg)
	ClearChatSections(SplitMessage)

	if ( strsub((event or ""), 1, 8) == "CHAT_MSG" ) then
        local type = strsub(event, 10)
        local info = _G.ChatTypeInfo[type]

        local kill, arg1 = RunMessageEventFilters(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12)
        if kill then
            return true
        end

        local s = SplitMessageOrg

        s.CHATTYPE = type

        s.MESSAGE = safestr(arg1)

        local chatget = _G["CHAT_"..type.."_GET"]
        if chatget then
            s.TYPEPREFIX, s.TYPEPOSTFIX = string.match(_G.TEXT(chatget), "(.*)%%s(.*)")
        end

        s.TYPEPOSTFIX = safestr(s.TYPEPOSTFIX)
        s.TYPEPREFIX = safestr(s.TYPEPREFIX)

        local arg2 = safestr(arg2)
        if strlen(arg2) > 0 then

        	if ( strsub(type, 1, 7) == "MONSTER" or type == "RAID_BOSS_EMOTE" ) then
        		-- no link
        	else
               local plr, svr = strsplit("-", arg2)

                s.pP = "["
                s.lL = "|Hplayer:"
                s.PLAYERLINK = arg2
                s.LL = "|h"
                s.PLAYER = plr

                if svr and strlen(svr) > 0 then
                    s.sS = "-"
                    s.SERVER = svr
                end

                if arg11 then
                    s.PLAYERLINKDATA = ":"..safestr(arg11)
                end

                s.Ll = "|h"
                s.Pp = "]"
            end
        end

        local arg6 = safestr(arg6)
        if strlen(arg6) > 0 then
            s.fF = ""

			-- 2.4 Change
			if arg6 == "GM" then 
				s.FLAG = "|TInterface\\ChatFrame\\UI-ChatIcon-Blizz.blp:0:2:0:-3|t "
			else
	            s.FLAG = _G["CHAT_FLAG_"..arg6]
			end

            s.Ff = ""
        end

        local arg3 = safestr(arg3)
        if ( (strlen(arg3) > 0) and (arg3 ~= "Universal") and (arg3 ~= frame.defaultLanguage) ) then
            s.gG = "["
            s.LANGUAGE = arg3
            s.Gg = "] "
        else
            s.LANGUAGE_NOSHOW = arg3
        end

        local arg9 = safestr(arg9)
        if strlen(arg9) > 0 then
            local bracket, post_bracket = string.match(s.TYPEPREFIX, "%[(.*)%](.*)")
            bracket = safestr(bracket)
            if strlen(bracket) > 0 then
                s.cC = "["
                s.Cc = "]"
                s.CHANNEL = bracket
                s.TYPEPREFIX = safestr(post_bracket)
            end

            if strlen(safestr(arg8)) > 0 and arg8 > 0 then
                s.CHANNELNUM = tostring(arg8)
                s.CC = ". "
            end

            if arg7 > 0 then
                s.cC = "["
                s.Cc = "] "
                s.CHANNEL, s.zZ, s.ZONE = string.match(arg9, "(.*)(%s%-%s)(.*)")

                if s.CHANNEL == nil then
                    s.CHANNEL = arg9
                end

                s.CHANNEL = safestr(s.CHANNEL)
                s.zZ = safestr(s.zZ)
                s.ZONE = safestr(s.ZONE)
                s.Zz = ""
            else
                if strlen(arg9) > 0 then
                    s.CHANNEL = arg9
                    s.cC = "["
                    s.Cc = "] "
                end
            end
        end


--		local _, fontHeight = _G.GetChatWindowInfo(frame:GetID());
--		
--		if ( fontHeight == 0 ) then
--			--fontHeight will be 0 if it's still at the default (14)
--			fontHeight = 14;
--		end

		local arg7 = tonumber(arg7)
 		-- 2.4
		-- Search for icon links and replace them with texture links.
		if arg7 and ( arg7 < 1 or ( arg7 >= 1 and _G.CHAT_SHOW_ICONS ~= "0" ) ) then
			local term;
			for tag in string.gmatch(arg1, "%b{}") do
				term = strlower(string.gsub(tag, "[{}]", ""));
				if ( _G.ICON_TAG_LIST[term] and _G.ICON_LIST[_G.ICON_TAG_LIST[term]] ) then
					s.MESSAGE  = string.gsub(s.MESSAGE , tag, _G.ICON_LIST[_G.ICON_TAG_LIST[term]] .. "0|t");
-- 
-- This would allow for ignoring unknown icon tags
--
--				else
--					s.MESSAGE = string.gsub(s.MESSAGE, tag, "");
				end
			end
		end

        if type == "SYSTEM" or strsub(type,1,11) == "ACHIEVEMENT" or strsub(type,1,18) == "GUILD_ACHIEVEMENT" then
            local pl, p, rest = string.match(s.MESSAGE, "|Hplayer:(.-)|h%[(.-)%]|h(.+)")
            if pl and p then
                local plr, svr = strsplit("-", pl)
                s.pP = "["
                s.lL = "|Hplayer:"
                s.PLAYERLINK = pl
                s.LL = "|h"
                s.PLAYER = plr
                s.Ll = "|h"
                s.Pp = "]"
                s.MESSAGE = rest

                if svr and strlen(svr) > 0 then
                    s.sS = "-"
                    s.SERVER = svr
                end

                if arg11 then
                    s.PLAYERLINKDATA = ":"..safestr(arg11)
                end
            end
        end

        s.ORG = SplitMessageOrg

        return SplitMessage, info
    end
end

local NULL_INFO = {r = 1.0, g = 1.0, b = 1.0, id = 0 }



