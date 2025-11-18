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
        vim.keymap.set({'n', 'x'}, '<leader>ea', function()
            require('scissors').addNewSnippet()
        end, { desc = 'zz:Scissor:AddNewSnippet'})
        vim.keymap.set({'n', 'x'}, '<leader>ee', function()
            require('scissors').editSnippet()
        end, { desc = 'zz:Scissor:EditSnippet'})
    end,
}


