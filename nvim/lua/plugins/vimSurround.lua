return {
    'tpope/vim-surround',
    init = function()
        vim.g.surround_47 = '/* \r */'
        vim.g.surround_42 = '/*\n\r\n*/'
        vim.g.surround_35 = '#if 0\n\r\n#endif'
    end,
}
