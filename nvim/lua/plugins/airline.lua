if vim.g.vscode then
	return {}
else
	return {
		{ 
			'vim-airline/vim-airline',
			init = function()
				vim.g.airline_powerline_fonts=1
			end,
		},
		{ 'vim-airline/vim-airline-themes' }
	}
end



