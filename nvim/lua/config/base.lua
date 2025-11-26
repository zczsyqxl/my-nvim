if vim.g.vscode == nil then
    if vim.fn.has('win32') ~= 0 then
        vim.cmd[[
             language time English_United States.1252
         ]]

    end
    vim.opt.autochdir = true
    vim.opt.foldmethod = 'syntax'
    vim.opt.foldcolumn = '4'
    vim.opt.expandtab = true
    vim.opt.belloff = 'all'
    vim.opt.visualbell = false
    vim.opt.tildeop = true
    vim.opt.encoding = 'utf-8'
    vim.opt.grepprg = 'grep -n $*'
    -- vim.o.winbar = " %f %m "
    -- if vim.fn.has('win32') ~= 0 then
        -- vim.opt.shada = ''
    -- end
end

vim.cmd('syntax on')

vim.opt.showmode = false
vim.opt.mmp = 2000000
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.textwidth = 9999
vim.opt.fileencodings = 'ucs-bom,utf-8,gbk,cp936,latin1'
vim.opt.undofile = true



