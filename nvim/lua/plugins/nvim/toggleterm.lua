return {
    'akinsho/toggleterm.nvim',
    -- lazy-load on the terminal/yazi toggle keys (stubs: config installs the
    -- real function mappings once the plugin loads)
    keys = {
        { '<leader>vm', desc = 'zz:toggleterm:NewShellToggle' },
        { '<leader>vy', desc = 'zz:toggleterm:NewShellToggle' },
    },
    config = function()
        local myshell
        if vim.fn.has('win32') == 1 then
            myshell = 'pwsh'
        else
            myshell = 'zsh'
        end

        require('toggleterm').setup({
            shell = myshell,
            float_opts = {
                width = function()
                    return math.floor(vim.o.columns * 1.0)
                end,
                height = function()
                    return math.floor(vim.o.lines * 1.0)
                end,
            },
        })

        local Terminal = require('toggleterm.terminal').Terminal

        local newshell = Terminal:new({
            cmd = myshell,
            direction = 'float',
            dir = 'git_dir',
        })

        local yazi = Terminal:new({
            cmd = 'yazi',
            direction = 'float',
            dir = 'git_dir',
        })

        vim.keymap.set('n', '<leader>vm', function()
            newshell:toggle()
        end, { remap = false, silent = true, desc = 'zz:toggleterm:NewShellToggle' })
        vim.keymap.set('n', '<leader>vy', function()
            yazi:toggle()
        end, { remap = false, silent = true, desc = 'zz:toggleterm:NewShellToggle' })
    end,
}
