return {
    'saghen/blink.cmp',
    dependencies = { 'Kurama622/llm.nvim', 'saghen/blink.lib', 'Kaiser-Yang/blink-cmp-avante' }, -- blink.cmp v2 split its core into blink.lib, a hard dependency
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
                winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None,CurSearch:None',

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
            -- docs open manually via C-Space (toggle); C-b/C-f and PageUp/PageDown scroll
            documentation = {
                auto_show = false,
                window = { border = 'none' },
            },
            trigger = {
                prefetch_on_insert = false,
                show_on_blocked_trigger_characters = {},
            },
        },
        -- enabled: opt-in! blink ships signature help DISABLED by default (config/signature.lua:31).
        -- show_on_keyword: request signature help on any typed keyword; compensates for
        -- snippet-expanded '(' not counting as a typed trigger character
        signature = {
            enabled = true,
            window = { border = 'double' },
        },

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
            -- C-j/C-k select next/prev; the default preset also provides C-p (fallback_to_mappings)
            -- and C-n — our explicit C-n below overrides the preset's select_next with the docs toggle
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<C-k>'] = { 'select_prev', 'fallback' },
            -- long-doc scrolling alongside the preset's C-b/C-f
            ['<PageUp>'] = { 'scroll_documentation_up', 'fallback' },
            ['<PageDown>'] = { 'scroll_documentation_down', 'fallback' },
            -- manual docs toggle on C-n (overrides the preset's select_next; C-j/C-k cover
            -- selection). Rejected keys: C-Space (Windows IME swallows it), C-[ (ESC alias),
            -- C-Tab (old-protocol terminal sends plain Tab), C-g (prefix commands C-g u/j/k)
            ['<C-n>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<CR>'] = { 'select_and_accept', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
        },

        sources = {
            -- if you want to use auto-complete
            -- cmdline provider is builtin (blink.cmp.sources.cmdline); it only triggers in cmdline mode
            default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline', 'llm', 'avante' },
            per_filetype = {
                -- optionally inherit from the `default` sources
                llm = { inherit_defaults = false },
                AvanteInput = { 'avante', 'lsp', 'path', 'snippets', 'buffer' },
                AvantePrompt = { 'avante', 'lsp', 'path', 'snippets', 'buffer' },
            },

            providers = {
                llm = {
                    name = 'LLM',
                    module = 'llm.common.completion.frontends.blink',
                    timeout_ms = 10000,
                    score_offset = 100,
                    async = true,
                },
                avante = {
                    module = 'blink-cmp-avante',
                    name = 'Avante',
                    opts = {},
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
