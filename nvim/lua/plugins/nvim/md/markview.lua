return {
    'OXY2DEV/markview.nvim',
    dependency = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        preview = {
            modes = { "i", "n", "no", "c" },
            hybrid_modes = { "i" },
            enable = true,
            enable_hybrid_mode = true,
            linewise_hybrid_mode = true,
            filetypes = { 'markdown', 'llm'},
            icon_provider = 'mini',
            ignore_buftypes = {},  -- for llm buffers
        },
    },
    config = function(_, opts)
        require("markview").setup(opts);
        vim.keymap.set('n', '<leader>v/', '<cmd>Markview<cr>', { remap = false, desc='zz:markview:SplitToggle'})
        vim.keymap.set('n', '<leader>v.', '<cmd>Markview splitToggle<cr>', { remap = false, desc='zz:markview:SplitToggle'})
    end,

}


