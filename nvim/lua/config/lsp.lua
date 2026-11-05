-- LSP client setup, independent of the completion engine (nvim-cmp/blink).
-- Runs at startup so diagnostics/hover work before entering insert mode.
--
-- NOTE: no `require('cmp_nvim_lsp')` here. It used to retroactively load the
-- entire nvim-cmp stack on startup (~65ms, lazy.nvim requires-hook). nvim's
-- builtin default capabilities already cover snippetSupport/resolveSupport/
-- labelDetails; the completion engine merges the rest itself when it loads
-- (see plugins.nvim.cmpn.nvimCmp).

-- Prepend mason's bin dir to PATH ourselves: vim.lsp.enable below spawns
-- servers at startup, but mason.nvim (the plugin that normally prepends
-- this dir) is VeryLazy-loaded. Without this, buffers opened before mason
-- loads (e.g. `nvim file.lua` from the shell) fail to start mason-only
-- servers (lua_ls/pyright), and nvim never retries the failed buffer.
local mason_bin = vim.fn.stdpath('data') .. '/mason/bin'
vim.env.PATH = mason_bin .. (vim.fn.has('win32') == 1 and ';' or ':') .. vim.env.PATH

vim.lsp.enable({ 'clangd', 'rust_analyzer', 'lua_ls', 'pyright' })

-- NOTE: the manual FileType replay loop that used to live here was removed
-- 2026-11-05. On nvim v0.13.0-dev-1804+, vim.lsp.enable()'s internal recovery
-- covers cmdline-arg buffers: the doautoall condition now includes
-- `vim.fn.did_filetype() == 1` (runtime/lua/vim/lsp.lua:658), so `nvim file.rs`
-- attaches without help. The old comment ("doautoall recovery misses them")
-- described an earlier dev build. Post-install attach (fresh machine) is
-- handled by mason-lspconfig v2's automatic_enable, which re-calls
-- vim.lsp.enable() on package:install:success.
