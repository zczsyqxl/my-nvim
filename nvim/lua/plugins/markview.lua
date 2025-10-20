if vim.g.vscode then
    return {}
else
    return {
        'OXY2DEV/markview.nvim',
        config = function()
            require("markview").setup({
                preview = {
                    modes = { "i", "n", "no", "c" },
                    hybrid_modes = { "i" },
                    enable = true,
                    enable_hybrid_mode = true,
                    linewise_hybrid_mode = true,
                },
            });
            vim.keymap.set('n', '<leader>m', '<cmd>Markview splitToggle<cr>', { remap = false})
        end,

    }
end


