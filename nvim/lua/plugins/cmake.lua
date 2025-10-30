if vim.g.vscode then
    return {}
else
    return {
        'Civitasv/cmake-tools.nvim',
        lazy = true,
        ft = {'c', 'json', 'cmake'},
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            cmake_regenerate_on_save = false,
            cmake_executor = {
                name = 'toggleterm',
                -- default_opts = {
                --     toggleterm = {
                --         direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                --         close_on_exit = false, -- whether close the terminal when exit
                --         auto_scroll = true, -- whether auto scroll to the bottom
                --         singleton = true, -- single instance, autocloses the opened one, if present
                --     },
                -- }
            },
            cmake_runner = {
                name = 'toggleterm',
                -- default_opts = {
                --     toggleterm = {
                --         direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
                --         close_on_exit = false, -- whether close the terminal when exit
                --         auto_scroll = true, -- whether auto scroll to the bottom
                --         singleton = true, -- single instance, autocloses the opened one, if present
                --     },
                -- }
            },
            cmake_compile_commands_options = {
                action = 'none'
            },
            cmake_dap_configuration = {
                -- stopOnEntry = true,
            }
        },
        config = function(_,opts)
            require('cmake-tools').setup(opts)
            vim.keymap.set('n', '<leader>cb', '<cmd>CMakeBuild<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cB', '<cmd>CMakeBuildCurrentFile<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cc', '<cmd>CMakeClean<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cg', '<cmd>CMakeGenerate<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cr', '<cmd>CMakeRun<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cR', '<cmd>CMakeRunCurrentFile<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cp', '<cmd>CMakeSelectConfigurePreset<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cd', '<cmd>CMakeSelectBuildDir<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>ct', '<cmd>CMakeSelectBuildTarget<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cy', '<cmd>CMakeSelectBuildType<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>ce', '<cmd>CMakeSelectBuildPreset<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cw', '<cmd>CMakeSelectCwd<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>ck', '<cmd>CMakeSelectKit<cr>', {remap = false, silent = true})
            vim.keymap.set('n', '<leader>cl', '<cmd>CMakeSelectLaunchTarget<cr>', {remap = false, silent = true})
        end
    }
end
