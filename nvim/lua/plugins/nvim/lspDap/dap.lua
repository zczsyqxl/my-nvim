-- nvim-dap: the DAP client + adapters/launch configs registration.
-- Split from lspDap.lua (2026-11-05). TIMING NOTE: this spec was previously
-- nested inside nvim-dap-ui's dependencies, which made it load with dap-ui.
-- Now that it is a top-level spec it would default to startup loading, so
-- `lazy = true` keeps it deferred: it loads exactly when a dependent needs it
-- (dap-ui lists it as a dependency; dap-ui itself loads on the F6-F12 keys /
-- :Dap* commands) -- same effective load time as before the split.
return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        dependencies = {
            { 'mason-org/mason.nvim', opts = {}, config = true },
            { 'jay-babu/mason-nvim-dap.nvim' },
        },
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

            -- Rust-specific launch: auto-pick binaries from target/debug so
            -- the exe path never has to be typed. Prepended (not appended):
            -- table.insert(list, 1, item) puts this FIRST in the F7 picker,
            -- above mason-nvim-dap's shared "LLDB: Launch" entries.
            -- NOTE: no initCommands here: in a Rust binary `main` is the
            -- rustc-generated shim (no usable source line -> codelldb opens
            -- disassembly); put a source breakpoint (F10) in your own
            -- fn main() instead.
            dap.configurations.rust = dap.configurations.rust or {}
            table.insert(dap.configurations.rust, 1, {
                name = 'Rust: Launch (auto bin)',
                type = 'codelldb',
                request = 'launch',
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                program = function()
                    -- top-level *.exe are exactly the bin targets
                    -- (build-script/test binaries live in build/ and deps/)
                    local bins = vim.fn.glob('target/debug/*.exe', false, true)
                    if #bins == 0 then
                        -- not a cargo project root (or not built yet):
                        -- fall back to the manual path prompt
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                    end
                    if #bins == 1 then
                        return bins[1]
                    end
                    -- multiple bins: pick one. ui.select is async, so wrap
                    -- in a coroutine (same pattern as mason-nvim-dap's
                    -- get_dll in configurations.lua)
                    return coroutine.create(function(dap_run_co)
                        vim.ui.select(bins, { prompt = 'Select binary: ' }, function(choice)
                            coroutine.resume(dap_run_co, choice or bins[1])
                        end)
                    end)
                end,
            })
        end,
    },
}
