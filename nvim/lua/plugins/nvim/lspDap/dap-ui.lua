-- nvim-dap-ui: the DAP UI (scopes/breakpoints/stacks/watches + repl) and the
-- F6-F14 debug keymaps that lazy-load the whole debug stack.
-- Split from lspDap.lua (2026-11-05); timing unchanged (keys/cmd handlers).
-- nvim-dap itself is configured in lspDap/dap.lua; referencing it here as a
-- bare dependency keeps the original load order: keys/cmd -> dap-ui ->
-- (nio, nvim-dap -> mason, mason-nvim-dap) -> dap config -> dapui config.
return {
    {
        'rcarriga/nvim-dap-ui',
        -- lazy-load the whole debug stack on the F6-F14 debug keys: mappings
        -- exist at startup, nvim-dap/nvim-dap-ui/mason-* only load on first
        -- press; :Dap* commands get lazy shims too
        cmd = { 'DapNew', 'DapContinue', 'DapPause', 'DapStepOver', 'DapStepInto', 'DapStepOut', 'DapTerminate', 'DapToggleBreakpoint' },
        -- real mappings live in keys{} only: lazy loads the whole debug stack
        -- on first press, then runs the rhs (single source of truth; also
        -- fixes <leader>vd/<leader>vt not existing before the first load)
        keys = {
            -- extra opts (silent/remap/nowait) in entries are forwarded verbatim
            -- to the final vim.keymap.set by lazy's keys handler
            { '<F13>', '<cmd>CMakeDebug<cr>', silent = true, desc = 'zz:DAP:CmakeDebug' },
            { '<F14>', '<cmd>DapNew<cr>', silent = true, desc = 'zz:DAP:New' },
            { '<F6>', '<cmd>DapPause<cr>', silent = true, desc = 'zz:DAP:Pause' },
            { '<F7>', '<cmd>DapContinue<cr>', silent = true, desc = 'zz:DAP:Continue' },
            { '<F8>', '<cmd>DapStepOver<cr>', silent = true, desc = 'zz:DAP:StepOver' },
            { '<F9>', '<cmd>DapToggleBreakpoint<cr>', silent = true, desc = 'zz:DAP:ToggleBreakpoint' },
            { '<F10>', '<cmd>DapStepInto<cr>', silent = true, desc = 'zz:DAP:StepInto' },
            { '<F11>', '<cmd>DapStepOut<cr>', silent = true, desc = 'zz:DAP:StepOut' },
            { '<F12>', '<cmd>DapTerminate<cr>', silent = true, desc = 'zz:DAP:Terminate' },
            {
                '<leader>vb',
                function()
                    require('dapui').toggle()
                end,
                silent = true,
                desc = 'zz:dapui:toggle',
            },
            {
                '<leader>va',
                function()
                    -- FloatElementArgs "required" fields have runtime defaults; false positive
                    ---@diagnostic disable-next-line: missing-fields
                    require('dapui').float_element('console', { position = 'center', title = 'dap-terminal-float' })
                end,
                silent = true,
                desc = 'zz:dapui:FlotTerm',
            },
        },
        dependencies = {
            { 'nvim-neotest/nvim-nio' },
            'mfussenegger/nvim-dap', -- spec + config live in lspDap/dap.lua
        },
        config = function()
            -- dapui's "required" fields (wrap/icons/...) merge with defaults at runtime;
            -- false positive (avante case)
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
                                size = 1.0,
                            },
                            -- {
                            --     id = 'console',
                            --     size = 0.5,
                            -- },
                        },
                        position = 'bottom',
                        size = 10,
                    },
                },
            })
            local dap, dapui = require('dap'), require('dapui')
            -- nvim-dap's built-in sign defaults set texthl = 'SignColumn' for every
            -- dap sign (lua/dap.lua signs table), which renders the breakpoint "B"
            -- and the stopped arrow in theme-gray. Redefine them here (after dap
            -- loads, so this overrides dap.lua's defaults) with the Dap* texthls
            -- defined in theme/zz.lua.
            vim.fn.sign_define('DapBreakpoint', { text = 'B', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
            vim.fn.sign_define('DapBreakpointCondition', { text = 'C', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
            vim.fn.sign_define('DapBreakpointRejected', { text = 'R', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })
            vim.fn.sign_define('DapLogPoint', { text = 'L', texthl = 'DapLogPoint', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DapStopped', linehl = '', numhl = '' })
            -- nvim-dap builds listeners dynamically with setmetatable (dap.lua:124);
            -- LuaLS can't resolve them statically — suppress each of the 4 accesses below
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
                -- KNOWN CRASH (igorlfs/nvim-dap-view#186, Windows + codelldb):
                -- closing dap windows immediately when the adapter disconnects
                -- segfaults nvim (exit code 0xC0000005, no VimLeavePre fires).
                -- Defer the close so the adapter teardown finishes first.
                vim.defer_fn(function()
                    dapui.close()
                end, 1000)
            end
            ---@diagnostic disable-next-line: undefined-field
            dap.listeners.before.event_exited.dapui_config = function()
                vim.defer_fn(function()
                    dapui.close()
                end, 1000)
            end
        end,
    },
}
