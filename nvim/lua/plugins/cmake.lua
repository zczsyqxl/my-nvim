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
            print('loaded cmake')
        end
    }
end
