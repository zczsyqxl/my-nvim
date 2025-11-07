require('mini.surround').setup({
    mappings = {
        add = 'ys', -- Add surrounding in Normal and Visual modes
        delete = 'ds', -- Delete surrounding
        find = '\\f', -- Find surrounding (to the right)
        find_left = '\\F', -- Find surrounding (to the left)
        highlight = '\\h', -- Highlight surrounding
        replace = 'cs', -- Replace surrounding
        update_n_lines = '\\n',

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
    },
    custom_surroundings = {
        -- Make `)` insert parts with spaces. `input` pattern stays the same.
        ['/'] = {
            input = {'%/%* ().-() %*%/'},
            output = { left = '/* ', right = ' */' }
        },
        ['*'] = {
            input = {'\n%/%*\n().-()\n%*%/'},
            output = { left = '\n/*\n', right = '\n*/' }
        },
        ['#'] = {
            input = {'\n%#if 0\n().-()\n%#endif'},
            output = { left = '\n#if 0\n', right = '\n#endif' }
        },
        -- ['*'] = {
        --     input = function()
        --         local n_star = MiniSurround.user_input('Number of * to find')
        --         local many_star = string.rep('%*', tonumber(n_star) or 1)
        --         return { many_star .. '().-()' .. many_star }
        --     end,
        --     output = function()
        --         local n_star = MiniSurround.user_input('Number of * to output')
        --         local many_star = string.rep('*', tonumber(n_star) or 1)
        --         return { left = many_star, right = many_star }
        --     end,
        -- },

        -- Use function to compute surrounding info
    }
})

vim.keymap.set('n', 'yss', 'ys_', {remap = true, desc='zz:mini.surround:AddLineSurround'})
vim.keymap.del('x', 'ys')
vim.keymap.set('x', 'S', [[:<C-u>lua MiniSurround.add('visual')<CR>]], {silent = true, desc='zz:mini.surround:AddVisSurround' })
