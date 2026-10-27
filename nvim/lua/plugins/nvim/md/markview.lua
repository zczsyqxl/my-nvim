return {
    'OXY2DEV/markview.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        preview = {
            modes = { 'i', 'n', 'no', 'c' },
            hybrid_modes = { 'i' },
            enable = true,
            enable_hybrid_mode = true,
            linewise_hybrid_mode = true,
            filetypes = { 'markdown', 'llm' },
            icon_provider = 'mini',
            ignore_buftypes = {}, -- for llm buffers
        },
    },
    config = function(_, opts)
        require('markview').setup(opts)
    end,
    keys = {
        { '<leader>e/', '<cmd>Markview<cr>', desc = 'zz:markview:Toggle', silent = true },
        { '<leader>e.', '<cmd>Markview splitToggle<cr>', desc = 'zz:markview:SplitToggle', silent = true },
    },
}
