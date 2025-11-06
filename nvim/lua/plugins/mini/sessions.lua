require('mini.sessions').setup({
    directory = 'd:/workspace/nvim',

    hooks = {
        -- Before successful action
        pre = {
            write = function()
                vim.cmd('Neotree close')
            end
        },
    },
})
