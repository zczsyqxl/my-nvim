
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, desc = "Escape" })

vim.keymap.set("n", "<space>", "$", { noremap = true })
vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true})
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true})
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true})
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true})
vim.keymap.set("n", "z;", "<cmd>w<cr>", { noremap = true})

vim.keymap.set("n", "<leader>;", "<cmd>set wrap!<cr>", {noremap = true})
vim.keymap.set({"n", "v", "x"}, "<leader>y", '"+y', {noremap = true})
vim.keymap.set("n", "<leader>p", '"+p', {noremap = true})
vim.keymap.set("n", "<leader>P", '"+P', {noremap = true})
vim.keymap.set("n", "<leader>]p", '"+]p', {noremap = true})
vim.keymap.set("n", "<leader>[p", '"+[p', {noremap = true})

vim.keymap.set("n", "<leader>gv", "<cmd>vsplit $MYVIMRC<cr>", {noremap = true})
vim.keymap.set("n", "<leader>gs", "<cmd>source $MYVIMRC<cr>", {noremap = true})

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {noremap = true})


require("config.mylua.exkeymap")
