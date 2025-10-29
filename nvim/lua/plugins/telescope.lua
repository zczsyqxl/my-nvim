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
            local actions = require('telescope.actions')
            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {
                            ['<esc>'] = actions.close,
                        },
                        n = {
                            ['<esc>'] = actions.close,
                        }
                    },
                },
                pickers = {
                    find_files = {
                        find_command = {'fd', '--type', 'f', '-a', '--no-ignore', '--hidden', '--exclude', '.git' }
                    }
                }
            })
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('live_grep_args')
            require('telescope').load_extension('file_browser')
            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('dap')
            vim.keymap.set('n', '<leader>fg', '<cmd>Telescop git_files<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fe', '<cmd>Telescop file_browser<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>ff', '<cmd>Telescop find_files<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fb', '<cmd>Telescop buffers<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fk', '<cmd>Telescop lsp_document_symbols<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fl', '<cmd>Telescop lsp_workspace_symbols<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fd', '<cmd>Telescop diagnostics<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fm', '<cmd>Telescop keymaps<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fs', '<cmd>Telescop live_grep<cr>', {remap = false, silent = true})
        end
    }
end

