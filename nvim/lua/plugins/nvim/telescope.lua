return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        { 'nvim-telescope/telescope-dap.nvim' },
        { 'nvim-telescope/telescope-live-grep-args.nvim' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -G Ninja -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install',
        },
    },
    -- lazy-load on use: :Telescope command + all the <leader>f keymaps below
    -- create their mappings at startup but only load the plugin on first press.
    cmd = 'Telescope',
    keys = {
        { '<leader>f[', '<cmd>Telescope grep_string<cr>', desc = 'zz:telescope:GrepString' },
        { '<leader>f]', '<cmd>Telescope live_grep<cr>', desc = 'zz:telescope:LiveGrep' },
        { '<leader>fa', '<cmd>Telescope git_status<cr>', desc = 'zz:telescope:GitStatus' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'zz:telescope:Buffers' },
        { '<leader>fc', '<cmd>Telescope colorscheme<cr>', desc = 'zz:telescope:Colorscheme' },
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'zz:telescope:Diagnostics' },
        { '<leader>fe', '<cmd>Telescope file_browser<cr>', desc = 'zz:telescope:FileBrowser' },
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'zz:telescope:FindFiles' },
        { '<leader>fg', '<cmd>Telescope git_files<cr>', desc = 'zz:telescope:GitFiles' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'zz:telescope:HelpTags' },
        { '<leader>fi', '<cmd>Telescope lsp_incoming_calls<cr>', desc = 'zz:telescope:LspIncompingCalls' },
        { '<leader>fj', '<cmd>Telescope jump_lists<cr>', desc = 'zz:telescope:JumpList' },
        { '<leader>fk', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'zz:telescope:LspDocSymbols' },
        { '<leader>fl', '<cmd>Telescope lsp_workspace_symbols<cr>', desc = 'zz:telescope:LspWorkspaceSymbols' },
        { '<leader>fm', '<cmd>Telescope keymaps<cr>', desc = 'zz:telescope:Keymaps' },
        { '<leader>fn', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'zz:telescope:LspDynWorksapceSymbols' },
        { '<leader>fo', '<cmd>Telescope lsp_outgoing_calls<cr>', desc = 'zz:telescope:LspOutgoingCalls' },
        { '<leader>fp', '<cmd>Telescope git_bcommits<cr>', desc = 'zz:telescope:GitBcommit' },
        { '<leader>fq', '<cmd>Telescope git_commits<cr>', desc = 'zz:telescope:GitCommit' },
        { '<leader>fr', '<cmd>Telescope lsp_references<cr>', desc = 'zz:telescope:LspReferences' },
        { '<leader>fs', '<cmd>Telescope live_grep_args<cr>', desc = 'zz:telescope:LiveGrepArgs' },
        { '<leader>ft', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'zz:telescope:TypeDefinitions' },
        { '<leader>fu', '<cmd>Telescope git_stash<cr>', desc = 'zz:telescope:GitStash' },
        { '<leader>fv', '<cmd>Telescope vim_options<cr>', desc = 'zz:telescope:VimOptions' },
        { '<leader>fw', '<cmd>Telescope git_branches<cr>', desc = 'zz:telescope:GitBranches' },
        { '<leader>fz', '<cmd>Telescope highlights<cr>', desc = 'zz:telescope:Highlights' },
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
                        end,
                    },
                    n = {
                        ['<esc>'] = actions.close,
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = {
                        'fd',
                        '--type',
                        'f',
                        '--no-ignore',
                        '--hidden',
                        '--exclude',
                        '.git',
                        '--exclude',
                        '.codechecker',
                    },
                },
                colorscheme = {
                    enable_preview = true,
                },
            },
        })
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('live_grep_args')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('ui-select')
        require('telescope').load_extension('dap')
        require('telescope').load_extension('lazygit')
    end,
}
