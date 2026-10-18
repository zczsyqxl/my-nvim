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
        fwatch.watch(sn_dir, {
            recursive = true,
            on_event = function(path, events)
                vim.schedule(function()
                    local ok1 = pcall(require('luasnip.loaders').reload_file, path)
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
