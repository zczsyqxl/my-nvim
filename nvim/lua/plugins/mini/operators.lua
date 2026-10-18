require('mini.operators').setup({})
vim.keymap.set('n', 'gxc', '<c-c>', { remap = true, desc = 'zz:mini.operators:CancelPendingExchange' })
