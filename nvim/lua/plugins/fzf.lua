if vim.g.vscode then
    return {}
else
    return {
        { 
            'junegunn/fzf',
        },
        {
            'junegunn/fzf.vim'
        }
    }
end


