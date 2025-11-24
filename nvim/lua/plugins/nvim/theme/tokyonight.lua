return {
    "folke/tokyonight.nvim",
    opts = {
        style = 'night',
        terminal_colors = false,
    },
    config = function(_,opts)
        require('tokyonight').setup(opts)
        vim.cmd('colorscheme tokyonight')
    end
}
