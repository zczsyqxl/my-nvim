return {
    'sindrets/diffview.nvim',
    -- lazy-load on the diffview keys AND on any :Diffview* command (mappings
    -- exist at startup, plugin loads on first press; config not needed)
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewRefresh', 'DiffviewFileHistory', 'DiffviewLog' },
    keys = {
        { '<leader>do', '<cmd>DiffviewOpen<cr>', desc = 'zz:diffview:Open' },
        { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'zz:diffview:Close' },
        { '<leader>dr', '<cmd>DiffviewRefresh<cr>', desc = 'zz:diffview:Refresh' },
        { '<leader>dh', '<cmd>DiffviewFileHistory %<cr>', mode = 'n', desc = 'zz:diffview:fileHistory' },
        { '<leader>dh', ":'<,'>DiffviewFileHistory %<cr>", mode = 'x', desc = 'zz:diffview:fileHistory[range]' },
    },
}
