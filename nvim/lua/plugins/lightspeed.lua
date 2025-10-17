
return {
	'ggandor/lightspeed.nvim',
	config = function()
		require'lightspeed'.setup {
			ignore_case = true,
			substitute_chars = { [' '] = '■' },
			safe_labels = {nil},
			labels = { "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"},
		}

		function set_highlight(group, fg, bg, bold, underline)
			vim.api.nvim_set_hl(0, group, {fg = fg, bg = bg, bold = bold, underline=underline})
		end

		set_highlight("LightspeedMaskedChar", "#adff2f", "", false, false)
		set_highlight("LightspeedLabel", "#80dcfe", "", false, false)
		set_highlight("LightspeedCursor", "#000080", "#adff2f", false, false)
		set_highlight("LightspeedLabelDistant", "#4170ff", "", false, true)

		vim.keymap.set('', 's', '<Plug>Lightspeed_omni_s', {remap=true})
	end,
}
