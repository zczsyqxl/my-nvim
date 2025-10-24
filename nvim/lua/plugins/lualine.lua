
if vim.g.vscode then
    return {}
else
    return {
        'nvim-lualine/lualine.nvim',
        dependencies = { 
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                globalstatus = true,
                theme = 'onedark'
            },
            extensions = {
                'nvim-tree',
                'toggleterm',
                'mason'
            }
        },
        config = true
    }
end

