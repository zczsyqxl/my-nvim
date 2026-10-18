return {
    'catgoose/nvim-colorizer.lua', -- actively maintained fork (the original norcalli version is unmaintained)
    opts = {
        filetypes = {
            'lua',
            'yaml',
            'conf',
            'toml',
        },
    },
    config = function(_, opts)
        require("colorizer").setup(opts);
    end,

}


