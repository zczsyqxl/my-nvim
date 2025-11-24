return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-mini/mini.nvim'
    },
    opts = {
        options = {
            globalstatus = true,
            -- theme = 'ayu_dark',
            theme = 'tokyonight',
        },
        extensions = {
            'nvim-tree',
            'toggleterm',
            'mason'
        }
    },
    config = true
}

