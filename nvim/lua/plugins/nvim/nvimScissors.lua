return {
    'chrisgrieser/nvim-scissors',
    dependencies = 'nvim-telescope/telescope.nvim', -- if using telescope
    config = function()
        require('scissors').setup({
            snippetDir = vim.fn.stdpath('config') .. '/snippets',

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
            loaders.reload_file = function(path)
                local res = orig(path)
                pcall(function()
                    require('plugins.mini.snippet').setup()
                end)
                return res
            end
            loaders._zz_mini_patched = true
        end
        vim.keymap.set({ 'n', 'x' }, '<leader>ea', function()
            require('scissors').addNewSnippet()
        end, { desc = 'zz:Scissor:AddNewSnippet' })
        vim.keymap.set({ 'n', 'x' }, '<leader>ee', function()
            require('scissors').editSnippet()
        end, { desc = 'zz:Scissor:EditSnippet' })
    end,
}
