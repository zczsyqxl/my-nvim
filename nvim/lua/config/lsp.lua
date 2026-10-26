-- LSP client setup, independent of the completion engine (nvim-cmp/blink).
-- Runs at startup so diagnostics/hover work before entering insert mode.
--
-- NOTE: no `require('cmp_nvim_lsp')` here. It used to retroactively load the
-- entire nvim-cmp stack on startup (~65ms, lazy.nvim requires-hook). nvim's
-- builtin default capabilities already cover snippetSupport/resolveSupport/
-- labelDetails; the completion engine merges the rest itself when it loads
-- (see plugins.nvim.cmpn.nvimCmp).
vim.lsp.enable({ 'clangd', 'rust_analyzer', 'lua_ls', 'pyright' })
