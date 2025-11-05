return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        config = function()
            local my_system_open = {}
            if vim.fn.has('win32') == 1 then
                my_system_open = {
                    cmd = "cmd",
                    args = {"/c", "start", ""},
                }
            end
            require('nvim-tree').setup({
                system_open = my_system_open
            })
            vim.keymap.set('n', '<leader>vn', '<cmd>NvimTreeFindFileToggle<cr>', { remap=false, silent=true})
            vim.keymap.set('n', '<leader>vf', '<cmd>NvimTreeFindFile<cr>', { remap=false, silent=true})
        end
    }
}
