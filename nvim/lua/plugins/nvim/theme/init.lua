local theme = 'tokyonight'
return {
    require(
        ({
            tokyonight = 'plugins.nvim.theme.tokyonight',
        })[theme]
        or 'plugins.nvim.theme.tokyonight'
    )
}
