return {
    'kdheepak/lazygit.nvim',
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {'<leader>vl', '<cmd>LazyGit<cr>', desc = 'zz:lazygit:Open' }
    }
}