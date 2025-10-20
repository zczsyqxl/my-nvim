return {
    'tommcdo/vim-exchange',
    config = function()
        vim.keymap.set('n', 'cn', '<Plug>(Exchange)', {remap = true})
        vim.keymap.set('x', 'X', '<Plug>(Exchange)', {remap = true})
        vim.keymap.set('n', 'cnc', '<Plug>(ExchangeClear)', {remap = true})
        vim.keymap.set('n', 'cnn', '<Plug>(ExchangeLine)', {remap = true})
    end
}
