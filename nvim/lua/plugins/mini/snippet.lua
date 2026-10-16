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

    -- mini 的会话映射只在 Insert 模式创建（源码里写死 'i'），
    -- 这里补 Normal 模式的 stop：有活跃会话才停止，否则保持 C-c 原生行为。
    -- （llm.nvim 的 C-c 取消是 buffer 局部映射，优先级更高，不受影响。）
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
