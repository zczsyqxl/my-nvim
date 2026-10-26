local cmp = 'blinkcmp'
return {
    require(({
        blinkcmp = 'plugins.nvim.cmpn.blinkcmp',
        nvimcmp = 'plugins.nvim.cmpn.nvimCmp',
    })[cmp] or 'plugins.nvim.cmpn.nvimCmp'),
}
