-- gF (markdown buffers only): resolve the link target under the cursor and
-- open it with the system handler (vim.ui.open). markdown-preview's server
-- only serves its own five routes (app/routes.js: /page/:n, /_next/*,
-- /_static/*, /_local_image_*, 404 fallback), so vault-relative links such as
-- ../../attachments/x.html 404 in the browser preview. Here the same link is
-- resolved against the buffer's directory, the way Obsidian does.
local M = {}

local URL = '^%a[%w+.-]*://'

local function md_links(line)
    -- [text](target): target stops at ')' or whitespace; trailing title
    -- ("... html" ) stays out of the capture. Good enough for vault notes.
    local links = {}
    local pos = 1
    while true do
        local s, e, t = line:find('%[[^%]]*%]%(([^)%s]+)[^)]*%)', pos)
        if not s then
            break
        end
        links[#links + 1] = { s = s, e = e, target = t }
        pos = e + 1
    end
    return links
end

-- Returns the link target (URL or relative path) under/near the cursor,
-- or a gf-style path chunk, or nil.
M.resolve = function()
    local line = vim.api.nvim_get_current_line()
    local _, col = unpack(vim.api.nvim_win_get_cursor(0))
    local links = md_links(line)

    local hit
    for _, l in ipairs(links) do
        if col >= l.s - 1 and col < l.e then
            hit = l.target
            break
        end
    end
    if not hit then
        -- no link under the cursor: take the nearest one on the line
        local bd
        for _, l in ipairs(links) do
            local d = col < l.s - 1 and (l.s - 1 - col) or (col - (l.e - 1))
            if not bd or d < bd then
                bd, hit = d, l.target
            end
        end
    end
    if not hit or hit == '' then
        hit = vim.fn.expand('<cfile>')
    end
    if not hit or hit == '' then
        return nil
    end
    if not hit:match(URL) then
        hit = hit:gsub('[#?].*$', '') -- strip anchor/query of file targets
    end
    return hit
end

-- Relative target → absolute path, resolved against the buffer's directory
-- (Obsidian-style), with `..` chains collapsed lexically.
M.abspath = function(t)
    local p = t:sub(1, 1) == '~' and vim.fn.expand(t) or t
    if not (p:match('^%a:[/\\]') or p:sub(1, 1) == '/') then
        p = vim.fn.expand('%:p:h') .. '/' .. p
    end
    return vim.fs.normalize(p)
end

M.open = function()
    local t = M.resolve()
    if not t then
        vim.notify('md: no link target under cursor', vim.log.levels.WARN)
        return
    end
    if t:match(URL) then
        vim.ui.open(t)
        return
    end
    local p = M.abspath(t)
    if vim.fn.filereadable(p) ~= 1 and vim.fn.isdirectory(p) ~= 1 then
        vim.notify('md: target not found: ' .. p, vim.log.levels.WARN)
        return
    end
    vim.ui.open(p)
end

return M
