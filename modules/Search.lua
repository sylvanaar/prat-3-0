Prat:AddModuleToLoad(function()

    local PRAT_MODULE = Prat:RequestModuleName("Search")

    if PRAT_MODULE == nil then
        return
    end

    local module = Prat:NewModule(PRAT_MODULE)


    SLASH_FIND1 = "/find"
    SlashCmdList["FIND"] = function(msg) module:Find(msg, false) end

    SLASH_FINDALL1 = "/findall"
    SlashCmdList["FINDALL"] = function(msg) module:Find(msg, true) end

    local MAX_SCRAPE_TIME = 30
    local foundlines = {}
    local scrapelines = {}

    local function out(frame, msg)
        Prat:Print(frame, msg)
    end

    function module:Find(word, all, frame)
        self.longstr = ""
        self.str = ""

        if frame == nil then
            frame = SELECTED_CHAT_FRAME
        end


        if not word then return end

        if #word <= 1 then
            frame:ScrollToBottom()
            out(frame, "Search term is too short")
            return
        end

        if frame:GetNumMessages() == 0 then return end


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

            for i,v in ipairs(scrapelines) do
                if v:find(word) then
                --out(frame, ("Found line %d scroll %d"):format(frame:GetCurrentLine(), frame:GetCurrentScroll()))
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
            out(frame, "Find Results:")

            Prat.loading = true
            for i,v in ipairs(foundlines) do
                out(frame, v)
            end
            Prat.loading = nil

        else
            out(frame, "Not Found")
        end

        wipe(foundlines)
    end

    function module:ScrapeFrame(frame)
        wipe(scrapelines)

        self:AddLines(scrapelines, frame:GetRegions())
    end

    function module:AddLines(lines, ...)
        for i=select("#", ...),1,-1 do
            local x = select(i, ...)
            if x:GetObjectType() == "FontString" and not x:GetName() then
                table.insert(lines, x:GetText())
            end
        end
    end

    return
end) -- Prat:AddModuleToLoad