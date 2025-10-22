if vim.g.vscode then
	return {}
else
	return {
		'nvim-treesitter/nvim-treesitter',
        opts = {
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
            vim.api.nvim_create_autocmd('BufReadPost', {
                callback = function()
                    if vim.treesitter.language.get_lang(vim.bo.filetype) then
                        vim.opt_local.foldmethod = 'expr'
                        vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                        vim.opt_local.foldlevel = 99
                    end
                end,
            })
        end,
	}
end
