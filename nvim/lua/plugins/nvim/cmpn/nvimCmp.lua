local snipEngine = 'luasnip'
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'abeldekat/cmp-mini-snippets',
        'saadparwaiz1/cmp_luasnip',
    },
    event = 'InsertEnter',
    config = function()
        local cmp = require('cmp')
        local tmeSources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
        }

        if snipEngine == 'luasnip' then
            table.insert(tmeSources, { name = 'luasnip' })
        elseif snipEngine == 'mini' then
            table.insert(tmeSources, { name = 'mini_snippets' })
        end

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    if snipEngine == 'luasnip' then
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

                        -- For `mini.snippets` users:
                    elseif snipEngine == 'mini' then
                        local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        insert({ body = args.body }) -- Insert at cursor
                        cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        require("cmp.config").set_onetime({ sources = {} })
                    end
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources(tmeSources)
        })
        local capalilities = require('cmp_nvim_lsp').default_capabilities()
        vim.lsp.config('clangd', {
            capalilities = capalilities
        })
        vim.lsp.config('rust_analyzer', {
            capalilities = capalilities
        })
        vim.lsp.config('lua-ls', {
            capalilities = capalilities
        })
        vim.lsp.config('pyright', {
            capalilities = capalilities
        })
        vim.lsp.enable('clangd')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('pyright')
    end
}
