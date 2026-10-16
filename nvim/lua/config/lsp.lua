-- LSP client setup, independent of the completion engine (nvim-cmp/blink/coc).
-- Runs at startup so diagnostics/hover work before entering insert mode.
local capabilities
local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

local servers = { 'clangd', 'rust_analyzer', 'lua_ls', 'pyright' }
for _, server in ipairs(servers) do
    vim.lsp.config(server, {
        capabilities = capabilities,
    })
end

vim.lsp.enable(servers)
