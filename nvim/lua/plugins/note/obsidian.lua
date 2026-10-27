-- vault root differs per platform
local vaults = vim.fn.has('win32') == 1 and 'D:/myprojects/vaults' or '~/myprojects/vaults'

-- flatten a vault-relative dir + base name into one dash-joined stem, so stems and ids are
-- globally unique: dir "tools/nvim" + base "keymap" -> "tools-nvim-keymap".
-- used by both note_id_func and note_path_func (requires plugin modules lazily at call time)
local function flattened_stem(dir, base)
    local rel = dir and dir:vault_relative_path() or ""
    local parts = {}
    for part in rel:gmatch("[^/\\]+") do
        parts[#parts + 1] = part
    end
    local flat = table.concat(parts, "-")
    local stem = tostring(base or "")
    if flat ~= "" and stem ~= "" and stem:sub(1, #flat + 1) ~= flat .. "-" then
        stem = flat .. "-" .. stem
    end
    return stem
end

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    event = 'VeryLazy',
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        picker = {
            name = "snacks.picker",
        },
        ui = { enable = false }, -- obsidian's conceal-based UI (checkbox toggle, link conceal); disabled to avoid the conceallevel warning and conflicts with render-markdown
        -- id mirrors the flattened filename: input "tools/nvim/keymap" -> id "tools-nvim-keymap";
        -- empty titles fall back to timestamp IDs (title_to_slug handles this).
        -- wrapped in a closure: obsidian is lazy-loaded (ft=markdown), requiring the module eagerly here would fail at spec-collection time
        note_id_func = function(title, path)
            local slug = require("obsidian.builtin").title_to_slug(title)
            return flattened_stem(path, slug)
        end,
        -- keep the input's dir but rename the stem via flattened_stem; stems already carrying
        -- the prefix (produced by note_id_func) are left untouched. daily notes are verbatim and
        -- resolve their own date-named path, so the daily folder is exempted here.
        note_path_func = function(spec)
            local rel = spec.dir:vault_relative_path() or ""
            -- the global Obsidian table is the sanctioned options access (get_client()/client are deprecated for 4.0)
            local daily = Obsidian.opts.daily_notes.folder
            if daily and (rel == daily or rel:sub(1, #daily + 1) == daily .. "/") then
                return (spec.dir / tostring(spec.id)):with_suffix(".md", true)
            end
            return (spec.dir / flattened_stem(spec.dir, spec.id)):with_suffix(".md", true)
        end,
        workspaces = {
            { name = "personal", path = vaults .. "/personal" },
            { name = "work",     path = vaults .. "/work" },
        },
        daily_notes = { folder = "daily" }, -- daily notes go to <workspace>/daily/YYYY-MM-DD.md (relative to active vault)
        unique_note = {
            folder = "muse", -- unique notes (,ou) land in <active workspace>/muse; created on first use after a confirm prompt
        },
        config = function(_, opts)
            -- official switch to drop the default buffer-local <CR>/]o/[o maps
            -- (set before setup; vim.keymap.del against them would fail with E31 at startup)
            vim.g.obsidian_default_keymap = false
            require("obsidian").setup(opts)
        end,
        callbacks = {
            enter_note = function(note)
                -- note-only navigation keys, buffer-local on vault notes
                vim.keymap.set("n", "]e", function()
                    require("obsidian.actions").nav_link("next", false)
                end, { buffer = true, silent = true, desc = "zz:obsidian:next_link" })
                vim.keymap.set("n", "[e", function()
                    require("obsidian.actions").nav_link("prev", false)
                end, { buffer = true, silent = true, desc = "zz:obsidian:prev_link" })
                vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { buffer = true, silent = true, desc = "zz:obsidian:backlinks" })
                vim.keymap.set("n", "<leader>of", "<cmd>Obsidian footnotes<cr>", { buffer = true, silent = true, desc = "zz:obsidian:footnotes" })
                vim.keymap.set("n", "<leader>oF", "<cmd>Obsidian follow_link<cr>", { buffer = true, silent = true, desc = "zz:obsidian:follow_link" })
                vim.keymap.set("n", "<leader>ol", "<cmd>Obsidian links<cr>", { buffer = true, silent = true, desc = "zz:obsidian:links" })
                vim.keymap.set("n", "<leader>op", "<cmd>Obsidian paste_img<cr>", { buffer = true, silent = true, desc = "zz:obsidian:paste_img" })
                vim.keymap.set("n", "<leader>or", "<cmd>Obsidian rename<cr>", { buffer = true, silent = true, desc = "zz:obsidian:rename" })
                vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian toc<cr>", { buffer = true, silent = true, desc = "zz:obsidian:toc" })
                vim.keymap.set("n", "<leader>oT", "<cmd>Obsidian template<cr>", { buffer = true, silent = true, desc = "zz:obsidian:template" })
            end,
        },
    },
    keys = {
        { "<leader>oc",  "<cmd>Obsidian check<cr>",      desc = "zz:obsidian:check",         silent = true },
        { "<leader>odl", "<cmd>Obsidian dailies<cr>",    desc = "zz:obsidian:dailies",       silent = true },
        { "<leader>odt", "<cmd>Obsidian today<cr>",      desc = "zz:obsidian:today",         silent = true },
        { "<leader>odm", "<cmd>Obsidian tomorrow<cr>",   desc = "zz:obsidian:tomorrow",      silent = true },
        { "<leader>ody", "<cmd>Obsidian yesterday<cr>",  desc = "zz:obsidian:yesterday",     silent = true },
        { "<leader>ov",  "<cmd>Obsidian<cr>",            desc = "zz:obsidian:obsidian",      silent = true },
        { "<leader>oh",  "<cmd>Obsidian help<cr>",       desc = "zz:obsidian:help",          silent = true },
        { "<leader>oH",  "<cmd>Obsidian helpgrep<cr>",   desc = "zz:obsidian:helpgrep",      silent = true },
        { "<leader>om",  "<cmd>Obsidian bookmarks<cr>",  desc = "zz:obsidian:bookmarks",     silent = true },
        { "<leader>on",  "<cmd>Obsidian new<cr>",        desc = "zz:obsidian:new",           silent = true },
        { "<leader>oN",  "<cmd>Obsidian new_from_template<cr>", desc = "zz:obsidian:new_from_template", silent = true },
        { "<leader>oo",  "<cmd>Obsidian open<cr>",       desc = "zz:obsidian:open",          silent = true },
        { "<leader>oq",  "<cmd>Obsidian quick_switch<cr>", desc = "zz:obsidian:quick_switch", silent = true },
        { "<leader>oR",  "<cmd>Obsidian rebuild_cache<cr>", desc = "zz:obsidian:rebuild_cache", silent = true },
        { "<leader>os",  "<cmd>Obsidian search<cr>",     desc = "zz:obsidian:search",        silent = true },
        { "<leader>og",  "<cmd>Obsidian tags<cr>",       desc = "zz:obsidian:tags",          silent = true },
        { "<leader>ou",  "<cmd>Obsidian unique_note<cr>", desc = "zz:obsidian:unique_note",  silent = true },
        { "<leader>ow",  "<cmd>Obsidian workspace<cr>",  desc = "zz:obsidian:workspace",     silent = true },
    },
}
