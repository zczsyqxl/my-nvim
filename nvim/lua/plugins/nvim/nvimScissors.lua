return {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
    config = function()
        require("scissors").setup ({
            snippetDir = vim.fn.stdpath('config') .. '/snippets',

            editSnippetPopup = {
                keymaps = {
                    -- if not mentioned otherwise, the keymaps apply to normal mode
                    insertNextPlaceholder = "<C-B>", -- inserkkt & normal mode
                },
            },
        })

        -- scissors 保存后只会热重载 LuaSnip（引擎列表硬编码，不认识 mini.snippets）。
        -- 这里包一层 reload_file：它保存时顺手重 setup mini，清掉缓存，
        -- 这样 ,ee 保存后 C-j 路径也立即生效（缓存策略不变，展开依旧走缓存）。
        local loaders = require('luasnip.loaders')
        if not loaders._zz_mini_patched then
            local orig = loaders.reload_file
            loaders.reload_file = function(path)
                local res = orig(path)
                pcall(function() require('plugins.mini.snippet').setup() end)
                return res
            end
            loaders._zz_mini_patched = true
        end
        vim.keymap.set({'n', 'x'}, '<leader>ea', function()
            require('scissors').addNewSnippet()
        end, { desc = 'zz:Scissor:AddNewSnippet'})
        vim.keymap.set({'n', 'x'}, '<leader>ee', function()
            require('scissors').editSnippet()
        end, { desc = 'zz:Scissor:EditSnippet'})
    end,
}


