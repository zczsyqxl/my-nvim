if vim.g.vscode then
    return {}
else
    return {
        require('plugins.nvim.aerial'),
        require('plugins.nvim.cmpn'),
        require('plugins.nvim.cmake'),
        require('plugins.nvim.tab'),
        require('plugins.nvim.diffview'),
        require('plugins.nvim.grugFar'),
        require('plugins.nvim.rainbow'),
        require('plugins.nvim.lspDap'),
        require('plugins.nvim.lazydev'),
        require('plugins.nvim.lualine'),
        require('plugins.nvim.md'),
        require('plugins.nvim.project'),
        require('plugins.nvim.toggleterm'),
        require('plugins.nvim.treesitter'),
        require('plugins.nvim.theme'),
        require('plugins.nvim.nvimScissors'),
        require('plugins.nvim.luaSnip'),
        require('plugins.nvim.nvimColorizer'),
        require('plugins.nvim.codecompanion'),
        require('plugins.nvim.avante'),
        require('plugins.nvim.aegis'),
    }
end
