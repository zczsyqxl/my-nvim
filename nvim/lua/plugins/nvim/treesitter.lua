return {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').install({
            'c',
            'markdown',
            'markdown_inline',
            'python',
            'lua',
            'rust',
            'bash',
            'c_sharp',
            'cmake',
            'cpp',
            'diff',
            'git_config',
            'html',
            'json',
            'json5',
            'make',
            'ninja',
            'ruby',
            'sql',
            'ssh_config',
            'vim',
            'vimdoc',
            'yaml',
            'latex',
        })
        -- new versions no longer enable highlighting automatically; start it explicitly
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
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
