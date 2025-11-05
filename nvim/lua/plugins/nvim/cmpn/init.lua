if vim.g.vscode then
    return {}
else
    local cmp = 'coc'
    return {
        require(
            ({
                blinkcmp = 'plugins.nvim.cmpn.blinkcmp',
                nvimcmp = 'plugins.nvim.cmpn.nvimCmp'
            })[cmp]
            or 'plugins.nvim.cmpn.coc'
        )
    }
end
