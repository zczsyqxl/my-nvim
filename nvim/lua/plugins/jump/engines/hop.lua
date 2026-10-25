return {
    'smoka7/hop.nvim',
    -- keys must live at spec top level for lazy loading (inside config lazy.nvim
    -- can't see them and the plugin would load at startup)
    -- Dimmed-highlight ZZ.HopUnmatched lives in theme/zz.lua (hop's default
    -- is #666666; its definition uses default=true, so it won't override groups the
    -- theme defined first)
    keys = {
        -- { '<leader>f', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.f' },
        -- { '<leader>F', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.F' },
        -- { '<leader>t', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.t' },
        -- { '<leader>T', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.T' },
        {
            '<leader>w',
            function()
                -- no direction = bidirectional jump (hop runtime semantics; nil
                -- falls through the direction branches, window.lua:245+);
                -- hop's Options type wrongly marks direction as required (defaults.lua:2)
                ---@diagnostic disable-next-line: missing-fields
                require('hop').hint_words({})
            end,
            mode = { 'n', 'v', 'o' },
            desc = 'zz:hop:hint_words.after',
        },
        -- {
        --     '<leader>b',
        --     function()
        --         require('hop').hint_words({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR })
        --     end,
        --     mode = { 'n', 'v', 'o' },
        --     desc = 'zz:hop:hint_words.before',
        -- },
        {
            '<leader>l',
            function()
                -- no direction = bidirectional jump (hop runtime semantics; nil
                -- falls through the direction branches, window.lua:245+);
                -- hop's Options type wrongly marks direction as required (defaults.lua:2)
                ---@diagnostic disable-next-line: missing-fields
                require('hop').hint_lines({})
            end,
            mode = { 'n', 'v', 'o' },
            desc = 'zz:hop:hint_lines.after',
        },
        -- {
        --     '<leader>k',
        --     function()
        --         require('hop').hint_lines({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR })
        --     end,
        --     mode = { 'n', 'v', 'o' },
        --     desc = 'zz:hop:hint_lines.before',
        -- },
        {
            '<leader>L',
            function()
                -- no direction = bidirectional jump (hop runtime semantics; nil
                -- falls through the direction branches, window.lua:245+);
                -- hop's Options type wrongly marks direction as required (defaults.lua:2)
                ---@diagnostic disable-next-line: missing-fields
                require('hop').hint_vertical({})
            end,
            mode = { 'n', 'v', 'o' },
            desc = 'zz:hop:hint_vertical.after',
        },
        -- {
        --     '<leader>K',
        --     function()
        --         require('hop').hint_vertical({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR })
        --     end,
        --     mode = { 'n', 'v', 'o' },
        --     desc = 'zz:hop:hint_vertical.before',
        -- },
        {
            '<leader>s',
            function()
                -- no direction = bidirectional jump (hop runtime semantics; nil
                -- falls through the direction branches, window.lua:245+);
                -- hop's Options type wrongly marks direction as required (defaults.lua:2)
                ---@diagnostic disable-next-line: missing-fields
                require('hop').hint_char1({})
            end,
            mode = { 'n', 'v', 'o' },
            desc = 'zz:hop:hint_char1',
        },
        -- { '<leader>x', function() require('hop').hint_char2() end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char2' },
        {
            '<leader>S',
            function()
                -- same as ,s: no direction = bidirectional; hop's type wrongly marks it required
                ---@diagnostic disable-next-line: missing-fields
                require('hop').hint_patterns({})
            end,
            mode = { 'n', 'v', 'o' },
            desc = 'zz:hop:hint_patterns',
        },
        -- { ',a', function() require('hop').hint_anywhere() end, mode = {'n','v','o'}, desc = 'zz:hop:hint_anywhere' },
        -- hop-yank (,x/,X remote yank/paste, lua/hop-yank/) removed: remote ops are
        -- handled by leap's Visitor (gk); ,x/,X reassigned to leap one-way search + traversal
    },
    opts = {
        uppercase_labels = true,
        multi_windows = true,
    },
}
