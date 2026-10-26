return {
    'saghen/blink.cmp',
    dependencies = { 'Kurama622/llm.nvim', 'saghen/blink.lib' }, -- blink.cmp v2 split its core into blink.lib, a hard dependency
    -- v2 downloads the prebuilt Rust fuzzy matcher (falls back to slower Lua without it)
    build = function()
        require('blink.cmp').build():pwait()
    end,
    opts = {
        snippets = { preset = 'luasnip' }, -- keep the LuaSnip popup path working (A-l/A-h jump keys live in luaSnip.lua)

        completion = {
            menu = {
                scrollbar = false,
                border = 'none',
                winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:FloatBorder',

                draw = {
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx)
                                if ctx.item.kind_name == 'llm' then
                                    return ' '
                                else
                                    return ctx.kind_icon
                                end
                            end,

                            highlight = function(ctx)
                                if ctx.item.kind_name == 'llm' then
                                    return 'BlinkCmpKindSnippet'
                                else
                                    return ctx.kind_hl
                                end
                            end,
                        },
                    },

                    -- columns = {
                    --   { "kind_icon", "kind" },
                    --   { "label", "label_description", gap = 1 },
                    --   { "source_name", "source_id", gap = 1 },
                    -- },
                },
            },
            -- nvim-cmp shows docs automatically when the popup opens; blink defaults to false
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = 'none' },
            },
            trigger = {
                prefetch_on_insert = false,
                show_on_blocked_trigger_characters = {},
            },
        },
        signature = { window = { border = 'single' } },

        -- v2 overrides cmdline mode with menu.auto_show = false (its ghost-text replacement
        -- only renders with noice.nvim, which we don't use), so re-enable the popup.
        -- sources are overridden to {'buffer','cmdline'} in cmdline mode, so '/' completes
        -- buffer words and ':' completes commands.
        -- cmdline has its own keymap (preset 'cmdline', NOT inherited): C-n/C-p come from the
        -- preset, C-j/C-k must be re-declared here to work in cmdline mode
        cmdline = {
            completion = { menu = { auto_show = true } },
            keymap = {
                preset = 'cmdline',
                ['<C-j>'] = { 'select_next' },
                ['<C-k>'] = { 'select_prev' },
                ['<Tab>'] = { 'select_and_accept', 'fallback' },
            },
        },

        keymap = {
            preset = 'default',
            -- the default preset has no C-n/C-p; mirror nvim-cmp muscle memory (+ C-j/C-k)
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-y>'] = {
                function(cmp)
                    cmp.show({ providers = { 'llm' } })
                end,
            },
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
        },

        sources = {
            -- if you want to use auto-complete
            -- cmdline provider is builtin (blink.cmp.sources.cmdline); it only triggers in cmdline mode
            default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline', 'llm' },
            per_filetype = {
                -- optionally inherit from the `default` sources
                llm = { inherit_defaults = false },
            },

            providers = {
                llm = {
                    name = 'LLM',
                    module = 'llm.common.completion.frontends.blink',
                    timeout_ms = 10000,
                    score_offset = 100,
                    async = true,
                },
            },
        },
    },
    config = function(_, opts)
        require('blink.cmp').setup(opts)
        -- inject blink's capabilities for every server, mirroring the nvimCmp pattern
        -- (kept out of config/lsp.lua so the completion engine stays swappable)
        vim.lsp.config('*', { capabilities = require('blink.cmp').get_lsp_capabilities() })
    end,
}
