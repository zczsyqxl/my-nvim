if vim.g.vscode then
    return {}
else
    return {
        {
            'mason-org/mason-lspconfig.nvim',
            opts = {},
            dependencies = {
                {
                    'neovim/nvim-lspconfig'
                },
                {
                    'rcarriga/nvim-dap-ui',
                    dependencies = {
                        {'nvim-neotest/nvim-nio'},
                        {
                            'mfussenegger/nvim-dap',
                            dependencies = {
                                {'mason-org/mason.nvim'},
                                {'jay-babu/mason-nvim-dap.nvim'},
                            },
                            opts = {},
                            config = function()
                                require('mason').setup()
                                require('mason-nvim-dap').setup({
                                    -- ensure_installed = {'codelldb'},
                                    handlers = {
                                        function(config)
                                            require('mason-nvim-dap').default_setup(config)
                                        end,
                                    }
                                })
                                -- local dap = require('dap')
                                -- dap.adapters.codelldb = {
                                --     type = 'executable',
                                --     command = [[C:\Users\yingqi.zhang\AppData\Local\nvim-data\mason\packages\codelldb\extension\adapter\codelldb.exe]]
                                -- }
                                -- dap.configurations.c = {
                                --     {
                                --         name = 'Launch file',
                                --         type = 'codelldb',
                                --         request = 'launch',
                                --         program = function()
                                --             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                                --         end,
                                --         cwd = '${workspaceFolder}',
                                --         stopOnEntry = false,
                                --         -- externalConsole = true,
                                --     },
                                -- }
                                -- dap.set_log_level('DEBUG')
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
                        require('dapui').setup()
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
                    end
                }
            }
        },
    }
end
