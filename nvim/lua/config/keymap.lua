
vim.keymap.set("i", "jk", "<esc>", { remap = false, desc = "escape" })

vim.keymap.set("n", "<space>", "$", { remap = false })
vim.keymap.set("n", "<c-h>", "<c-w>h", { remap = false})
vim.keymap.set("n", "<c-j>", "<c-w>j", { remap = false})
vim.keymap.set("n", "<c-k>", "<c-w>k", { remap = false})
vim.keymap.set("n", "<c-l>", "<c-w>l", { remap = false})
vim.keymap.set("n", "z;", "<cmd>w<cr>", { remap = false})


vim.keymap.set("n", "<leader>;", "<cmd>set wrap!<cr>", {remap = false})
vim.keymap.set({"n", "v", "x"}, "<leader>y", '"+y', {remap = false})
vim.keymap.set("n", "<leader>p", '"+p', {remap = false})
vim.keymap.set("n", "<leader>p", '"+p', {remap = false})
vim.keymap.set("n", "<leader>]p", '"+]p', {remap = false})
vim.keymap.set("n", "<leader>[p", '"+[p', {remap = false})

vim.keymap.set("n", "<leader>gv", "<cmd>vsplit $myvimrc<cr>", {remap = false})
vim.keymap.set("n", "<leader>gs", "<cmd>source $myvimrc<cr>", {remap = false})

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", {remap = false})

vim.keymap.set("n", "<backspace>", "<cmd>noh<cr>", {remap = false, silent = true})

require("config.mylua.exkeymap")
