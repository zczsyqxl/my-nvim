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
        cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
        cmake_compile_commands_options = {
            action = 'none',
        },
        cmake_dap_configuration = {
            -- stopOnEntry = true,
        }
    },
    config = function(_,opts)
        require('cmake-tools').setup(opts)
        vim.keymap.set('n', '<leader>cb',  '<cmd>CMakeBuild<cr>',                 {remap = false, silent = true, desc='zz:cmake:Build'})
        vim.keymap.set('n', '<leader>cB',  '<cmd>CMakeBuildCurrentFile<cr>',      {remap = false, silent = true, desc='zz:cmake:BuildCurFile'})
        vim.keymap.set('n', '<leader>cc',  '<cmd>CMakeClean<cr>',                 {remap = false, silent = true, desc='zz:cmake:Clean'})
        vim.keymap.set('n', '<leader>cg',  '<cmd>CMakeGenerate<cr>',              {remap = false, silent = true, desc='zz:cmake:Generate'})
        vim.keymap.set('n', '<leader>cr',  '<cmd>CMakeRun<cr>',                   {remap = false, silent = true, desc='zz:cmake:Run'})
        vim.keymap.set('n', '<leader>cR',  '<cmd>CMakeRunCurrentFile<cr>',        {remap = false, silent = true, desc='zz:cmake:RunCurFile'})
        vim.keymap.set('n', '<leader>csc', '<cmd>CMakeSelectConfigurePreset<cr>', {remap = false, silent = true, desc='zz:cmake:SelectConPreset'})
        vim.keymap.set('n', '<leader>csd', '<cmd>CMakeSelectBuildDir<cr>',        {remap = false, silent = true, desc='zz:cmake:SelectBuildDir'})
        vim.keymap.set('n', '<leader>cst', '<cmd>CMakeSelectBuildTarget<cr>',     {remap = false, silent = true, desc='zz:cmake:SelectBuildTarget'})
        vim.keymap.set('n', '<leader>csp', '<cmd>CMakeSelectBuildType<cr>',       {remap = false, silent = true, desc='zz:cmake:SelectBuildType'})
        vim.keymap.set('n', '<leader>csb', '<cmd>CMakeSelectBuildPreset<cr>',     {remap = false, silent = true, desc='zz:cmake:SelectBuildPreset'})
        vim.keymap.set('n', '<leader>csw', '<cmd>CMakeSelectCwd<cr>',             {remap = false, silent = true, desc='zz:cmake:SelectCWD'})
        vim.keymap.set('n', '<leader>csk', '<cmd>CMakeSelectKit<cr>',             {remap = false, silent = true, desc='zz:cmake:SelectKit'})
        vim.keymap.set('n', '<leader>csl', '<cmd>CMakeSelectLaunchTarget<cr>',    {remap = false, silent = true, desc='zz:cmake:SelectLaunchTarget'})
    end
}
