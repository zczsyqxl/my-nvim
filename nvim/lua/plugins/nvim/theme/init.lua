local theme = 'tokyonight'
return {
    require(
        ({
            tokyonight = 'plugins.nvim.theme.tokyonight',
            onedark = 'plugins.nvim.theme.onedark',
            nvim = 'plugins.nvim.theme.nvim',
        })[theme]
        or 'plugins.nvim.theme.tokyonight'
    )
}
