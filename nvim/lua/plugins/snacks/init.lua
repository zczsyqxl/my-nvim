if vim.g.vscode then
    return {}
else
    return {
        require('plugins.snacks.snacks'),
    }
end
