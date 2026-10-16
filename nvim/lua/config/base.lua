if vim.g.vscode == nil then
    if vim.fn.has('win32') ~= 0 then
        vim.cmd[[
             language time English_United States.1252
         ]]
    else
        vim.g.python3_host_prog = vim.fn.expand('~/.local/share/nvim/py3venv/bin/python')
        vim.g.python3_root_dir = vim.fn.expand('~/.local/share/nvim/py3venv/bin')
    end
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
    --
    -- local is_wsl = (function()
    --     local f = io.open('/proc/version', 'r')
    --     if not f then return false end
    --     local ver = f:read('*a')
    --     f:close()
    --     return ver:match('[Mm]icrosoft') or ver:match('[Ww][Ss][Ll]')
    -- end)()
    --
    -- if not is_wsl and vim.env.ZELLIJ ~= nil then          -- 只在 Zellij 内生效
    if vim.env.ZELLIJ ~= nil then          -- 只在 Zellij 内生效
        vim.g.clipboard = {                  -- 完全绕过自动检测
            name = 'zellij-osc52',
            copy = {
                ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
                ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
            },
            paste = {
                ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
                ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
            },
        }
    end
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



