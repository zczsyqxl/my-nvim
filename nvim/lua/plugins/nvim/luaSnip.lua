return {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load({
            paths = {
                vim.fn.stdpath('config') .. '/snippets',
            },
        })
        local ls = require('luasnip')
        local types = require('luasnip.util.types')

        ls.setup({
            ext_opts = {
                [types.insertNode] = {
                    -- these ext_opts are applied when the node is active (e.g. it has been
                    -- jumped into, and not out yet).
                    active = {
                        -- highlight the text inside the node red.
                        -- virt_text = {{"▶", "ZZ.ViHolder"}},
                        -- hl_group = "ZZ.ViHolder"
                    },
                    -- these ext_opts are applied when the node is not active, but
                    -- the snippet still is.
                    passive = {
                        -- add virtual text on the line of the node, behind all text.
                        -- virt_text = {{"«", "ZZ.UnHolder"}},
                        -- hl_group = "ZZ.UnHolder"
                    },
                    -- visited or unvisited are applied when a node was/was not jumped into.
                    visited = {
                        hl_group = 'ZZ.ViHolder',
                    },
                    unvisited = {
                        hl_group = 'ZZ.UnHolder',
                    },
                    snippet_passive = {},
                },
                [types.choiceNode] = {
                    -- these ext_opts are applied when the node is active (e.g. it has been
                    -- jumped into, and not out yet).
                    active = {
                        -- highlight the text inside the node red.
                        -- virt_text = {{"▶", "ZZ.ViHolder"}},
                        -- hl_group = "ZZ.ViHolder"
                    },
                    -- these ext_opts are applied when the node is not active, but
                    -- the snippet still is.
                    passive = {
                        -- add virtual text on the line of the node, behind all text.
                        -- virt_text = {{"«", "ZZ.UnHolder"}},
                        -- hl_group = "ZZ.UnHolder"
                    },
                    -- visited or unvisited are applied when a node was/was not jumped into.
                    visited = {
                        hl_group = 'ZZ.ViHolder',
                    },
                    unvisited = {
                        hl_group = 'ZZ.UnHolder',
                    },
                    snippet_passive = {},
                },

                [types.snippet] = {
                    -- these ext_opts are applied when the node is active (e.g. it has been
                    -- jumped into, and not out yet).
                    active = {
                        -- highlight the text inside the node red.
                        -- virt_text = {{"▶", "ZZ.ViHolder"}},
                        -- hl_group = "ZZ.ViHolder"
                    },
                    -- these ext_opts are applied when the node is not active, but
                    -- the snippet still is.
                    passive = {
                        -- add virtual text on the line of the node, behind all text.
                        -- virt_text = {{"«", "ZZ.UnHolder"}},
                        -- hl_group = "ZZ.UnHolder"
                    },
                    -- visited or unvisited are applied when a node was/was not jumped into.
                    visited = {
                        -- hl_group = "ZZ.ViHolder"
                    },
                    unvisited = {
                        -- hl_group = "ZZ.UnHolder"
                    },
                    snippet_passive = {},
                },
            },
        })

        -- vim.keymap.set({"i"}, "<A-i>", function() ls.expand() end, {silent = true, desc = 'zz:LuaSnip:expand'})
        vim.keymap.set({ 'i', 's' }, '<A-l>', function()
            ls.jump(1)
        end, { silent = true, desc = 'zz:LuaSnip:JumpNext' })
        vim.keymap.set({ 'i', 's' }, '<A-h>', function()
            ls.jump(-1)
        end, { silent = true, desc = 'zz:LuaSnip:JumpPrev' })
        -- vim.keymap.set({"i", "s", "n"}, "<A-o>", function() ls.unlink_current() end, {silent = true, desc = 'zz:LuaSnip:Cancel'})
        vim.keymap.set({ 'n' }, '<esc>', function()
            ls.unlink_current()
        end, { silent = true, desc = 'zz:LuaSnip:Cancel' })

        vim.keymap.set({ 'i', 's' }, '<A-j>', function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, { silent = true, desc = 'zz:LuaSnip:ChangeChoiceNext' })

        vim.keymap.set({ 'i', 's' }, '<A-k>', function()
            if ls.choice_active() then
                ls.change_choice(-1)
            end
        end, { silent = true, desc = 'zz:LuaSnip:ChangeChoicePrev' })
    end,
}
