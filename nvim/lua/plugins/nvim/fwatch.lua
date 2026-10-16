return {
    'rktjmp/fwatch.nvim',
    config = function()
        local fwatch = require('fwatch')
        local sn_dir = vim.fn.stdpath('config') .. '/snippets/snippets'

        -- 双引擎并存：LuaSnip（cmp 弹窗路径）精确重载变化的文件；
        -- mini.snippets（C-j/C-l 路径）没有单文件重载 API，整体重 setup
        -- （复用 plugins.mini.snippet 的配置，保证 mappings 不漂移）。
        -- scissors 只热重载 LuaSnip，所以 mini 与外部修改（git pull 等）都靠这里。
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
    end
}
