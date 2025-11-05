return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        -- show_current_context = true,
        -- show_current_context_start = true,
    },
    config = function()
        local highlight = {
            "RainbowBlue",
            "RainbowYellow",
            "RainbowRed",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowCyan",
            "RainbowGray",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            vim.api.nvim_set_hl(0, "RainbowGray", { fg = "#4d4d4d" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
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
                highlight = highlight,
                show_end = true,
                show_start = true,
                include = {
                    node_type = { ['*'] =  {'*'} },
                }
            }

        })
    end
}

