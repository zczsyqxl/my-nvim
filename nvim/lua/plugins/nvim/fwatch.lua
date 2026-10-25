return {
    'rktjmp/fwatch.nvim',
    config = function()
        local fwatch = require('fwatch')
        local sn_dir = vim.fn.stdpath('config') .. '/snippets/snippets'

        -- Dual snippet engines coexist: LuaSnip (cmp popup path) precisely reloads
        -- the changed file; mini.snippets (C-j/C-l path) has no per-file reload API,
        -- so it re-runs the whole setup instead (reusing plugins.mini.snippet's
        -- config so mappings don't drift).
        -- scissors only hot-reloads LuaSnip, so mini and external edits (git pull etc.)
        -- both rely on this watcher.
        --
        -- libuv fs_event (Windows ReadDirectoryChangesW) quirks handled below:
        --   * one real write reports TWO events (rename + change) -> debounce
        --   * filename arrives RELATIVE to sn_dir -> join before using it
        --   * raw-event logging goes to stdpath('log')/fwatch.log
        --     (temporary diagnosis for the mystery ",ff-time" writer; remove later)
        local last_at = {} -- per-path timestamp of last handled event (debounce)
        fwatch.watch(sn_dir, {
            recursive = true,
            on_event = function(path, events)
                vim.schedule(function()
                    -- temporary: log every raw event to identify the real writer
                    pcall(function()
                        local dir = vim.fn.stdpath('log')
                        vim.fn.mkdir(dir, 'p')
                        local logf = io.open(dir .. '/fwatch.log', 'a')
                        if logf then
                            logf:write(('%s | %-50s | %s\n'):format(
                                os.date('%m-%d %H:%M:%S'), tostring(path), vim.inspect(events)))
                            logf:close()
                        end
                    end)

                    -- filter: snippet .json files only (ignore tmp/undo/other drops)
                    if not (type(path) == 'string' and path:match('%.json$')
                        and events and (events.change or events.rename))
                    then
                        return
                    end
                    -- debounce: collapse the rename+change double-report of one write
                    local now = (vim.uv or vim.loop).hrtime() / 1e9
                    if last_at[path] and now - last_at[path] < 1 then
                        return
                    end
                    last_at[path] = now

                    local abs = sn_dir .. '/' .. path
                    local ok1 = pcall(require('luasnip.loaders').reload_file, abs)
                    local ok2 = pcall(function()
                        require('plugins.mini.snippet').setup()
                    end)
                    if ok1 or ok2 then
                        vim.notify('Snippets reloaded: ' .. path, vim.log.levels.INFO)
                    else
                        vim.notify('Failed to reload snippet file: ' .. path, vim.log.levels.WARN)
                    end
                end)
            end,
        })
    end,
}
