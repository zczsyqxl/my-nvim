local dir = nil

if vim.fn.has('win32') == 1 then
    dir = 'd:/workspace/nvim'
else
    dir = nil
end

require('mini.sessions').setup({

    directory = dir,

    hooks = {
        -- Before successful action
        pre = {
            write = function()
                pcall(function()
                    for _, p in ipairs(Snacks.picker.get({ source = 'explorer' })) do
                        p:close()
                    end
                end)
            end,
        },
    },
})

vim.keymap.set('n', "z'", function()
    vim.cmd('wa')

    vim.ui.input({
        prompt = 'Save session to: ',
        default = (vim.v.this_session ~= '' and vim.fn.fnamemodify(vim.v.this_session, ':t:r')) or [[Session]],
        completion = 'file',
    }, function(path)
        if not path or path == '' then
            vim.api.nvim_echo({ { 'No session name provided', 'WarningMsg' } }, false, {})
            return
        end
        MiniSessions.write(path .. '.vim', {})
    end)
end, { remap = false, silent = true, desc = 'zz:mini.sessions:WriteSession' })
