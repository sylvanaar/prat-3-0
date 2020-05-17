Prat:AddModuleToLoad(function()
  local PRAT_MODULE = Prat:RequestModuleName("Search")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE)

  local PL = module.PL

  --@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    module_name = "Search",
    module_desc = "Adds the ability to search the chatframes.",
    module_info = "This module adds the /find commands to search the chat history\n\nUsage:\n\n /find <text>",
    err_tooshort = "Search term is too short",
    err_notfound = "Not Found",
    find_results = "Find Results:",
    bnet_removed = "<BNET REMOVED>",
  })
  --@end-debug@

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --[===[@non-debug@
 do
     local L


--@localization(locale="enUS", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "enUS",L)


--@localization(locale="frFR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "frFR",L)


--@localization(locale="deDE", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "deDE",L)


--@localization(locale="koKR", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "koKR",L)


--@localization(locale="esMX", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "esMX",L)


--@localization(locale="ruRU", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "ruRU",L)


--@localization(locale="zhCN", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "zhCN",L)


--@localization(locale="esES", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "esES",L)


--@localization(locale="zhTW", format="lua_table", handle-subnamespaces="none", same-key-is-true=true, namespace="Search")@

   PL:AddLocale(PRAT_MODULE, "zhTW",L)

 end
 --@end-non-debug@]===]




  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = true,
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


  SLASH_FIND1 = "/find"
  SlashCmdList["FIND"] = function(msg) module:Find(msg, true) end

  local foundlines = {}
  local scrapelines = {}

  local function out(frame, msg)
    frame:AddMessage(msg)
  end

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
      out(frame, PL.err_tooshort)
      return
    end

    if frame:GetNumMessages() == 0 then
      out(frame, PL.err_notfound)
      return
    end

    self.lastsearch = word

    self:ScrapeFrame(frame, nil, true)

    for _, v in ipairs(scrapelines) do
      if v.message and v.message:find(word) then
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
      out(frame, PL.find_results)

      Prat.loading = true -- prevent double timestamp
      for _, v in ipairs(foundlines) do
        frame:AddMessage(v.message:gsub("|K.-|k", PL.bnet_removed), v.r, v.g, v.b)
      end
      Prat.loading = nil
    else
      out(frame, PL.err_notfound)
    end

    wipe(foundlines)
  end

  function module:ScrapeFrame(frame)
    wipe(scrapelines)

    for _, v in ipairs(frame.historyBuffer.elements) do
      if v.message then
        table.insert(scrapelines, v)
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad