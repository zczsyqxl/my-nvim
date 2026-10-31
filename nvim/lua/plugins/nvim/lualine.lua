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
            lualine_x = {
                -- attached LSP clients with the buffer's filetype icon
                -- (mini.icons, category 'filetype'; the 'lsp' category maps
                -- every server to the same glyph). Icon is colored via the
                -- hl group returned by mini.icons. Returns '' (component
                -- hidden) when nothing is attached.
                {
                    function()
                        local clients = vim.lsp.get_clients({ bufnr = 0 })
                        if #clients == 0 then
                            return ''
                        end
                        local icon, hl = require('mini.icons').get('filetype', vim.bo.filetype)
                        local names = {}
                        for _, c in ipairs(clients) do
                            names[#names + 1] = c.name
                        end
                        icon = hl and ('%#' .. hl .. '#' .. icon .. '%*') or icon
                        return icon .. ' ' .. table.concat(names, ',')
                    end,
                },
                'encoding',
                'fileformat',
                'filetype',
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
            -- statusline for quickfix AND location-list windows (both use
            -- filetype 'qf'): shows the list title + entry position
            'quickfix',
            -- Trouble windows are NOT qf windows (filetype is 'trouble'):
            -- they only read the qf/loclist content. This extension shows
            -- the Trouble mode (Qflist / Symbols / Diagnostics / ...)
            'trouble',
            -- neo-tree replacement: when focus enters a snacks explorer/picker float,
            -- the whole bottom statusline swaps to a minimal one (single left
            -- segment showing the current directory)
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
