return {
    "ahmedkhalf/project.nvim",
    opts = {
        manual_mode = false,          -- fully automatic
        detection_methods = { "pattern" },
        patterns = {
            ".git",
            "Cargo.toml",
            "go.mod",
            "CMakeLists.txt",
            '.project',
            '.cproject',
        },
        -- the two lines below are the key to "pinning" the cwd
        silent_chdir = true,          -- no noise when changing directory
        scope_chdir = "global",       -- global scope, shared by all windows
    },
    config = function(_, opts)
        require("project_nvim").setup(opts)
        -- trigger once automatically so we start at the project root
        vim.schedule(function() vim.cmd("silent! ProjectRoot") end)
    end,
}


