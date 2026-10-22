return {
    'lukas-reineke/indent-blankline.nvim',
    dependencies = {
        'hiphish/rainbow-delimiters.nvim',
    },
    -- lazy: attach per buffer when the first file buffer is read
    event = 'VeryLazy',
    main = 'ibl',
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
            'RainbowGray',
        }
        local scopeHighlight = {
            'RainbowBlue',
        }
        local delHighlight = {
            'RainbowYellow',
            'RainbowBlue',
            'RainbowRed',
            'RainbowGreen',
            'RainbowOrange',
            'RainbowCyan',
            'RainbowPurple',
        }

        local hooks = require('ibl.hooks')
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, 'RainbowRed', { link = 'ZZ.RainbowRed' })
            vim.api.nvim_set_hl(0, 'RainbowOrange', { link = 'ZZ.RainbowOrange' })
            vim.api.nvim_set_hl(0, 'RainbowYellow', { link = 'ZZ.RainbowYellow' })
            vim.api.nvim_set_hl(0, 'RainbowGreen', { link = 'ZZ.RainbowGreen' })
            vim.api.nvim_set_hl(0, 'RainbowCyan', { link = 'ZZ.RainbowCyan' })
            vim.api.nvim_set_hl(0, 'RainbowBlue', { link = 'ZZ.RainbowBlue' })
            vim.api.nvim_set_hl(0, 'RainbowPurple', { link = 'ZZ.RainbowPurple' })
            vim.api.nvim_set_hl(0, 'RainbowGray', { link = 'ZZ.RainbowGray' })
        end)

        require('ibl').setup({
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
                    node_type = { ['*'] = { '*' } },
                },
            },
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
    end,
}
