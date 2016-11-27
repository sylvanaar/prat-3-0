-- This is the editbox module from Chatter by Antiarc

if not Prat.BN_CHAT then return end -- Requires 3.3.5

Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("Editbox")

  if PRAT_MODULE == nil then
    return
  end

  local PL = Prat:GetLocalizer({})

  --@debug@
  PL:AddLocale("enUS", {
    ["Editbox"] = true,
    ["Editbox options."] = true,
    ["Top"] = true,
    ["Bottom"] = true,
    ["Free-floating"] = true,
    ["Free-floating, Locked"] = true,
    ["Background texture"] = true,
    ["Border texture"] = true,
    ["Background color"] = true,
    ["Border color"] = true,
    ["Background Inset"] = true,
    ["Tile Size"] = true,
    ["Edge Size"] = true,
    ["Attach to..."] = true,
    ["Attach edit box to..."] = true,
    ["Color border by channel"] = true,
    ["Sets the frame's border color to the color of your currently active channel"] = true,
    ["Use Alt key for cursor movement"] = true,
    ["Requires the Alt key to be held down to move the cursor in chat"] = true,
    ["Font"] = true,
    currently_broken_alt_behavior = "Arrow key behaviour broken in current WoW client,\n\nUse ALT-UP and ALT-DOWN instead of just UP DOWN to access history",
    ["Select the font to use for the edit box"] = true,
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --[===[@non-debug@

--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("enUS",L)


--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("frFR",L)


--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("deDE",L)


--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("koKR",L)


--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("esMX",L)


--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("ruRU",L)


--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("zhCN",L)


--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("esES",L)


--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Editbox")@

  PL:AddLocale("zhTW",L)

  --@end-non-debug@]===]



  local mod = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

  local mustUseAlt = select(4, _G.GetBuildInfo()) >= 50400

  local Media = Prat.Media
  local backgrounds, borders, fonts = {}, {}, {}
  local CreateFrame = _G.CreateFrame
  local max = _G.max
  local pairs = _G.pairs
  local select = _G.select

  local VALID_ATTACH_POINTS = {
    TOP = PL["Top"],
    BOTTOM = PL["Bottom"],
    FREE = PL["Free-floating"],
    LOCK = PL["Free-floating, Locked"]
  }

  local function updateEditBox(method, ...)
    for i = 1, NUM_CHAT_WINDOWS do
      local f = _G["ChatFrame" .. i .. "EditBox"]
      f[method](f, ...)
    end
  end

  Prat:SetModuleOptions(mod, {
    name = PL["Editbox"],
    desc = PL["Editbox options."],
    type = "group",
    args = {
      background = {
        type = "select",
        name = PL["Background texture"],
        desc = PL["Background texture"],
        values = backgrounds,
        get = function() return mod.db.profile.background end,
        set = function(info, v)
          mod.db.profile.background = v
          mod:SetBackdrop()
        end
      },
      border = {
        type = "select",
        name = PL["Border texture"],
        desc = PL["Border texture"],
        values = borders,
        get = function() return mod.db.profile.border end,
        set = function(info, v)
          mod.db.profile.border = v
          mod:SetBackdrop()
        end
      },
      backgroundColor = {
        type = "color",
        name = PL["Background color"],
        desc = PL["Background color"],
        hasAlpha = true,
        get = function()
          local c = mod.db.profile.backgroundColor
          return c.r, c.g, c.b, c.a
        end,
        set = function(info, r, g, b, a)
          local c = mod.db.profile.backgroundColor
          c.r, c.g, c.b, c.a = r, g, b, a
          mod:SetBackdrop()
        end
      },
      borderColor = {
        type = "color",
        name = PL["Border color"],
        desc = PL["Border color"],
        hasAlpha = true,
        get = function()
          local c = mod.db.profile.borderColor
          return c.r, c.g, c.b, c.a
        end,
        set = function(info, r, g, b, a)
          local c = mod.db.profile.borderColor
          c.r, c.g, c.b, c.a = r, g, b, a
          mod:SetBackdrop()
        end
      },
      inset = {
        type = "range",
        name = PL["Background Inset"],
        desc = PL["Background Inset"],
        min = 1,
        max = 64,
        step = 1,
        bigStep = 1,
        get = function() return mod.db.profile.inset end,
        set = function(info, v)
          mod.db.profile.inset = v
          mod:SetBackdrop()
        end
      },
      tileSize = {
        type = "range",
        name = PL["Tile Size"],
        desc = PL["Tile Size"],
        min = 1,
        max = 64,
        step = 1,
        bigStep = 1,
        get = function() return mod.db.profile.tileSize end,
        set = function(info, v)
          mod.db.profile.tileSize = v
          mod:SetBackdrop()
        end
      },
      edgeSize = {
        type = "range",
        name = PL["Edge Size"],
        desc = PL["Edge Size"],
        min = 1,
        max = 64,
        step = 1,
        bigStep = 1,
        get = function() return mod.db.profile.edgeSize end,
        set = function(info, v)
          mod.db.profile.edgeSize = v
          mod:SetBackdrop()
        end
      },
      attach = {
        type = "select",
        name = PL["Attach to..."],
        desc = PL["Attach edit box to..."],
        get = function() return mod.db.profile.attach end,
        values = VALID_ATTACH_POINTS,
        set = function(info, v)
          mod.db.profile.attach = v
          mod:SetAttach()
        end
      },
      colorByChannel = {
        type = "toggle",
        name = PL["Color border by channel"],
        desc = PL["Sets the frame's border color to the color of your currently active channel"],
        get = function()
          return mod.db.profile.colorByChannel
        end,
        set = function(info, v)
          mod.db.profile.colorByChannel = v
          if v then
            mod:RawHook("ChatEdit_UpdateHeader", "SetBorderByChannel", true)
          else
            if mod:IsHooked("ChatEdit_UpdateHeader") then
              mod:Unhook("ChatEdit_UpdateHeader")
              local c = mod.db.profile.borderColor
              for _, frame in ipairs(mod.frames) do
                frame:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
              end
            end
          end
        end
      },
      useAltKey = {
        type = "toggle",
        name = PL["Use Alt key for cursor movement"],
        desc = PL["Requires the Alt key to be held down to move the cursor in chat"],
        get = function()
          return mod.db.profile.useAltKey
        end,
        set = function(info, v)
          mod.db.profile.useAltKey = v
          updateEditBox("SetAltArrowKeyMode", v)
        end,
      },
      font = {
        type = "select",
        name = PL["Font"],
        desc = PL["Select the font to use for the edit box"],
        values = fonts,
        get = function() return mod.db.profile.font end,
        set = function(i, v)
          mod.db.profile.font = v
          for i = 1, NUM_CHAT_WINDOWS do
            local ff = _G["ChatFrame" .. i .. "EditBox"]
            local _, s, m = ff:GetFont()
            ff:SetFont(Media:Fetch("font", v), s, m)
          end
        end
      },
        info = {
            name = PL.currently_broken_alt_behavior;
            type = "description",
            hidden = not mustUseAlt;
            order = 1000;
        },
    },

  })

  Prat:SetModuleDefaults(mod.name, {
    profile = {
      on = true,
      background = "Blizzard Tooltip",
      border = "Blizzard Tooltip",
      backgroundColor = { r = 0, g = 0, b = 0, a = 1 },
      borderColor = { r = 1, g = 1, b = 1, a = 1 },
      inset = 3,
      edgeSize = 12,
      tileSize = 16,
      height = 22,
      attach = "BOTTOM",
      colorByChannel = true,
      useAltKey = false,
      font = (function()
        for i = 1, NUM_CHAT_WINDOWS do
          local ff = _G["ChatFrame" .. i .. "EditBox"]
          local f = ff:GetFont()
          for k, v in pairs(Media:HashTable("font")) do
            if v == f then return k end
          end
        end
      end)()
    }
  })


  function mod:LibSharedMedia_Registered()
    for k, v in pairs(Media:List("background")) do
      backgrounds[v] = v
    end
    for k, v in pairs(Media:List("border")) do
      borders[v] = v
    end
    for k, v in pairs(Media:List("font")) do
      fonts[v] = v
    end
  end

  Prat:SetModuleInit(mod,
    function(self)

      Media.RegisterCallback(mod, "LibSharedMedia_Registered")
      self.frames = {}

      self:LibSharedMedia_Registered()

      for i = 1, NUM_CHAT_WINDOWS do
        local parent = _G["ChatFrame" .. i .. "EditBox"]


        local frame = CreateFrame("Frame", nil, parent)
        frame:SetFrameStrata("DIALOG")

        frame:SetFrameLevel(parent:GetFrameLevel() - 1)
        frame:SetAllPoints(parent)
        frame:Hide()

        parent.lDrag = CreateFrame("Frame", nil, parent)
        parent.lDrag:SetWidth(15)
        parent.lDrag:SetPoint("TOPLEFT", parent, "TOPLEFT")
        parent.lDrag:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT")

        parent.rDrag = CreateFrame("Frame", nil, parent)
        parent.rDrag:SetWidth(15)
        parent.rDrag:SetPoint("TOPRIGHT", parent, "TOPRIGHT")
        parent.rDrag:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT")
        parent.lDrag.left = true
        parent.frame = frame
        tinsert(self.frames, frame)
      end
    end)

  local function OnArrowPressed(self, key)
      if #self.history_lines == 0 then
          return
      end

      if key == "DOWN" then
          self.history_index = self.history_index - 1

          if self.history_index < 1 then
              self.history_index = #self.history_lines
          end
      elseif key == "UP" then
          self.history_index = self.history_index + 1

          if self.history_index > #self.history_lines then
              self.history_index = 1
          end
      else
          return -- We don't want to interfere with LEFT/RIGHT because the tab-complete stuff might use it; we're already killing the other two.
      end
      self:SetText(self.history_lines[self.history_index])
  end
  local function enableArrowKeys(e)
      e.history_lines = e.history_lines or {}
      e.history_index = e.history_index or 0
      e:HookScript("OnArrowPressed", OnArrowPressed)
  end
  function mod:Prat_FramesUpdated(info, name, chatFrame, ...)
    local i = chatFrame:GetID()
    local f = _G["ChatFrame" .. i .. "EditBox"]
    _G["ChatFrame" .. i .. "EditBoxLeft"]:Hide()
    _G["ChatFrame" .. i .. "EditBoxRight"]:Hide()
    _G["ChatFrame" .. i .. "EditBoxMid"]:Hide()
    _G["ChatFrame" .. i .. "EditBoxFocusLeft"]:SetTexture(nil)
    _G["ChatFrame" .. i .. "EditBoxFocusRight"]:SetTexture(nil)
    _G["ChatFrame" .. i .. "EditBoxFocusMid"]:SetTexture(nil)
    f:Hide()

    self.frames[i] = f
    self.frames[i]:Show()
    local font, s, m = f:GetFont()
    f:SetFont(Media:Fetch("font", self.db.profile.font), s, m)

    local header = _G[f:GetName() .. "Header"]
    local font, s, m = header:GetFont()
    header:SetFont(Media:Fetch("font", self.db.profile.font), s, m)

    f:SetAltArrowKeyMode(mod.db.profile.useAltKey and 1 or nil)
    if (not mod.db.profile.useAltKey) then
        enableArrowKeys(f)
    end
    self:SetBackdrop()
    self:UpdateHeight()
  end

  function mod:OnEnable()
    self:LibSharedMedia_Registered()

    for i = 1, NUM_CHAT_WINDOWS do
      local f = _G["ChatFrame" .. i .. "EditBox"]
      _G["ChatFrame" .. i .. "EditBoxLeft"]:Hide()
      _G["ChatFrame" .. i .. "EditBoxRight"]:Hide()
      _G["ChatFrame" .. i .. "EditBoxMid"]:Hide()
      _G["ChatFrame" .. i .. "EditBoxFocusLeft"]:SetTexture(nil)
      _G["ChatFrame" .. i .. "EditBoxFocusRight"]:SetTexture(nil)
      _G["ChatFrame" .. i .. "EditBoxFocusMid"]:SetTexture(nil)
      f:Hide()

      -- Prevent an error in FloatingChatFrame FCF_FadeOutChatFrame() (blizz bug)
      f:SetAlpha(f:GetAlpha() or 0)

      self.frames[i]:Show()
      local font, s, m = f:GetFont()
      f:SetFont(Media:Fetch("font", self.db.profile.font), s, m)

      local header = _G[f:GetName() .. "Header"]
      local font, s, m = header:GetFont()
      header:SetFont(Media:Fetch("font", self.db.profile.font), s, m)

      f:SetAltArrowKeyMode(mod.db.profile.useAltKey and 1 or nil)
      if (not mod.db.profile.useAltKey) then
          enableArrowKeys(f)
      end
    end


    self:SetBackdrop()


    self:SetAttach(nil, self.db.profile.editX, self.db.profile.editY, self.db.profile.editW)
    self:SecureHook("ChatEdit_DeactivateChat")
    self:SecureHook("ChatEdit_SetLastActiveWindow")

    self:SetBackdrop()
    self:UpdateHeight()
    if self.db.profile.colorByChannel then
      self:RawHook("ChatEdit_UpdateHeader", "SetBorderByChannel", true)
    end
    self:SecureHook("FCF_Tab_OnClick")

    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
  end

  function mod:FCF_Tab_OnClick(frame, button)
    if self.db.profile.attach == "TOP" and GetCVar("chatStyle") ~= "classic" then
      local chatFrame = _G["ChatFrame" .. frame:GetID()];
      ChatEdit_DeactivateChat(chatFrame.editBox)
    end
  end

  function mod:OnDisable()
    for i = 1, NUM_CHAT_WINDOWS do
      local f = _G["ChatFrame" .. i .. "EditBox"]
      _G["ChatFrame" .. i .. "EditBoxLeft"]:Show()
      _G["ChatFrame" .. i .. "EditBoxRight"]:Show()
      _G["ChatFrame" .. i .. "EditBoxMid"]:Show()
      f:SetAltArrowKeyMode(true)
      f:EnableMouse(true)
      f.frame:Hide()
      self:SetAttach("BOTTOM")
    end
  end

  -- changed the Hide to SetAlpha(0), the new ChatSystem OnHide handlers go though some looping
  -- when in IM style and Classic style, cause heavy delays on the chat edit box.
  function mod:ChatEdit_SetLastActiveWindow(frame)
    if frame:IsShown() then
      frame:SetAlpha(0)
    else
      frame:SetAlpha(1)
    end
	frame:EnableMouse(true)
  end

  function mod:ChatEdit_DeactivateChat(frame)
    if frame:IsShown() then
      frame:SetAlpha(0)
      frame:EnableMouse(false)
    end
  end

  function mod:SetBackdrop()
    for _, frame in ipairs(self.frames) do
      frame:SetBackdrop({
        bgFile = Media:Fetch("background", self.db.profile.background),
        edgeFile = Media:Fetch("border", self.db.profile.border),
        tile = true,
        tileSize = self.db.profile.tileSize,
        edgeSize = self.db.profile.edgeSize,
        insets = { left = self.db.profile.inset, right = self.db.profile.inset, top = self.db.profile.inset,
          bottom = self.db.profile.inset }
      })
      local c = self.db.profile.backgroundColor
      frame:SetBackdropColor(c.r, c.g, c.b, c.a)

      local c = self.db.profile.borderColor
      frame:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
    end
  end

  function mod:SetBorderByChannel(...)
    self.hooks.ChatEdit_UpdateHeader(...)
    for index, frame in ipairs(self.frames) do
      local f = _G["ChatFrame" .. index .. "EditBox"]
      local attr = f:GetAttribute("chatType")
      if attr == "CHANNEL" then
        local chan = f:GetAttribute("channelTarget")
        if chan == 0 then
          local c = self.db.profile.borderColor
          frame:SetBackdropBorderColor(c.r, c.g, c.b, c.a)
        else
          local r, g, b = GetMessageTypeColor("CHANNEL" .. chan)
          frame:SetBackdropBorderColor(r, g, b, 1)
        end
      else
        local r, g, b = GetMessageTypeColor(attr)
        frame:SetBackdropBorderColor(r, g, b, 1)
      end
    end
  end

  do
    local function startMoving(self)
      self:StartMoving()
    end

    local function stopMoving(self)
      self:StopMovingOrSizing()
      mod.db.profile.editX = self:GetLeft()
      mod.db.profile.editY = self:GetTop()
      mod.db.profile.editW = self:GetRight() - self:GetLeft()
    end

    local cfHeight
    local function constrainHeight(self)
      self:GetParent():SetHeight(cfHeight)
    end

    local function startDragging(self)
      cfHeight = self:GetParent():GetHeight()
      self:GetParent():StartSizing(not self.left and "TOPRIGHT" or "TOPLEFT")
      self:SetScript("OnUpdate", constrainHeight)
    end

    local function stopDragging(self)
      local parent = self:GetParent()
      parent:StopMovingOrSizing()
      self:SetScript("OnUpdate", nil)
      mod.db.profile.editX = parent:GetLeft()
      mod.db.profile.editY = parent:GetTop()
      mod.db.profile.editW = parent:GetWidth()
    end

    function mod:SetAttach(val, x, y, w)
      for i = 1, NUM_CHAT_WINDOWS do
        local frame = _G["ChatFrame" .. i .. "EditBox"]
        local val = val or self.db.profile.attach
        if not x and val == "FREE" then
          if self.db.profile.editX and self.db.profile.editY then
            x, y, w = self.db.profile.editX, self.db.profile.editY, self.db.profile.editW
          else
            x, y, w = frame:GetLeft(), frame:GetTop(), max(frame:GetWidth(), (frame:GetRight() or 0) - (frame:GetLeft() or 0))
          end
        end
        if not w or w < 10 then w = 100 end
        frame:ClearAllPoints()
        if val ~= "FREE" then
          frame:SetMovable(false)
          frame.lDrag:EnableMouse(false)
          frame.rDrag:EnableMouse(false)
          frame:SetScript("OnMouseDown", nil)
          frame:SetScript("OnMouseUp", nil)
          frame.lDrag:EnableMouse(false)
          frame.rDrag:EnableMouse(false)
          frame.lDrag:SetScript("OnMouseDown", nil)
          frame.rDrag:SetScript("OnMouseDown", nil)
          frame.lDrag:SetScript("OnMouseUp", nil)
          frame.rDrag:SetScript("OnMouseUp", nil)
        end

        if val == "TOP" then
          frame:SetPoint("BOTTOMLEFT", frame.chatFrame, "TOPLEFT", 0, 3)
          frame:SetPoint("BOTTOMRIGHT", frame.chatFrame, "TOPRIGHT", 0, 3)
        elseif val == "BOTTOM" then
          frame:SetPoint("TOPLEFT", frame.chatFrame, "BOTTOMLEFT", 0, -8)
          frame:SetPoint("TOPRIGHT", frame.chatFrame, "BOTTOMRIGHT", 0, -8)
        elseif val == "FREE" then
          frame:EnableMouse(true)
          frame:SetMovable(true)
          frame:SetResizable(true)
          frame:SetScript("OnMouseDown", startMoving)
          frame:SetScript("OnMouseUp", stopMoving)
          frame:SetWidth(w)
          frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
          frame:SetMinResize(40, 1)

          frame.lDrag:EnableMouse(true)
          frame.rDrag:EnableMouse(true)

          frame.lDrag:SetScript("OnMouseDown", startDragging)
          frame.rDrag:SetScript("OnMouseDown", startDragging)

          frame.lDrag:SetScript("OnMouseUp", stopDragging)
          frame.rDrag:SetScript("OnMouseUp", stopDragging)
        elseif val == "LOCK" then
          frame:SetWidth(self.db.profile.editW or w)
          frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.db.profile.editX or x, self.db.profile.editY or y)
        end
      end
    end
  end

  function mod:UpdateHeight()
    for i, frame in ipairs(self.frames) do
      local ff = _G["ChatFrame" .. i .. "EditBox"]
      ff:SetHeight(mod.db.profile.height)
    end
  end

  return
end) -- Prat:AddModuleToLoad
