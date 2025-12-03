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
                position = "inline", -- inline | overlay
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
                width = 0.99,
                left_margin = 0,
                highlight = "RenderMarkdownH1",
            },
            code = { style = "normal" },
            bullet = {
                -- Useful context to have when evaluating values.
                -- | level | how deeply nested the list is, 1-indexed          |
                -- | index | how far down the item is at that level, 1-indexed |
                -- | value | text value of the marker node                     |

                -- Turn on / off list bullet rendering
                enabled = true,
                -- Additional modes to render list bullets
                render_modes = false,
                -- Replaces '-'|'+'|'*' of 'list_item'.
                -- If the item is a 'checkbox' a conceal is used to hide the bullet instead.
                -- Output is evaluated depending on the type.
                -- | function   | `value(context)`                                    |
                -- | string     | `value`                                             |
                -- | string[]   | `cycle(value, context.level)`                       |
                -- | string[][] | `clamp(cycle(value, context.level), context.index)` |
                icons = { '●', '○', '◆', '◇' },
                -- Replaces 'n.'|'n)' of 'list_item'.
                -- Output is evaluated using the same logic as 'icons'.
                ordered_icons = function(ctx)
                    local value = vim.trim(ctx.value)
                    local index = tonumber(value:sub(1, #value - 1))
                    return ('%d.'):format(index > 1 and index or ctx.index)
                end,
                -- Padding to add to the left of bullet point.
                -- Output is evaluated depending on the type.
                -- | function | `value(context)` |
                -- | integer  | `value`          |
                left_pad = 2,
                -- Padding to add to the right of bullet point.
                -- Output is evaluated using the same logic as 'left_pad'.
                right_pad = 0,
                -- Highlight for the bullet icon.
                -- Output is evaluated using the same logic as 'icons'.
                highlight = 'RenderMarkdownBullet',
                -- Highlight for item associated with the bullet point.
                -- Output is evaluated using the same logic as 'icons'.
                scope_highlight = {},
                -- Priority to assign to scope highlight.
                scope_priority = nil,
            },
        })
        vim.keymap.set('n', '<leader>v/', '<cmd>RenderMarkdown buf_toggle<cr>', { remap = false, desc='zz:markview:SplitToggle'})
        vim.keymap.set('n', '<leader>v.', '<cmd>RenderMarkdown preview<cr>', { remap = false, desc='zz:markview:SplitToggle'})
    end,
}
