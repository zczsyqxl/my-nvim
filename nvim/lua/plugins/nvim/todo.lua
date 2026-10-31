-- Snacks.picker frontend on top of todo-comments' rg-based search engine,
-- equivalent to todo-comments' TodoTelescope command (Telescope is not
-- installed in this config; snacks.nvim is the picker in use).
local function todo_picker(opts)
    opts = opts or {}
    Snacks.picker({
        -- forwarded to the finder below for keyword filtering
        keywords = opts.keywords,

        -- snacks contract: the finder function itself runs synchronously
        -- (still inside the keymap's C-call stack), so it must RETURN
        -- either an item table or an async producer function. Yielding
        -- directly from the finder body raises
        -- "attempt to yield across C-call boundary".
        finder = function(fopts, ctx)
            return function(cb)
                -- Async context driving this producer (set by finder:run)
                local async = ctx.async
                require('todo-comments.search').search(function(todos)
                    local keywords = require('todo-comments.config').options.keywords
                    for _, todo in ipairs(todos) do
                        local kw = keywords[todo.tag]
                        cb({
                            text = todo.text, -- fuzzy match text (tag + message)
                            file = todo.filename,
                            pos = { todo.lnum, todo.col }, -- jump target, 1-based
                            line = todo.line, -- full line for preview
                            tag = todo.tag, -- normalized tag, e.g. TODO / FIX / HACK
                            message = todo.message, -- comment text after the tag
                            icon = kw and kw.icon or '',
                        })
                    end
                    async:resume() -- wake the suspended producer
                end, { keywords = fopts.keywords })
                async:suspend() -- park the coroutine until rg finishes
            end
        end,

        format = function(item)
            local ret = {} ---@type snacks.picker.Highlight[]
            -- tag rendered with its own highlight group (TodoBgTODO etc.,
            -- defined by todo-comments at setup time)
            ret[#ret + 1] = { item.icon .. item.tag .. ' ', 'TodoBg' .. item.tag }
            ret[#ret + 1] = { vim.fs.basename(item.file), 'SnacksPickerFile' }
            ret[#ret + 1] = { ':' .. item.pos[1] .. ' ', 'SnacksPickerLine' }
            ret[#ret + 1] = { item.message, 'Comment' }
            return ret
        end,

        preview = 'file', -- file preview, auto-scrolled to pos
        win = { input = { title = ' Todo ' } },
    })
end

return {
    'folke/todo-comments.nvim',
    -- lazy = false: adding keys would otherwise make lazy.nvim lazy-load
    -- this plugin, which would disable the in-editor TODO highlighting.
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    -- ,st-style LazyVim prefixes were rejected on purpose: ,s / ,S are
    -- active hop keys, and ,st would delay them by timeoutlen.
    keys = {
        { '<leader>ft', function() todo_picker() end, desc = 'zz:todo:picker' },
        { '<leader>fT', function() todo_picker({ keywords = 'TODO,FIX,FIXME' }) end, desc = 'zz:todo:picker (fix only)' },
        { '<leader>vt', '<cmd>TodoQuickFix<cr>', desc = 'zz:todo:quickfix' },
        { '<leader>vT', '<cmd>TodoLocList<cr>', desc = 'zz:todo:loclist' },
        -- jump to next/prev todo comment. NOTE: the README's ]t/[t examples are
        -- LazyVim bindings, not built-in (todo-comments ships no keymaps);
        -- ]e/[e are free here (mini.bracketed has no 'e' target)
        { ']e', function() require('todo-comments.jump').next() end, desc = 'zz:todo:NextTodo' },
        { '[e', function() require('todo-comments.jump').prev() end, desc = 'zz:todo:PrevTodo' },
    },
}
