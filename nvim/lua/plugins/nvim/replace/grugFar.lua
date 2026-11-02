return {
    'MagicDuck/grug-far.nvim',
    -- lazy-load on the search/replace keys (stubs: config installs the real
    -- function mappings once the plugin loads)
    keys = {
        {
            '<leader>rw',
            mode = { 'n', 'v' },
            function()
                require('grug-far').open({
                    prefills = {
                        search = vim.fn.expand('<cword>'),
                        paths = vim.fn.expand('%'),
                    },
                    startInInsertMode = false,
                })
            end,
            desc = 'zz:grugfar:SearchCWordInCurFile',
        },
        {
            '<leader>rW',
            mode = { 'n', 'v' },
            function()
                require('grug-far').open({
                    prefills = {
                        search = vim.fn.expand('<cword>'),
                    },
                    startInInsertMode = false,
                })
            end,
            desc = 'zz:grugfar:SearchCWordInCWD',
        },
        {
            '<leader>rg',
            mode = 'n',
            function()
                require('grug-far').open({
                    prefills = {
                        paths = vim.fn.expand('%'),
                    },
                })
            end,
            desc = 'zz:grugfar:SearchInCurFile',
        },
        {
            '<leader>rG',
            mode = 'n',
            function()
                require('grug-far').open({})
            end,
            desc = 'zz:grugfar:SearchInCWD',
        },
    },
    config = function()
        require('grug-far').setup({
            icons = {
                fileIconsProvider = 'mini.icons',
            },
            keymaps = {
                close = { n = '<localleader>q' },
                qflist = { n = '<localleader>c' },
                syncFile = { n = '<localleader>z' },
            },
        })
    end,
}
