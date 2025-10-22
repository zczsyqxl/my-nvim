if vim.g.vscode then
    return {}
else
    return {
        'Xuyuanp/nerdtree-git-plugin',
        config = function()
            vim.g.NERDTreeGitStatusUseNerdFonts = 1
            vim.g.NERDTreeGitStatusUntrackedFilesMode = 'all'
        end,
        dependencies = {
            'scrooloose/nerdtree',
            config = function()
                vim.g.NERDTreeChDirMode = 3
                vim.keymap.set("n", "<leader>vn", function() vim.cmd('NERDTreeToggle') end, {noremap = true})
                -- vim.keymap.set("n", "<leader>vf", "<cmd>NERDTreeFind<cr>", {noremap = true})
            end
        }
    }
end
