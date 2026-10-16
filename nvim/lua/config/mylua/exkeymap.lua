-- if loaded_exkeymap == 1 then
-- 	return
-- end
--
-- loaded_exkeymap = 1

local function foldcolumn_toggle()
	if vim.o.foldcolumn ~= '0' then
		vim.opt_local.foldcolumn = '0'
	else
		vim.opt_local.foldcolumn = '4'
	end
end

vim.keymap.set('n', '<leader>.', foldcolumn_toggle, {silent = true, desc = 'zz:foldcolumn_toggle'})

local function virtualedit_toggle()
	if vim.o.virtualedit == '' then
		vim.o.virtualedit = 'all'
        vim.api.nvim_echo({{'Enter virtual edit mode!', 'Error'}}, false, {})
	else
		vim.o.virtualedit = ''
        vim.api.nvim_echo({{'Exit virtual edit mode!', 'WarningMsg'}}, false, {})
	end
end

vim.keymap.set('n', "<leader>'", virtualedit_toggle, {silent = true, desc = 'zz:vitualedit_toggle'})


-- local function replace_item()
-- 	local old_word = vim.fn.expand('<cword>')
-- 	local new_word = vim.fn.input('Please input the new word: ')
-- 	vim.cmd(([[
-- 	%%s/%s/%s/gc
-- 	noh
-- 	]]):format(old_word, new_word))
-- end
--
-- vim.keymap.set('n', '<leader>r', replace_item, {silent = true, unique = false})


quickfix_is_open = false
quickfix_return_to_window = 0

local function toggle_quickfix_win()
	if quickfix_is_open == true then
		vim.cmd('cclose')
		quickfix_is_open = false
		vim.cmd(quickfix_return_to_window .. 'wincmd w')
	else
		quickfix_return_to_window = vim.fn.winnr()
		vim.cmd('vertical botright copen')
		vim.cmd('vertical resize 70')
		vim.cmd('wincmd =')
		quickfix_is_open = true
	end
end

vim.keymap.set('n', '<leader>`', toggle_quickfix_win, {silent = true, desc='zz:toggle_quickfix_win'})

