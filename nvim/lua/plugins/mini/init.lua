return {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
        if vim.g.vscode == nil then
            require('plugins.mini.icons')
            require('plugins.mini.bracketed')
            require('plugins.mini.comment')
            require('plugins.mini.diff')
            require('plugins.mini.sessions')
            require('plugins.mini.starter')
        end
        require('plugins.mini.ai')
        require('plugins.mini.operators')
        require('plugins.mini.surround')
        require('plugins.mini.align')
    end
}
