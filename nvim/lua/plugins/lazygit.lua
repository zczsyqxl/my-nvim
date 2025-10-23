if vim.g.vscode then
    return {}
else
    return {
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        keys = {
            {'<leader>vg', '<cmd>LazyGit<cr>', desc = 'LazyGit' }
        }
    }
end

