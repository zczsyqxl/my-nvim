return {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
        'hiphish/rainbow-delimiters.nvim',
    },
    main = "ibl",
    opts = {
        -- show_current_context = true,
        -- show_current_context_start = true,
    },
    config = function()
        local highlight = {
            -- "RainbowBlue",
            -- "RainbowYellow",
            -- "RainbowRed",
            -- "RainbowOrange",
            -- "RainbowGreen",
            -- "RainbowCyan",
            "RainbowGray",
        }
        local scopeHighlight = {
            "RainbowBlue",
        }
        local delHighlight = {
            "RainbowYellow",
            "RainbowBlue",
            "RainbowRed",
            "RainbowGreen",
            "RainbowOrange",
            "RainbowCyan",
            "RainbowPurple",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ff7173" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E1EE00" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#00ff00" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#00FFFF" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowPurple", { fg = "#D600D1" })
            vim.api.nvim_set_hl(0, "RainbowGray", { fg = "#4d4d4d" })
        end)

        require("ibl").setup ({
            indent = {
                highlight = highlight,
                char = '╎',

            },
            -- whitespace = {
            --     highlight = {'Function', 'Label'},
            --     remove_blankline_trail = true,
            -- },
            scope = {
                highlight = scopeHighlight,
                show_end = false,
                show_start = false,
                include = {
                    node_type = { ['*'] =  {'*'} },
                }
            }

        })

        require('rainbow-delimiters.setup').setup({
            strategy = {
                -- ...
            },
            query = {
                -- ...
            },
            highlight = delHighlight,
        })
    end
}

