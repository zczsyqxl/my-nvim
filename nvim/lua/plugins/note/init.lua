if vim.g.vscode then
    return {}
else
    return {
        require('plugins.note.obsidian'),
    }
end
