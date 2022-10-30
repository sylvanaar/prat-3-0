-- This is the editbox module from Chatter by Antiarc

if not Prat.BN_CHAT then return end -- Requires 3.3.5

Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("Editbox")

  if PRAT_MODULE == nil then
    return
  end

  local mod = Prat:NewModule(PRAT_MODULE, "AceHook-3.0")

  local PL = mod.PL


  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
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
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/

  --@non-debug@
do
  local L


L = {
	["Editbox"] = {
		["Attach edit box to..."] = true,
		["Attach to..."] = true,
		["Background color"] = true,
		["Background Inset"] = true,
		["Background texture"] = true,
		["Border color"] = true,
		["Border texture"] = true,
		["Bottom"] = true,
		["Color border by channel"] = true,
		["currently_broken_alt_behavior"] = [=[Arrow key behaviour broken in current WoW client,

Use ALT-UP and ALT-DOWN instead of just UP DOWN to access history]=],
		["Edge Size"] = true,
		["Editbox"] = true,
		["Editbox options."] = true,
		["Font"] = true,
		["Free-floating"] = true,
		["Free-floating, Locked"] = true,
		["Requires the Alt key to be held down to move the cursor in chat"] = true,
		["Select the font to use for the edit box"] = true,
		["Sets the frame's border color to the color of your currently active channel"] = true,
		["Tile Size"] = true,
		["Top"] = true,
		["Use Alt key for cursor movement"] = true,
	}
}


PL:AddLocale(PRAT_MODULE, "enUS",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "Définit la position de la boîte d'édition.",
		["Attach to..."] = "Position",
		["Background color"] = "Couleur du fond",
		["Background Inset"] = "Marge du fond",
		["Background texture"] = "Texture du fond",
		["Border color"] = "Couleur de la bordure",
		["Border texture"] = "Texture de la bordure",
		["Bottom"] = "Bas",
		["Color border by channel"] = "Colorier avec le canal",
		--[[Translation missing --]]
		["currently_broken_alt_behavior"] = [=[Arrow key behaviour broken in current WoW client,

Use ALT-UP and ALT-DOWN instead of just UP DOWN to access history]=],
		["Edge Size"] = "Taille de la bordure",
		["Editbox"] = "Boite d'édition",
		["Editbox options."] = "Options de la boite d'édition.",
		["Font"] = "Police d'écriture",
		["Free-floating"] = "Flottante",
		["Free-floating, Locked"] = "Flottante, verrouillée",
		["Requires the Alt key to be held down to move the cursor in chat"] = "Requiert de maintenir la touche Alt enfoncée pour déplacer le curseur lorsque vous écrivez un message.",
		["Select the font to use for the edit box"] = "Définit la police du texte dans la boîte d'édition.",
		["Sets the frame's border color to the color of your currently active channel"] = "Définit la couleur de la bordure avec la couleur du canal actif.",
		["Tile Size"] = "Taille du fond",
		["Top"] = "Haut",
		["Use Alt key for cursor movement"] = "Curseur avec Alt",
	}
}


PL:AddLocale(PRAT_MODULE, "frFR",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "Hefte Eingabefeld an...",
		["Attach to..."] = "Befestige an ...",
		["Background color"] = "Hintergrundfarbe",
		["Background Inset"] = "Hintergrundeinfügung",
		["Background texture"] = "Hintergrundbeschaffenheit",
		["Border color"] = "Randfarbe",
		["Border texture"] = "Randtextur",
		["Bottom"] = "Unten",
		["Color border by channel"] = "Farbrand nach Kanal",
		["currently_broken_alt_behavior"] = "Das Verhalten der Pfeiltasten im aktuellen WoW-Client ist unterbrochen. Verwende ALT-HOCH und ALT-RUNTER anstelle von nur HOCH RUNTER, um auf den Verlauf zuzugreifen",
		["Edge Size"] = "Kantengröße",
		["Editbox"] = "Eingabefeld",
		["Editbox options."] = "Optionen für das Eingabefeld.",
		["Font"] = "Schriftart",
		["Free-floating"] = "Freischwebend",
		["Free-floating, Locked"] = "Freischwebend, fixiert",
		["Requires the Alt key to be held down to move the cursor in chat"] = "Das Drücken der Alt-Taste wird benötigt, um den Cursor (Zeiger) im Chat zu bewegen.",
		["Select the font to use for the edit box"] = "Schriftart auswählen, die im Eingabefeld verwendet wird.",
		["Sets the frame's border color to the color of your currently active channel"] = "Legt die Randfarbe des Rahmens auf die Farbe des aktuell aktiven Kanals fest",
		["Tile Size"] = "Kachelgröße",
		["Top"] = "Oben",
		["Use Alt key for cursor movement"] = "Benutze Alt-Taste für Cursor-Bewegung",
	}
}


PL:AddLocale(PRAT_MODULE, "deDE",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "입력창 붙이기...",
		["Attach to..."] = "붙이기...",
		["Background color"] = "배경 색상",
		["Background Inset"] = "배경 삽입",
		["Background texture"] = "배경 무늬",
		["Border color"] = "테두리 색상",
		["Border texture"] = "테두리 무늬",
		["Bottom"] = "아래",
		["Color border by channel"] = "채널에 의한 테두리 색상",
		["currently_broken_alt_behavior"] = [=[화살표 키 동작은 현재 WoW 클라이언트에서 작동하지 않습니다.

기록 접근에 위쪽 아래쪽 키 대신 ALT-위와 ALT-아래 키를 사용하세요]=],
		["Edge Size"] = "모서리 크기",
		["Editbox"] = "대화 입력창 [Editbox]",
		["Editbox options."] = "대화 입력창을 설정합니다.",
		["Font"] = "글꼴",
		["Free-floating"] = "자유로운 이동",
		["Free-floating, Locked"] = "자유로운 이동, 잠금",
		["Requires the Alt key to be held down to move the cursor in chat"] = "대화 입력창 커서 이동에 Alt 키를 사용합니다",
		["Select the font to use for the edit box"] = "대화 입력창에 사용할 글꼴 선택",
		["Sets the frame's border color to the color of your currently active channel"] = "대화 입력창 테두리 색상을 현재 채널 색상으로 설정",
		["Tile Size"] = "타일 크기",
		["Top"] = "위",
		["Use Alt key for cursor movement"] = "커서 이동에 Alt 키 사용",
	}
}


PL:AddLocale(PRAT_MODULE, "koKR",L)



L = {
	["Editbox"] = {
		--[[Translation missing --]]
		["Attach edit box to..."] = "Attach edit box to...",
		--[[Translation missing --]]
		["Attach to..."] = "Attach to...",
		--[[Translation missing --]]
		["Background color"] = "Background color",
		--[[Translation missing --]]
		["Background Inset"] = "Background Inset",
		--[[Translation missing --]]
		["Background texture"] = "Background texture",
		--[[Translation missing --]]
		["Border color"] = "Border color",
		--[[Translation missing --]]
		["Border texture"] = "Border texture",
		--[[Translation missing --]]
		["Bottom"] = "Bottom",
		--[[Translation missing --]]
		["Color border by channel"] = "Color border by channel",
		--[[Translation missing --]]
		["currently_broken_alt_behavior"] = [=[Arrow key behaviour broken in current WoW client,

Use ALT-UP and ALT-DOWN instead of just UP DOWN to access history]=],
		--[[Translation missing --]]
		["Edge Size"] = "Edge Size",
		--[[Translation missing --]]
		["Editbox"] = "Editbox",
		--[[Translation missing --]]
		["Editbox options."] = "Editbox options.",
		--[[Translation missing --]]
		["Font"] = "Font",
		--[[Translation missing --]]
		["Free-floating"] = "Free-floating",
		--[[Translation missing --]]
		["Free-floating, Locked"] = "Free-floating, Locked",
		--[[Translation missing --]]
		["Requires the Alt key to be held down to move the cursor in chat"] = "Requires the Alt key to be held down to move the cursor in chat",
		--[[Translation missing --]]
		["Select the font to use for the edit box"] = "Select the font to use for the edit box",
		--[[Translation missing --]]
		["Sets the frame's border color to the color of your currently active channel"] = "Sets the frame's border color to the color of your currently active channel",
		--[[Translation missing --]]
		["Tile Size"] = "Tile Size",
		--[[Translation missing --]]
		["Top"] = "Top",
		--[[Translation missing --]]
		["Use Alt key for cursor movement"] = "Use Alt key for cursor movement",
	}
}


PL:AddLocale(PRAT_MODULE, "esMX",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "Закрепить поле ввода...",
		["Attach to..."] = "Закрепить...",
		["Background color"] = "Цвет фона",
		["Background Inset"] = "Фоновая врезка",
		["Background texture"] = "Текстура фона",
		["Border color"] = "Цвет границ",
		["Border texture"] = "Текстура границы",
		["Bottom"] = "Внизу",
		["Color border by channel"] = "Окраска границы по цвету канала",
		["currently_broken_alt_behavior"] = [=[Поведение стрелок сломано в текущей версии WoW

Используйте ALT-СтрелкаВверх и ALT-СтрелкаВниз вместо просто стрелок вверх и вниз чтобы открыть историю]=],
		["Edge Size"] = "Размер контура",
		["Editbox"] = "Поле ввода",
		["Editbox options."] = "Настройки поля ввода.",
		["Font"] = "Шрифт",
		["Free-floating"] = "Свободно",
		["Free-floating, Locked"] = "Свободно, заблокировано",
		["Requires the Alt key to be held down to move the cursor in chat"] = "Для перемещения курсора в чате требуется нажатая клавиша Alt",
		["Select the font to use for the edit box"] = "Выбор шрифта для области редактирования",
		["Sets the frame's border color to the color of your currently active channel"] = "Установить окраску границы в цвет вашего активного канала",
		["Tile Size"] = "Размер мозаики",
		["Top"] = "Вверху",
		["Use Alt key for cursor movement"] = "Исп. кливишу Alt для перемещения курсора",
	}
}


PL:AddLocale(PRAT_MODULE, "ruRU",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "把输入框附加到……",
		["Attach to..."] = "附加到……",
		["Background color"] = "背景颜色",
		["Background Inset"] = "背景嵌入",
		["Background texture"] = "背景纹理",
		["Border color"] = "边框颜色",
		["Border texture"] = "边框纹理",
		["Bottom"] = "底部",
		["Color border by channel"] = "频道颜色边框",
		["currently_broken_alt_behavior"] = [=[在现在WoW客户端里，方向键的行为已损坏，

使用Alt+上和Alt+下来替代上下键浏览历史]=],
		["Edge Size"] = "边缘尺寸",
		["Editbox"] = "输入框",
		["Editbox options."] = "输入框选项",
		["Font"] = "字体",
		["Free-floating"] = "自由浮动",
		["Free-floating, Locked"] = "自由浮动，锁定",
		["Requires the Alt key to be held down to move the cursor in chat"] = "需要在聊天中按住Alt键移动光标",
		["Select the font to use for the edit box"] = "选择输入框的字体",
		["Sets the frame's border color to the color of your currently active channel"] = "设置边框颜色到你当前激活的频道颜色",
		["Tile Size"] = "平铺尺寸",
		["Top"] = "顶部",
		["Use Alt key for cursor movement"] = "使用Alt键令光标移动",
	}
}


PL:AddLocale(PRAT_MODULE, "zhCN",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "Anclar la caja de edición a...",
		["Attach to..."] = "Anclar a...",
		["Background color"] = "Color de fondo",
		--[[Translation missing --]]
		["Background Inset"] = "Background Inset",
		["Background texture"] = "Textura de fondo",
		["Border color"] = "Color del borde",
		["Border texture"] = "Textura del borde",
		["Bottom"] = "Abajo",
		["Color border by channel"] = "Color del borde por canal",
		--[[Translation missing --]]
		["currently_broken_alt_behavior"] = [=[Arrow key behaviour broken in current WoW client,

Use ALT-UP and ALT-DOWN instead of just UP DOWN to access history]=],
		["Edge Size"] = "Tamaño del borde",
		["Editbox"] = "Caja de edición",
		["Editbox options."] = "Opciones de la caja de edición.",
		["Font"] = "Fuente",
		["Free-floating"] = "Flotar-libre",
		["Free-floating, Locked"] = "Flotar-libre, Bloqueado",
		["Requires the Alt key to be held down to move the cursor in chat"] = "Requiere la tecla Alt presionada para mover el cursor en el chat",
		["Select the font to use for the edit box"] = "Seleccione la fuente a usar para la caja de edición",
		["Sets the frame's border color to the color of your currently active channel"] = "Establece el color del borde del marco con el color de su canal actualmente activo",
		["Tile Size"] = "Tamaño de mosaico",
		["Top"] = "Arriba",
		["Use Alt key for cursor movement"] = "Usar la tecla Alt para el desplazamiento del cursor",
	}
}


PL:AddLocale(PRAT_MODULE, "esES",L)



L = {
	["Editbox"] = {
		["Attach edit box to..."] = "附上編輯框...",
		["Attach to..."] = "附上...",
		["Background color"] = "背景色彩",
		["Background Inset"] = "背景插入",
		["Background texture"] = "背景材質",
		["Border color"] = "邊緣色彩",
		["Border texture"] = "邊緣材質",
		["Bottom"] = "底部",
		["Color border by channel"] = "顏色邊框由道頻",
		--[[Translation missing --]]
		["currently_broken_alt_behavior"] = [=[Arrow key behaviour broken in current WoW client,

Use ALT-UP and ALT-DOWN instead of just UP DOWN to access history]=],
		["Edge Size"] = "邊框尺寸",
		["Editbox"] = "輸入框",
		["Editbox options."] = "輸入框選單",
		["Font"] = "字型",
		["Free-floating"] = "自由浮動",
		["Free-floating, Locked"] = "自由浮動, 已鎖定",
		--[[Translation missing --]]
		["Requires the Alt key to be held down to move the cursor in chat"] = "Requires the Alt key to be held down to move the cursor in chat",
		["Select the font to use for the edit box"] = "選擇字型使用編輯框",
		--[[Translation missing --]]
		["Sets the frame's border color to the color of your currently active channel"] = "Sets the frame's border color to the color of your currently active channel",
		["Tile Size"] = "並排尺寸",
		["Top"] = "頂部",
		["Use Alt key for cursor movement"] = "使用 Alt 鍵游標移動",
	}
}


PL:AddLocale(PRAT_MODULE, "zhTW",L)


end
--@end-non-debug@




  local mustUseAlt = true -- select(4, _G.GetBuildInfo()) >= 50400

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
    for i = 1, #CHAT_FRAMES do
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
          for i = 1, #CHAT_FRAMES do
            local ff = _G["ChatFrame" .. i .. "EditBox"]
            local header = _G[ff:GetName() .. "Header"]
            local _, s, m = ff:GetFont()
            local font = Media:Fetch("font", v)
            ff:SetFont(font, s, m)
            header:SetFont(font, s, m)
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
        for i = 1, #CHAT_FRAMES do
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

  local function MakePratEditbox(self, i)
    if not self.frames[i] then
      local parent = _G["ChatFrame" .. i .. "EditBox"]

      local frame = CreateFrame("Frame", nil, parent, BackdropTemplateMixin and "BackdropTemplate")
      frame:SetFrameStrata("DIALOG")
      frame:SetFrameLevel(parent:GetFrameLevel() - 1)
      frame:SetAllPoints(parent)
      frame:Hide()
      parent.pratFrame = frame
      self.frames[i] = frame

      parent.lDrag = CreateFrame("Frame", nil, parent)
      parent.lDrag:SetWidth(15)
      parent.lDrag:SetPoint("TOPLEFT", parent, "TOPLEFT")
      parent.lDrag:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT")
      parent.lDrag.left = true

      parent.rDrag = CreateFrame("Frame", nil, parent)
      parent.rDrag:SetWidth(15)
      parent.rDrag:SetPoint("TOPRIGHT", parent, "TOPRIGHT")
      parent.rDrag:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT")
    end
  end

  Prat:SetModuleInit(mod,
    function(self)

      Media.RegisterCallback(mod, "LibSharedMedia_Registered")
      self.frames = {}

      self:LibSharedMedia_Registered()

      for i = 1, #CHAT_FRAMES do
        MakePratEditbox(self, i)
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
    if f.focusLeft then f.focusLeft:SetAlpha(0) end
    if f.focusRight then f.focusRight:SetAlpha(0) end
    if f.focusMid then f.focusMid:SetAlpha(0) end
    f:Hide()

    MakePratEditbox(self, i)
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
    self:SetAttach(nil, self.db.profile.editX, self.db.profile.editY, self.db.profile.editW)
  end

  function mod:OnModuleEnable()
    self:LibSharedMedia_Registered()

    for i = 1, #CHAT_FRAMES do
      local f = _G["ChatFrame" .. i .. "EditBox"]
      _G["ChatFrame" .. i .. "EditBoxLeft"]:Hide()
      _G["ChatFrame" .. i .. "EditBoxRight"]:Hide()
      _G["ChatFrame" .. i .. "EditBoxMid"]:Hide()
      if f.focusLeft then f.focusLeft:SetAlpha(0) end
      if f.focusRight then f.focusRight:SetAlpha(0) end
      if f.focusMid then f.focusMid:SetAlpha(0) end
      f:Hide()

      -- Prevent an error in FloatingChatFrame FCF_FadeOutChatFrame() (blizz bug)
      f:SetAlpha(f:GetAlpha() or 0)

      MakePratEditbox(self, i) -- For new temporary chat frames created between init and now
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
    self:SecureHook("ChatFrame_OpenChat")

    self:SetBackdrop()
    self:UpdateHeight()
    if self.db.profile.colorByChannel then
      self:RawHook("ChatEdit_UpdateHeader", "SetBorderByChannel", true)
    end
    self:SecureHook("FCF_Tab_OnClick")

    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
  end



  function mod:ChatFrame_OpenChat(text, chatFrame)
    if not self.db.profile.useAltKey then
      local frame = ChatEdit_ChooseBoxForSend(chatFrame)

      frame.history_index = 0
    end
  end

  function mod:FCF_Tab_OnClick(frame, button)
    if self.db.profile.attach == "TOP" and GetCVar("chatStyle") ~= "classic" then
      local chatFrame = _G["ChatFrame" .. frame:GetID()];
      --ChatEdit_DeactivateChat(chatFrame.editBox) -- replace with service function to avoid tainting ACTIVE_CHAT_EDIT_BOX
      Prat.ChatEdit_SetDeactivated(chatFrame.editBox)
    end
  end

  function mod:OnModuleDisable()
    self:SetAttach("BOTTOM") -- clear move/resize handlers
    for i = 1, #CHAT_FRAMES do
      local f = _G["ChatFrame" .. i .. "EditBox"]
      _G["ChatFrame" .. i .. "EditBoxLeft"]:Show()
      _G["ChatFrame" .. i .. "EditBoxRight"]:Show()
      _G["ChatFrame" .. i .. "EditBoxMid"]:Show()
      if f.focusLeft then f.focusLeft:SetAlpha(1) end
      if f.focusRight then f.focusRight:SetAlpha(1) end
      if f.focusMid then f.focusMid:SetAlpha(1) end
      f:SetAltArrowKeyMode(true)
      f:EnableMouse(true)
      f.pratFrame:Hide()
      -- restore Blizz size/position
      f:ClearAllPoints()
      f:SetHeight(32)
      f:SetPoint("TOPLEFT", f.chatFrame, "BOTTOMLEFT", -5, -2)
      if Prat.IsClassic then
        f:SetPoint("TOPRIGHT", f.chatFrame, "BOTTOMRIGHT", 5, -2)
      else
        f:SetPoint("RIGHT", f.chatFrame.ScrollBar, "RIGHT", 5, 0)
      end
    end
  end

  function mod:GetDescription()
    return PL["Editbox options."]
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
        insets = {
          left = self.db.profile.inset,
          right = self.db.profile.inset,
          top = self.db.profile.inset,
          bottom = self.db.profile.inset
        }
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
        elseif chan and ChatTypeInfo["CHANNEL" .. chan] then
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
      for i = 1, #CHAT_FRAMES do
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

        local scrollbarWidth = frame.chatFrame.ScrollBar and frame.chatFrame.ScrollBar:GetWidth() or 0
        if val == "TOP" then
          frame:SetPoint("BOTTOMLEFT", frame.chatFrame, "TOPLEFT", 0, 3)
          frame:SetPoint("BOTTOMRIGHT", frame.chatFrame, "TOPRIGHT", scrollbarWidth, 3)
        elseif val == "BOTTOM" then
          frame:SetPoint("TOPLEFT", frame.chatFrame, "BOTTOMLEFT", 0, -8)
          frame:SetPoint("TOPRIGHT", frame.chatFrame, "BOTTOMRIGHT", scrollbarWidth, -8)
        elseif val == "FREE" then
          frame:EnableMouse(true)
          frame:SetMovable(true)
          frame:SetResizable(true)
          frame:SetScript("OnMouseDown", startMoving)
          frame:SetScript("OnMouseUp", stopMoving)
          frame:SetWidth(w)
          frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
          local minWidth, minHeight = 40, 1
          if frame.SetResizeBounds then
            frame:SetResizeBounds(minWidth, minHeight)
          else
            frame:SetMinResize(minWidth, minHeight)
          end

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
