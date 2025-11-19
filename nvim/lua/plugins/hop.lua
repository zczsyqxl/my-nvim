
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
		-- vim.keymap.set('', '<leader>f', function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		-- end, {remap=true, desc='zz:hop:hint_char1.f'})
		-- vim.keymap.set('', '<leader>F', function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		-- end, {remap=true, desc='zz:hop:hint_char1.F'})
		-- vim.keymap.set('', '<leader>t', function()
		-- 	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		-- end, {remap=true, desc='zz:hop:hint_char1.t'})
		-- vim.keymap.set('', '<leader>T', function()
		-- 	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		-- end, {remap=true, desc='zz:hop:hint_char1.T'})
		vim.keymap.set('', '<leader>w', function()
			hop.hint_words({ direction = directions.AFTER_CURSOR })
		end, {remap=true, desc='zz:hop:hint_words.after'})
		vim.keymap.set('', '<leader>b', function()
			hop.hint_words({ direction = directions.BEFORE_CURSOR })
		end, {remap=true, desc='zz:hop:hint_words.before'})
		vim.keymap.set('', '<leader>j', function()
			hop.hint_lines({ direction = directions.AFTER_CURSOR })
		end, {remap=true, desc='zz:hop:hint_lines.after'})
		vim.keymap.set('', '<leader>k', function()
			hop.hint_lines({ direction = directions.BEFORE_CURSOR })
		end, {remap=true, desc='zz:hop:hit_lines.before'})
		vim.keymap.set('', '<leader>J', function()
			hop.hint_vertical({ direction = directions.AFTER_CURSOR })
		end, {remap=true, desc='zz:hop:hint_vertical.after'})
		vim.keymap.set('', '<leader>K', function()
			hop.hint_vertical({ direction = directions.BEFORE_CURSOR })
		end, {remap=true, desc='zz:hop:hint_vertical.before'})
		vim.keymap.set('', '<leader>s', function()
			hop.hint_char1()
		end, {remap=true, desc='zz:hop:hint_char1'})
		-- vim.keymap.set('', '<leader>x', function()
		-- 	hop.hint_char2()
		-- end, {remap=true, desc='zz:hop:hint_char2'})
		vim.keymap.set('', '<leader>z', function()
			hop.hint_patterns()
		end, {remap=true, desc='zz:hop:hint_patterns'})
		-- vim.keymap.set('', ',a', function()
		-- 	hop.hint_anywhere()
		-- end, {remap=true, desc='zz:hop:hint_anywhere'})

		local hopyank = require('hop-yank')
		vim.keymap.set('', ',x', function()
			hopyank.yank_char1()
		end, {remap=true, desc='zz:hop:hopyank.yank_char1'})
		vim.keymap.set('', ',X', function()
			hopyank.paste_char1()
		end, {remap=true, desc='zz:hop:hopyank.paste_char1'})
	end,
}
