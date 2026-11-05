-- lspDap/ aggregator: nvim/init.lua does require('plugins.nvim.lspDap'),
-- which resolves to THIS file -- each plugin spec lives in its own module.
-- Load timing & dependency order are documented in each file's header.
return {
    require('plugins.nvim.lspDap.lspconfig'),
    require('plugins.nvim.lspDap.mason-lspconfig'),
    require('plugins.nvim.lspDap.dap'),
    require('plugins.nvim.lspDap.dap-ui'),
}
