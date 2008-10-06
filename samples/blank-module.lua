--[[ blank-module.lua
     ----------------
 
This file is meant to be a skeleton containing the most basic elements
required for all Prat 2 modules which can be used as a template.

The following strings are used through the file and should be replaced
with the relevant information:

   @@ = ModuleName 	-- eg, ExampleModule or AddonMsgs or Whatever
   ## = Description	-- eg, "An blank example module file for Prat 2.0."
   %% = revision number	-- eg, 22222

Other variables that need to be set have been marked by the following
on a line by itself:

-- !!

For more resources on Prat, its modules, and Acey type stuff, have a
look at some of this page:

 - http://groups.google.com/group/wow-prat/web/prat-resources
 
Cheers!

 - Fin // fin@instinct.org
]]

-- !!
--[[
Name: Prat_@@
Revision: $Revision: %%$
-- !!
Your Name (youremail@example.com)
Author(s):  (..@..)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#@@
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: ## (default=off).
Dependencies: Prat
]]

-- Get Utility Libraries
local util, DBG, CLR = GetPratUtils()

-- set prat module name
local PRAT_MODULE = Prat:RequestModuleName("@@")

-- define localized strings
local L = PRAT_LIBRARY(PRATLIB.LOCALIZATION):new(PRAT_MODULE)

L:RegisterTranslations("enUS", function() return {
	["@@"] = true,
	["##"] = true,

	--[[
		text strings used by the toggleOptions' show{} handler
		NB: other handlers may also generate text needing translations added
	]]
--	["show_name"] = "Show @@",		-- example with defaultDB entries below 
--	["show_desc"] = "Toggle Prat_@@.",	-- commented out

	--[[
		text strings used by the toggleOptions' show{} handler
		NB: %d replaced with the Frame Name
	]]
--	["show_perframename"] = "Chat%d@@MsgsShow",
--	["show_perframedesc"] = "Toggle showing addon messages for chat window %d.",
	} end)

--[[
	translations for various locales here - typically including
	deDE, frFR, esES, koKR, zhCN, zhTW; must include an entry for each
	text string listed for enUS, eg:

L:RegisterTranslations("deDE", function() return {
	-- !!
	["@@"] = true,
	["##"] = true,
	} end)
]]
L:RegisterTranslations("zhCN", function() return {
	["@@"] = "@@",
	["##"] = "##",
	} end)



-- create Prat module
Prat_@@ = Prat:NewModule(PRAT_MODULE)
Prat_@@.revision = tonumber(string.sub("$Revision: 79217 $", 12, -3))

-- define key module values
Prat_@@.moduleName	= L["@@"] 	-- module name, eg "ExampleMod"
-- !!
Prat_@@.moduleDesc	= L["##"] 	-- module description, eg "An example of a Prat 2 mod"

Prat_@@.consoleName	= string.lower(Prat_@@.moduleName)
Prat_@@.guiName		= Prat_@@.moduleName

-- categories the module is related to, eg "{ cat.TEXT, cat.INFO }"
-- list here: http://groups-beta.google.com/group/wow-prat/web/prat-categories
-- !!
Prat_@@.Categories	= { }

-- init moduleOoptions (populated by the other various options tables below)
Prat_@@.moduleOptions = {}

-- default values for any settings that need them
-- !!
Prat_@@.defaultDB = {
	on	= false, -- this value tracks if the module should be on or off, 
	             -- an option 'toggle' is automatically created so you can 
	             -- set this value
	}


-- any boolean options
Prat_@@.toggleOptions = {
	--[[
	NB: for each key name, you must have two corresponding local
	entries for the key name and description:

		key_name
		key_desc

	eg, with an entry of:

		cheesy	= true,

	You would then need to add the two entries shown below:

	L:RegisterTranslations("enUS", function() return {
	...
		["cheesy_name"] = "Cheesy",
		["cheesy_desc"] = "Whether the addon exudes an aura of cheese, or not.",
	...
	} end)
	]]
	}

function Prat_@@:GetModuleOptions()
	self.moduleOptions = {
		name	= self.moduleName,
		desc	= self.moduleDesc,
		type	= "group",
		args = {
			--[[
				table of possible arguments to the slash command and for the FuBar menu;
				see here for more details on valid entries:
			
				- http://www.wowace.com/wiki/AceConsole-2.0
				- http://www.wowace.com/wiki/AceOptions_data_table
			]]
			
			--[[ eg:
			
			test = {
				name	= L["Test setting"],				-- used in tooltip and generated help
				desc	= L["To test assigning a value to an option."],	-- used in tooltip and generated help
				type	= "text",					-- type of argument (eg, group, toggle
				order	= 99,						-- order when displaying list of args
				usage	= L["test <value>"],				-- text to to display if no values given

				get	= function() return self.db.profile.test end,	-- function to return the current value
				set	= function(v) self.db.profile.test = v end,	-- function to set this argument's value
				},
			]]
			}
		}
	
	return self.moduleOptions
end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is enabled
function Prat_@@:OnModuleEnable()
	-- register events
	-- !!
	self:RegisterEvent("")
	
	-- hook functions
	-- !!
	self:SecureHook("")

	-- !!
	-- register slash commands if wanted
	local slashcmds = {
		-- eg: "/testmodule", "/testm"
		}

	if slashcmds then
		Prat:RegisterChatCommand(slashcmds, self.moduleOptions, string.upper(self.moduleName))
	end
end

-- things to do when the module is disabled
function Prat_@@:OnModuleDisable()
	-- unregister events
	self:UnregisterAllEvents()
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- things do stuff here
