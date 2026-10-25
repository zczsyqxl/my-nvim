-- Terminal singletons, created lazily inside the keymap rhs (after the
-- plugin has loaded), so nothing but the two proxy mappings exist at startup.
local terms = {}

return {
    'akinsho/toggleterm.nvim',
    -- real mappings live in keys{} only: lazy loads the plugin on first
    -- press, then runs the rhs (no stub + config-time duplicate pattern)
    keys = {
        {
            '<leader>vm',
            function()
                if not terms.shell then
                    terms.shell = require('toggleterm.terminal').Terminal:new({
                        cmd = vim.fn.has('win32') == 1 and 'pwsh' or 'zsh',
                        direction = 'float',
                        dir = 'git_dir',
                    })
                end
                terms.shell:toggle()
            end,
            silent = true,
            desc = 'zz:toggleterm:ShellToggle',
        },
        {
            '<leader>vy',
            function()
                if not terms.yazi then
                    terms.yazi = require('toggleterm.terminal').Terminal:new({
                        cmd = 'yazi',
                        direction = 'float',
                        dir = 'git_dir',
                    })
                end
                terms.yazi:toggle()
            end,
            silent = true,
            desc = 'zz:toggleterm:YaziToggle',
        },
    },
    opts = {
        shell = vim.fn.has('win32') == 1 and 'pwsh' or 'zsh',
        float_opts = {
            width = function()
                return math.floor(vim.o.columns * 1.0)
            end,
            height = function()
                return math.floor(vim.o.lines * 0.85)
            end,
        },
    },
}
