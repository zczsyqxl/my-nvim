if vim.g.vscode then
    return {}
else
    return {
        'OXY2DEV/markview.nvim',
        opts = {
            preview = {
                modes = { "i", "n", "no", "c" },
                hybrid_modes = { "i" },
                enable = true,
                enable_hybrid_mode = true,
                linewise_hybrid_mode = true,
            },
        },
        config = function(_, opts)
            require("markview").setup(opts);
            vim.keymap.set('n', '<leader>v.', '<cmd>Markview splitToggle<cr>', { remap = false})
        end,

    }
end


