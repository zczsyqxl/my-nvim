-- mason-lspconfig: auto-installs LSP servers listed in ensure_installed.
-- Split from lspDap.lua (2026-11-05); timing unchanged (VeryLazy).
return {
    {
        'mason-org/mason-lspconfig.nvim',
        -- lazy: mason/mason-lspconfig are only needed to (re)install
        -- missing servers -- defer them past first draw
        -- keep ensure_installed in sync with the vim.lsp.enable list in
        -- config/lsp.lua; on a new machine missing servers install automatically
        -- (already-installed ones are skipped, no duplicate downloads)
        -- NOTE: mason's bin dir is prepended to PATH in config/lsp.lua so
        -- vim.lsp.enable can spawn mason-only servers before mason loads
        event = 'VeryLazy',
        -- NOTE: no install-success replay hook needed: mason-lspconfig v2's
        -- automatic_enable (default true) already subscribes to
        -- package:install:success itself and calls vim.lsp.enable() on
        -- completion, which doautoalls FileType for open buffers (core
        -- lsp.lua:656-660). Verified empirically + source-read 2026-11-05.
        opts = { ensure_installed = { 'clangd', 'rust_analyzer', 'lua_ls', 'pyright' } },
        dependencies = {
            { 'mason-org/mason.nvim', opts = {}, config = true },
        },
    },
}
