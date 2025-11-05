if vim.g.vscode then
    return {}
else
    return {
        require('plugins.nvim.tree'),
        require('plugins.nvim.aerial'),
        require('plugins.nvim.cmp'),
        require('plugins.nvim.cmake'),
        require('plugins.nvim.diff'),
        require('plugins.nvim.git'),
        require('plugins.nvim.grugFar'),
        require('plugins.nvim.indentLine'),
        require('plugins.nvim.lspDap'),
        require('plugins.nvim.lualine'),
        require('plugins.nvim.markview'),
        require('plugins.nvim.project'),
        require('plugins.nvim.rainbow'),
        require('plugins.nvim.telescope'),
        require('plugins.nvim.toggleterm'),
        require('plugins.nvim.treesitter'),
        require('plugins.nvim.vimStartify'),
    }
end
