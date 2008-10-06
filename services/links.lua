---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
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
Name: Prat 3.0 (links.lua)
Revision: $Revision: 81600 $
Author(s): Sylvaanar (sylvanaar@mindspring.com)
Inspired By: Prat 2.0, Prat, and idChat2 by Industrial
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat
Forum: http://www.wowace.com/forums/index.php?topic=6243.0
SVN: http://svn.wowace.com/wowace/trunk/Prat/
Description: The chat link registry service
]]




--[[ BEGIN STANDARD HEADER ]]--

-- Imports
local _G = _G
local LibStub = LibStub

local pairs, ipairs = pairs, ipairs
local tinsert, tremove, tconcat = table.insert, table.remove, table.concat

-- Isolate the environment
setfenv(1, SVC_NAMESPACE)

--[[ END STANDARD HEADER ]]--


local function debug() end

function BuildLink(linktype, data, text, color, link_start, link_end)
    return "|cff"..(color or "ffffff").."|H"..linktype..":"..data.."|h"..(link_start or "[")..text..(link_end or "]").."|h|r"
end


do
	LinkRegistry = {}
	local LinkOwners = {}
	
	-- linktype = { linkid, linkfunc, handler }
	function RegisterLinkType(linktype, who)
	    if linktype and linktype.linkid and linktype.linkfunc then
	        tinsert(LinkRegistry, linktype)
	
	        local idx = #LinkRegistry
	
	        debug([[DBG_LINK("RegisterLinkType", who, linktype.linkid, idx)]])
	
	        if idx then
	            LinkOwners[idx] = who
	        end
	
	        return idx
	    end
	end
	
	function UnregisterAllLinkTypes(who)
	    debug([[DBG_LINK("UnregisterAllLinkTypes", who)]])
	
	    for k, owner in pairs(LinkOwners) do
	        if owner == who then
	            UnregisterLinkType(k)
	        end
	    end
	end

	function UnregisterLinkType(idx)
	    tremove(LinkRegistry, idx)
	end

	function SetItemRefHook(orgfunc, link, ...)
	    debug([[DUMP_LINK("SetItemRef ", link, ...)]])
	    for i,reg_link in ipairs(LinkRegistry) do
	        if reg_link.linkid == link:sub(1, (reg_link.linkid):len()) then
	            if (reg_link.linkfunc(reg_link.handler, link,  ...) == false) then
	                debug([[DUMP_LINK("SetItemRef ", "Link Handled Internally")]])
	                return false
	            end
	        end
	    end
		
		if WOTLK then
			SetItemRef(link, ...)
		else
			orgfunc(link, ...)
		end
	end
end


function SetItemRef(link, text, button)
	if ( _G.strsub(link, 1, 6) == "player" ) then
		local namelink = _G.strsub(link, 8);
		local name, lineid = _G.strsplit(":", namelink);
		if ( name and (_G.strlen(name) > 0) ) then
			if ( _G.IsModifiedClick("CHATLINK") ) then
				local staticPopup;
				staticPopup = _G.StaticPopup_Visible("ADD_IGNORE");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = _G.StaticPopup_Visible("ADD_MUTE");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = _G.StaticPopup_Visible("ADD_FRIEND");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = _G.StaticPopup_Visible("ADD_GUILDMEMBER");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = _G.StaticPopup_Visible("ADD_TEAMMEMBER");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = _G.StaticPopup_Visible("ADD_RAIDMEMBER");
				if ( staticPopup ) then
					-- If add ignore dialog is up then enter the name into the editbox
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				staticPopup = _G.StaticPopup_Visible("CHANNEL_INVITE");
				if ( staticPopup ) then
					_G.getglobal(staticPopup.."EditBox"):SetText(name);
					return;
				end
				if ( _G.ChatFrameEditBox:IsVisible() ) then
					_G.ChatFrameEditBox:Insert(name);
				elseif ( _G.HelpFrameOpenTicketText:IsVisible() ) then
					_G.HelpFrameOpenTicketText:Insert(name);
				else
					_G.SendWho(_G.WHO_TAG_NAME..name);					
				end
				
			elseif ( button == "RightButton" ) then
				_G.FriendsFrame_ShowDropdown(name, 1, lineid);
			else
				_G.ChatFrame_SendTell(name);
			end
		end
		return;
	elseif ( _G.strsub(link, 1, 7) == "channel" ) then
		if ( _G.IsModifiedClick("CHATLINK") ) then
			_G.FriendsFrame:Show();
			_G.FriendsFrameTab4:Click();
		elseif ( button == "LeftButton" ) then
			local chan = _G.strsub(link, 9);
			local channum = _G.tonumber(chan)
			if ( (not channum) or _G.GetChannelName(channum)~=0 ) then
				--Open chat for channel
				_G.ChatFrame_OpenChat("/"..chan, _G.DEFAULT_CHAT_FRAME);
			end
		end
		return;
    end
    
	if ( _G.IsModifiedClick() ) then
		_G.HandleModifiedItemClick(text);
	else
		_G.ShowUIPanel(_G.ItemRefTooltip);
		if ( not _G.ItemRefTooltip:IsShown() ) then
			_G.ItemRefTooltip:SetOwner(_G.UIParent, "ANCHOR_PRESERVE");
		end
		_G.ItemRefTooltip:SetHyperlink(link);
	end
end


