return {
    {
        'mason-org/mason-lspconfig.nvim',
        -- lazy: LSP itself runs on vim.lsp.enable + nvim's builtin runtime
        -- configs, mason/mason-lspconfig are only needed to (re)install
        -- missing servers -- defer them past first draw
        -- keep ensure_installed in sync with the vim.lsp.enable list in
        -- config/lsp.lua; on a new machine missing servers install automatically
        -- (already-installed ones are skipped, no duplicate downloads)
        event = 'VeryLazy',
        opts = { ensure_installed = { 'clangd', 'rust_analyzer', 'lua_ls', 'pyright' } },
        dependencies = {
            'neovim/nvim-lspconfig',
            { 'mason-org/mason.nvim', opts = {}, config = true },
        },
    },
    {
        'rcarriga/nvim-dap-ui',
        -- lazy-load the whole debug stack on the F1-F12 debug keys: mappings
        -- exist at startup, nvim-dap/nvim-dap-ui/mason-* only load on first
        -- press; :Dap* commands get lazy shims too
        cmd = { 'DapNew', 'DapContinue', 'DapPause', 'DapStepOver', 'DapStepInto', 'DapStepOut', 'DapTerminate', 'DapToggleBreakpoint' },
        keys = {
            { '<F4>', desc = 'zz:DAP:CmakeDebug' },
            { '<F5>', desc = 'zz:DAP:New' },
            { '<F6>', desc = 'zz:DAP:Pause' },
            { '<F7>', desc = 'zz:DAP:Continue' },
            { '<F8>', desc = 'zz:DAP:StepOver' },
            { '<F9>', desc = 'zz:DAP:ToggleBreakpoint' },
            { '<F10>', desc = 'zz:DAP:StepInto' },
            { '<F11>', desc = 'zz:DAP:StepOut' },
            { '<F12>', desc = 'zz:DAP:Terminate' },
            { '<F1>', desc = 'zz:dapui:open' },
            { '<F2>', desc = 'zz:dapui:close' },
            { '<F3>', desc = 'zz:dapui:toggle' },
        },
        dependencies = {
            { 'nvim-neotest/nvim-nio' },
            {
                'mfussenegger/nvim-dap',
                dependencies = {
                    { 'mason-org/mason.nvim', opts = {}, config = true },
                    { 'jay-babu/mason-nvim-dap.nvim' },
                },
                opts = {},
                config = function()
                    -- local dap = require('dap')
                    -- dap.set_log_level('DEBUG') -- verbose dap log every session, removed for perf
                    -- dap.defaults.fallback.external_terminal = {
                    --     command = [[pwsh]],
                    --     args = {'-NoExit'},
                    -- }
                    -- dap.defaults.fallback.force_external_terminal = true
                    -- mason.nvim is already set up by the lazy dependency
                    -- ({ 'mason-org/mason.nvim', config = true }); calling setup()
                    -- again re-registers the default registries.
                    local pydap = nil
                    if vim.fn.has('win32') == 1 then
                        pydap = function(config)
                            config.adapters = {
                                type = 'executable',
                                command = 'python',
                                args = {
                                    '-m',
                                    'debugpy.adapter',
                                },
                            }
                            config.configurations = {
                                {
                                    type = 'python',
                                    request = 'launch',
                                    name = 'Launch Current File',
                                    program = '${file}', -- debug the current file
                                    -- pythonPath = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe",
                                    console = 'integratedTerminal',
                                },
                                {
                                    type = 'python',
                                    request = 'launch',
                                    name = 'Run Script With Args',
                                    program = '${file}',
                                    args = { 'arg2', 'arg2' },
                                    -- pythonPath = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe",
                                    console = 'integratedTerminal',
                                },
                            }
                            -- print(vim.inspect(require("dap").adapters.python))
                            -- print(vim.inspect(require("dap").configurations.c))
                            require('mason-nvim-dap').default_setup(config)
                        end
                    end

                    -- ensure_installed/automatic_installation 由插件默认值提供
                    --(missing-fields 为类型标注风格误报,同 avante 案例)
                    ---@diagnostic disable-next-line: missing-fields
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
                            --             console = "externalTerminal",  -- <== key
                            --         },
                            --     }
                            --     require('mason-nvim-dap').default_setup(config)
                            -- end,
                            python = pydap,
                        },
                    })

                    vim.keymap.set('n', '<F4>', '<cmd>CMakeDebug<cr>', { remap = false, silent = true, desc = 'zz:DAP:CmakeDebug' })
                    vim.keymap.set('n', '<F5>', '<cmd>DapNew<cr>', { remap = false, silent = true, desc = 'zz:DAP:New' })
                    vim.keymap.set('n', '<F6>', '<cmd>DapPause<cr>', { remap = false, silent = true, desc = 'zz:DAP:Pause' })
                    vim.keymap.set('n', '<F7>', '<cmd>DapContinue<cr>', { remap = false, silent = true, desc = 'zz:DAP:Continue' })
                    vim.keymap.set('n', '<F8>', '<cmd>DapStepOver<cr>', { remap = false, silent = true, desc = 'zz:DAP:StepOver' })
                    vim.keymap.set('n', '<F9>', '<cmd>DapToggleBreakpoint<cr>', { remap = false, silent = true, desc = 'zz:DAP:ToggleBreakpoint' })
                    vim.keymap.set('n', '<F10>', '<cmd>DapStepInto<cr>', { remap = false, silent = true, desc = 'zz:DAP:StepInto' })
                    vim.keymap.set('n', '<F11>', '<cmd>DapStepOut<cr>', { remap = false, silent = true, desc = 'zz:DAP:StepOut' })
                    vim.keymap.set('n', '<F12>', '<cmd>DapTerminate<cr>', { remap = false, silent = true, desc = 'zz:DAP:Terminate' })
                end,
            },
        },
        config = function()
            -- dapui 声明的必填字段(wrap/icons/...)运行时与默认值合并,误报(同 avante 案例)
            ---@diagnostic disable-next-line: missing-fields
            require('dapui').setup({
                layouts = {
                    {
                        elements = {
                            {
                                id = 'scopes',
                                size = 0.25,
                            },
                            {
                                id = 'breakpoints',
                                size = 0.25,
                            },
                            {
                                id = 'stacks',
                                size = 0.25,
                            },
                            {
                                id = 'watches',
                                size = 0.25,
                            },
                        },
                        position = 'left',
                        size = 40,
                    },
                    {
                        elements = {
                            {
                                id = 'repl',
                                size = 0.5,
                            },
                            {
                                id = 'console',
                                size = 0.5,
                            },
                        },
                        position = 'bottom',
                        size = 10,
                    },
                },
            })
            local dap, dapui = require('dap'), require('dapui')
            -- nvim-dap 的 listeners 用 setmetatable 动态自建(dap.lua:124),
            -- LuaLS 无法静态解析,下面 4 处访问逐行压制
            ---@diagnostic disable-next-line: undefined-field
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            ---@diagnostic disable-next-line: undefined-field
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            ---@diagnostic disable-next-line: undefined-field
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            ---@diagnostic disable-next-line: undefined-field
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            vim.keymap.set('n', '<F1>', function()
                require('dapui').open()
            end, { remap = false, silent = true, desc = 'zz:dapui:open' })
            vim.keymap.set('n', '<F2>', function()
                require('dapui').close()
            end, { remap = false, silent = true, desc = 'zz:dapui:close' })
            vim.keymap.set('n', '<F3>', function()
                require('dapui').toggle()
            end, { remap = false, silent = true, desc = 'zz:dapui:toggle' })
            vim.keymap.set('n', '<leader>va', function()
                require('dapui').toggle()
            end, { remap = false, silent = true, desc = 'zz:dapui:toggle' })
            vim.keymap.set('n', '<leader>vt', function()
                -- FloatElementArgs 的必填字段运行时有默认值,误报
                ---@diagnostic disable-next-line: missing-fields
                require('dapui').float_element('console', { position = 'center', title = 'dap-terminal-float' })
            end, { remap = false, silent = true, desc = 'zz:dapui:FlotTerm' })
        end,
    },
}
