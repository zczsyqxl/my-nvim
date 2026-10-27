return {
    'chrisgrieser/nvim-scissors',
    keys = {
        {
            '<leader>za',
            mode = { 'n', 'x' },
            function()
                require('scissors').addNewSnippet()
            end,
            desc = 'zz:Scissor:AddNewSnippet',
        },
        {
            '<leader>ze',
            mode = { 'n', 'x' },
            function()
                require('scissors').editSnippet()
            end,
            desc = 'zz:Scissor:EditSnippet',
        },
    },
    config = function()
        require('scissors').setup({
            snippetDir = vim.fn.stdpath('config') .. '/snippets',
            snippetSelection = {
                picker = 'snacks',
            },
            editSnippetPopup = {
                keymaps = {
                    -- if not mentioned otherwise, the keymaps apply to normal mode
                    insertNextPlaceholder = '<C-B>', -- inserkkt & normal mode
                },
            },
        })

        -- scissors only hot-reloads LuaSnip on save (its engine list is hardcoded
        -- and unaware of mini.snippets). Wrap reload_file: on save it also re-setups
        -- mini, clearing the cache, so the C-j path takes effect right after ,ee
        -- saves (cache strategy unchanged; expansion still goes through the cache).
        local loaders = require('luasnip.loaders')
        if not loaders._zz_mini_patched then
            local orig = loaders.reload_file
            ---@diagnostic disable-next-line: duplicate-set-field -- intentionally wraps LuaSnip's reload_file (the patch itself)
            loaders.reload_file = function(path)
                local res = orig(path)
                pcall(function()
                    require('plugins.mini.snippet').setup()
                end)
                return res
            end
            loaders._zz_mini_patched = true
        end
    end,
}
