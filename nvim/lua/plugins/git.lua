if vim.g.vscode then
    return {}
else
    return {
        {
            'kdheepak/lazygit.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
            keys = {
                {'<leader>vl', '<cmd>LazyGit<cr>', desc = 'LazyGit' }
            }
        },
        {
            'sindrets/diffview.nvim'
        },
    }
end

