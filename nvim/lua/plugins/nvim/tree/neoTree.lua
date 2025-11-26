return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons", -- optional, but recommended
        -- "3rd/image.nvim",
        "antosha417/nvim-lsp-file-operations",
        {
            "s1n7ax/nvim-window-picker",
            opts = {
                highlights = {
                    enabled = true,
                    statusline = {
                        focused = {
                            fg = '#ffffff',
                            bg = '#7aa2f7',
                            bold = true,
                        },
                        unfocused = {
                            fg = '#000000',
                            bg = '#7aa2f7',
                            bold = true,
                        },
                    },
                },
            },
            config = function(_,opts)
                require('window-picker').setup(opts)
            end
        },
    },
    config = function()
        require('neo-tree').setup({
            window = {
                mappings = {
                    ["O"]  = { "show_help", config = { title = "Order by", prefix_key = "O" } },
                    ["Oc"] = "order_by_created",
                    ["Od"] = "order_by_diagnostics",
                    ["Og"] = "order_by_git_status",
                    ["Om"] = "order_by_modified",
                    ["On"] = "order_by_name",
                    ["Os"] = "order_by_size",
                    ["Ot"] = "order_by_type",
                    ["oc"] = 'noop',
                    ["od"] = 'noop',
                    ["og"] = 'noop',
                    ["om"] = 'noop',
                    ["on"] = 'noop',
                    ["os"] = 'noop',
                    ["ot"] = 'noop',
                    ['o'] = 'open',
                    ['v'] = 'open_vsplit',
                    ['S'] = 'noop',
                    ['s'] = 'open_split',
                    [",<tab>"] = {
                        function(state)
                            local node = state.tree:get_node()
                            vim.fn.system('start ' .. node.path)
                        end,
                        desc = "System Open",
                        nowait = true
                    },
                },
            },
            filesystem = {
                -- use_libuv_file_watcher = true,
                bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
                -- cwd_target = {
                --     sidebar = "tab",   -- sidebar is when position = left or right
                --     current = "window" -- current is when position = current
                -- },
                follow_current_file = {
                    enabled = true,
                },
            },
            event_handlers = {
                {
                    event = 'neo_tree_window_after_open',
                    handler = function(args)
                        if args.position == 'left' or args.position == 'right' then
                            vim.wo.foldcolumn = '0'
                            vim.wo.foldenable = false
                        end
                    end,
                },
            },
        })
        vim.keymap.set('n','<leader>vn', '<cmd>Neotree reveal toggle left reveal_force_cwd<cr>', {remap = false, silent = true, desc='zz:neotree:ToggleLeft'})
        vim.keymap.set('n','<leader>vf', '<cmd>Neotree <cr>', {remap = false, silent = true, desc='zz:neotree:FocusSidebar'})
        vim.keymap.set('n','<leader>vg', '<cmd>Neotree buffers toggle left reveal_force_cwd<cr>', {remap = false, silent = true, desc='zz:neotree:ToggleBuf'})
        vim.keymap.set('n','<leader>vd', '<cmd>Neotree git_status toggle left reveal_force_cwd<cr>', {remap = false, silent = true, desc='zz:neotree:ToggleGitSts'})
        vim.keymap.set('n','<leader>vv', '<cmd>Neotree reveal toggle float reveal_force_cwd<cr>', {remap = false, silent = true, desc='zz:neotree:ToggleLeftFloat'})
        vim.keymap.set('n','<leader>vb', '<cmd>Neotree buffers toggle float reveal_force_cwd<cr>', {remap = false, silent = true, desc='zz:neotree:ToggleBufFloat'})
        vim.keymap.set('n','<leader>vc', '<cmd>Neotree git_status toggle float reveal_force_cwd<cr>', {remap = false, silent = true, desc='zz:neotree:ToggleGitStsFloat'})
    end,
    lazy = false, -- neo-tree will lazily load itself
}

