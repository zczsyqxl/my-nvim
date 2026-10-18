local M = {}

function M.setup()
    local gen_loader = require('mini.snippets').gen_loader
    local file = vim.fn.stdpath('config') .. '/snippets/snippets/global.json'

    require('mini.snippets').setup({
        snippets = {
            gen_loader.from_file(file),
            gen_loader.from_lang(),
        },
        mappings = {
            -- Expand snippet at cursor position. Created globally in Insert mode.
            expand = '<C-j>',

            -- Interact with default `expand.insert` session.
            -- Created for the duration of active session(s)
            jump_next = '<C-l>',
            jump_prev = '<C-h>',
            stop = '<C-c>',
        },
    })

    -- mini's session mappings are only created in Insert mode (hardcoded 'i' in
    -- the source), so add a Normal-mode stop here: stop only if a session is
    -- active, otherwise pass through to native C-c.
    -- (llm.nvim's C-c cancel is a buffer-local mapping with higher priority, unaffected.)
    vim.keymap.set('n', '<C-c>', function()
        local ms = require('mini.snippets')
        if ms.session.get() ~= nil then
            ms.session.stop()
        else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', false)
        end
    end, { desc = 'zz:MiniSnippets:stop session (normal)' })
end

M.setup()

return M
