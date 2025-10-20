if vim.g.vscode then
    return {}
else
    if true then
        return {
            'neovim/nvim-lspconfig',
            config = function()
                vim.lsp.enable('rust_analyzer')
            end,
        }
    else
        return {}
    end
end
