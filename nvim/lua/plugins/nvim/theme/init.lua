local theme = 'tokyonight'
return {
    require(
        ({
            onemonokai = 'plugins.nvim.theme.onemonokai',
            tokyonight = 'plugins.nvim.theme.tokyonight',
        })[theme]
        or 'plugins.nvim.theme.onemonokai'
    )
}
