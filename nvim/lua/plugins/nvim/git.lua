return {
    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        keys = {
            {'<leader>vl', '<cmd>LazyGit<cr>', desc = 'zz:lazygit:Open' }
        }
    },
    {
        'sindrets/diffview.nvim',
        config = function()
            vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen<cr>',        {remap = false, silent = true, desc='zz:diffview:Open'})
            vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<cr>',       {remap = false, silent = true, desc='zz:diffview:Close'})
            vim.keymap.set('n', '<leader>dt', '<cmd>DiffviewToggleFiles<cr>', {remap = false, silent = true, desc='zz:diffview:ToggleFiles'})
            vim.keymap.set('n', '<leader>df', '<cmd>DiffviewFocusFiles<cr>',  {remap = false, silent = true, desc='zz:diffview:FocusFiles'})
            vim.keymap.set('n', '<leader>dr', '<cmd>DiffviewRefresh<cr>',     {remap = false, silent = true, desc='zz:diffview:Refresh'})
            vim.keymap.set('n', '<leader>dh', '<cmd>DiffviewFileHistory<cr>', {remap = false, silent = true, desc='zz:diffview:fileHistory'})
        end,
    },
}

