if vim.g.vscode then
    return {}
else
    return {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            config = function()
                require('nvim-tree').setup()
                vim.keymap.set('n', '<leader>vn', '<cmd>NvimTreeFindFileToggle<cr>', { remap=fale, silent=treu})
            end
        }
    }
end


