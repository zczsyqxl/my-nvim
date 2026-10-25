if vim.g.vscode == nil then
    if vim.fn.has('win32') ~= 0 then
        vim.cmd([[
             language time English_United States.1252
         ]])
        -- 默认 shell 用 pwsh（:h shell-powershell 官方推荐块）：
        -- 影响 :!cmd / :make / :grep / :terminal / snacks terminal(<c-/>)
        vim.o.shell = 'pwsh'
        vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
        vim.o.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
        vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
        vim.o.shellquote = ''
        vim.o.shellxquote = ''
    else
        vim.g.python3_host_prog = vim.fn.expand('~/.local/share/nvim/py3venv/bin/python')
        vim.g.python3_root_dir = vim.fn.expand('~/.local/share/nvim/py3venv/bin')
        vim.o.shell = 'zsh'
    end
    vim.opt.foldmethod = 'syntax'
    vim.opt.foldcolumn = '4'
    vim.opt.expandtab = true
    vim.opt.belloff = 'all'
    vim.opt.visualbell = false
    vim.opt.tildeop = true
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
    -- if not is_wsl and vim.env.ZELLIJ ~= nil then          -- only inside Zellij
    if vim.env.ZELLIJ ~= nil then -- only inside Zellij
        vim.g.clipboard = { -- fully bypass auto-detection
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

    -- `nvim <dir>` keeps pwd at the shell's cwd by design, and project.nvim
    -- cannot fix it (netrw buffers are nofile, rejected by its is_file gate).
    -- Chdir to the directory ourselves; project.nvim takes over from the
    -- first real file opened inside it.
    vim.api.nvim_create_autocmd('VimEnter', {
        once = true,
        callback = function()
            local arg = vim.fn.argv(0)
            -- argv() 的类型标注是 string|string[]（无索引调用才返回列表），
            -- type 检查既收窄类型，也天然跳过意外的列表值
            if type(arg) == 'string' and arg ~= '' and vim.fn.isdirectory(arg) == 1 then
                vim.api.nvim_set_current_dir(vim.fn.fnamemodify(arg, ':p'))
            end
        end,
    })
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
-- cp936 is an alias of gbk, listing one is enough
vim.opt.fileencodings = 'ucs-bom,utf-8,gbk,latin1'
vim.opt.undofile = true
