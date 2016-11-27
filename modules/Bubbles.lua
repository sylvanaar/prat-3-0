---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2011  Prat Development Team
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

Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("Bubbles")

  if PRAT_MODULE == nil then
    return
  end

  local PL = Prat:GetLocalizer({})

  --@debug@
  PL:AddLocale("enUS", {
    module_name = "Bubbles",
    module_desc = "Chat bubble related customizations",
    shorten_name = "Shorten Bubbles",
    shorten_desc = "Shorten the chat bubbles down to a single line each. Mouse over the bubble to expand the text.",
    color_name = "Color Bubbles",
    color_desc = "Color the chat bubble border the same as the chat type.",
    format_name = "Format Text",
    format_desc = "Apply Prat's formatting to the chat bubble text.",
    icons_name = "Show Raid Icons",
    icons_desc = "Show raid icons in the chat bubbles.",
    font_name = "Use Chat Font",
    font_desc = "Use the same font you are using on the chatframe",
    fontsize_name = "Font Size",
    fontsize_desc = "Set the chat bubble font size",
    transparent_name = "Transparent Bubbles",
    transparent_desc = "Hide background and border textures from chat bubbles. (/reload required to undo this option)",
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@

--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("enUS",L)


--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("frFR",L)


--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("deDE",L)


--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("koKR",L)


--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("esMX",L)


--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("ruRU",L)


--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("zhCN",L)


--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("esES",L)


--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Bubbles")@

  PL:AddLocale("zhTW",L)

  --@end-non-debug@]===]

  local module = Prat:NewModule(PRAT_MODULE)

  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      shorten = false,
      color = true,
      format = true,
      icons = true,
      font = true,
      transparent = false,
      fontsize = 14,
    }
  })

  local toggleOption = {
    name = function(info) return PL[info[#info] .. "_name"] end,
    desc = function(info) return PL[info[#info] .. "_desc"] end,
    type = "toggle",
  }

  Prat:SetModuleOptions(module.name, {
    name = PL["module_name"],
    desc = PL["module_desc"],
    type = "group",
    args = {
      shorten = toggleOption,
      color = toggleOption,
      format = toggleOption,
      icons = toggleOption,
      font = toggleOption,
      transparent = toggleOption,
      fontsize = {
        name = function(info) return PL[info[#info] .. "_name"] end,
        desc = function(info) return PL[info[#info] .. "_desc"] end,
        type = "range",
        min = 8,
        max = 32,
        step = 1,
        order = 101
      }
    }
  })

  --[[------------------------------------------------
    Module Event Functions
  ------------------------------------------------]] --

  local BUBBLE_SCAN_THROTTLE = 0.1

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    self.update = self.update or CreateFrame('Frame');
    self.throttle = BUBBLE_SCAN_THROTTLE

    self.update:SetScript("OnUpdate",
      function(frame, elapsed)
        self.throttle = self.throttle - elapsed
        if frame:IsShown() and self.throttle < 0 then
          self.throttle = BUBBLE_SCAN_THROTTLE
          self:FormatBubbles()
        end
      end)

    self:RestoreDefaults()
    self:APLyOptions()
  end

  function module:APLyOptions()
    self.shorten = self.db.profile.shorten
    self.color = self.db.profile.color
    self.format = self.db.profile.format
    self.icons = self.db.profile.icons
    self.font = self.db.profile.font
    self.fontsize = self.db.profile.fontsize
    self.transparent = self.db.profile.transparent

    if self.shorten or self.color or self.format or self.icons or self.font or self.transparent then
      self.update:Show()
    else
      self.update:Hide()
    end
  end

  function module:OnValueChanged(info, b)
    self:RestoreDefaults()

    self:APLyOptions()
  end

  function module:OnModuleDisable()
    self:RestoreDefaults()
  end

  function module:FormatBubbles()
    self:IterateChatBubbles("FormatCallback")
  end

  function module:RestoreDefaults()
    self.update:Hide()

    self:IterateChatBubbles("RestoreDefaultsCallback")
  end

  local MAX_CHATBUBBLE_WIDTH = 300

  -- Called for each chatbubble, passed the bubble's frame and its fontstring
  function module:FormatCallback(frame, fontstring)
    if not frame:IsShown() then
      fontstring.lastText = nil
      return
    end

    if self.shorten then
      local wrap = fontstring:CanWordWrap() or 0

      -- If the mouse is over, then expand the bubble
      if frame:IsMouseOver() then
        fontstring:SetWordWrap(true)
      elseif wrap == 1 then
        fontstring:SetWordWrap(false)
      end
    end

    MAX_CHATBUBBLE_WIDTH = math.min(UIParent:GetWidth() /2, math.max(frame:GetWidth(), MAX_CHATBUBBLE_WIDTH))

    local text = fontstring:GetText() or ""

    if text == fontstring.lastText then
      if self.shorten then
        fontstring:SetWidth(fontstring:GetWidth())
      end
      return
    end

    if self.color then
      -- Color the bubble border the same as the chat
      frame:SetBackdropBorderColor(fontstring:GetTextColor())
    end


    if self.font then
      local a, b, c = fontstring:GetFont()

      fontstring:SetFont(ChatFrame1:GetFont(), self.fontsize, c)
    end

    if self.transparent then
       -- Hide the border and background textures of the chat bubble
       --FIXME: remove texture from bubble tail
       frame:SetBackdrop(nil) -- remove texture from bubble (borders and background)
    end

    if self.icons then
      local term;
      for tag in string.gmatch(text, "%b{}") do
        term = strlower(string.gsub(tag, "[{}]", ""));
        if (ICON_TAG_LIST[term] and ICON_LIST[ICON_TAG_LIST[term]]) then
          text = string.gsub(text, tag, ICON_LIST[ICON_TAG_LIST[term]] .. "0|t");
        end
      end
    end

    if self.format then
      text = Prat.MatchPatterns(text)
      text = Prat.ReplaceMatches(text)
    end

    fontstring:SetText(text)
    fontstring.lastText = text
    fontstring:SetWidth(math.min(fontstring:GetStringWidth(), MAX_CHATBUBBLE_WIDTH - 14))
  end

  -- Called for each chatbubble, passed the bubble's frame and its fontstring
  function module:RestoreDefaultsCallback(frame, fontstring)
    frame:SetBackdropBorderColor(1, 1, 1, 1)
    fontstring:SetWordWrap(1)
    fontstring:SetWidth(fontstring:GetWidth())
  end

  function module:IterateChatBubbles(funcToCall)
    for i = 1, WorldFrame:GetNumChildren() do
      local v = select(i, WorldFrame:GetChildren())
      local b = v.isChatBubble == nil and v:GetBackdrop()
      if v.isChatBubble ~= false and b and b.bgFile == "Interface\\Tooltips\\ChatBubble-Background" then
        v.isChatBubble = true
        for i = 1, v:GetNumRegions() do
          local frame = v
          local v = select(i, v:GetRegions())
          if v:GetObjectType() == "FontString" then
            local fontstring = v
            if type(funcToCall) == "function" then
              funcToCall(frame, fontstring)
            else
              self[funcToCall](self, frame, fontstring)
            end
          end
        end
      else
        v.isChatBubble = false
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad