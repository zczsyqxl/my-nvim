return {
    'OXY2DEV/markview.nvim',
    dependency = {
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        preview = {
            modes = { "i", "n", "no", "c" },
            hybrid_modes = { "i" },
            enable = true,
            enable_hybrid_mode = true,
            linewise_hybrid_mode = true,
            filetypes = { 'markdown', 'llm'},
        },
    },
    config = function(_, opts)
        local ok, parser = pcall(vim.treesitter.language.get_lang, 'markdown')
        if ok and parser then
            vim.treesitter.language.register(parser, 'llm') -- llm ↔ markdown
        end
        require("markview").setup(opts);
        vim.keymap.set('n', '<leader>v.', '<cmd>Markview splitToggle<cr>', { remap = false, desc='zz:markview:SplitToggle'})
    end,

}


