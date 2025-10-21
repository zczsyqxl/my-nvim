if vim.g.vscode then
    return {}
else
    return {
        'stevearc/aerial.nvim',
        opts = {},
        config = function(buf)
            require('aerial').setup({
                backends = {'lsp','treesitter','markdown','asciidoc','man'},
                layout = {
                    default_direction = 'prefer_right',
                },
                filter_kind = {
                    'Array',
                    'Boolean',
                    'Class',
                    'Constant',
                    'Constructor',
                    'Enum',
                    'EnumMember',
                    'Event',
                    'Field',
                    'File',
                    'Function',
                    'Interface',
                    'Key',
                    'Method',
                    'Module',
                    'Namespace',
                    'Null',
                    'Number',
                    'Object',
                    'Operator',
                    'Package',
                    'Property',
                    'String',
                    'Struct',
                    'TypeParameter',
                    'Variable',
                },
                on_attach = function(bufnr)
                    vim.keymap.set('n', '{', '<cmd>AerialPrev<cr>', { buffer = bufnr})
                    vim.keymap.set('n', '}', '<cmd>AerialNext<cr>', { buffer = bufnr})
                end,
            })
            vim.keymap.set('n', '<leader>vd', '<cmd>AerialToggle!<cr>')
        end,
    }
end


