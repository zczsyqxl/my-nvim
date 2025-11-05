return {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
        vim.keymap.set('i', '<cr>', function()
            return vim.fn['coc#pum#visible']() ~= 0
                and vim.fn['coc#pum#confirm']()
                or vim.api.nvim_replace_termcodes('<c-g>u<cr>', true, true, true)
        end, { expr = true, silent = true, remap = false})
        vim.keymap.set('i', '<c-]>', 'coc#refresh()', {expr = true, silent = true})
    end
}

