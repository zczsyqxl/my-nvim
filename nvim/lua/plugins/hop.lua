
return {
	'smoka7/hop.nvim',
    opts = {
        uppercase_labels = true,
        multi_windows = true,
    },
	config = function(_, opts)
        local hop = require('hop')
		hop.setup(opts)

		local directions = require('hop.hint').HintDirection
		vim.keymap.set('', '<leader>g', function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		end, {remap=true})
		vim.keymap.set('', '<leader>G', function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		end, {remap=true})
		vim.keymap.set('', '<leader>t', function()
			hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		end, {remap=true})
		vim.keymap.set('', '<leader>T', function()
			hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		end, {remap=true})
		vim.keymap.set('', '<leader>w', function()
			hop.hint_words({ direction = directions.AFTER_CURSOR })
		end, {remap=true})
		vim.keymap.set('', '<leader>b', function()
			hop.hint_words({ direction = directions.BEFORE_CURSOR })
		end, {remap=true})
		vim.keymap.set('', '<leader>j', function()
			hop.hint_lines({ direction = directions.AFTER_CURSOR })
		end, {remap=true})
		vim.keymap.set('', '<leader>k', function()
			hop.hint_lines({ direction = directions.BEFORE_CURSOR })
		end, {remap=true})
		vim.keymap.set('', '<leader>J', function()
			hop.hint_vertical({ direction = directions.AFTER_CURSOR })
		end, {remap=true})
		vim.keymap.set('', '<leader>K', function()
			hop.hint_vertical({ direction = directions.BEFORE_CURSOR })
		end, {remap=true})
		vim.keymap.set('', '<leader>s', function()
			hop.hint_char1()
		end, {remap=true})
		-- vim.keymap.set('', '<leader>x', function()
		-- 	hop.hint_char2()
		-- end, {remap=true})
		vim.keymap.set('', '<leader>z', function()
			hop.hint_patterns()
		end, {remap=true})
		vim.keymap.set('', ',A', function()
			hop.hint_anywhere()
		end, {remap=true})

		local hopyank = require('hop-yank')
		vim.keymap.set('', ',x', function()
			hopyank.yank_char1()
		end, {remap=true})
		vim.keymap.set('', ',X', function()
			hopyank.paste_char1()
		end, {remap=true})

		local function set_hl(g, fg, bg, bold, underline)
			vim.api.nvim_set_hl(0, g, { fg = fg, bg = bg, bold = bold, underline = underline })
		end
		set_hl('HopNextKey',  '#80dcfe', '', false, false)
		set_hl('HopNextKey1', '#adff2f', '', false, false)
		set_hl('HopNextKey2', '#1e90ff', '', false, false)
		set_hl('HopPreview',  'white', '#191970', false, false)
	end,
}
