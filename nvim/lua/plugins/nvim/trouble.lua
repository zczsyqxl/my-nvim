return {
    "folke/trouble.nvim",
    opts = {
        modes = {
            symbols = {
                -- The default kind whitelist excludes Variable/Constant
                -- (outline convention). Arrays are force-merged by index in
                -- Trouble, so the built-in list is copied in full with the
                -- two extra kinds appended.
                filter = {
                    -- keep: lua_ls reports require/control-flow blocks as Package
                    ['not'] = { ft = 'lua', kind = 'Package' },
                    any = {
                        -- keep: help/markdown symbols bypass the kind whitelist
                        ft = { 'help', 'markdown' },
                        kind = {
                            'Class', 'Constructor', 'Enum', 'Field', 'Function',
                            'Interface', 'Method', 'Module', 'Namespace', 'Package',
                            'Property', 'Struct', 'Trait',
                            'Variable', 'Constant',
                            -- NOTE: lua_ls fine-grained kinds (String/Array/Object/
                            -- Number/Boolean) were tried and reverted: they only
                            -- match config-table fields (desc strings etc.), which
                            -- drowns plain-config files in noise. Pure `return {...}`
                            -- files like this one stay intentionally empty.
                        },
                    },
                },
            },
        },
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>vd",
            "<cmd>Trouble diagnostics toggle focus=true<cr>",
            desc = "zz:trouble:Diagnostics (Trouble)",
        },
        {
            "<leader>vD",
            "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
            desc = "zz:trouble:Buffer Diagnostics (Trouble)",
        },
        {
            "<leader>v,",
            "<cmd>Trouble symbols toggle focus=true<cr>",
            desc = "zz:trouble:Symbols (Trouble)",
        },
        {
            "<leader>vx",
            "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
            desc = "zz:trouble:LSP Definitions / references / ... (Trouble)",
        },
        {
            "<leader>vL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "zz:trouble:Location List (Trouble)",
        },
        {
            "<leader>vQ",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "zz:trouble:Quickfix List (Trouble)",
        },
    },
}
