return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter",
            branch = "main",
            config = function()
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "llm", "markdown" },
                    callback = function()
                        vim.treesitter.start(0, "markdown")
                    end,
                })
            end,
        },
    }, -- if you use standalone mini plugins
    ft = { "markdown", "llm" },

    config = function()
        require("render-markdown").setup({

            completions = { lsp = { enabled = true } },
            restart_highlighter = true,
            heading = {
                enabled = true,
                sign = false,
                position = "overlay", -- inline | overlay
                icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
                signs = { "󰫎 " },
                width = "block",
                left_margin = 0,
                left_pad = 0,
                right_pad = 0,
                min_width = 0,
                border = false,
                border_virtual = false,
                border_prefix = false,
                above = "▄",
                below = "▀",
                backgrounds = {},
                foregrounds = {
                    "RenderMarkdownH1",
                    "RenderMarkdownH2",
                    "RenderMarkdownH3",
                    "RenderMarkdownH4",
                    "RenderMarkdownH5",
                    "RenderMarkdownH6",
                },
            },
            dash = {
                enabled = true,
                icon = "─",
                width = 0.5,
                left_margin = 0.5,
                highlight = "RenderMarkdownDash",
            },
            code = { style = "normal" },
        })
    end,
}
