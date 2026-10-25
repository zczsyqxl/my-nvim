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
                -- 无 direction = 双向跳转(hop 的运行时语义,window.lua:245 起 nil 走双向);
                -- hop 的 Options 类型把 direction 误标为必填(defaults.lua:2),与此不符
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
                -- 无 direction = 双向跳转(hop 的运行时语义,window.lua:245 起 nil 走双向);
                -- hop 的 Options 类型把 direction 误标为必填(defaults.lua:2),与此不符
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
                -- 无 direction = 双向跳转(hop 的运行时语义,window.lua:245 起 nil 走双向);
                -- hop 的 Options 类型把 direction 误标为必填(defaults.lua:2),与此不符
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
                -- 无 direction = 双向跳转(hop 的运行时语义,window.lua:245 起 nil 走双向);
                -- hop 的 Options 类型把 direction 误标为必填(defaults.lua:2),与此不符
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
                -- 同 ,s:无 direction = 双向,hop 类型误标必填
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
