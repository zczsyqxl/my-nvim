require('mini.surround').setup({
    n_lines = 35,
    respect_selection_type = true,
    mappings = {
        add = 'ys', -- Add surrounding in Normal and Visual modes
        delete = 'ds', -- Delete surrounding
        find = 'Sf', -- Find surrounding (to the right)
        find_left = 'SF', -- Find surrounding (to the left)
        highlight = 'Sh', -- Highlight surrounding
        replace = 'cs', -- Replace surrounding
        update_n_lines = 'Sn',

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
    },
    custom_surroundings = {
        -- Make `)` insert parts with spaces. `input` pattern stays the same.
        ['/'] = {
            input = {'%/%* ().-() %*%/'},
            output = { left = '/* ', right = ' */' }
        },
        ['#'] = {
            input = {'%#if 0().-()%#endif'},
            output = { left = '#if 0', right = '#endif' }
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
