if vim.g.vscode then
    return {}
else
    return {
        "ahmedkhalf/project.nvim",
        opts = {
            manual_mode = false,          -- 全自动
            detection_methods = { "pattern" },
            patterns = {
                ".git",
                "package.json",
                "Cargo.toml",
                "go.mod",
                "CMakeLists.txt",
                '.project',
                '.cproject',
            },
            -- 下面两行是“钉死” cwd 的关键
            silent_chdir = true,          -- 切目录时不刷屏
            scope_chdir = "global",       -- 全局生效，所有窗口共享
        },
        config = function(_, opts)
            require("project_nvim").setup(opts)
            -- 自动触发一次，保证启动时就在项目根
            vim.schedule(function() vim.cmd("silent! ProjectRoot") end)
        end,
    }
end


