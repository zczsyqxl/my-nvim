return {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    config = function()
        require("scissors").setup ({
            snippetDir = vim.fn.stdpath('config') .. '/snippets',

            editSnippetPopup = {
                keymaps = {
                    -- if not mentioned otherwise, the keymaps apply to normal mode
                    insertNextPlaceholder = "<C-i>", -- inserkkt & normal mode
                },
            },
        })
    end,
}
