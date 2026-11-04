return {
    {
        -- startup-load: vim.lsp.enable (config/lsp.lua) resolves server
        -- configs (lsp/lua_ls.lua etc.) from this plugin's runtime dir; with
        -- VeryLazy, buffers opened before UIEnter (e.g. `nvim file.lua` from
        -- the shell) miss the server entirely -- vim.lsp.config[name] is nil
        -- at enable time and nvim never retries the failed buffer.
        -- nvim 0.13 has no builtin lsp/ runtime configs, this plugin is the
        -- only provider.
        'neovim/nvim-lspconfig',
        lazy = false,
    },
    {
        'mason-org/mason-lspconfig.nvim',
        -- lazy: mason/mason-lspconfig are only needed to (re)install
        -- missing servers -- defer them past first draw
        -- keep ensure_installed in sync with the vim.lsp.enable list in
        -- config/lsp.lua; on a new machine missing servers install automatically
        -- (already-installed ones are skipped, no duplicate downloads)
        -- NOTE: mason's bin dir is prepended to PATH in config/lsp.lua so
        -- vim.lsp.enable can spawn mason-only servers before mason loads
        event = 'VeryLazy',
        opts = { ensure_installed = { 'clangd', 'rust_analyzer', 'lua_ls', 'pyright' } },
        dependencies = {
            { 'mason-org/mason.nvim', opts = {}, config = true },
        },
    },
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
            {
                'mfussenegger/nvim-dap',
                dependencies = {
                    { 'mason-org/mason.nvim', opts = {}, config = true },
                    { 'jay-babu/mason-nvim-dap.nvim' },
                },
                opts = {},
                config = function()
                    local dap = require('dap')
                    -- dap.set_log_level('DEBUG') -- verbose dap log every session, removed for perf
                    -- codelldb runs the inferior via a runInTerminal reverse
                    -- request; nvim-dap would spawn it in the terminal buffer
                    -- that dapui's console element CACHEs
                    -- (dapui/elements/console.lua:51), and nvim 0.11+ then
                    -- rejects the reused modified buffer
                    -- ("jobstart(...,{term=true}) requires unmodified buffer",
                    -- nvim-dap-ui#482). Route EVERY session to an external
                    -- console window instead: force_external_terminal covers
                    -- mason's "LLDB: Launch" and cmake-tools' :CMakeDebug
                    -- alike, and cmd /c start "" <prog> guarantees a fresh
                    -- Windows console (stdout never interleaves with the
                    -- nvim TUI), interactive stdin included.
                    dap.defaults.fallback.external_terminal = {
                        command = 'cmd',
                        args = { '/c', 'start', '' },
                    }
                    dap.defaults.fallback.force_external_terminal = true
                    -- mason.nvim is already set up by the lazy dependency
                    -- ({ 'mason-org/mason.nvim', config = true }); calling setup()
                    -- again re-registers the default registries.
                    local pydap = nil
                    if vim.fn.has('win32') == 1 then
                        pydap = function(config)
                            config.adapters = {
                                type = 'executable',
                                command = 'debugpy-adapter',
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

                    -- ensure_installed/automatic_installation come from plugin defaults
                    -- (missing-fields is an annotation-style false positive, see avante case)
                    ---@diagnostic disable-next-line: missing-fields
                    require('mason-nvim-dap').setup({
                        -- ensure_installed = {'codelldb'},
                        handlers = {
                            function(config)
                                require('mason-nvim-dap').default_setup(config)
                            end,
                            -- stop at program entry on launch: no pre-set breakpoint
                            -- needed. NOTE: LLDB stopOnEntry stops inside the CRT
                            -- startup stub (no source info -> codelldb pops a
                            -- disassembly window), so instead keep stopOnEntry off
                            -- and place an automatic LLDB breakpoint on `main` via
                            -- initCommands; the session then stops at main.c source.
                            codelldb = function(config)
                                for _, c in ipairs(config.configurations or {}) do
                                    c.stopOnEntry = false
                                    c.initCommands = { 'breakpoint set --name main' }
                                end
                                require('mason-nvim-dap').default_setup(config)
                            end,
                            python = pydap,
                        },
                    })
                end,
            },
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
            vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
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
