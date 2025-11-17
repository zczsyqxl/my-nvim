local gen_loader = require('mini.snippets').gen_loader
local file = vim.fn.stdpath('config') .. '/snippets/snippets/global.json'
require('mini.snippets').setup({
    snippets = {
        gen_loader.from_file(file),
        gen_loader.from_lang(),
    }
})



