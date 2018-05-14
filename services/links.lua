---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
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





--[[ BEGIN STANDARD HEADER ]] --

-- Imports
local _G = _G
local LibStub = LibStub

local pairs, ipairs = pairs, ipairs
local tinsert, tremove, tconcat = table.insert, table.remove, table.concat

-- Isolate the environment
setfenv(1, select(2, ...))

--[[ END STANDARD HEADER ]] --


local function debug(...)
--  _G.ChatFrame1:print(...)
end

function BuildLink(linktype, data, text, color, link_start, link_end)
  return "|cff" .. (color or "ffffff") .. "|H" .. linktype .. ":" .. data .. "|h" .. (link_start or "[") .. text .. (link_end or "]") .. "|h|r"
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

    for k,owner in pairs(LinkOwners) do
      if owner == who then
        UnregisterLinkType(k)
      end
    end
  end

  function UnregisterLinkType(idx)
    tremove(LinkRegistry, idx)
  end

  function SetHyperlinkHook(hooks, frame, link, ...)
    debug("SetItemRef ", link, ...)
    for i,reg_link in ipairs(LinkRegistry) do
      if reg_link.linkid == link:sub(1, (reg_link.linkid):len()) then
        if (reg_link.linkfunc(reg_link.handler, link, ...) == false) then
          debug([[DUMP_LINK("SetItemRef ", "Link Handled Internally")]])
          return false
        end
      end
    end
    hooks.SetHyperlink(frame, link, ...)
  end
end


