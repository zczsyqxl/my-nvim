if vim.g.vscode then
    return {}
else
    return {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            config = function()
                if vim.fn.has('win32') == 1 then
                    my_system_open = {
                        cmd = "cmd",
                        args = {"/c", "start", ""},
                    }
                else
                    my_system_open = {}
                end
                require('nvim-tree').setup({
                    system_open = my_system_open
                })
                vim.keymap.set('n', '<leader>vn', '<cmd>NvimTreeFindFileToggle<cr>', { remap=fale, silent=treu})
                vim.keymap.set('n', '<leader>vf', '<cmd>NvimTreeFindFile<cr>', { remap=fale, silent=treu})
            end
        }
    }
end


