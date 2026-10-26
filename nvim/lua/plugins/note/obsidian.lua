-- vault root differs per platform
local vaults = vim.fn.has('win32') == 1 and 'D:/vaults' or '~/vaults'

return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        workspaces = {
            { name = "personal", path = vaults .. "/personal" },
            { name = "work",     path = vaults .. "/work" },
        },
    },
}
