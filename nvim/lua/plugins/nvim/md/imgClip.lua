return {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {
        default = {},
    },
    -- keys = {
    --     { '<leaser>gp', '<cmd>PasteImage<cr>', desc = 'ZZ:ImgClip:PasteImageFromSystemClipboard'},
    -- },
    config = function(_, opts)
        require('img-clip').setup(opts)
        if vim.fn.has('win32') ~= 0 then
            vim.keymap.set('n', '<leader>ep', '<cmd>PasteImage<cr>', { desc = 'ZZ:ImgClip:PasteImageFromSystemClipboard' })
        end
    end,
}
