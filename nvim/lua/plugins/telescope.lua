if vim.g.vscode then
    return {}
else
    return {
        {
            'nvim-telescope/telescope.nvim',
            branch = '0.1.x',
            dependencies = {
                { 'nvim-lua/plenary.nvim'},
                { 'nvim-telescope/telescope-live-grep-args.nvim' },
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    build = 'make'
                },
            },
            config = function()
                require('telescope').load_extension('fzf')
                require('telescope').load_extension('live_grep_args')
            end
        },
    }
end


