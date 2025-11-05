if vim.g.vscode then
    return {}
else
    local cmp = 'coc'
    return {
        require(
            ({
                blinkcmp = 'plugins.nvim.cmp.blinkcmp',
                nvimcmp = 'plugins.nvim.cmp.nvimCmp'
            })[cmp]
            or 'plugins.nvim.cmp.coc'
        )
    }
end
