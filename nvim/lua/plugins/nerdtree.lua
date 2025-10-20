if vim.g.vscode then
	return {}
else
	return {
        {
            'scrooloose/nerdtree',
            config = function()
                vim.keymap.set("n", "<leader>vn", function() vim.cmd('NERDTreeToggle') end, {noremap = true})
                vim.keymap.set("n", "<leader>vf", "<cmd>NERDTreeFind<cr>", {noremap = true})
            end
        },
        {
            'Xuyuanp/nerdtree-git-plugin'
        }
	}
end
