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

-- nvim 0.13 reads cmdline file args during init (before this file runs):
-- their FileType event fires before vim.lsp.enable registers its autocmd,
-- and enable()'s internal doautoall recovery misses them, so those buffers
-- never get a client (e.g. `nvim file.lua` from the shell). Re-play the
-- FileType event for buffers already loaded at this point.
for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == '' then
        vim.api.nvim_exec_autocmds('FileType', { buffer = buf, group = 'nvim.lsp.enable' })
    end
end
