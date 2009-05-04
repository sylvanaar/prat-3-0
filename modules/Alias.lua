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
Revision: $Revision: $
Author(s): Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#Alias
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command (default=off).
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("Alias")

if PRAT_MODULE == nil then 
    return 
end

local L = Prat:GetLocalizer({})

--@debug@
L:AddLocale("enUS", {
	["module_name"] = "Alias",
	["module_desc"] = "Adds the command /alias, which can be used to alias slash commands in a similar way to the Unix alias command.",
	["add"] = true,
	["add an alias"] = true,
	['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - \s "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'] = true,
	["unalias"] = true,
	["remove an alias"] = true,
	['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'] = true,
	["listaliases"] = true,
	["list all aliases"] = true,
	['findaliases'] = true,
	['find aliases matching a given search term'] = true,
	['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'] = true,
	['verbose'] = true,
	['Display extra information in the chat frame when commands are dealiased'] = true,
	['inline'] = true,
	['Expand aliases as you are typing'] = true,
	["Options for altering the behaviour of Alias"] = true,
	['Options'] = true,
	['noclobber'] = true,
	["Don't overwrite existing aliases when using /addalias"] = true,
	[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'] = true,
	["%s() called with nil argument!"] = true,
	["%s() called with blank string!"] = true,
	['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'] = true,
	['noclobber set - skipping new alias: /%s already expands to /%s'] = true,
	['overwriting existing alias "/%s" (was aliased to "/%s")'] = true,
	["/%s aliased to: /%s"] = true,
	['alias "/%s" does not exist'] = true,
	['deleting alias "/%s" (previously aliased as "/%s")'] = true,
	['tried to show value for alias "%s" but undefined in module.Aliases!'] = true,
	['/%s aliased to "/%s"'] = true,
	["No aliases have been defined"] = true,
	['There is no alias current defined for "%s"'] = true,
	['infinite loop detected for alias /%s - ignoring'] = true,
	['dealiasing command /%s to /%s'] = true,
	['matching aliases found: %d'] = true,
	['total aliases: %d'] = true,
	["warnUser() called with nil argument!"] = true,
	["warnUser() called with zero length string!"] = true,
})
--@end-debug@

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


--[===[@non-debug@
L:AddLocale("enUS", 
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("frFR",  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("deDE", 
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("koKR",  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("esMX",  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("ruRU",  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("zhCN",  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("esES",  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
L:AddLocale("zhTW",  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Alias")@
)
--@end-non-debug@]===]

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

Prat:SetModuleDefaults(module.name, {
	profile = {
		on	= false,
		aliases	= {},
		verbose	= false,
		inline	= true,
		noclobber = false,
	
		-- things we won't alias
		wontalias = {
			unalias	= 1,
			alias	= 1,
			prat	= 1,
			script	= 1,
			run	= 1,
			ace	= 1,
			ace2	= 1,
			listaliases = 1,
			quit	= 1,
			reload	= 1,
			rl	= 1,
			},
		}
} )


Prat:SetModuleOptions(module, {
		name	= L["module_name"],
		desc	= L["module_desc"],
		type	= "group",
		args = {
			add = {
				type	= "input",
				name	= L["add"],
				desc	= L["add an alias"],
--				usage	= L['<command>[ <value>] - alias <command> to be executed as <value>, or return the value of the currently defined alias for <command> if <command> has not been assigned a value. eg: "/alias /examplehello /say hello there" - typing "/examplehello" will now cause your character to say "hello there"; "/alias examplehello" - prints "/examplehello is aliased to /say hello there" (cmd aliases: /addalias)'],

				get	= false,
				set	= function(info, argstr) return info.handler:setAlias(argstr) end,
				order	= 210,
				},

			del = {
				name	= L["unalias"],
				desc	= L["remove an alias"],
				type	= "select",
--				usage	= L['<alias> - remove the alias <alias> (cmd aliases: /delalias, /remalias)'],
				values	= function(info) return info.handler.db.profile.aliases end,
				set	= function(info, aliastoremove) return info.handler:delAlias(aliastoremove) end,
				order	= 220,
				disabled = function(info) return info.handler:NumAliases()==0 end
				},

			find = {
				name	= L["findaliases"],
				desc	= L["find aliases matching a given search term"],
				type	= 'input',
				set	= function(info, q) return info.handler:listAliases(q) end,
				get	= false,
--				usage	= L['<keyword> - finds all aliases matching <keyword> (cmd aliases: /findalias)'],
				order	= 230,
				},

			list = {
				name	= L["listaliases"],
				desc	= L["list all aliases"],
				type	= 'execute',
				func	= function(info) info.handler:listAliases() end,
--				usage	= L[' - list all aliases; supply <keyword> to search for matching aliases (cmd aliases: /listallaliases)'],
				order	= 240,
				},


			blankheader = {
				name    = "",
				order	= 499,
				type	= 'header',
				},
			--[[ OPTIONS ]]--
			optionsheader = {
				name	= L["Options"],
				desc	= L["Options for altering the behaviour of Alias"],
				type	= 'header',
				order	= 500,
				},


			inline = {
				name	= L['inline'],
				desc	= L['Expand aliases as you are typing'],
				type	= 'toggle',
				order	= 510,
				},

			noclobber = {
				name	= L['noclobber'],
				desc	= L["Don't overwrite existing aliases when using /addalias"],
				type	= 'toggle',
				order	= 520,
				},

			verbose = {
				name	= L['verbose'],
				desc	= L['Display extra information in the chat frame when commands are dealiased'],
				type	= 'toggle',
				order	= 530,
				},
			}
		}
)

local CLR = Prat.CLR

local function clralias(text) return CLR:Colorize("64ff64", text:lower()) end
local function clrexpansion(text) return CLR:Colorize("64ffff", text:lower()) end
local function clrmodname(text) return CLR:Colorize("ff8080", text) end


-- things to do when the module is enabled
function module:OnModuleEnable()
	self.Aliases = {}

	table.sort(self.db.profile.aliases)

	for k, v in pairs(self.db.profile.aliases) do
		self.Aliases[k] = v
	end

	self.WontAlias = self.db.profile.wontalias
	for naughtyalias, justtrue in pairs(self.WontAlias) do
		self.WontAlias[string.lower(naughtyalias)] = 1
	end

	self:RawHook('ChatEdit_HandleChatType', true)

--	Prat:RegisterChatCommand({ '/alias', '/addalias', }, self.moduleOptions.args.add, 'PRATALIAS')
--	Prat:RegisterChatCommand({ '/unalias', '/delalias', '/remalias' }, self.moduleOptions.args.del, 'PRATUNALIAS')
--	Prat:RegisterChatCommand({ '/listaliases', '/listallaliases' }, self.moduleOptions.args.list, 'PRATLISTALIASES')
--	Prat:RegisterChatCommand({ '/findaliases', '/findalias' }, self.moduleOptions.args.find, 'PRATFINDALIASES')

	Prat.RegisterChatCommand("alias", function(argstr) return self:setAlias(argstr) end)
	Prat.RegisterChatCommand("unalias", function(argstr) return self:delAlias(argstr) end)
	Prat.RegisterChatCommand("listaliases", function(argstr) return self:listAliases(argstr) end)
end

-- things to do when the module is disabled
function module:OnModuleDisable()
	-- unregister events
--	Prat.UnregisterAllChatEvents(self)

	self:UnhookAll()
	self.Aliases = nil
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

function module:splitAliasArgs(str)
	-- str should be "<command>[=value| value]"
	local name, value
	local args = {
		name	= "",
		value	= "",
		}

	-- if it doesn't match, args is left with default blank strings for values
	--for alias, command in str:find("(%w+)%s*=?%s*(.-)%s*$") do
	for alias, command in str:gmatch("/?(%w+)%s*[%s=]%s*/?(.-)$") do
		-- either matches both alias and command (may match command as a blank string)
		args['name']	= string.lower(alias)
		args['value']	= command or ""
		-- util:print('name ' .. args['name'])
		-- util:print('value ' .. args['value'])
	end

	return args
end

function module:checkArgStr(funcname, argstr)
	if argstr == nil then
		self:warnUser(string.format(L["%s() called with nil argument!"], funcname))
		return false
	end

	if argstr == "" then
		self:warnUser(string.format(L["%s() called with blank string!"], funcname))
		return false
	end

	return true
end

function module:setAlias(argstr)
	-- argstr should be "<command>[ <value]"
	if not self:checkArgStr('setAlias', argstr) then
		return false
	end

	local alias = self:splitAliasArgs(argstr)

	-- check to see if the user is defining an alias or not
	if not alias['value'] or (alias['value'] == "") then
		local name = argstr

		-- called as: /alias <command> - check for alias called <command> to display
		if self.Aliases[name] then
			-- alias found; show it :)
			self:showAlias(name)
			return true
		else
			-- no alias found called <command>; tell user
			self:reportUndefinedAlias(name)
		end
	elseif self.WontAlias[string.lower(alias['name'])] then
		-- user is defining an alias called <command>, but it's potentially bad
		self:warnUser(string.format(L['refusing to alias "/%s" to anything in the interests of Not Buggering Everything Up'], clralias(alias['name'])))
		return false
	elseif self.db.profile.noclobber and self.Aliases[string.lower(alias['name'])] then
		self:warnUser(string.format(L['noclobber set - skipping new alias: /%s already expands to /%s'], clralias(alias['name']), clrexpansion(alias['value'])))
		return false
	else
		-- it's not listed as bad, so create or update the aliases tables
		-- called as /alias <command> <value> - define alias <command> as <value>
		if self.Aliases[alias['name']] then
			-- specified alias already exists, warn user and print old setting
			self:warnUser(string.format(L['overwriting existing alias "/%s" (was aliased to "/%s")'], clralias(alias['name']), clrexpansion(self.Aliases[alias['name']])))
		end

		-- now (re?)define the alias <command> to <value>
		self.Aliases[alias['name']] = alias['value']
		self.db.profile.aliases[alias['name']] = alias['value']

		table.sort(self.db.profile.aliases)
		table.sort(self.Aliases)

		LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")

		self:warnUser(string.format(L["/%s aliased to: /%s"], clralias(alias['name']), clrexpansion(alias['value'])))
	end
end

function module:delAlias(aliasname)
	if not self:checkArgStr('delAlias', aliasname) then
		return false
	end

	-- remove unecessary /s at the beginning of the alias name
	aliasname	= aliasname:gsub('^/*', '')

	if not self.Aliases[aliasname] then
		self:warnUser(string.format(L['alias "/%s" does not exist'], clralias(aliasname)))
		return false
	end

	local oldalias = self.Aliases[aliasname]

	self:warnUser(string.format(L['deleting alias "/%s" (previously aliased as "/%s")'], clralias(aliasname), clrexpansion(oldalias)))

	self.Aliases[aliasname]			= nil
	self.db.profile.aliases[aliasname]	= nil

	LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")

	return oldalias
end

function module:showAlias(aliasname)
	if not self:checkArgStr('showAlias', aliasname) then
		return false
	end

	-- check for undefined alias called aliasname
	if not self.Aliases[aliasname] then
		self:warnUser(string.format(L['tried to show value for alias "%s" but undefined in module.Aliases!'], clralias(aliasname)))
		return false
	end

	-- everything OK; display value of alias "aliasname"
	self:warnUser(string.format(L['/%s aliased to "/%s"'], clralias(aliasname), clrexpansion(self.Aliases[aliasname])))

	return true
end

function module:listAliases(q)
	if self.Aliases == {} then
		self:warnUser(L["No aliases have been defined"])
		return false
	end

	local msg
	local count	= 0

	table.sort(self.Aliases)

	for name, alias in pairs(self.Aliases) do
		if not q or (name:match(q)) then
			self:showAlias(name)
			count = count + 1
		end
	end

	if q then
		msg	= L['matching aliases found: %d']
	else
		msg	= L['total aliases: %d']
	end

	self:tellUser(string.format(msg, count))
end


function module:reportUndefinedAlias(name)
	return self:warnUser(string.format(L['There is no alias current defined for "%s"'], clralias(name)))
end

function module:tellUser(str)
	return module:warnUser(str)
end

function module:NumAliases()
	local n=0
	for name, alias in pairs(self.Aliases) do
		n=n+1
	end
	return n
end

function module:warnUser(str)
	if str == nil then
		str = L["warnUser() called with nil argument!"]
	elseif not str then
		str = L["warnUser() called with zero length string!"]
	end

	DEFAULT_CHAT_FRAME:AddMessage(string.format("%s: %s", clrmodname(self.moduleName), str))

	return true
end


local fake	= {}

function module:ChatEdit_HandleChatType(editBox, msg, command, send, dealiased)
	local command	= command or ""
	local alias	= self.Aliases[string.lower(strsub(command, 2))]
	local dealiased	= dealiased or {}
	local msg	= msg or ""

	if dealiased[command] then
		-- skip commands we've already dealiased
		self:warnUser(string.format(L['infinite loop detected for alias /%s - ignoring'], clralias(alias)))
	elseif alias and alias ~= "" then
		if (send == 1) and self.db.profile.verbose then
			self:warnUser(string.format(L['dealiasing command /%s to /%s'], clralias(strsub(command, 2)), clrexpansion(alias)))
		end

		dealiased[command] = true
		alias		= Prat.ReplaceMatches(alias, 'OUTBOUND')

		local newcmd	= strmatch(alias, "^/*([^%s]+)") or ""
		local premsg	= strsub(alias, strlen(newcmd) + 2) or ""

		if premsg ~= "" then
			msg	= premsg .. ' ' .. msg
		end

		command = '/' .. string.upper(newcmd) -- this needs to be upper
		text	= string.lower(command) -- this needs to be lower

		if msg and msg ~= "" then
			fake.MESSAGE = msg

			Prat.Addon:ProcessUserEnteredChat(fake)

			msg	= fake.MESSAGE
			text	= text .. ' ' .. msg
		end

		if (send == 1) then
			editBox:SetText(text)
		elseif (self.db.profile.inline) then
			editBox:SetText(text .. ' ')
		end

		self:ChatEdit_HandleChatType(editBox,  msg, command, send, dealiased)

		return true
	end

	if send == 1 then
    	-- Check the hash tables for slash commands and emotes to see if we've run this before. 
    	if ( hash_SlashCmdList[command] ) then
    		-- if the code in here changes - change the corresponding code below
    		hash_SlashCmdList[command](strtrim(msg), editBox);
    		editBox:AddHistoryLine(text);
    		ChatEdit_OnEscapePressed(editBox);
    		return true;
    	elseif ( hash_EmoteTokenList[command] ) then
    		-- if the code in here changes - change the corresponding code below
    		DoEmote(hash_EmoteTokenList[command], msg);
    		editBox:AddHistoryLine(text);
    		ChatEdit_OnEscapePressed(editBox);
    		return true;
    	end
    
    	-- If we didn't have the command in the hash tables, look for it the slow way...
    	for index, value in pairs(SlashCmdList) do
    		local i = 1;
    		local cmdString = _G["SLASH_"..index..i];
    		while ( cmdString ) do
    			cmdString = strupper(cmdString);
    			if ( cmdString == command ) then
    				-- if the code in here changes - change the corresponding code above
    				hash_SlashCmdList[command] = value;	-- add to hash
    				value(strtrim(msg), editBox);
    				editBox:AddHistoryLine(text);
    				ChatEdit_OnEscapePressed(editBox);
    				return true;
    			end
    			i = i + 1;
    			cmdString = _G["SLASH_"..index..i];
    		end
    	end
    
        -- Skip emotes
	end

	return self.hooks["ChatEdit_HandleChatType"](editBox,  msg, command, send)
end


  return
end ) -- Prat:AddModuleToLoad