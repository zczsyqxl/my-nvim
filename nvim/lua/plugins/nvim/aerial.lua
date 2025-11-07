return {
    'stevearc/aerial.nvim',
    opts = {
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
            vim.keymap.set('n', '{', '<cmd>AerialPrev<cr>', { buffer = bufnr, desc='zz:aerial:Prev'})
            vim.keymap.set('n', '}', '<cmd>AerialNext<cr>', { buffer = bufnr, desc='zz:aerial:Next'})
        end,
    },
    config = function(_, opts)
        require('aerial').setup(opts)
        vim.keymap.set('n', '<leader>vo', '<cmd>AerialToggle!<cr>', {desc = 'zz:aerial:Toggle'})
    end,
}


