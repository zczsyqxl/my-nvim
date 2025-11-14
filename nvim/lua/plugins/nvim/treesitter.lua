return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        local ok, parser = pcall(vim.treesitter.language.get_lang, 'markdown')
        if ok and parser then
            vim.treesitter.language.register(parser, 'llm') -- llm ↔ markdown
        end
        ok, parser = pcall(vim.treesitter.language.get_lang, 'bash')
        if ok and parser then
            vim.treesitter.language.register(parser, 'zsh')
        end
        vim.api.nvim_create_autocmd('BufReadPost', {
            callback = function()
                if vim.treesitter.language.get_lang(vim.bo.filetype) then
                    vim.opt_local.foldmethod = 'expr'
                    vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.opt_local.foldlevel = 99
                end
            end,
        })
    end,
}
