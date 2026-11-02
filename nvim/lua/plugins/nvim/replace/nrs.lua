return {
    'chrisgrieser/nvim-rip-substitute',
    cmd = 'RipSubstitute',
    opts = {
        popupWin = {
            border = "double",
            disableCompletions = false, -- such as from blink.cmp
        },
    },
    keys = {
        {
            '<leader>rs',
            function() require('rip-substitute').sub() end,
            mode = { 'n', 'x' },
            desc = 'zz:nrs:rip substitute',
        },
    },
}

