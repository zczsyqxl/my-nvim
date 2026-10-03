return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-mini/mini.nvim'
    },
    opts = {
        options = {
            globalstatus = true,
            -- theme = 'ayu_dark',
            theme = 'tokyonight',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = '' },
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(str)
                        return string.format("%-7s", str)
                    end
                }
            },
            lualine_z = {
                {
                    function()
                        local totalLine = vim.fn.line('$')
                        local n = #tostring(totalLine)
                        return string.format(' %'..n..'d/%d:%-3d', vim.fn.line('.'), totalLine, vim.fn.col('.'))
                    end
                }
            }
        },
        extensions = {
            'nvim-tree',
            'toggleterm',
            'mason'
        }
    },
    config = true
}

