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
Name: PratChannelReordering
Revision: $Revision: 80298 $
Author(s): Sylvanaar (sylvanaar@mindspring.com)
           SlackerJer (slackerjer@gmail.com)
Website: http://www.wowace.com/files/index.php?path=Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#ChannelReordering
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that renumbers chat channels to your specification.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function() 

-- Get Utility Libraries
local util, DBG, CLR = GetPratUtils()

local LIB = PRATLIB
local PRAT_LIBRARY = PRAT_LIBRARY
-- set prat module name
local PRAT_MODULE = Prat:RequestModuleName("PratChannelReordering")

if PRAT_MODULE == nil then 
    return 
end

-- define localized strings
local loc = PRAT_LIBRARY(LIB.LOCALIZATION)
local L = loc[PRATLIB.NEWLOCALENAMESPACE](loc, PRAT_MODULE)

L[LIB.NEWLOCALE](L, "enUS", function() return {
    ["ChannelReordering"] = true,
    ["Channel renumbering options."] = true,
    ["Save"] = true,
    ["Save channel list based on current channels"] = true,
    ["Sort"] = true,
    ["Sort channel list in order"] = true,
    ["Toggle"] = true,
    ["Toggle sorting channels on load on and off."] = true,
    ["Sort channel list in order"] = true,
    ["Sorting on load"] = true,
    ["Edit List"] = true,
    ["Edit current order list"] = true,
    ["%dth channel"] = true,
    ["%dst channel"] = true,
    ["%dnd channel"] = true,
    ["%drd channel"] = true,
    ["Set %dth channel."] = true,
    ["Set %dst channel."] = true,
    ["Set %dnd channel."] = true,
    ["Set %drd channel."] = true,
    ["<channel name>"] = true,
		["There are not enough channels available to rejoin the following:"] = true,
		["If you free up channels and then re-sort, the previous channels will be added"] = true,
} end)

L[LIB.NEWLOCALE](L, "koKR", function() return {
    ["ChannelReordering"] = "채널재배열",
    ["Channel renumbering options."] = "채널 재배열 설정입니다.",
    ["Save"] = "저장",
    ["Save channel list based on current channels"] = "현재 채널 상태에 따른 채널 목록을 저장합니다.",
    ["Sort"] = "정렬",
    ["Sort channel list in order"] = "순서대로 채널 목록을 정렬합니다.",
    ["Toggle"] = "사용",
    ["Toggle sorting channels on load on and off."] = "접속시 채널 정렬 사용을 켜거나 끕니다.",
--    ["Sort channel list in order"] = "순서대로 채널 목록을 정렬합니다.",
    ["Sorting on load"] = "접속 시 정렬 기능",
    ["Edit List"] = "목록 편집",
    ["Edit current order list"] = "현재 순서 목록을 편집합니다.",
    ["%dth channel"] = "%d번째 채널",
    ["%dst channel"] = "%d번째 채널",
    ["%dnd channel"] = "%d번째 채널",
    ["%drd channel"] = "%d번째 채널",
    ["Set %dth channel."] = "%d번째 채널을 설정합니다.",
    ["Set %dst channel."] = "%d번째 채널을 설정합니다.",
    ["Set %dnd channel."] = "%d번째 채널을 설정합니다.",
    ["Set %drd channel."] = "%d번째 채널을 설정합니다.",
    ["<channel name>"] = "<채널명>",
    ["There are not enough channels available to rejoin the following:"] = "다음의 재참여를 위한 사용 가능한 충분한 채널이 없습니다:",
    ["If you free up channels and then re-sort, the previous channels will be added"] = "만약 채널에 여유를 만들고 재정렬한다면, 이전 채널들이 추가될 것입니다.",
} end)

L[LIB.NEWLOCALE](L, "esES", function() return {
    ["ChannelReordering"] = "Reordenación de Canales",
    ["Channel renumbering options."] = "Opciones de Reordenación de canales",
    ["Save"] = "Guardar",
    ["Save channel list based on current channels"] = "Guarda la lista de canales basada en los canales actuales",
    ["Sort"] = "Ordenar",
    ["Sort channel list in order"] = "Ordena la lista de canales",
    ["Toggle"] = "Activar",
    ["Toggle sorting channels on load on and off."] = "Determina si ordena los canales al cargar",
    ["Sort channel list in order"] = "Ordena la lista de canales",
    ["Sorting on load"] = "Ordenar al cargar",
    ["Edit List"] = "Editar lista",
    ["Edit current order list"] = "Edita la lista de orden actual",
    ["%dth channel"] = "Canal n\195\186m. %d",
    ["%dst channel"] = "Canal n\195\186m. %d",
    ["%dnd channel"] = "Canal n\195\186m. %d",
    ["%drd channel"] = "Canal n\195\186m. %d",
    ["Set %dth channel."] = "Establecer como canal n\195\186mero %d",
    ["Set %dst channel."] = "Establecer como canal n\195\186mero %d",
    ["Set %dnd channel."] = "Establecer como canal n\195\186mero %d",
    ["Set %drd channel."] = "Establecer como canal n\195\186mero %d",
    ["<channel name>"] = "<nombre de canal>",
} end)

L[LIB.NEWLOCALE](L, "deDE", function() return {
    ["ChannelReordering"] = "Kanal Neu Nummerrierung",
    ["Channel renumbering options."] = "Kanal Neu Nummerrierungs Optionen",
    ["Save"] = "Speichern",
    ["Save channel list based on current channels"] = "Speichere die Kanalliste basierend auf den gegenw\195\164rtigen Kan\195\164len",
    ["Sort"] = "Sortiere",
    ["Sort channel list in order"] = "Sortiere die Kanal Liste nach Anordnung.",
    ["Toggle"] = "Lade Sortierung",
    ["Toggle sorting channels on load on and off."] = "Schaltet die Sortierung beim Laden an und aus.",
    ["Sort channel list in order"] = "Sortiere die Kanal Liste nach Anordnung.",
    ["Sorting on load"] = "Sortiere beim Laden",
    ["Edit List"] = "Editiere Liste",
    ["Edit current order list"] = "Editiere gegenw\195\164rtige Anordnungsliste",
    ["%dth channel"] = "%dter Kanal",
    ["Set %dth channel."] = "Setze %dten Kanal",
    ["<channel name>"] = "<kanal name>",
} end)

L[LIB.NEWLOCALE](L, "frFR", function() return {
    ["ChannelReordering"] = "R\195\169organisation des canaux",
    ["Channel renumbering options."] = "Options de r\195\169organisation des canaux.",
    ["Save"] = "Sauver",
    ["Save channel list based on current channels"] = "Sauver la liste des canaux bas\195\169e sur les canaux courants.",
    ["Sort"] = "Trier",
    ["Sort channel list in order"] = "Trier la liste des canaux",
    ["Toggle"] = "Activer/d\195\169sactiver",
    ["Toggle sorting channels on load on and off."] = "Active/d\195\169sactive le tri des canaux au chargement.",
    ["Sorting on load"] = "Tri au chargement",
    ["Edit List"] ="Editer la liste",
    ["Edit current order list"] = "Edite l'ordre actuel",
    ["%dth channel"] = "%d\195\168me canal",
    ["Set %dth channel."] = "R\195\168gle le %d\195\168me canal.",
    ["<channel name>"] = "<nom du canal>",
} end)

L[LIB.NEWLOCALE](L, "zhTW", function() return {
    ["ChannelReordering"] = "頻道重新排序",
    ["Channel renumbering options."] = "頻道數字變更選項。",
    ["Save"] = "儲存",
    ["Save channel list based on current channels"] = "依目前的頻道設定儲存頻道清單。",
    ["Sort"] = "排序",
    ["Sort channel list in order"] = "將頻道清單依序排列。",
-- no use anymore    ["Toggle"] = true,
    ["Toggle sorting channels on load on and off."] = "切換模組載入後切換是否啟用頻道排序。",
-- duplicated entry    ["Sort channel list in order"] = true,
    ["Sorting on load"] = "模組載入後排序",
    ["Edit List"] = "編輯清單",
    ["Edit current order list"] = "編輯現在的排序清單。",
    ["%dth channel"] = "%d號頻道",
    ["%dst channel"] = "%d號頻道",
    ["%dnd channel"] = "%d號頻道",
    ["%drd channel"] = "%d號頻道",
    ["Set %dth channel."] = "設定%d號頻道。",
    ["Set %dst channel."] = "設定%d號頻道。",
    ["Set %dnd channel."] = "設定%d號頻道。",
    ["Set %drd channel."] = "設定%d號頻道。",
    ["<channel name>"] = "<頻道名稱>",
		["There are not enough channels available to rejoin the following:"] = "頻道不足，無法加入以下頻道:",
		["If you free up channels and then re-sort, the previous channels will be added"] = "如果你釋放頻道後再將其重新排序，之前的頻道將會自動加入",
} end)
--Chinese Translation: 月色狼影@CWDG
--CWDG site: http://Cwowaddon.com
L[LIB.NEWLOCALE](L, "zhCN", function() return {
    ["ChannelReordering"] = "频道重新排列",
    ["Channel renumbering options."] = "频道数字变更设置",
    ["Save"] = "保存",
    ["Save channel list based on current channels"] = "以当前频道配置保存到频道清单中",
    ["Sort"] = "排序",
    ["Sort channel list in order"] = "依序排列频道清单",
    ["Toggle"] = "启用",
    ["Toggle sorting channels on load on and off."] = "切换频道排列顺序打开或关闭",
    ["Sort channel list in order"] = "依序排列频道清单",
    ["Sorting on load"] = "排列接收",
    ["Edit List"] = "编辑清单",
    ["Edit current order list"] = "编辑当前排列清单",
    ["%dth channel"] = "%d频道",
    ["%dst channel"] = "%d频道",
    ["%dnd channel"] = "%d频道",
    ["%drd channel"] = "%d频道",
    ["Set %dth channel."] = "设置%d频道",
    ["Set %dst channel."] = "设置%d频道",
    ["Set %dnd channel."] = "设置%d频道",
    ["Set %drd channel."] = "设置%d频道",
    ["<channel name>"] = "<频道名称>",
		["There are not enough channels available to rejoin the following:"] = "频道不足,无法加在以下频道:",
		["If you free up channels and then re-sort, the previous channels will be added"] = "如果你进行频道整理后重新排列，之前的频道将会自动载入",
} end)

-- define bogus channels
local bogusChannels = {
    [1] =  "xz9lq121",
    [2] =  "xz9lq122",
    [3] =  "xz9lq123",
    [4] =  "xz9lq124",
    [5] =  "xz9lq125",
    [6] =  "xz9lq126",
    [7] =  "xz9lq127",
    [8] =  "xz9lq128",
    [9] =  "xz9lq129",
    [10] = "xz9lq120",
}

-- holds list of channels that need to be rejoined
local rejoinChannels = {};



-- create prat module
Prat_ChannelReordering = Prat:NewModule(PRAT_MODULE, LIB.HOOKS)
local Prat_ChannelReordering = Prat_ChannelReordering
Prat_ChannelReordering.pratModuleName = PRAT_MODULE
Prat_ChannelReordering.revision = tonumber(string.sub("$Revision: 80298 $", 12, -3))

-- define key module values
Prat_ChannelReordering.moduleName = L["ChannelReordering"]
Prat_ChannelReordering.moduleDesc = L["Channel renumbering options."]
Prat_ChannelReordering.consoleName = "chanrenumbering"
Prat_ChannelReordering.guiName = L["ChannelReordering"]

--Prat_ChannelReordering.status = "BROKEN"

-- define the default db values
Prat_ChannelReordering.defaultDB = {
        on = false,
        sortonload = true,
}

-- create a moduleOptions stub (for setting self.moduleOptions)
Prat_ChannelReordering.moduleOptions = {}

-- add module options not covered by templates
function Prat_ChannelReordering:GetModuleOptions()
    self.moduleOptions = {
        name = L["ChannelReordering"],
        desc = L["Channel renumbering options."],
        type = "group",
        args = {
            sort = {
                name = L["Sort"],
                desc = L["Sort channel list in order"],
                type = "execute",
                order = 100,
                func = function() self:Sort() end,
                disabled = function() return self.currentlySorting end,
            },
            save = {
                name = L["Save"],
                desc = L["Save channel list based on current channels"],
                type = "execute",
                order = 110,
                func = function() self:Save() end,
                disabled = function() return self.currentlySorting end,
            },
            edit = {
                name = L["Edit List"],
                desc = L["Edit current order list"],
                type = "group",
                disabled = function() return self.currentlySorting end,
                order = 120,
                args = {
                    channel1 = {
                        name = string.format(L["%dst channel"], 1),
                        desc = string.format(L["Set %dst channel."], 1),
                        type = "text",
                        usage = L["<channel name>"],
                        order = 121,
                        get = function() return self.db.char.orderList[1] end,
                        set = function(v) self.db.char.orderList[1] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel2 = {
                        name = string.format(L["%dnd channel"], 2),
                        desc = string.format(L["Set %dnd channel."], 2),
                        type = "text",
                        usage = L["<channel name>"],
                        order = 122,
                        get = function() return self.db.char.orderList[2] end,
                        set = function(v) self.db.char.orderList[2] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel3 = {
                        name = string.format(L["%drd channel"], 3),
                        desc = string.format(L["Set %drd channel."], 3),
                        type = "text",
                        usage = L["<channel name>"],
                        order = 123,
                        get = function() return self.db.char.orderList[3] end,
                        set = function(v) self.db.char.orderList[3] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel4 = {
                        name = string.format(L["%dth channel"], 4),
                        desc = string.format(L["Set %dth channel."], 4),
                        type = "text",
                        usage = L["<channel name>"],
                        order = 124,
                        get = function() return self.db.char.orderList[4] end,
                        set = function(v) self.db.char.orderList[4] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel5 = {
                        name = string.format(L["%dth channel"], 5),
                        desc = string.format(L["Set %dth channel."], 5),
                        type = "text",
                        order = 125,
                        usage = L["<channel name>"],
                        get = function() return self.db.char.orderList[5] end,
                        set = function(v) self.db.char.orderList[5] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel6 = {
                        name = string.format(L["%dth channel"], 6),
                        desc = string.format(L["Set %dth channel."], 6),
                        type = "text",
                        order = 126,
                        usage = L["<channel name>"],
                        get = function() return self.db.char.orderList[6] end,
                        set = function(v) self.db.char.orderList[6] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel7 = {
                        name = string.format(L["%dth channel"], 7),
                        desc = string.format(L["Set %dth channel."], 7),
                        type = "text",
                        order = 127,
                        usage = L["<channel name>"],
                        get = function() return self.db.char.orderList[7] end,
                        set = function(v) self.db.char.orderList[7] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel8 = {
                        name = string.format(L["%dth channel"], 8),
                        desc = string.format(L["Set %dth channel."], 8),
                        type = "text",
                        order = 128,
                        usage = L["<channel name>"],
                        get = function() return self.db.char.orderList[8] end,
                        set = function(v) self.db.char.orderList[8] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel9 = {
                        name = string.format(L["%dth channel"], 9),
                        desc = string.format(L["Set %dth channel."], 9),
                        type = "text",
                        order = 129,
                        usage = L["<channel name>"],
                        get = function() return self.db.char.orderList[9] end,
                        set = function(v) self.db.char.orderList[9] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                    channel10 = {
                        name = string.format(L["%dth channel"], 10),
                        desc = string.format(L["Set %dth channel."], 10),
                        type = "text",
                        order = 130,
                        usage = L["<channel name>"],
                        get = function() return self.db.char.orderList[10] end,
                        set = function(v) self.db.char.orderList[10] = Prat_ChannelReordering:CleanseChannel(v) end,
                    },
                },
            },
            load = {
                name = L["Sorting on load"],
                desc = L["Toggle sorting channels on load on and off."],
                type = "toggle",
                order = 140,
                get = function() return self.db.profile.sortonload end,
                set = function(v) self.db.profile.sortonload = v end,
            }
        }
    }
    return self.moduleOptions
end

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--

-- things to do when the module is initialized
function Prat_ChannelReordering:OnModuleInit()
    Prat:RegisterDefaults("PratChannelReordering", "char", {
        orderList = {},
        suspendedChannels = {},
    })
    self.currentlySorting = false
end

-- things to do when the module is enabled
function Prat_ChannelReordering:OnModuleEnable()
	-- register events
	self[LIB.REGISTEREVENT](self, "AceEvent_FullyInitialized")
	self[LIB.REGISTEREVENT](self, "CHAT_MSG_CHANNEL_NOTICE");
end

-- things to do when the module is disabled
function Prat_ChannelReordering:OnModuleDisable()
	-- unregister events
	self:UnregisterAllEvents()
end

--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

-- we watch this for suspended channel action (ie, trade channel)
function Prat_ChannelReordering:CHAT_MSG_CHANNEL_NOTICE()
	if (arg1 == "SUSPENDED") then -- suspending a server channel
		self.db.char.suspendedChannels[arg8] = self:CleanseChannel(arg9);
	elseif (arg1 == "YOU_JOINED") then -- check if it's a suspended channel
--		if (self.db.char.suspendedChannels[arg8] == self:CleanseChannel(arg9)) or (self.db.char.suspendedChannels[arg8] == "UNKNOWN_SUSPENDED_CHANNEL") then -- it's ours, we're back so clear it
		if (self.db.char.suspendedChannels[arg8] ~= nil) then -- if any channel is here, it's either not suspended or got moved
			self.db.char.suspendedChannels[arg8] = nil;
		end
	end
--	self:Debug(arg1 .. "-" .. arg2 .. "-" .. arg3 .. "-" .. arg4 .. "-" .. arg5 .. "-" .. arg6 .. "-" .. arg7 .. "-" .. arg8 .. "-" .. arg9);
end

-- this reduces server zone channels (general, trade, etc to their base parts with no zone info)
function Prat_ChannelReordering:CleanseChannel(cname)
	if (cname == nil) then return nil; end
	local spaceFound = string.find(cname, " ");
	if (spaceFound) then
		cname = string.sub(cname, 1, spaceFound - 1);
	end
	return cname;
end

function Prat_ChannelReordering:AceEvent_FullyInitialized()
	if self.db.profile.sortonload then
		self:ScheduleEvent("Sort", self.Sort, 1, self)
	end
end

function Prat_ChannelReordering:Save()
	self.db.char.orderList = {};
	for i=1,10 do
		local cid, cname = GetChannelName(i);
		cname = self:CleanseChannel(cname);
		if cid > 0 and cname ~= nil then
			self.db.char.orderList[cid] = cname;
		end
	end
end

function Prat_ChannelReordering:Sort()
	self.currentlySorting = true;
	self:Hook("ChatFrame_MessageEventHandler", true);
	self:LeaveChannels();
	self:ScheduleEvent("JoinChannels", self.JoinChannels, 2, self)
end

function Prat_ChannelReordering:LeaveChannels()
	for i=1,10 do
		local cid, cname = GetChannelName(i);
		cname = self:CleanseChannel(cname);
		if cid > 0 and cname ~= nil then
			-- does this channel explicity belong here?
			if ((self.db.char.orderList[cid]) and (string.lower(cname) == string.lower(self.db.char.orderList[cid]))) then
				self:Debug("Found " .. cname .. " on " .. cid .. " where it belongs");
			elseif self:IsSavedChannel(cname) then -- is this a saved chan that should be elsewhere?
				self:Debug("Leaving " .. cid .. "-" .. cname .. " to move it");
				LeaveChannelByName(cname);
			elseif (self.db.char.orderList[cid] and self.db.char.orderList[cid] ~= "") then -- do we need this channel for one of our saved chans?
				self:Debug("Leaving " .. cid .. "-" .. cname .. " to reclaim this number");
				LeaveChannelByName(cname);
				-- need to save and rejoin this channel later
				table.insert(rejoinChannels, cname);
			end
		end
	end
end

function Prat_ChannelReordering:GetMaxSavedChannelNumber()
	local maxnum = 1;
	for i = 1, 10 do
		if (self.db.char.orderList[i] and self.db.char.orderList[i] ~= "") then
			maxnum = i;
		end
	end
	return maxnum;
end

function Prat_ChannelReordering:IsSavedChannel(channame)
	channame = string.lower(channame);
	for i = 1, 10 do
		if (self.db.char.orderList[i] and string.lower(self.db.char.orderList[i]) == channame) then
			return true;
		end
	end
	return false;
end

function Prat_ChannelReordering:IsSuspendedChannel(channum)
	if self.db.char.suspendedChannels[channum] ~= nil then
		return true;
	else
		return false;
	end
end

function Prat_ChannelReordering:CheckForSuspendedChannel(channum, channame)
	local checkid, checkname = GetChannelName(channum);
--	if string.lower(checkname or "1") ~= string.lower(channame or "2") then
	self:Debug("CheckSusp: want: " .. channame .. " on " .. channum .. " have " .. (checkname or "nil"));
	if checkname == nil then -- if no channel name then we couldn't place here
		-- this will happen if the channel is a suspended server channel (like trade)
		self:UnregisterAllEvents();
		self:Debug("Found possible unknown suspended channel on " .. channum);
		self.db.char.suspendedChannels[channum] = "UNKNOWN_SUSPENDED_CHANNEL";
		self:ScheduleEvent("LeaveChannels", self.LeaveChannels, 2, self);
		self:ScheduleEvent("JoinChannels", self.JoinChannels, 6, self);
	end
end

function Prat_ChannelReordering:GetNumberSuspendedChannels()
	local numsuspendedchans = 0;
	for i = 1, 10 do
		if self.db.char.suspendedChannels[i] ~= nil then
			numsuspendedchans = numsuspendedchans + 1;
		end
	end
	return numsuspendedchans;
end

function Prat_ChannelReordering:GetNumRejoinChannels()
	local numrejoinchans = 0;
	for key,value in pairs(rejoinChannels) do
		numrejoinchans = numrejoinchans + 1;
	end
	return numrejoinchans;
end

function Prat_ChannelReordering:JoinChannels()
	local numchannels = 0;
	for i, v in ipairs( { GetChannelList() } ) do
		numchannels = numchannels + 1;
	end
	numchannels = numchannels / 2; -- halve it because previous loop gets us chan number and name
	numchannels = numchannels + self:GetNumberSuspendedChannels(); -- suspended chans will not be in our total yet
	self:Debug("Starting channels: .. " .. numchannels);
	local serverchans = { EnumerateServerChannels() };
	local maxnum = self:GetMaxSavedChannelNumber();
	for i = 1, maxnum do
		if not Prat_ChannelReordering:IsSuspendedChannel(i) then
			local checkid, checkname = GetChannelName(i);
			checkname = self:CleanseChannel(checkname);
			if (self.db.char.orderList[i] and self.db.char.orderList[i] ~= "") then -- we need to put a chan here
				if (string.lower(checkname or "1") ~= string.lower(self.db.char.orderList[i] or "2")) then -- skip if our channel is already set for us
					if string.lower(self.db.char.orderList[i]) ~= "trade" then -- trade is special, server should keep for us?
						if (checkid == 0 and checkname == nil) then
							self:Join(self.db.char.orderList[i]);
							numchannels = numchannels + 1;
							self:ScheduleEvent("CheckForSuspendedChannel"..i, self.CheckForSuspendedChannel, 1, self, i, self.db.char.orderList[i]);
						else
							-- if we got here, not all channels are available to us, re-leave and try to join again
							self:Debug("Something is wrong. Channel " .. checkid .. " should be clear, but it is not. Starting over.");
							self:ScheduleEvent("LeaveChannels", self.LeaveChannels, 2, self);
							self:ScheduleEvent("JoinChannels", self.JoinChannels, 6, self);
							return;
						end
					end
				end
			elseif ((checkid == 0 and checkname == nil) and (i ~= maxnum)) then -- don't fill automatically if it's the last channel we need
				if (self:GetNumRejoinChannels() > 0) then -- fill with one of our rejoin channels
					local rejchan = table.remove(rejoinChannels)
					self:Join(rejchan);
					numchannels = numchannels + 1;
					self:ScheduleEvent("CheckForSuspendedChannel"..i, self.CheckForSuspendedChannel, 1, self, i, rejchan);
				else -- fill with a bogus channel
					self:Join(bogusChannels[i]);
					numchannels = numchannels + 1;
					self:ScheduleEvent("CheckForSuspendedChannel"..i, self.CheckForSuspendedChannel, 1, self, i, bogusChannels[i]);
				end
			end
		end
	end
	if (numchannels >= 10) and (self:GetNumRejoinChannels() > 0) then
		DEFAULT_CHAT_FRAME:AddMessage(L["There are not enough channels available to rejoin the following:"]);
	end
	for key,value in pairs(rejoinChannels) do -- rejoin any remaining leftover channels
		if (numchannels < 10) then
			self:Join(value);
			table.remove(rejoinChannels, key);
			numchannels = numchannels + 1;
		else
			DEFAULT_CHAT_FRAME:AddMessage("- " .. value);
		end
	end
	if (self:GetNumRejoinChannels() > 0) then
		DEFAULT_CHAT_FRAME:AddMessage(L["If you free up channels and then re-sort, the previous channels will be added"]);
	end
	self:ScheduleEvent("LeaveBogusChannels", self.LeaveBogusChannels, 1, self)
end

function Prat_ChannelReordering:LeaveBogusChannels()
	for i = 1, 10 do
		local cid, cname = GetChannelName(i);
		if ((cid > 0) and (string.sub(cname,1,7) == string.sub(bogusChannels[1],1,7))) then
				LeaveChannelByName(cname);
		end
	end
	self:ScheduleEvent("SortingDone", self.SortingDone, 1, self);
end

function Prat_ChannelReordering:SortingDone()
	if self:IsHooked("ChatFrame_MessageEventHandler") then
		self:Unhook("ChatFrame_MessageEventHandler")
	end
	self.currentlySorting = false
end

function Prat_ChannelReordering:ChatFrame_MessageEventHandler(event)
	local type = strsub(event, 10);
	if (type == "CHANNEL_NOTICE") then return true end
	return self.hooks["ChatFrame_MessageEventHandler"](event)
end

function Prat_ChannelReordering:Join(name)
	self:Debug("Joining channel: " .. name);
	local zoneChannel, channelName = JoinChannelByName(name, password, DEFAULT_CHAT_FRAME:GetID())
	if channelName then
		name = channelName
	end
	if not zoneChannel then
		return
	end
	local i = 1
	while DEFAULT_CHAT_FRAME.channelList[i] do
		i = i + 1
	end
	DEFAULT_CHAT_FRAME.channelList[i] = name
	DEFAULT_CHAT_FRAME.zoneChannelList[i] = zoneChannel
end


  return
end ) -- Prat:AddModuleToLoad