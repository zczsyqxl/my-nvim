if vim.g.vscode then
    return {}
else
    return {
        {
            "nvim-mini/mini.diff",
            version = false,
            config = function()
                require("mini.diff").setup()
            end,
        },
    }
end
