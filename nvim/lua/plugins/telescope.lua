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
                            ['<c-j>'] = function()
                                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<c-n>', true, false, true), 'i', true)
                            end,
                            ['<c-k>'] = function()
                                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<c-p>', true, false, true), 'i', true)
                            end
                        },
                        n = {
                            ['<esc>'] = actions.close,
                        }
                    },
                },
                pickers = {
                    find_files = {
                        find_command = {
                            'fd', '--type', 'f', '--no-ignore', '--hidden',
                            '--exclude', '.git',
                            '--exclude', '.codechecker',
                        }
                    }
                }
            })
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('live_grep_args')
            require('telescope').load_extension('file_browser')
            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('dap')

            local function git_root()
                local git_dir = vim.fs.find('.git', { upward = true, type = 'directory' })[1]
                return git_dir and vim.fs.dirname(git_dir) or vim.loop.cwd()
            end

            vim.keymap.set('n', '<leader>f[', function() require('telescope.builtin').grep_string({ cwd = git_root() }) end, {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fb', '<cmd>Telescop buffers<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fc', '<cmd>Telescop colorscheme<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fd', '<cmd>Telescop diagnostics<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<cr>', {remap = false, silent = true})
            -- vim.keymap.set('n', '<leader>fe', function() require('telescope').extensions.file_browser.file_browser({ cwd = git_root(), }) end, {remap = false, silent = true})
            vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files({ cwd = git_root() }) end, {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fg', '<cmd>Telescop git_files<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fh', '<cmd>Telescop help_tags<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fi', '<cmd>Telescop lsp_incoming_calls<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fj', '<cmd>Telescop jump_lists<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fk', '<cmd>Telescop lsp_document_symbols<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fl', '<cmd>Telescop lsp_workspace_symbols<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fm', '<cmd>Telescop keymaps<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fn', '<cmd>Telescop lsp_dynamic_workspace_symbols<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fo', '<cmd>Telescop lsp_outgoing_calls<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fr', '<cmd>Telescop lsp_references<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').live_grep({ cwd = git_root() }) end, {remap = false, silent = true})
            vim.keymap.set('n', '<leader>ft', '<cmd>Telescop lsp_type_definitions<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>fv', '<cmd>Telescop vim_options<cr>', {remap = false, silent = true})
        end
    }
end


