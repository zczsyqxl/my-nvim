return {
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {},
        dependencies = {
            {
                {'neovim/nvim-lspconfig'},
                {'mason-org/mason.nvim', opts={}, config=true},
            },
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            {'nvim-neotest/nvim-nio'},
            {
                'mfussenegger/nvim-dap',
                dependencies = {
                    {'mason-org/mason.nvim', opts={}, config=true},
                    {'jay-babu/mason-nvim-dap.nvim'},
                },
                opts = {},
                config = function()
                    local dap = require('dap')
                    dap.set_log_level('DEBUG')
                    -- dap.defaults.fallback.external_terminal = {
                    --     command = [[pwsh]],
                    --     args = {'-NoExit'},
                    -- }
                    -- dap.defaults.fallback.force_external_terminal = true
                    require('mason').setup()
                    require('mason-nvim-dap').setup({
                        -- ensure_installed = {'codelldb'},
                        handlers = {
                            function(config)
                                require('mason-nvim-dap').default_setup(config)
                            end,
                            -- codelldb = function(config)
                            --     config.adapters = {
                            --         type = 'server',
                            --         port = "${port}",
                            --         executable = {
                            --             command = vim.fn.stdpath('data') .. '/mason/bin/codelldb.cmd',
                            --             args = {"--port", "${port}"},
                            --         }
                            --     }
                            --
                            --     config.configurations = {
                            --         {
                            --             name = "Launch (CMD)",
                            --             type = "codelldb",
                            --             request = "launch",
                            --             program = function()
                            --                 return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '\\build\\', 'file')
                            --             end,
                            --             cwd = '${workspaceFolder}',
                            --             stopOnEntry = false,
                            --             console = "externalTerminal",  -- <== 关键
                            --         },
                            --     }
                            --     require('mason-nvim-dap').default_setup(config)
                            -- end,
                            python = function(config)
                                config.adapters = {
                                    type = "executable",
                                    command = "python",
                                    args = {
                                        "-m",
                                        "debugpy.adapter",
                                    }
                                }
                                config.configurations = {
                                    {
                                        type = "python",
                                        request = "launch",
                                        name = "Launch Current File",
                                        program = "${file}",  -- 调试当前文件
                                        -- pythonPath = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe",
                                        console = "integratedTerminal",
                                    },
                                    {
                                        type = "python",
                                        request = "launch",
                                        name = "Run Script With Args",
                                        program = "${file}",
                                        args = { "arg2", "arg2" },
                                        -- pythonPath = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe",
                                        console = "integratedTerminal",
                                    },
                                }
                                -- print(vim.inspect(require("dap").adapters.python))
                                -- print(vim.inspect(require("dap").configurations.c))
                                require('mason-nvim-dap').default_setup(config)
                            end,
                        }
                    })

                    vim.keymap.set('n', '<F4>', '<cmd>CMakeDebug<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F5>', '<cmd>DapNew<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<S-F5>', '<cmd>DapTerminate<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F6>', '<cmd>DapPause<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F7>', '<cmd>DapContinue<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<S-F7>', '<cmd>DapTerminate<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F8>', '<cmd>DapStepOver<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F9>', '<cmd>DapToggleBreakpoint<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F10>', '<cmd>DapStepInto<cr>', {remap = false, silent = true})
                    vim.keymap.set('n', '<F11>', '<cmd>DapStepOut<cr>', {remap = false, silent = true})
                end
            }
        },
        config = function()
            require('dapui').setup({
                layouts = {
                    {
                        elements = {
                            {
                                id = "scopes",
                                size = 0.25
                            },
                            {
                                id = "breakpoints",
                                size = 0.25
                            },
                            {
                                id = "stacks",
                                size = 0.25
                            },
                            {
                                id = "watches",
                                size = 0.25
                            }
                        },
                        position = "left",
                        size = 40
                    },
                    {
                        elements = {
                            {
                                id = "repl",
                                size = 0.5
                            },
                            {
                                id = "console",
                                size = 0.5
                            }
                        },
                        position = "bottom",
                        size = 10
                    },
                },
            })
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            vim.keymap.set('n', '<F1>', function() require('dapui').open() end, {remap = false, silent = true})
            vim.keymap.set('n', '<F2>', function() require('dapui').close() end, {remap = false, silent = true})
            vim.keymap.set('n', '<F3>', function() require('dapui').toggle() end, {remap = false, silent = true})
            vim.keymap.set('n', '<leader>va', function() require('dapui').toggle() end, {remap = false, silent = true})
            vim.keymap.set('n', '<leader>vt', function() require('dapui').float_element('console',{position = 'center', title = 'dap-terminal-float'}) end, {remap = false, silent = true})

        end
    }
}



