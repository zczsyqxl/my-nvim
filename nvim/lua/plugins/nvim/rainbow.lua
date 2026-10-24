return {
    'hiphish/rainbow-delimiters.nvim',
    -- lazy: attach per buffer when the first file buffer is read
    event = 'VeryLazy',
    config = function()
        local delHighlight = {
            'RainbowYellow',
            'RainbowBlue',
            'RainbowRed',
            'RainbowGreen',
            'RainbowOrange',
            'RainbowCyan',
            'RainbowPurple',
        }
        require('rainbow-delimiters.setup').setup({
            strategy = {
                -- ...
            },
            query = {
                -- ...
            },
            highlight = delHighlight,
        })
    end,
}
