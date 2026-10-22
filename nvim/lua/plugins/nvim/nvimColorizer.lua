return {
    'catgoose/nvim-colorizer.lua', -- actively maintained fork (the original norcalli version is unmaintained)
    -- lazy: colorize only matters for these filetypes
    ft = { 'lua', 'yaml', 'conf', 'toml' },
    opts = {
        filetypes = {
            'lua',
            'yaml',
            'conf',
            'toml',
        },
    },
    config = function(_, opts)
        require('colorizer').setup(opts)
    end,
}
