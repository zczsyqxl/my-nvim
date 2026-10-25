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
        { "<leader>va", function() Snacks.notifier.show_history() end, desc = "zz:snacks:Notification History" },
        { "<leader>vh", function() Snacks.notifier.hide() end, desc = "zz:snacks:Dismiss All Notifications" },
        { "<leader>vn", function() Snacks.explorer() end, desc = "zz:snacks:File Explorer" },
        { "<leader>vs", function() Snacks.scratch() end, desc = "zz:snacks:Toggle Scratch Buffer" },
        { "<leader>vd", function() Snacks.scratch.select() end, desc = "zz:snacks:Select Scratch Buffer" },
        { "<leader>vu", function() Snacks.lazygit() end, desc = "zz:snacks:Lazygit" },
        { "<leader>v[", function() Snacks.zen() end, desc = "zz:snacks:Toggle Zen Mode" },
        { "<leader>v]", function() Snacks.zen.zoom() end, desc = "zz:snacks:Toggle Zoom" },
        -- find
        { "<leader>fa", function() Snacks.picker.autocmds() end, desc = "zz:snacks:Autocmds" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "zz:snacks:Buffers" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "zz:snacks:Find Config File" },
        { "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "zz:snacks:Diagnostics" },
        { "<leader>fe", function() Snacks.picker.diagnostics_buffer() end, desc = "zz:snacks:Buffer Diagnostics" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "zz:snacks:Find Files" },
        { "<leader>fg", function() Snacks.picker.git_files() end, desc = "zz:snacks:Find Git Files" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "zz:snacks:Help Pages" },
        { "<leader>fi", function() Snacks.picker.icons() end, desc = "zz:snacks:Icons" },
        { "<leader>fj", function() Snacks.picker.jumps() end, desc = "zz:snacks:Jumps" },
        { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "zz:snacks:Keymaps" },
        { "<leader>fl", function() Snacks.picker.lines() end, desc = "zz:snacks:Buffer Lines" },
        { "<leader>fm", function() Snacks.picker.marks() end, desc = "zz:snacks:Marks" },
        { "<leader>fn", function() Snacks.picker.man() end, desc = "zz:snacks:Man Pages" },
        { "<leader>fo", function() Snacks.picker.loclist() end, desc = "zz:snacks:Location List" },
        { "<leader>fp", function() Snacks.picker.projects() end, desc = "zz:snacks:Projects" },
        { "<leader>fq", function() Snacks.picker.qflist() end, desc = "zz:snacks:Quickfix List" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "zz:snacks:Recent" },
        { "<leader>fs", function() Snacks.picker.resume() end, desc = "zz:snacks:Resume" },
        { "<leader>ft", function() Snacks.picker.highlights() end, desc = "zz:snacks:Highlights" },
        { "<leader>fu", function() Snacks.picker.undo() end, desc = "zz:snacks:Undo History" },
        { "<leader>fv", function() Snacks.picker.notifications() end, desc = "zz:snacks:Notification History" },
        { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "zz:snacks:Visual selection or word", mode = { "n", "x" } },
        { "<leader>fx", function() Snacks.picker.commands() end, desc = "zz:snacks:Commands" },
        { "<leader>fy", function() Snacks.picker.lazy() end, desc = "zz:snacks:Search for Plugin Spec" },
        { "<leader>f;", function() Snacks.picker.command_history() end, desc = "zz:snacks:Command History" },
        { "<leader>f'", function() Snacks.picker.registers() end, desc = "zz:snacks:Registers" },
        { '<leader>f/', function() Snacks.picker.search_history() end, desc = "zz:snacks:Search History" },
        { "<leader>f[", function() Snacks.picker.grep() end, desc = "zz:snacks:Grep" },
        { "<leader>f]", function() Snacks.picker.grep_buffers() end, desc = "zz:snacks:Grep Open Buffers" },
        { "<leader>f,", function() Snacks.picker.lsp_symbols() end, desc = "zz:snacks:LSP Symbols" },
        { "<leader>f.", function() Snacks.picker.lsp_workspace_symbols() end, desc = "zz:snacks:LSP Workspace Symbols" },
        -- git
        { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "zz:snacks:Git Branches" },
        { "<leader>gg", function() Snacks.picker.git_log() end, desc = "zz:snacks:Git Log" },
        { "<leader>gl", function() Snacks.picker.git_log_line() end, desc = "zz:snacks:Git Log Line" },
        { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "zz:snacks:Git Log File" },
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
        { "gl", function() Snacks.picker.lsp_declarations() end, desc = "zz:snacks:Goto Declaration" },
        { "gf", function() Snacks.picker.lsp_references() end, nowait = true, desc = "zz:snacks:References" },
        { "gp", function() Snacks.picker.lsp_implementations() end, desc = "zz:snacks:Goto Implementation" },
        { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "zz:snacks:Goto T[y]pe Definition" },
        { "gi", function() Snacks.picker.lsp_incoming_calls() end, desc = "zz:snacks:C[a]lls Incoming" },
        { "go", function() Snacks.picker.lsp_outgoing_calls() end, desc = "zz:snacks:C[a]lls Outgoing" },

        -- search
        { "<leader>ov", function() Snacks.picker.colorschemes() end, desc = "zz:snacks:Colorschemes" },

        -- Other
        { "<leader>ed", function() Snacks.bufdelete() end, desc = "zz:snacks:Delete Buffer" },
        { "<leader>er", function() Snacks.rename.rename_file() end, desc = "zz:snacks:Rename File" },
        { "<c-/>",      function() Snacks.terminal() end, desc = "zz:snacks:Toggle Terminal" },
        { "<c-_>",      function() Snacks.terminal() end, desc = "zz:snacks:Toggle Terminal" },
        { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "zz:snacks:Next Reference", mode = { "n", "t" } },
        { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "zz:snacks:Prev Reference", mode = { "n", "t" } },
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
                    -- 有意覆盖 nvim 内部实现(runtime editor.lua 的 vim._print)，
                    -- 把 `:=` 的输出路由进 Snacks——官方 snacks 示例的标准写法
                    ---@diagnostic disable-next-line: duplicate-set-field
                    vim._print = function(_, ...)
                        dd(...)
                    end
                else
                    vim.print = _G.dd
                end

                -- Create some toggle mappings
                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>os")
                Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
                Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>or")
                Snacks.toggle.diagnostics():map("<leader>od")
                Snacks.toggle.line_number():map("<leader>ol")
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>oc")
                Snacks.toggle.treesitter():map("<leader>ot")
                Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ob")
                Snacks.toggle.inlay_hints():map("<leader>oh")
                Snacks.toggle.indent():map("<leader>oi")
                Snacks.toggle.dim():map("<leader>om")
            end,
        })
    end,
}
