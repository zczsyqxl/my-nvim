return {
    'rktjmp/fwatch.nvim',
    config = function()
        local fwatch = require('fwatch')
        local sn_dir = vim.fn.stdpath('config') .. '/snippets/snippets'

        -- 第一次加载
        local function reload()
            vim.schedule(function()
                require('mini.snippets').setup({
                    snippets = {
                        require('mini.snippets').gen_loader.from_file(sn_dir .. '/global.json'),
                        require('mini.snippets').gen_loader.from_lang(),
                    }
                })
                vim.notify('Snippets reloaded!', vim.log.levels.INFO)
            end)
        end

        -- 递归监听整个目录
        fwatch.watch(sn_dir, {
            recursive = true,
            on_event = function(path, events)
                reload()
            end,
        })
    end
}
