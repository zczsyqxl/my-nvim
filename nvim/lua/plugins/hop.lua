
return {
	'smoka7/hop.nvim',
    -- 键位提升到 spec 顶层 keys 才能懒加载（写在 config 里 lazy 看不见，会启动即加载）
	keys = {
		-- { '<leader>f', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.f' },
		-- { '<leader>F', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.F' },
		-- { '<leader>t', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.t' },
		-- { '<leader>T', function() require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1.T' },
		{ '<leader>w', function() require('hop').hint_words({ direction = require('hop.hint').HintDirection.AFTER_CURSOR }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_words.after' },
		{ '<leader>b', function() require('hop').hint_words({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_words.before' },
		{ '<leader>j', function() require('hop').hint_lines({ direction = require('hop.hint').HintDirection.AFTER_CURSOR }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_lines.after' },
		{ '<leader>k', function() require('hop').hint_lines({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_lines.before' },
		{ '<leader>J', function() require('hop').hint_vertical({ direction = require('hop.hint').HintDirection.AFTER_CURSOR }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_vertical.after' },
		{ '<leader>K', function() require('hop').hint_vertical({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR }) end, mode = {'n','v','o'}, desc = 'zz:hop:hint_vertical.before' },
		{ '<leader>s', function() require('hop').hint_char1() end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char1' },
		-- { '<leader>x', function() require('hop').hint_char2() end, mode = {'n','v','o'}, desc = 'zz:hop:hint_char2' },
		{ '<leader>z', function() require('hop').hint_patterns() end, mode = {'n','v','o'}, desc = 'zz:hop:hint_patterns' },
		-- { ',a', function() require('hop').hint_anywhere() end, mode = {'n','v','o'}, desc = 'zz:hop:hint_anywhere' },
		-- hop-yank 是 hop.nvim 自带模块（lua/hop-yank/）
		{ ',x', function() require('hop-yank').yank_char1() end, mode = {'n','v','o'}, desc = 'zz:hop:hopyank.yank_char1' },
		{ ',X', function() require('hop-yank').paste_char1() end, mode = {'n','v','o'}, desc = 'zz:hop:hopyank.paste_char1' },
	},
	opts = {
		uppercase_labels = true,
		multi_windows = true,
	},
}
