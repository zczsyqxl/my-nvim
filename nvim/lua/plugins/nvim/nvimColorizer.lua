return {
    'norcalli/nvim-colorizer.lua',
    opts = {
        'lua';
        'yaml';
        'conf';
        'toml';
    },
    config = function(_, opts)
        require("colorizer").setup(opts);
    end,

}


