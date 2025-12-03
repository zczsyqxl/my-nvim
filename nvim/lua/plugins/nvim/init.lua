if vim.g.vscode then
    return {}
else
    return {
        require('plugins.nvim.tree'),
        require('plugins.nvim.aerial'),
        require('plugins.nvim.cmpn'),
        require('plugins.nvim.cmake'),
        require('plugins.nvim.tab'),
        require('plugins.nvim.lazygit'),
        require('plugins.nvim.diffview'),
        require('plugins.nvim.grugFar'),
        require('plugins.nvim.indentline'),
        require('plugins.nvim.lspDap'),
        require('plugins.nvim.lualine'),
        -- require('plugins.nvim.markview'),
        require('plugins.nvim.markdownPreview'),
        require('plugins.nvim.renderMarkdown'),
        require('plugins.nvim.project'),
        require('plugins.nvim.telescope'),
        require('plugins.nvim.toggleterm'),
        require('plugins.nvim.treesitter'),
        require('plugins.nvim.theme'),
        require('plugins.nvim.nvimScissors'),
        require('plugins.nvim.luaSnip'),
        require('plugins.nvim.fwatch'),
        require('plugins.nvim.nvimColorizer'),
    }
end
