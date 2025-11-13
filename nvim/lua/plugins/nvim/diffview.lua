return {
    'sindrets/diffview.nvim',
    config = function()
        vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen<cr>',        {remap = false, silent = true, desc='zz:diffview:Open'})
        vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>',       {remap = false, silent = true, desc='zz:diffview:Close'})
        vim.keymap.set('n', '<leader>dr', '<cmd>DiffviewRefresh<cr>',     {remap = false, silent = true, desc='zz:diffview:Refresh'})
        vim.keymap.set('n', '<leader>dh', '<cmd>DiffviewFileHistory %<cr>', {remap = false, silent = true, desc='zz:diffview:fileHistory'})
        vim.keymap.set('x', '<leader>dh', ':\'<,\'>DiffviewFileHistory %<cr>', {remap = false, silent = true, desc='zz:diffview:fileHistory[range]'})
    end,
}
