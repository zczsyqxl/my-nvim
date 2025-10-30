if vim.g.vscode then
    return {}
else
    return {
        'akinsho/toggleterm.nvim',
        version = '*',
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
                dir = "git_dir",
            })

            vim.keymap.set("n", "<leader>vm", function() newshell:toggle() end, {remap = false, silent = true})
        end
    }
end

