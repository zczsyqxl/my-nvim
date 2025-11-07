return {
    'MagicDuck/grug-far.nvim',
    config = function()
        require('grug-far').setup({
            icons = {
                fileIconsProvider = 'mini.icons',
            },
            keymaps = {
                close = { n = '<localleader>q'},
                qflist = { n = '<localleader>c' },
                syncFile = { n = '<localleader>z' },
            }
        })
        vim.keymap.set({'n', 'v'},'<leader>[', function() require('grug-far').open({
            prefills = {
                search = vim.fn.expand('<cword>'),
                paths = vim.fn.expand('%')
            },
            startInInsertMode = false,
        }) end, {remap = false, silent = true, desc = 'zz:grugfar:SearchCWordInCurFile'})
        vim.keymap.set({'n'},'<leader>]', function() require('grug-far').open({
            prefills = {
                paths = vim.fn.expand('%')
            }
        }) end, {remap = false, silent = true, desc = 'zz:grugfar:SearchInCurFile'})
        vim.keymap.set({'n', 'v'},'<leader>{', function() require('grug-far').open({
            prefills = {
                search = vim.fn.expand('<cword>'),
            },
            startInInsertMode = false,
        }) end, {remap = false, silent = true, desc = 'zz:grugfar:SearchCWordInCWD'})
        vim.keymap.set({'n'},'<leader>}', function() require('grug-far').open({
        }) end, {remap = false, silent = true, desc = 'zz:grugfar:SearchInCWD'})
    end
}
