return {
    "folke/tokyonight.nvim",
    opts = {},
    config = function()
        vim.cmd('colorscheme tokyonight-night')
        vim.api.nvim_set_hl(0, 'MatchParen', {fg='#ffff00', bg='NONE', bold=true})
    end
}
