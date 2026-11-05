-- nvim-lspconfig: startup-loaded provider of lsp/<name>.lua runtime configs.
-- Split from lspDap.lua (2026-11-05); timing unchanged (lazy = false).
return {
    {
        -- startup-load: vim.lsp.enable (config/lsp.lua) resolves server
        -- configs (lsp/lua_ls.lua etc.) from this plugin's runtime dir; with
        -- VeryLazy, buffers opened before UIEnter (e.g. `nvim file.lua` from
        -- the shell) miss the server entirely -- vim.lsp.config[name] is nil
        -- at enable time and nvim never retries the failed buffer.
        -- nvim 0.13 has no builtin lsp/ runtime configs, this plugin is the
        -- only provider.
        'neovim/nvim-lspconfig',
        lazy = false,
    },
}
