Prat:AddModuleToLoad(function()
    local PRAT_MODULE = Prat:RequestModuleName("Search")

    if PRAT_MODULE == nil then
        return
    end

    local PL = Prat:GetLocalizer({})

    --@debug@
    PL:AddLocale("enUS", {
        module_name = "Search",
        module_desc = "Adds the ability to search the chatframes.",
        module_info = "This module adds the /find and /findall commands to search the chat history\n\nUsage:\n\n /find <text> \n\n /findall <text>",
        err_tooshort = "Search term is too short",
        err_notfound = "Not Found",
        find_results = "Find Results:",
    })
    --@end-debug@

    -- These Localizations are auto-generated. To help with localization
    -- please go to http://www.wowace.com/projects/prat-3-0/localization/


    --[===[@non-debug@
  
--@localization(locale="enUS", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("enUS",L)
  
--@localization(locale="frFR", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("frFR",L)
  
--@localization(locale="deDE", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("deDE",L)
  
--@localization(locale="koKR", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("koKR",L)
  
--@localization(locale="esMX", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("esMX",L)
  
--@localization(locale="ruRU", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("ruRU",L)
  
--@localization(locale="zhCN", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("zhCN",L)
  
--@localization(locale="esES", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("esES",L)
  
--@localization(locale="zhTW", format="lua_table", same-key-is-true=true, namespace="Search")@

  PL:AddLocale("zhTW",L)
    --@end-non-debug@]===]


    local module = Prat:NewModule(PRAT_MODULE)


    Prat:SetModuleDefaults(module.name, {
        profile = {
            on = true,
        }
    } )

    
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
    SlashCmdList["FIND"] = function(msg) module:Find(msg, false) end

    SLASH_FINDALL1 = "/findall"
    SlashCmdList["FINDALL"] = function(msg) module:Find(msg, true) end

    local MAX_SCRAPE_TIME = 30
    local foundlines = {}
    local scrapelines = {}

    local function out(frame, msg)
        frame:print(frame, msg)
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
            out(frame, PL.err_tooshorL)
            return
        end

        if frame:GetNumMessages() == 0 then
             out(frame, PL.err_notfound)
             return
        end

        local starttime = time()
        local runtime = 0

        if not all and self.lastsearch == word then
            frame:PageUp()
        end

        if all then
            frame:ScrollToBottom()
        end

        self.lastsearch = word

        repeat
            self:ScrapeFrame(frame, nil, true)

            for _,v in ipairs(scrapelines) do
                if v.message:find(word) then
                    if all then
                        table.insert(foundlines, v)
                    else
                        return
                    end
                end
            end

            frame:PageUp()
            runtime = time() - starttime
            if runtime >= MAX_SCRAPE_TIME then
                out(frame, "Frame scraping timeout exceeded, results will be incomplete.")
                break;
            end

        until frame:AtTop() or runtime >= MAX_SCRAPE_TIME

        self.lastsearch = nil

        frame:ScrollToBottom()

        if all and #foundlines > 0 then
            out(frame, PL.find_results)

            Prat.loading = true
            for _,v in ipairs(foundlines) do
                frame:AddMessage(v.message, v.r, v.g, v.b)
            end
            Prat.loading = nil

        else
            out(frame, PL.err_notfound)
        end

        wipe(foundlines)
    end

    function module:ScrapeFrame(frame)
        wipe(scrapelines)

        for _,v in ipairs(frame.visibleLines) do
            local msg = v.messageInfo
            if msg then
                table.insert(scrapelines, 1, msg)
            end
        end
    end

    return
end) -- Prat:AddModuleToLoad