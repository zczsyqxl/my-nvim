return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        dashboard = require('plugins.snacks.dashboard'),
        picker = require('plugins.snacks.picker'),
        indent = require('plugins.snacks.indent'),
        bigfile = { enabled = true },
        explorer = { enabled = true },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            }
        },
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "zz:snacks:Smart Find Files" },
        { "<leader>v.", function() Snacks.notifier.show_history() end, desc = "zz:snacks:Notifier show History" },
        { "<leader>v>", function() Snacks.notifier.hide() end, desc = "zz:snacks:Dismiss All Notifications" },
        { "<leader>vn", function() Snacks.explorer() end, desc = "zz:snacks:File Explorer" },
        { "<leader>vs", function() Snacks.scratch() end, desc = "zz:snacks:Toggle Scratch Buffer" },
        { "<leader>vS", function() Snacks.scratch.select() end, desc = "zz:snacks:Select Scratch Buffer" },
        { "<leader>vu", function() Snacks.lazygit() end, desc = "zz:snacks:Lazygit" },
        { "<leader>v[", function() Snacks.zen() end, desc = "zz:snacks:Toggle Zen Mode" },
        { "<leader>v]", function() Snacks.zen.zoom() end, desc = "zz:snacks:Toggle Zoom" },
        -- find
        { "<leader>fa", function() Snacks.picker.autocmds() end, desc = "zz:snacks:Autocmds" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "zz:snacks:Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "zz:snacks:Find Config File" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "zz:snacks:Diagnostics" },
        { "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, desc = "zz:snacks:Buffer Diagnostics" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "zz:snacks:Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "zz:snacks:Find Git Files" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "zz:snacks:Help Pages" },
        { "<leader>fH", function() Snacks.picker.highlights() end, desc = "zz:snacks:Highlights" },
        { "<leader>fi", function() Snacks.picker.icons() end, desc = "zz:snacks:Icons" },
        { "<leader>fj", function() Snacks.picker.jumps() end, desc = "zz:snacks:Jumps" },
        { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "zz:snacks:Keymaps" },
        { "<leader>fl", function() Snacks.picker.lines() end, desc = "zz:snacks:Buffer Lines" },
        { "<leader>fL", function() Snacks.picker.loclist() end, desc = "zz:snacks:Location List" },
        { "<leader>fm", function() Snacks.picker.man() end, desc = "zz:snacks:Man Pages" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "zz:snacks:Projects" },
        { "<leader>fq", function() Snacks.picker.qflist() end, desc = "zz:snacks:Quickfix List" },
        { "<leader>fr", function() Snacks.picker.resume() end, desc = "zz:snacks:Resume" },
        { "<leader>fR", function() Snacks.picker.recent() end, desc = "zz:snacks:Recent" },
        { "<leader>fu", function() Snacks.picker.undo() end, desc = "zz:snacks:Undo History" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "zz:snacks:Visual selection or word", mode = { "n", "x" } },
        { "<leader>fy", function() Snacks.picker.lazy() end, desc = "zz:snacks:Search for Plugin Spec" },
        { "<leader>f;", function() Snacks.picker.command_history() end, desc = "zz:snacks:Command History" },
        { "<leader>f:", function() Snacks.picker.commands() end, desc = "zz:snacks:Commands" },
        { "<leader>f'", function() Snacks.picker.marks() end, desc = "zz:snacks:Marks" },
        { '<leader>f"', function() Snacks.picker.registers() end, desc = "zz:snacks:Registers" },
        { '<leader>f/', function() Snacks.picker.search_history() end, desc = "zz:snacks:Search History" },
        { "<leader>f[", function() Snacks.picker.grep() end, desc = "zz:snacks:Grep" },
        { "<leader>f]", function() Snacks.picker.grep_buffers() end, desc = "zz:snacks:Grep Open Buffers" },
        { "<leader>f,", function() Snacks.picker.lsp_symbols() end, desc = "zz:snacks:LSP Symbols" },
        { "<leader>f<", function() Snacks.picker.lsp_workspace_symbols() end, desc = "zz:snacks:LSP Workspace Symbols" },
        { "<leader>f.", function() Snacks.picker.notifications() end, desc = "zz:snacks:Notification History" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "zz:snacks:Git Branches" },
        { "<leader>glg", function() Snacks.picker.git_log() end, desc = "zz:snacks:Git Log" },
        { "<leader>gll", function() Snacks.picker.git_log_line() end, desc = "zz:snacks:Git Log Line" },
        { "<leader>glf", function() Snacks.picker.git_log_file() end, desc = "zz:snacks:Git Log File" },
        { "<leader>gs", function() Snacks.picker.git_status() end, desc = "zz:snacks:Git Status" },
        { "<leader>gh", function() Snacks.picker.git_stash() end, desc = "zz:snacks:Git Stash" },
        { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "zz:snacks:Git Diff (Hunks)" },
        -- gh
        { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "zz:snacks:GitHub Issues (open)" },
        { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "zz:snacks:GitHub Issues (all)" },
        { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "zz:snacks:GitHub Pull Requests (open)" },
        { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "zz:snacks:GitHub Pull Requests (all)" },

        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "zz:snacks:Goto Definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "zz:snacks:Goto Declaration" },
        { "gf", function() Snacks.picker.lsp_references() end, nowait = true, desc = "zz:snacks:References" },
        { "gp", function() Snacks.picker.lsp_implementations() end, desc = "zz:snacks:Goto Implementation" },
        { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "zz:snacks:Goto T[y]pe Definition" },
        { "gi", function() Snacks.picker.lsp_incoming_calls() end, desc = "zz:snacks:C[a]lls Incoming" },
        { "go", function() Snacks.picker.lsp_outgoing_calls() end, desc = "zz:snacks:C[a]lls Outgoing" },

        -- search
        { "<leader>bC", function() Snacks.picker.colorschemes() end, desc = "zz:snacks:Colorschemes" },

        -- Other
        { "<leader>ed", function() Snacks.bufdelete() end, desc = "zz:snacks:Delete Buffer" },
        { "<leader>er", function() Snacks.rename.rename_file() end, desc = "zz:snacks:Rename File" },
        { "<c-/>",      function() Snacks.terminal() end, desc = "zz:snacks:Toggle Terminal" },
        { "<c-_>",      function() Snacks.terminal() end, desc = "zz:snacks:Toggle Terminal" },
        { "]s",         function() Snacks.words.jump(vim.v.count1) end, desc = "zz:snacks:Next Reference", mode = { "n", "t" } },
        { "[s",         function() Snacks.words.jump(-vim.v.count1) end, desc = "zz:snacks:Prev Reference", mode = { "n", "t" } },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        }
    },
    init = function()
        vim.g.snacks_animate = false
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end

                -- Override print to use snacks for `:=` command
                if vim.fn.has("nvim-0.11") == 1 then
                    -- intentionally override nvim's internal implementation
                    -- (runtime editor.lua's vim._print), routing `:=` output
                    -- through Snacks — the standard pattern from the official
                    -- snacks example
                    ---@diagnostic disable-next-line: duplicate-set-field
                    vim._print = function(_, ...)
                        dd(...)
                    end
                else
                    vim.print = _G.dd
                end

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>bs")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>bw")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>br")
                Snacks.toggle.diagnostics():map("<leader>bd")
                Snacks.toggle.line_number():map("<leader>bl")
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>bc")
                Snacks.toggle.treesitter():map("<leader>bt")
                Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>bb")
                Snacks.toggle.inlay_hints():map("<leader>bh")
                Snacks.toggle.indent():map("<leader>bi")
                Snacks.toggle.dim():map("<leader>bD")
            end,
        })
    end,
}
