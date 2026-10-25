return {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load when editing lua files
    opts = {
        library = {
            -- luv types: injected only when vim.uv appears in the buffer
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            -- Plugin libraries injected on demand (path = plugin name; lazydev
            -- resolves the installed path). words = inject only when matched
            -- in the buffer → no whole-library scanning → cross-plugin module
            -- name ambiguity is gone (avante.llm / _toggleterm never enter the library)
            { path = 'snacks.nvim', words = { 'Snacks' } },
            { path = 'mini.nvim', words = { 'Mini' } },
            { path = 'toggleterm.nvim', words = { 'toggleterm' } },
            { path = 'llm.nvim', words = { '%f[%w]llm' } },
            { path = 'codecompanion.nvim', words = { 'codecompanion' } },
        },
    },
}
