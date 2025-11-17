return {
    "cpea2506/one_monokai.nvim",
    config = function()
        require("one_monokai").setup({
            transparent = false,
            colors = {},
            highlights = function(colors)
                return {}
            end,
            italics = true,
        })
    end
}


