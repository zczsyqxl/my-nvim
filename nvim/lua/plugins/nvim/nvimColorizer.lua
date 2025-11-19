return {
    'norcalli/nvim-colorizer.lua',
    opts = {
        'lua';
        'yaml';
        'conf';
    },
    config = function(_, opts)
        require("colorizer").setup(opts);
    end,

}


