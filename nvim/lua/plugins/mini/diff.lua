require('mini.diff').setup({
    -- must stay below the diagnostic sign priority (10): in the default
    -- 'number' view style our sign extmarks carry only `number_hl_group`,
    -- so snacks.statuscolumn classifies them as anonymous "sign" marks and
    -- a priority of 199 would shadow diagnostics on the same line
    view = { priority = 5 },
    mappings = {
        apply = 'gy',
        reset = 'gY',
        textobject = 'gy',
        goto_first = '[G',
        goto_prev = '[g',
        goto_next = ']g',
        goto_last = ']G',
    },
})

-- overlay view draws deleted lines as virtual lines under the change
-- (overrides built-in linewise Select mode, see :h gH)
vim.keymap.set('n', 'gH', function()
    MiniDiff.toggle_overlay(0)
end, { desc = 'zz:mini.diff:Toggle overlay' })
