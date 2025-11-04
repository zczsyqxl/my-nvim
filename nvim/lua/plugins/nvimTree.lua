if vim.g.vscode then
    return {}
elseif false then
    return {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            config = function()
                local my_system_open = {}
                if vim.fn.has('win32') == 1 then
                    my_system_open = {
                        cmd = "cmd",
                        args = {"/c", "start", ""},
                    }
                end
                require('nvim-tree').setup({
                    system_open = my_system_open
                })
                vim.keymap.set('n', '<leader>vn', '<cmd>NvimTreeFindFileToggle<cr>', { remap=false, silent=true})
                vim.keymap.set('n', '<leader>vf', '<cmd>NvimTreeFindFile<cr>', { remap=false, silent=true})
            end
        }
    }
else
    return {
        {
            "nvim-neo-tree/neo-tree.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "nvim-tree/nvim-web-devicons", -- optional, but recommended
            },
            config = function()
                require('neo-tree').setup({
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
                vim.keymap.set('n','<leader>vn', '<cmd>Neotree reveal toggle left reveal_force_cwd<cr>', {remap = false, silent = true})
                vim.keymap.set('n','<leader>vd', '<cmd>Neotree <cr>', {remap = false, silent = true})
                vim.keymap.set('n','<leader>vf', '<cmd>Neotree buffers toggle left reveal_force_cwd<cr>', {remap = false, silent = true})
                vim.keymap.set('n','<leader>vg', '<cmd>Neotree git_status toggle left reveal_force_cwd<cr>', {remap = false, silent = true})
                vim.keymap.set('n','<leader>vv', '<cmd>Neotree reveal toggle float reveal_force_cwd<cr>', {remap = false, silent = true})
                vim.keymap.set('n','<leader>vb', '<cmd>Neotree buffers toggle float reveal_force_cwd<cr>', {remap = false, silent = true})
                vim.keymap.set('n','<leader>vc', '<cmd>Neotree git_status toggle float reveal_force_cwd<cr>', {remap = false, silent = true})
            end,
            lazy = false, -- neo-tree will lazily load itself
        }
    }
end
