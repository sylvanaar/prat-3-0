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
Revision: $Revision: 80392 $
Author(s): Krtek (krtek4@gmail.com); Fin (fin@instinct.org)
Website: http://files.wowace.com/Prat/
Documentation: http://www.wowace.com/wiki/Prat/Integrated_Modules#History
Subversion: http://svn.wowace.com/wowace/trunk/Prat/
Discussions: http://groups.google.com/group/wow-prat
Issues and feature requests: http://code.google.com/p/prat/issues/list
Description: Module for Prat that adds chat history options.
Dependencies: Prat
]]

Prat:AddModuleToLoad(function()

--[[
    2007-06-24: added option to save cmd history - fin
]]

    local PRAT_MODULE = Prat:RequestModuleName("History")

    if PRAT_MODULE == nil then
        return
    end

    local L = Prat:GetLocalizer({})


    --@debug@
    L:AddLocale("enUS", {
        ["History"] = true,
        ["Chat history options."] = true,
        ["Set Chat Lines"] = true,
        ["Set the number of lines of chat history for each window."] = true,
        ["Set Command History"] = true,
        ["Maximum number of lines of command history to save."] = true,
        ["Save Command History"] = true,
        ["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"] = true,
        ["Scrollback"] = true,
        ["Store the chat lines between sessions"] = true,
        ["Scrollback Options"] = true,
        divider = "========== End of Scrollback ==========",
        scrollbacklen_name = "Scrollback Length",
        scrollbacklen_desc = "Number of chatlines to save in the scrollback buffer.",
    })
    --@end-debug@

    -- These Localizations are auto-generated. To help with localization
    -- please go to http://www.wowace.com/projects/prat-3-0/localization/


    --[===[@non-debug@
    L:AddLocale("enUS",
    --@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("frFR",
    --@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("deDE",
    --@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("koKR",
    --@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("esMX",
    --@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("ruRU",
    --@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("zhCN",
    --@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("esES",
    --@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    L:AddLocale("zhTW",
    --@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="History")@
    )
    --@end-non-debug@]===]

    -- create prat module
    local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")
    module.L = L

    Prat:SetModuleDefaults(module.name, {
        profile = {
            on = true,
            chatlinesframes = {},
            chatlines = 384,
            maxlines = 50,
            savehistory = false,
            cmdhistory = {},
            scrollback = true,
            scrollbacklen = 50,
        }
    })

    module.pluginopts = {}

    Prat:SetModuleOptions(module.name, {
        name = L["History"],
        desc = L["Chat history options."],
        type = "group",
        plugins = module.pluginopts,
        args = {
            chatlinesframes = {
                name = L["Set Chat Lines"],
                desc = L["Set the number of lines of chat history for each window."],
                type = "multiselect",
                values = Prat.HookedFrameList,
                get = "GetSubValue",
                set = "SetSubValue"
            },
            chatlines = {
                name = L["Set Chat Lines"],
                desc = L["Set the number of lines of chat history for each window."],
                type = "range",
                order = 120, min = 300,
                max = 5000,
                step = 10,
                bigStep = 50,
            },
            cmdhistheader = {
                name = "Command History Options",
                type = "header",
                order = 130,
            },
            maxlines = {
                name = L["Set Command History"],
                desc = L["Maximum number of lines of command history to save."],
                type = "range",
                order = 132,
                min = 0,
                max = 500,
                step = 10,
                bigStep = 50,
                disabled = function() return not module.db.profile.savehistory end
            },
            savehistory = {
                name = L["Save Command History"],
                desc = L["Saves command history between sessions (for use with alt+up arrow or just the up arrow)"],
                type = "toggle",
                order = 131,
            },
        }
    })

    --[[------------------------------------------------
        Module Event Functions
    ------------------------------------------------]] --

    -- things to do when the module is enabled
    function module:OnModuleEnable()
        self:ConfigureAllChatFrames()

        if self.db.profile.savehistory then
            if not self.db.profile.cmdhistory then
                self.db.profile.cmdhistory = {}
            end

            self:SecureHook(ChatFrame1EditBox, "AddHistoryLine")
            self:addSavedHistory()
        end

        if IsInGuild() then
            self.frame = self.frame or CreateFrame("Frame")
            self:DelayGMOTD(self.frame)

            local a,b = strsplit(":", GUILD_MOTD_TEMPLATE)
            GUILD_MOTD_TEMPLATE = "|cffffffff"..a.."|r:"..b

        end


    end




    -- things to do when the module is enabled
    function module:OnModuleDisable()
        self:ConfigureAllChatFrames(384)

        self.db.profile.cmdhistory = {}
    end

    function module:ConfigureAllChatFrames(lines)
        local lines = lines or self.db.profile.chatlines

        for k,v in pairs(self.db.profile.chatlinesframes) do
            self:SetHistory(_G[k], lines)
        end
    end

    function module:OnSubvalueChanged()
        self:ConfigureAllChatFrames()
    end

    function module:OnValueChanged()
        self:ConfigureAllChatFrames()
    end


    function module:DelayGMOTD(frame)
        local delay = 2.5
        local maxtime = 60
        ChatFrame1:UnregisterEvent(GUILD_MOTD)
        frame:SetScript("OnUpdate", function(this, expired)
            delay = delay - expired
            if delay < 0 then
                local msg = GetGuildRosterMOTD()
                if maxtime < 0 or (msg and msg:len() > 0) then
                    ChatFrame1:RegisterEvent(GUILD_MOTD)
                    ChatFrame_SystemEventHandler(ChatFrame1, "GUILD_MOTD", msg)
                    this:Hide()
                else
                    delay = 2.5
                    maxtime = maxtime - 2.5
                end
            end
        end)
    end


    --[[------------------------------------------------
        Core Functions
    ------------------------------------------------]] --
    local aquire, reclaim
    do
        local cache = setmetatable({}, {
            __mode = 'k'
        })
        acquire = function()
            local t = next(cache) or {}
            cache[t] = nil
            return t
        end
        reclaim = function(t)
            for k in pairs(t) do
                t[k] = nil
            end
            cache[t] = true
        end
    end


    function module:SetHistory(f, lines)
        if f:GetMaxLines() ~= lines then
            local chatlines = acquire()
            for i=f:GetNumRegions(),1,-1 do
                local x = select(i, f:GetRegions())
                if x:GetObjectType() == "FontString" then
                    table.insert(chatlines, {
                        x:GetText(), x:GetTextColor()
                    })
                end
            end

            f:SetMaxLines(lines)

            Prat.loading = true
            for i,v in ipairs(chatlines) do
                f:AddMessage(unpack(v))
            end
            Prat.loading = false

            reclaim(chatlines)
        end
    end

    function module:addSavedHistory(cmdhistory)
        local cmdhistory = self.db.profile.cmdhistory
        local cmdindex = #cmdhistory

        -- where there"s a while, there"s a way
        while cmdindex > 0 do
            ChatFrame1EditBox:AddHistoryLine(cmdhistory[cmdindex])
            cmdindex = cmdindex - 1
        -- way
        end
    end

    function module:saveLine(text)
        if not text or (text == "") then
            return false
        end

        local maxlines = self.db.profile.maxlines
        local cmdhistory = self.db.profile.cmdhistory or {}

        table.insert(cmdhistory, 1, text)

        if #cmdhistory > maxlines then
            for x=1,(#cmdhistory - maxlines) do
                table.remove(cmdhistory)
            end
        end

        self.db.profile.cmdhistory = cmdhistory
    end

    function module:AddHistoryLine(editBox)
        editBox = editBox or {}

        -- following code mostly ripped off from Blizzard, but at least I understand it now
        local text = ""
        local type = editBox:GetAttribute("chatType")
        local header = _G["SLASH_" .. type .. "1"]

        if (header) then
            text = header
        end

        if (type == "WHISPER") then
            text = text .. " " .. editBox:GetAttribute("tellTarget")
        elseif (type == "CHANNEL") then
            text = "/" .. editBox:GetAttribute("channelTarget")
        end

        local editBoxText = editBox:GetText();
        if (strlen(editBoxText) > 0) then
            text = text .. " " .. editBox:GetText();
            self:saveLine(text)
        end
    end


    return
end) -- Prat:AddModuleToLoad