local tree = 'neo'
return {
    require(
        ({
            nvim = 'plugins.nvim.tree.nvimTree',
        })[tree]
        or 'plugins.nvim.tree.neoTree'
    )
}
