    -- Shared cycle_win key spec. Input accepts insert+normal; list/preview
    -- are normal-mode-only windows, the extra "i" in the mode list is inert
    -- there.
    local cycleKey = { "cycle_win", mode = { "i", "n" }, desc = "Cycle Windows" }

    -- Function-key slots for external translation layers (e.g. AutoHotkey)
    -- that map real chords onto the otherwise unreachable F13-F24 range.
    -- Legacy key-protocol caveats (terminal interception, C0 aliasing such as
    -- C-i==Tab, C-m==CR) disappear entirely: the byte stream is one clean
    -- code point per key. The alt originals (<a-x>) stay untouched.
    -- window coverage: input AND list — same as the <a-x> defaults;
    -- the preview window binds none of these (no such default keys there).
    local toggleCAlts = {
        { "<F16>", "toggle_follow",   "Toggle Follow" },   -- <a-f> toggle_follow
        { "<F17>", "toggle_hidden",   "Toggle Hidden" },   -- <a-h> toggle_hidden
        { "<F18>", "toggle_ignored",  "Toggle Ignored" },  -- <a-i> toggle_ignored
        { "<F19>", "toggle_regex",    "Toggle Regex" },    -- <a-r> toggle_regex
        { "<F14>", "toggle_maximize", "Toggle Maximize" }, -- <a-m> toggle_maximize
        { "<F13>", "toggle_preview",  "Toggle Preview" },  -- <a-p> toggle_preview
        { "<F15>", "inspect",         "Inspect" },         -- <a-d> inspect
    }
    local function caKeys(modes)
        local keys = {}
        for _, k in ipairs(toggleCAlts) do
            keys[k[1]] = { k[2], mode = modes, desc = k[3] }
        end
        keys["<F12>"] = cycleKey -- <a-w> cycle_win
        return keys
    end

return {
    enabled = true,
    -- list on top, input at the bottom (reverse=true inverts the list, classic telescope UX)
    -- layout = {
    --     preset = function()
    --         return vim.o.columns >= 120 and 'telescope' or 'vertical'
    --     end,
    -- },
    -- win.*.keys: extra picker-window keymaps (merged over the defaults in
    -- picker/config/defaults.lua). Window notes:
    --   input:   <PageUp>/<PageDown> mirror the <c-b>/<c-f> preview scrolling
    --            while typing; <F12> cycles windows (alt original <a-w>).
    --   preview: a real buffer, so <PageUp>/<PageDown> scroll it natively when
    --            focus is here; only added <F12> (default <a-w> stays).
    --   list:    <F12> cycles windows; <PageUp>/<PageDown> scroll the preview
    --            while focus is here. List paging stays <c-d>/<c-u>.
    win = {
        input = {
            keys = vim.tbl_extend("error", caKeys({ "i", "n" }), {
                ["<PageDown>"] = { "preview_scroll_down", mode = { "i", "n" }, desc = "Preview Scroll Down" },
                ["<PageUp>"] = { "preview_scroll_up", mode = { "i", "n" }, desc = "Preview Scroll Up" },
            }),
        },
        list = {
            keys = vim.tbl_extend("error", caKeys("n"), {
                ["<PageDown>"] = { "preview_scroll_down", mode = "n", desc = "Preview Scroll Down" },
                ["<PageUp>"] = { "preview_scroll_up", mode = "n", desc = "Preview Scroll Up" },
            }),
        },
        preview = {
            keys = { ["<F12>"] = cycleKey },
        },
    },
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
