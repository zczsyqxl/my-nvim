return {
    'cshuaimin/ssr.nvim',
    -- treesitter-based structural search & replace: match syntax nodes
    -- (function calls, args, blocks...) instead of fragile regexes.
    -- Usage: select code (or put the cursor on a node) and press <leader>rr,
    -- edit the SEARCH / REPLACE panes, <cr> replaces every match.
    -- NOTE: nvim-treesitter parsers are required (already installed here).
    keys = {
        {
            '<leader>rr',
            function()
                require('ssr').open()
            end,
            mode = { 'n', 'x' },
            desc = 'zz:ssr:StructuralReplace',
        },
    },
    opts = {
        min_width = 50,
        min_height = 5,
        -- keymaps use plugin defaults: q close, n/N next/prev match,
        -- <cr> replace with confirmation, <leader><cr> replace all.
        -- NOTE: the "(Press ? for help)" hint in the window title is
        -- unimplemented upstream (no ? keymap exists); ? falls through to
        -- Vim's default reverse search.
    },
}
