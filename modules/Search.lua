Prat:AddModuleToLoad(function()
  local PRAT_MODULE = Prat:RequestModuleName("Search")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE)

  local PL = module.PL

  local dbg = function() end
  --[==[@debug@
  dbg = function(...) Prat:PrintLiteral(...) end
  --@end-debug@]==]

  --[==[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    module_name = "Search",
    module_desc = "Adds the ability to search the chatframes.",
    module_info = "This module adds search boxes on the chat frames, and the /find commands to search the chat history\n\nUsage:\n\n /find <text>",
    err_tooshort = "Search term is too short",
    err_notfound = "Not Found",
    find_results = "Find Results:",
    bnet_removed = "<BNET REMOVED>",
  })
  --@end-debug@]==]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --@non-debug@
 do
     local L


L = {
	["Search"] = {
		["bnet_removed"] = "<BNET REMOVED>",
		["err_notfound"] = "Not Found",
		["err_tooshort"] = "Search term is too short",
		["find_results"] = "Find Results:",
		["module_desc"] = "Adds the ability to search the chatframes.",
		["module_info"] = [=[This module adds search boxes on the chat frames, and the /find commands to search the chat history

Usage:

 /find <text>]=],
		["module_name"] = "Search",
	}
}


   PL:AddLocale(PRAT_MODULE, "enUS",L)


L = {
	["Search"] = {
		--[[Translation missing --]]
		["bnet_removed"] = "<BNET REMOVED>",
		--[[Translation missing --]]
		["err_notfound"] = "Not Found",
		--[[Translation missing --]]
		["err_tooshort"] = "Search term is too short",
		["find_results"] = "Résultats trouvés :",
		--[[Translation missing --]]
		["module_desc"] = "Adds the ability to search the chatframes.",
		--[[Translation missing --]]
		["module_info"] = [=[This module adds search boxes on the chat frames, and the /find commands to search the chat history

Usage:

 /find <text>]=],
		--[[Translation missing --]]
		["module_name"] = "Search",
	}
}


   PL:AddLocale(PRAT_MODULE, "frFR",L)


L = {
	["Search"] = {
		["bnet_removed"] = "<BNET ENTFERNT>",
		["err_notfound"] = "Nicht gefunden",
		["err_tooshort"] = "Suchbegriff ist zu kurz",
		["find_results"] = "Gefundene Ergebnisse:",
		["module_desc"] = [=[Aktiviert die Suchfunktion in Chatfenstern.

Suche]=],
		["module_info"] = [=[Aktiviert die Textbefehle /find und /findall, um die Chathistorie zu durchsuchen

Benutzung:

/find <text>

/findall <text>

Suche]=],
		["module_name"] = "Suche",
	}
}


   PL:AddLocale(PRAT_MODULE, "deDE",L)


L = {
	["Search"] = {
		["bnet_removed"] = "<베틀넷 제거됨>",
		["err_notfound"] = "찾을 수 없음",
		["err_tooshort"] = "검색 구문이 너무 짧습니다",
		["find_results"] = "검색 결과:",
		["module_desc"] = "대화창 검색 기능을 추가합니다.",
		["module_info"] = [=[이 모듈은 대화 기록을 검색하는 /find 와 /findall 명령어를 추가합니다

사용법:

/find <문자열>

/findall <문자열>]=],
		["module_name"] = "검색 [Search]",
	}
}


   PL:AddLocale(PRAT_MODULE, "koKR",L)


L = {
	["Search"] = {
		--[[Translation missing --]]
		["bnet_removed"] = "<BNET REMOVED>",
		--[[Translation missing --]]
		["err_notfound"] = "Not Found",
		--[[Translation missing --]]
		["err_tooshort"] = "Search term is too short",
		--[[Translation missing --]]
		["find_results"] = "Find Results:",
		--[[Translation missing --]]
		["module_desc"] = "Adds the ability to search the chatframes.",
		--[[Translation missing --]]
		["module_info"] = [=[This module adds search boxes on the chat frames, and the /find commands to search the chat history

Usage:

 /find <text>]=],
		--[[Translation missing --]]
		["module_name"] = "Search",
	}
}


   PL:AddLocale(PRAT_MODULE, "esMX",L)


L = {
	["Search"] = {
		["bnet_removed"] = "<BNET УДАЛЕН>",
		["err_notfound"] = "Не Найденно",
		["err_tooshort"] = "Критерий поиска слишком короток",
		["find_results"] = "Найти Результаты:",
		["module_desc"] = "Добавляет возможность поиска текста в чате.",
		["module_info"] = [=[Этот модуль добавляет команды /find и /findall для поиска в истории чата

Использование:

/find <текст>

/findall <текст>]=],
		["module_name"] = "Поиск",
	}
}


   PL:AddLocale(PRAT_MODULE, "ruRU",L)


L = {
	["Search"] = {
		--[[Translation missing --]]
		["bnet_removed"] = "<BNET REMOVED>",
		["err_notfound"] = "没找到",
		["err_tooshort"] = "搜索文字太短",
		["find_results"] = "查找结果：",
		["module_desc"] = "增加搜索聊天框的能力",
		["module_info"] = [=[此模块增加 /find 和 /findall 命令搜索聊天历史

用法:

 /find <文字>

 /findall <文字>]=],
		["module_name"] = "搜索",
	}
}


   PL:AddLocale(PRAT_MODULE, "zhCN",L)


L = {
	["Search"] = {
		--[[Translation missing --]]
		["bnet_removed"] = "<BNET REMOVED>",
		["err_notfound"] = "No encontrado",
		["err_tooshort"] = "Termino de búsqueda demasiado corto",
		--[[Translation missing --]]
		["find_results"] = "Find Results:",
		--[[Translation missing --]]
		["module_desc"] = "Adds the ability to search the chatframes.",
		--[[Translation missing --]]
		["module_info"] = [=[This module adds search boxes on the chat frames, and the /find commands to search the chat history

Usage:

 /find <text>]=],
		--[[Translation missing --]]
		["module_name"] = "Search",
	}
}


   PL:AddLocale(PRAT_MODULE, "esES",L)


L = {
	["Search"] = {
		--[[Translation missing --]]
		["bnet_removed"] = "<BNET REMOVED>",
		["err_notfound"] = "找不到",
		["err_tooshort"] = "尋找物品太短",
		["find_results"] = "找到結果:",
		--[[Translation missing --]]
		["module_desc"] = "Adds the ability to search the chatframes.",
		--[[Translation missing --]]
		["module_info"] = [=[This module adds search boxes on the chat frames, and the /find commands to search the chat history

Usage:

 /find <text>]=],
		["module_name"] = "尋找",
	}
}


   PL:AddLocale(PRAT_MODULE, "zhTW",L)

 end
 --@end-non-debug@




  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
      searchactivealpha = 1.0,
      searchinactivealpha = 0.1
    }
  })


  Prat:SetModuleOptions(module.name, {
    name = PL.module_name,
    desc = PL.module_desc,
    type = "group",
    args = {
      info = {
        name = PL.module_info,
        type = "description",
      }
    }
  })


  function module:StashSearch(frame)
    frame:SetAlpha(self.db.profile.searchinactivealpha)
    frame:SetWidth(30)
  end

  function module:UnstashSearch(frame)
    frame:SetAlpha(self.db.profile.searchactivealpha)
    frame:SetWidth(130)
  end

  function module:CreateSearchBox(chatFrame)
    local name = chatFrame:GetName()
    local f = CreateFrame("EditBox", name .. "ChatSearchEditBox", chatFrame, "SearchBoxTemplate")

    f:SetWidth(130)
    f:SetHeight(16)
    f:SetFrameStrata("HIGH")
    f:SetPoint("TOPRIGHT", chatFrame, "TOPRIGHT")
    f:SetScript("OnEnter", function()
      local hoverAlpha = self.db.profile.searchinactivealpha + (self.db.profile.searchactivealpha - self.db.profile.searchinactivealpha) / 2
      if f:HasFocus() then self:UnstashSearch(f) else f:SetAlpha(hoverAlpha) end
    end)
    f:SetScript("OnLeave", function()
      if f:HasFocus() then self:UnstashSearch(f) else self:StashSearch(f) end
    end)
    f:SetScript("OnEditFocusLost", function() self:StashSearch(f) end)
    f:SetScript("OnEditFocusGained", function() self:UnstashSearch(f) end)
    f:SetScript("OnEscapePressed", function() f:ClearFocus() end)
    f:SetScript("OnEnterPressed", function(frame)
      local query = f:GetText()
      if query and query:len() > 0 then
        module:Find(query, true, frame:GetParent())
      end
    end)
    f.anim = f:CreateAnimationGroup()
    f.anim.fade1 = f.anim:CreateAnimation("Alpha")
    f.anim.fade1:SetFromAlpha(self.db.profile.searchactivealpha)
    f.anim.fade1:SetDuration(3)
    f.anim.fade1:SetToAlpha(self.db.profile.searchinactivealpha)
    f.anim.fade1:SetSmoothing("IN")
    f.anim:SetScript("OnFinished", function(...)
      if f:HasFocus() then
        self:UnstashSearch(f)
      else
        self:StashSearch(f)
      end
    end)

    f.anim:Play()

    return f
  end

  Prat:SetModuleInit(module, function(self)
    self.searchBoxes = {}
  end)

  function module:Prat_FramesUpdated(info, name, chatFrame, ...)
    if not self.searchBoxes[name] then
      self.searchBoxes[name] = self:CreateSearchBox(chatFrame)
    end
  end

  function module:OnModuleEnable()
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)

    for name, frame in pairs(Prat.HookedFrames) do
      if not self.searchBoxes[name] then
        self.searchBoxes[name] = self:CreateSearchBox(frame)
      end
    end

    for _, f in pairs(self.searchBoxes) do
      f:Show()
    end
  end

  function module:OnModuleDisable()
    for _, f in pairs(self.searchBoxes) do
      f:Hide()
    end
  end


  SLASH_FIND1 = "/find"
  SlashCmdList["FIND"] = function(msg) module:Find(msg, true) end

  local foundlines = {}
  local scrapelines = {}

  local CLR = Prat.CLR
  local function SearchTerm(term) return CLR:Colorize("ffff40", term) end

  function module:Find(word, all, frame)
    if not self.db.profile.on then
      return
    end

    if frame == nil then
      frame = SELECTED_CHAT_FRAME
    end

    if not word then return end

    if #word <= 1 then
      frame:ScrollToBottom()
      self:Output(frame, PL.err_tooshort)
      return
    end

    if frame:GetNumMessages() == 0 then
      frame:ScrollToBottom()
      self:Output(frame, PL.err_notfound)
      return
    end

    self.lastsearch = word

    self:ScrapeFrame(frame, nil, true)

    for _, v in ipairs(scrapelines) do
      if v.message and v.message:find(Prat.CaseInsensitveWordPattern(word)) then
        if all then
          table.insert(foundlines, v)
        else
          return
        end
      end
    end

    self.lastsearch = nil

    frame:ScrollToBottom()

    if all and #foundlines > 0 then
      self:Output(frame, "-------------------------------------------------------------")
      self:Output(frame, PL.find_results .. ": " .. SearchTerm(word))

      Prat.loading = true -- prevent double timestamp
      for _, v in ipairs(foundlines) do
        frame:AddMessage(v.message:gsub("|K.-|k", PL.bnet_removed), v.r, v.g, v.b)
      end
      Prat.loading = nil
      self:Output(frame, "-------------------------------------------------------------")
    else
      self:Output(frame, PL.err_notfound)
    end

    wipe(foundlines)
    wipe(scrapelines)
  end

  function module:ScrapeFrame(frame)
    wipe(scrapelines)

    for i=frame:GetNumMessages(),1,-1 do
      local msg = frame.historyBuffer:GetEntryAtIndex(i)

      if msg and msg.message then
        table.insert(scrapelines, msg)
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad