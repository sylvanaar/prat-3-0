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





Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("Scroll")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceTimer-3.0")

  local PL = module.PL

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["Scroll"] = true,
    ["Chat window scrolling options."] = true,
    ["mousewheel_name"] = "Enable MouseWheel",
    ["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
    ["Set MouseWheel Speed"] = true,
    ["Set number of lines mousewheel will scroll."] = true,
    modified_speed = "Set Shift+MouseWheel Speed",
    modified_speed_desc = "Set number of lines mousewheel will scroll when shift is pressed.",
    ["lowdown_name"] = "Enable TheLowDown",
    ["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
    ["Set TheLowDown Delay"] = true,
    ["Set time to wait before jumping to the bottom of chat windows."] = true,
    ["Text scroll direction"] = true,
    ["Control whether text is added to the frame at the top or the bottom."] = true,
    ["Top"] = "Top to bottom",
    ["Bottom"] = "Bottom to top",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L


L = {
	["Scroll"] = {
		["Bottom"] = "Bottom to top",
		["Chat window scrolling options."] = true,
		["Control whether text is added to the frame at the top or the bottom."] = true,
		["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
		["lowdown_name"] = "Enable TheLowDown",
		["modified_speed"] = "Set Shift+MouseWheel Speed",
		["modified_speed_desc"] = "Set number of lines mousewheel will scroll when shift is pressed.",
		["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
		["mousewheel_name"] = "Enable MouseWheel",
		["Scroll"] = true,
		["Set Ctrl+MouseWheel Speed"] = true,
		["Set MouseWheel Speed"] = true,
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = true,
		["Set number of lines mousewheel will scroll."] = true,
		["Set TheLowDown Delay"] = true,
		["Set time to wait before jumping to the bottom of chat windows."] = true,
		["Text scroll direction"] = true,
		["Top"] = "Top to bottom",
	}
}

PL:AddLocale(PRAT_MODULE, "enUS", L)



L = {
	["Scroll"] = {
		--[[Translation missing --]]
		["Bottom"] = "Bottom to top",
		--[[Translation missing --]]
		["Chat window scrolling options."] = "Chat window scrolling options.",
		--[[Translation missing --]]
		["Control whether text is added to the frame at the top or the bottom."] = "Control whether text is added to the frame at the top or the bottom.",
		--[[Translation missing --]]
		["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
		--[[Translation missing --]]
		["lowdown_name"] = "Enable TheLowDown",
		--[[Translation missing --]]
		["modified_speed"] = "Set Shift+MouseWheel Speed",
		--[[Translation missing --]]
		["modified_speed_desc"] = "Set number of lines mousewheel will scroll when shift is pressed.",
		--[[Translation missing --]]
		["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
		--[[Translation missing --]]
		["mousewheel_name"] = "Enable MouseWheel",
		--[[Translation missing --]]
		["Scroll"] = "Scroll",
		--[[Translation missing --]]
		["Set Ctrl+MouseWheel Speed"] = "Set Ctrl+MouseWheel Speed",
		--[[Translation missing --]]
		["Set MouseWheel Speed"] = "Set MouseWheel Speed",
		--[[Translation missing --]]
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Set number of lines mousewheel will scroll when ctrl is pressed.",
		--[[Translation missing --]]
		["Set number of lines mousewheel will scroll."] = "Set number of lines mousewheel will scroll.",
		--[[Translation missing --]]
		["Set TheLowDown Delay"] = "Set TheLowDown Delay",
		--[[Translation missing --]]
		["Set time to wait before jumping to the bottom of chat windows."] = "Set time to wait before jumping to the bottom of chat windows.",
		--[[Translation missing --]]
		["Text scroll direction"] = "Text scroll direction",
		--[[Translation missing --]]
		["Top"] = "Top to bottom",
	}
}

PL:AddLocale(PRAT_MODULE, "itIT", L)



L = {
	["Scroll"] = {
		--[[Translation missing --]]
		["Bottom"] = "Bottom to top",
		--[[Translation missing --]]
		["Chat window scrolling options."] = "Chat window scrolling options.",
		--[[Translation missing --]]
		["Control whether text is added to the frame at the top or the bottom."] = "Control whether text is added to the frame at the top or the bottom.",
		--[[Translation missing --]]
		["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
		--[[Translation missing --]]
		["lowdown_name"] = "Enable TheLowDown",
		--[[Translation missing --]]
		["modified_speed"] = "Set Shift+MouseWheel Speed",
		--[[Translation missing --]]
		["modified_speed_desc"] = "Set number of lines mousewheel will scroll when shift is pressed.",
		--[[Translation missing --]]
		["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
		--[[Translation missing --]]
		["mousewheel_name"] = "Enable MouseWheel",
		--[[Translation missing --]]
		["Scroll"] = "Scroll",
		--[[Translation missing --]]
		["Set Ctrl+MouseWheel Speed"] = "Set Ctrl+MouseWheel Speed",
		--[[Translation missing --]]
		["Set MouseWheel Speed"] = "Set MouseWheel Speed",
		--[[Translation missing --]]
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Set number of lines mousewheel will scroll when ctrl is pressed.",
		--[[Translation missing --]]
		["Set number of lines mousewheel will scroll."] = "Set number of lines mousewheel will scroll.",
		--[[Translation missing --]]
		["Set TheLowDown Delay"] = "Set TheLowDown Delay",
		--[[Translation missing --]]
		["Set time to wait before jumping to the bottom of chat windows."] = "Set time to wait before jumping to the bottom of chat windows.",
		--[[Translation missing --]]
		["Text scroll direction"] = "Text scroll direction",
		--[[Translation missing --]]
		["Top"] = "Top to bottom",
	}
}

PL:AddLocale(PRAT_MODULE, "ptBR", L)


L = {
	["Scroll"] = {
		["Bottom"] = "Bas vers le haut",
		["Chat window scrolling options."] = "Options de défilement.",
		["Control whether text is added to the frame at the top or the bottom."] = "Définit si le texte est ajouté en bas ou en haut de la fenêtre.",
		--[[Translation missing --]]
		["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
		--[[Translation missing --]]
		["lowdown_name"] = "Enable TheLowDown",
		--[[Translation missing --]]
		["modified_speed"] = "Set Shift+MouseWheel Speed",
		--[[Translation missing --]]
		["modified_speed_desc"] = "Set number of lines mousewheel will scroll when shift is pressed.",
		["mousewheel_desc"] = "Active/Désactive le support de la molette pour chaque fenêtre.",
		["mousewheel_name"] = "Activer la molette",
		["Scroll"] = "Défilement",
		["Set Ctrl+MouseWheel Speed"] = "Vitesse Ctrl+Molette",
		["Set MouseWheel Speed"] = "Vitesse Molette",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Définit le nombre de lignes qui défilent lorsque Ctrl est enfoncé.",
		["Set number of lines mousewheel will scroll."] = "Définit le nombre de lignes qui défilent lors d'un coup de molette avec la souris.",
		--[[Translation missing --]]
		["Set TheLowDown Delay"] = "Set TheLowDown Delay",
		["Set time to wait before jumping to the bottom of chat windows."] = "Régler le temps d'attente avant de sauter au bas de la fenêtre de chat.",
		["Text scroll direction"] = "Direction du texte",
		["Top"] = "Haut en bas",
	}
}

PL:AddLocale(PRAT_MODULE, "frFR",L)




L = {
	["Scroll"] = {
		["Bottom"] = "Von unten nach oben",
		["Chat window scrolling options."] = "Optionen zum Scrollen in Chatfenstern.",
		["Control whether text is added to the frame at the top or the bottom."] = "Steuerung, ob der Text oben oder unten im Chatfenster hinzugefügt wird.",
		["lowdown_desc"] = "Automatisches Springen zum unteren Ende eines Chatfensters ein-/ausschalten.",
		["lowdown_name"] = "TheLowDown aktivieren",
		["modified_speed"] = "SHIFT + Mausrad-Geschwindigkeit einstellen",
		["modified_speed_desc"] = "Anzahl der Zeilen, die bei Betätigung des Mausrads gescrollt werden, während die SHIFT-Taste gedrückt wird.",
		["mousewheel_desc"] = "Mausradunterstützung für jedes Chatfenster ein-/ausschalten.",
		["mousewheel_name"] = "Mausrad aktivieren",
		["Scroll"] = "Scrollen",
		["Set Ctrl+MouseWheel Speed"] = "Geschwindigkeit für <Strg>-Mausrad einstellen",
		["Set MouseWheel Speed"] = "Geschwindigkeit des Mausrads einstellen",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Die Anzahl der Zeilen festlegen, mit denen das Mausrad einen Textlauf durchführt, während die Strg-Taste gedrückt wird.",
		["Set number of lines mousewheel will scroll."] = "Stellt die Anzahl der Zeilen ein, mit denen das Mausrad einen Textlauf durchführt.",
		["Set TheLowDown Delay"] = "TheLowDown-Verzögerung einstellen",
		["Set time to wait before jumping to the bottom of chat windows."] = "Wartezeit einstellen, ehe zum Ende von Chatfenstern gesprungen wird.",
		["Text scroll direction"] = "Textlaufrichtung",
		["Top"] = "Von oben nach unten",
	}
}

PL:AddLocale(PRAT_MODULE, "deDE", L)


L = {
	["Scroll"] = {
		["Bottom"] = "밑에서 위로",
		["Chat window scrolling options."] = "대화 창 스크롤 옵션입니다.",
		["Control whether text is added to the frame at the top or the bottom."] = "문자가 창의 상단 또는 하단부터 추가될 지 설정합니다.",
		["lowdown_desc"] = "각 대화창 별로 자동 최하단 이동을 끄거나 켭니다.",
		["lowdown_name"] = "최하단 이동 사용",
		["modified_speed"] = "Shift+마우스휠 속도 설정",
		["modified_speed_desc"] = "Shift를 눌렀을 때 마우스 휠로 스크롤할 줄의 숫자를 설정합니다.",
		["mousewheel_desc"] = "각 대화창 별로 마우스 휠 지원을 끄거나 켭니다.",
		["mousewheel_name"] = "마우스 휠 사용",
		["Scroll"] = "스크롤 [Scroll]",
		["Set Ctrl+MouseWheel Speed"] = "Ctrl+마우스 휠 속도 설정",
		["Set MouseWheel Speed"] = "마우스 휠 속도 설정",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Ctrl 키를 누르고 마우스 휠을 사용할 때 스크롤할 줄의 수를 설정합니다.",
		["Set number of lines mousewheel will scroll."] = "마우스 휠로 스크롤할 줄의 수를 설정합니다.",
		["Set TheLowDown Delay"] = "최하단 이동 지연 시간 설정",
		["Set time to wait before jumping to the bottom of chat windows."] = "대화창을 하단으로 내리기까지 대기 시간을 설정합니다.",
		["Text scroll direction"] = "문자 스크롤 방향",
		["Top"] = "위에서 아래로",
	}
}

PL:AddLocale(PRAT_MODULE, "koKR",L)

L = {
	["Scroll"] = {
		--[[Translation missing --]]
		["Bottom"] = "Bottom to top",
		--[[Translation missing --]]
		["Chat window scrolling options."] = "Chat window scrolling options.",
		--[[Translation missing --]]
		["Control whether text is added to the frame at the top or the bottom."] = "Control whether text is added to the frame at the top or the bottom.",
		--[[Translation missing --]]
		["lowdown_desc"] = "Toggle auto jumping to the bottom for each chat window.",
		--[[Translation missing --]]
		["lowdown_name"] = "Enable TheLowDown",
		--[[Translation missing --]]
		["modified_speed"] = "Set Shift+MouseWheel Speed",
		--[[Translation missing --]]
		["modified_speed_desc"] = "Set number of lines mousewheel will scroll when shift is pressed.",
		--[[Translation missing --]]
		["mousewheel_desc"] = "Toggle mousewheel support for each chat window.",
		--[[Translation missing --]]
		["mousewheel_name"] = "Enable MouseWheel",
		--[[Translation missing --]]
		["Scroll"] = "Scroll",
		--[[Translation missing --]]
		["Set Ctrl+MouseWheel Speed"] = "Set Ctrl+MouseWheel Speed",
		--[[Translation missing --]]
		["Set MouseWheel Speed"] = "Set MouseWheel Speed",
		--[[Translation missing --]]
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Set number of lines mousewheel will scroll when ctrl is pressed.",
		--[[Translation missing --]]
		["Set number of lines mousewheel will scroll."] = "Set number of lines mousewheel will scroll.",
		--[[Translation missing --]]
		["Set TheLowDown Delay"] = "Set TheLowDown Delay",
		--[[Translation missing --]]
		["Set time to wait before jumping to the bottom of chat windows."] = "Set time to wait before jumping to the bottom of chat windows.",
		--[[Translation missing --]]
		["Text scroll direction"] = "Text scroll direction",
		--[[Translation missing --]]
		["Top"] = "Top to bottom",
	}
}

PL:AddLocale(PRAT_MODULE, "esMX",L)

L = {
	["Scroll"] = {
		["Bottom"] = "Снизу вверх",
		["Chat window scrolling options."] = "Настройки прокрутки окна чата.",
		["Control whether text is added to the frame at the top or the bottom."] = "Регулировка текста добавленного в окно в вверх или низ.",
		["lowdown_desc"] = "Вкл/Выкл авто прокрутку в низ для во всех окнах чата.",
		["lowdown_name"] = "Включить спад в низ",
		["modified_speed"] = "Установка скорости прокрутки колеса мышки+Shift",
		["modified_speed_desc"] = "Установите количество прокручиваемых строк с помощью колеса мыши+shift.",
		["mousewheel_desc"] = "Вкл/Выкл поддержку колесика мыши во всех оконах чата.",
		["mousewheel_name"] = "Включить КолесоМыши",
		["Scroll"] = "Прокрутка",
		["Set Ctrl+MouseWheel Speed"] = "Задать скорость Ctrl+КолесоМыши",
		["Set MouseWheel Speed"] = "Скорость КолесаМыши",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Установите число строк прокручиваемых колёсиком мыши при удерживании ctrl.",
		["Set number of lines mousewheel will scroll."] = "Устанавите число строк прокручиваемых колёсиком мыши за раз.",
		["Set TheLowDown Delay"] = "Задержка спада в низ",
		["Set time to wait before jumping to the bottom of chat windows."] = "Установите время ожидания перед прокруткой в низ окна чата.",
		["Text scroll direction"] = "Направление текста прокрутки",
		["Top"] = "С верху вниз",
	}
}

PL:AddLocale(PRAT_MODULE, "ruRU",L)

L = {
	["Scroll"] = {
		["Bottom"] = "从下到上",
		["Chat window scrolling options."] = "聊天窗口滚动选项",
		["Control whether text is added to the frame at the top or the bottom."] = "控制文本被添加到框体顶端还是底端",
		["lowdown_desc"] = "为每个聊天窗口自动跳至底端",
		["lowdown_name"] = "启用回到底端",
		["modified_speed"] = "设置 Shift+鼠标滚轮 速度",
		["modified_speed_desc"] = "设定按住Shift键时鼠标滚轮滚动的行数",
		["mousewheel_desc"] = "为每个聊天窗口选取鼠标滚轮支持",
		["mousewheel_name"] = "启用鼠标滚轮",
		["Scroll"] = "滚动",
		["Set Ctrl+MouseWheel Speed"] = "设置Ctrl+鼠标滚轮速度",
		["Set MouseWheel Speed"] = "设置鼠标滚轮速度",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "设置按下ctrl时鼠标滚轮滚动行数",
		["Set number of lines mousewheel will scroll."] = "设置鼠标滚轮滚动行数",
		["Set TheLowDown Delay"] = "设置回到底端延迟",
		["Set time to wait before jumping to the bottom of chat windows."] = "设置聊天窗口跳至底部前等待时间",
		["Text scroll direction"] = "文本滚动方向",
		["Top"] = "从上到下",
	}
}

PL:AddLocale(PRAT_MODULE, "zhCN",L)

L = {
	["Scroll"] = {
		["Bottom"] = "De Abajo a Arriba",
		["Chat window scrolling options."] = "Opciones de desplazamiento de la ventana de chat.",
		["Control whether text is added to the frame at the top or the bottom."] = "Controla si el texto se añade al marco en la parte superior o inferior.",
		["lowdown_desc"] = "Alternar saltar automáticamente a la parte inferior de cada ventana de chat.",
		["lowdown_name"] = "Activar TheLowDown",
		["modified_speed"] = [=[Establecer la velocidad de Shift+Rueda del Ratón
]=],
		["modified_speed_desc"] = "Establece el número de líneas que la rueda del ratón desplazará cuando shift está pulsado.",
		["mousewheel_desc"] = "Alterna soporte para rueda de ratón para cada ventana de chat.",
		["mousewheel_name"] = "Activar Rueda del Ratón",
		["Scroll"] = "Desplazamiento",
		["Set Ctrl+MouseWheel Speed"] = "Establecer Velocidad Ctrl+Rueda Ratón",
		["Set MouseWheel Speed"] = "Establecer Velocidad de la Rueda del Ratón",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "Establece el número de líneas que la rueda del ratón desplazará cuando ctrl está pulsada.",
		["Set number of lines mousewheel will scroll."] = "Establece el número de lineas que la rueda del ratón desplazará.",
		["Set TheLowDown Delay"] = "Establecer Retraso TheLowDown",
		["Set time to wait before jumping to the bottom of chat windows."] = "Estable el tiempo de espera antes de saltar a la parte inferior de las ventanas de chat.",
		["Text scroll direction"] = "Dirección de desplazamiento del texto",
		["Top"] = "De arriba a abajo",
	}
}

PL:AddLocale(PRAT_MODULE, "esES",L)

L = {
	["Scroll"] = {
		["Bottom"] = "由下而上",
		["Chat window scrolling options."] = "聊天視窗滾動選項",
		--[[Translation missing --]]
		["Control whether text is added to the frame at the top or the bottom."] = "Control whether text is added to the frame at the top or the bottom.",
		["lowdown_desc"] = "切換是否於個別聊天視窗自動跳轉至最新訊息",
		["lowdown_name"] = "啟用 TheLowDown",
		["modified_speed"] = "設定 Shift+滑鼠滾輪速度",
		--[[Translation missing --]]
		["modified_speed_desc"] = "Set number of lines mousewheel will scroll when shift is pressed.",
		["mousewheel_desc"] = "切換是否於個別聊天視窗支援滑鼠滾輪",
		["mousewheel_name"] = "啟用滑鼠滾輪",
		["Scroll"] = "滾動",
		["Set Ctrl+MouseWheel Speed"] = "設定 Ctrl 及滑鼠滾輪速度",
		["Set MouseWheel Speed"] = "設定滑鼠滾輪速度",
		["Set number of lines mousewheel will scroll when ctrl is pressed."] = "設定當按下 Ctrl時滑鼠滾輪滾動的行數",
		["Set number of lines mousewheel will scroll."] = "設定滑鼠滾輪將滾動行數數字",
		["Set TheLowDown Delay"] = "設定上下延遲",
		--[[Translation missing --]]
		["Set time to wait before jumping to the bottom of chat windows."] = "Set time to wait before jumping to the bottom of chat windows.",
		["Text scroll direction"] = "文字滾動方向",
		["Top"] = "由上而下",
	}
}

PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@




  --- -[[
  -- Chinese Local : CWDG Translation Team 昏睡墨鱼 (Thomas Mo)
  -- CWDG site: http://Cwowaddon.com
  -- $Rev: 82149 $
  -- ]]
  --

  --

  --

  --

  --

  --





  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      mousewheel = { ["*"] = true },
      normscrollspeed = 1,
      ctrlscrollspeed = 3,
      lowdown = { ["*"] = true },
      lowdowndelay = 20,
      scrolldirection = "BOTTOM"
    }
  })


  --- - build the options menu using prat templates
  -- module.toggleOptions = {
  -- mousewheel_handler = {},
  -- sep135_sep = 135,
  -- lowdown_handler = {}
  -- }


  Prat:SetModuleOptions(module.name, {
    name = PL["Scroll"],
    desc = PL["Chat window scrolling options."],
    type = "group",
    args = {
      mousewheel = {
        name = PL["mousewheel_name"],
        desc = PL["mousewheel_desc"],
        type = "multiselect",
        order = 110,
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      },
      normscrollspeed = {
        name = PL["Set MouseWheel Speed"],
        desc = PL["Set number of lines mousewheel will scroll."],
        type = "range",
        order = 120,
        min = 1,
        max = 21,
        step = 1,
      },
      scrolldirection = {
        type = "select",
        name = PL["Text scroll direction"],
        desc = PL["Control whether text is added to the frame at the top or the bottom."],
        values = { ["TOP"] = PL["Top"], ["BOTTOM"] = PL["Bottom"] },
        hidden = true, -- Blizz Bug DISABLED 10172010
      },
      ctrlscrollspeed = {
        name = PL.modified_speed,
        desc = PL.modified_speed_desc,
        type = "range",
        order = 130,
        min = 3,
        max = 21,
        step = 3,
      },
      lowdown = {
        name = PL["lowdown_name"],
        desc = PL["lowdown_desc"],
        type = "multiselect",
        order = 110,
        values = Prat.HookedFrameList,
        get = "GetSubValue",
        set = "SetSubValue"
      },
      lowdowndelay = {
        name = PL["Set TheLowDown Delay"],
        desc = PL["Set time to wait before jumping to the bottom of chat windows."],
        type = "range",
        order = 220,
        min = 1,
        max = 60,
        step = 1,
      },
    }
  })

  module.OnSubValueChanged = module.ConfigureAllFrames


  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    self:ConfigureAllFrames()
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
  end

  -- things to do when the module is disabled
  function module:OnModuleDisable()
    for k, v in pairs(Prat.Frames) do
      self:MouseWheel(v, false)
      if not IsCombatLog(v) then
        self:LowDown(v, false)
      end
    end

    self:SetScrollDirection("BOTTOM")
  end

  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --
  function module:Prat_FramesUpdated()
    self:ConfigureAllFrames()
  end

  function module:GetDescription()
    return PL["Chat window scrolling options."]
  end

  function module:ConfigureAllFrames()
    for k, v in pairs(Prat.Frames) do
      self:MouseWheel(v, self.db.profile.mousewheel[k])
      if not IsCombatLog(v) then
        self:LowDown(v, self.db.profile.lowdown[k])
      end
    end

    self:SetScrollDirection(self.db.profile.scrolldirection)
  end

  do
    local function scrollFrame(cf, up)
      if IsControlKeyDown() then
        if up then cf:ScrollToTop() else cf:ScrollToBottom() end
      else
        if IsShiftKeyDown() then
          for i = 1, module.db.profile.ctrlscrollspeed do
            if up then cf:ScrollUp() else cf:ScrollDown() end
          end
        else
          for i = 1, module.db.profile.normscrollspeed do
            if up then cf:ScrollUp() else cf:ScrollDown() end
          end
        end
      end
    end

    function module:MouseWheel(cf, enabled)
      if enabled then
        cf:SetScript("OnMouseWheel", function(cf, arg1) scrollFrame(cf, arg1 > 0) end)
        cf:EnableMouseWheel(true)
      else
        cf:SetScript("OnMouseWheel", nil)
        cf:EnableMouseWheel(false)
      end
    end
  end

  local timers = {}
  local function lowDownHandler(cf)
    if timers[cf] then
      module:CancelTimer(timers[cf])
    end

    timers[cf] = module:ScheduleTimer("BringTheLowDown", module.db.profile.lowdowndelay, cf)
  end

  function module:LowDown(cf, enabled)
    local funcs = { "ScrollUp", "ScrollDown", "ScrollToTop", "PageUp", "PageDown" }

    if enabled then
      for _, func in ipairs(funcs) do
        if not self:IsHooked(cf, func) then
          self:SecureHook(cf, func, lowDownHandler)
        end
      end
    else
      for _, func in ipairs(funcs) do
        if self:IsHooked(cf, func) then self:Unhook(cf, func) end
      end
    end
  end

  function module:BringTheLowDown(frame)
    timers[frame] = nil

    self:ResetFrame(frame)
  end

  function module:ResetFrame(cf)
    if not cf:AtBottom() then
      cf:ScrollToBottom()
    end
  end

  function module:SetScrollDirection(direction)
    -- Blizz bug DISABLED 10172010

    --    for k, v in pairs(Prat.HookedFrames) do
    --		self:ScrollDirection(v, direction)
    --    end

    self.db.profile.scrolldirection = direction
  end

  function module:ScrollDirection(cf, direction)
    if cf:GetInsertMode() ~= direction then
      cf:SetMaxLines(cf:GetMaxLines())
      cf:SetInsertMode(direction)
    end
  end



  return
end) -- Prat:AddModuleToLoad