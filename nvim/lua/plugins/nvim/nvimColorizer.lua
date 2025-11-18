return {
    'norcalli/nvim-colorizer.lua',
    opts = {
        'lua';
    },
    config = function(_, opts)
        require("colorizer").setup(opts);
    end,

}


