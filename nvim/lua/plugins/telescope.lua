if vim.g.vscode then
    return {}
else
    return {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim'},
            { 'nvim-telescope/telescope-file-browser.nvim'},
            { 'nvim-telescope/telescope-dap.nvim'},
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',

            },
        },
        config = function()
            require('telescope').setup({
                -- defaults = {
                --     mapppings = {
                --         i = {
                --             ['<cr>'] = actions.select_default
                --         }
                --     }
                -- }
            })
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('live_grep_args')
            require('telescope').load_extension('file_browser')
            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('dap')
        end
    }
end

