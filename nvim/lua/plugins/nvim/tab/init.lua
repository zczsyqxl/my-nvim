if vim.g.vscode then
    return {}
else
    local tab = 'buf'
    return {
        require(
            ({
                barbar = 'plugins.nvim.tab.barbar',
                tabby = 'plugins.nvim.tab.tabby'
            })[tab]
            or 'plugins.nvim.tab.bufferline'
        )
    }
end
