local cmp = 'nvimcmp'
return {
    require(
        ({
            blinkcmp = 'plugins.nvim.cmpn.blinkcmp',
            nvimcmp = 'plugins.nvim.cmpn.nvimCmp'
        })[cmp]
        or 'plugins.nvim.cmpn.coc'
    )
}
