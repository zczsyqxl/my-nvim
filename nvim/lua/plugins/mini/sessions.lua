-- mini.sessions: local-only sessions, one `.session.nvim` per project root.
-- First visit to a project: press z' to create it manually. After that:
--   - picking the project via ,<leader>fp or the dashboard restores it
--     (both call `MiniSessions.read()`, which prefers the local session)
--   - autowrite (default on) rewrites the active session on VimLeavePre, and
--     read() itself writes back the current session before switching away
-- directory = '': global named sessions are disabled, so read() has no
-- "latest global" fallback -- the classic cd-hijack (restoring some other
-- project's session over the just-chdir'd one) is impossible by design.
-- autoread = true (user choice): bare `nvim` restores the local session at
-- VimEnter when nothing is shown yet; the snacks dashboard races this -- whichever
-- VimEnter callback runs first wins.
require('mini.sessions').setup({
    file = '.session.nvim',
    directory = '',
    autoread = true,
    autowrite = true,
    hooks = {
        -- Before successful action
        pre = {
            write = function()
                pcall(function()
                    local n = 0
                    for _, p in ipairs(Snacks.picker.get({ source = 'explorer' })) do
                        p:close()
                        n = n + 1
                    end
                    if n > 0 then
                        -- Picker:close() tears its windows/buffers down inside
                        -- vim.schedule(), while mksession runs synchronously
                        -- right after this hook -- without flushing, the
                        -- explorer windows (incl. the NORMAL left sidebar win
                        -- and the preview-shown main win) get captured and
                        -- restore as an empty left buffer + [No Name] buffer.
                        -- The teardown spans several scheduler rounds (finder
                        -- abort -> layout/win close -> main-win buffer
                        -- restore), so budget generously; anything still
                        -- alive past the budget is closed synchronously.
                        local clean = vim.wait(1000, function()
                            for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                                if vim.w[w].snacks_layout then
                                    return false
                                end
                            end
                            return true
                        end, 20)
                        if not clean then
                            for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                                if vim.w[w].snacks_layout and vim.api.nvim_win_is_valid(w) then
                                    pcall(vim.api.nvim_win_close, w, true)
                                end
                            end
                        end
                    end
                    -- Wipe directory-named buffers not shown in any window:
                    -- `nvim <dir>` startup (or `:e <dir>`) leaves a LISTED buffer
                    -- named after the directory; mksession would `badd` it and
                    -- it would reappear as a ghost buffer after restore.
                    for _, b in ipairs(vim.api.nvim_list_bufs()) do
                        local name = vim.fn.bufname(b)
                        if name ~= '' and vim.fn.isdirectory(name) == 1 and #vim.fn.win_findbuf(b) == 0 then
                            pcall(vim.api.nvim_buf_delete, b, { force = true })
                        end
                    end
                    -- Drop directory entries from the arglist too: `nvim <dir>`
                    -- puts the dir into :args, mksession then emits
                    -- `$argadd <dir>`, and every restore re-creates the
                    -- directory buffer from it (the ghost "explorer buffer").
                    for _, a in ipairs(vim.fn.argv()) do
                        if type(a) == 'string' and a ~= '' and vim.fn.isdirectory(a) == 1 then
                            pcall(vim.cmd, 'argdelete ' .. vim.fn.fnameescape(a))
                        end
                    end
                end)
            end,
        },
    },
})

-- Silence read() when there is no local session: snacks (projects picker AND
-- dashboard projects section) unconditionally runs `require('mini.sessions')
-- .read()` on chdir; stock read() would notify "There are no detected
-- sessions..." in every fresh project. Skipping keeps snacks' own fallback
-- intact (SessionLoadPost never fires -> it opens the files picker).
local mini_read = MiniSessions.read
MiniSessions.read = function(session_name, opts)
    if session_name == nil and vim.fn.filereadable(MiniSessions.config.file) == 0 then
        return
    end
    return mini_read(session_name, opts)
end

-- z': create/update this project's local session. write() also sets it as the
-- active session (v:this_session), arming autowrite for the rest of the
-- session's lifetime. force=true allows overwriting an existing file.
vim.keymap.set('n', "z'", function()
    vim.cmd('wa')
    MiniSessions.write('.session.nvim', { force = true })
end, { remap = false, silent = true, desc = 'zz:mini.sessions:WriteLocalSession' })
