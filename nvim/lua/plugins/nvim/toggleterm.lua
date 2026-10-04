return {
    'akinsho/toggleterm.nvim',
    config = function()
        local myshell
        if vim.fn.has('win32') == 1 then
            myshell = 'pwsh'
        else
            myshell = 'zsh'
        end

        require('toggleterm').setup ({
            shell = myshell,
        })

        local Terminal  = require('toggleterm.terminal').Terminal

        local newshell = Terminal:new({
            cmd = myshell,
            direction = 'float',
            dir = "git_dir",
        })

        local yazi = Terminal:new({
            cmd = 'yazi',
            direction = 'float',
            dir = "git_dir",
        })

        vim.keymap.set("n", "<leader>vm", function() newshell:toggle() end, {remap = false, silent = true, desc='zz:toggleterm:NewShellToggle'})
        vim.keymap.set("n", "<leader>vy", function() yazi:toggle() end, {remap = false, silent = true, desc='zz:toggleterm:NewShellToggle'})
    end
}

