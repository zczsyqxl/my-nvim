return {
    enabled = true,
    -- list on top, input at the bottom (reverse=true inverts the list, classic telescope UX)
    -- layout = {
    --     preset = function()
    --         return vim.o.columns >= 120 and 'telescope' or 'vertical'
    --     end,
    -- },
    sources = {
        explorer = {
            -- preview = "main": show the preview in the main window (the normal
            -- buffer area on the right; the original buffer is restored after
            -- closing the explorer) instead of the small pane at the sidebar
            -- bottom (the preset ships a height=0.4 bottom window).
            -- hidden: the preview starts hidden (keeps the dashboard uncovered
            -- on nvim <dir> startup); press P (toggle_preview) in the explorer
            -- to show it on demand.
            -- win.preview: preview float styling (size stays default = fill
            -- the main window). border options: nvim native "none"/"single"/
            -- "double"/"rounded"/"solid"/"shadow", snacks-only single-side
            -- "left"/"right"/"top"/"bottom"/"top_bottom", padding "hpad"/
            -- "vpad", or a custom 8-char string / 8-item table.
            -- NOTE: source-level overrides must live under
            -- picker.sources.explorer (see the merge table in
            -- snacks/picker/config/init.lua); the top-level opts.explorer is
            -- the MODULE slot — the picker's source resolution never reads it.
            layout = { preset = 'sidebar', preview = 'main', hidden = { 'preview' } },
            win = {
                preview = {
                    border = 'double',
                    title = '{preview}',
                    title_pos = 'center',
                },
            },
        },
    },
}
