return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-mini/mini.nvim',
    },
    opts = {
        options = {
            globalstatus = true,
            -- theme = 'ayu_dark',
            theme = 'tokyonight',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(str)
                        return string.format('%-7s', str)
                    end,
                },
            },
            lualine_z = {
                {
                    function()
                        local totalLine = vim.fn.line('$')
                        local n = #tostring(totalLine)
                        return string.format(' %' .. n .. 'd/%d:%-3d', vim.fn.line('.'), totalLine, vim.fn.col('.'))
                    end,
                },
            },
        },
        extensions = {
            'toggleterm',
            'mason',
            -- neo-tree 替代品：focus 进 snacks explorer/picker 浮窗时，
            -- 底部状态栏整组替换为极简版（只剩左侧一格显示当前目录）
            {
                filetypes = { 'snacks_picker_list', 'snacks_picker_input' },
                sections = {
                    lualine_a = {
                        function()
                            local p = Snacks.picker.get()[1]
                            local cwd = p and p:cwd() or vim.fn.getcwd()
                            return ' ' .. vim.fn.fnamemodify(cwd, ':~')
                        end,
                    },
                },
            },
        },
    },
    config = true,
}
