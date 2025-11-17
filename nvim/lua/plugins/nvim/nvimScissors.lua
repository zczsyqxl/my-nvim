return {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    config = function()
        require("scissors").setup ({
            snippetDir = vim.fn.stdpath('config') .. '/snippets',
        })
    end,
}

