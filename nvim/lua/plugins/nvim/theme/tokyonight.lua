return {
    "folke/tokyonight.nvim",
    opts = {},
    config = function()
        vim.cmd('colorscheme tokyonight-night')
        vim.api.nvim_set_hl(0, 'MatchParen', {fg='#ffff00', bg='NONE', bold=true})
		local function set_hl(g, fg, bg, bold, underline)
			vim.api.nvim_set_hl(0, g, { fg = fg, bg = bg, bold = bold, underline = underline })
		end
		set_hl('HopNextKey',  '#80dcfe', '', false, false)
		set_hl('HopNextKey1', '#adff2f', '', false, false)
		set_hl('HopNextKey2', '#1e90ff', '', false, false)
		set_hl('HopPreview',  'white', '#191970', false, false)
    end
}
