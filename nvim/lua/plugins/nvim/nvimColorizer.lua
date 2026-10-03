return {
    'catgoose/nvim-colorizer.lua', -- 活跃维护的 fork（原 norcalli 版已停更）
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


