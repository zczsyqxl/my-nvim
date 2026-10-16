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
            { name = 'path' },
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
                completion = {
                    winhighlight = "Normal:ZZ.NvimCmp.WinHighlight",
                    -- border = 'bold', --[bold, double, none,rounded,shadow,signle,solid]
                },
                documentation = {
                    winhighlight = "Normal:ZZ.NvimCmp.WinHighlight",
                    -- border = 'rounded',
                },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Tab>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources(tmeSources)
        })

        -- `/` 搜索：用 buffer 内容补全
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = 'buffer' } },
        })

        -- `:` 命令行：命令补全 + 文件路径补全
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline' },
            }),
        })
    end
}
