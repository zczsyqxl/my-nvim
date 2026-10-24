return {
    'nvim-mini/mini.nvim',
    branch = 'main',
    config = function()
        if vim.g.vscode == nil then
            require('plugins.mini.icons')
            require('plugins.mini.bracketed')
            require('plugins.mini.comment')
            require('plugins.mini.diff')
            require('plugins.mini.sessions')
            -- require('plugins.mini.starter')
            require('plugins.mini.snippet')
        end
        require('plugins.mini.ai')
        require('plugins.mini.operators')
        require('plugins.mini.surround')
        require('plugins.mini.align')
    end,
}
