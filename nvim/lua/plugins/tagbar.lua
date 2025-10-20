if vim.g.vscode then
    return {}
else
    return {
        'majutsushi/tagbar',
        config = function()
            if vim.fn.has('win32') == 1 then
                vim.g.tagbar_ctags_bin = 'd:/DevTools/ctags/ctags.exe'
            else
                vim.g.tagbar_ctags_bin = '/usr/bin/ctags'
            end
            vim.keymap.set('n', '<leader>vd', '<cmd>TagbarToggle<cr>', { remap = false })
        end,
    }
end



