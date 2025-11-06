local starter = require('mini.starter')
-- local footer_time = (function()
--     local timer = vim.loop.new_timer()
--     timer:start(0, 60000, vim.schedule_wrap(function()
--         if vim.bo.filetype ~= 'ministarter' then
--             timer:stop()
--             return
--         end
--         MiniStarter.refresh()
--     end))
--
--     return function()
--         return  os.date('%Y-%m-%d %H:%M') .. '\n' .. 'Hello! ' .. vim.loop.os_get_passwd().username
--     end
-- end)()

starter.setup({
    evaluate_single = true,
    items = {
        -- starter.sections.telescope(),
        starter.sections.builtin_actions(),
        starter.sections.sessions(5, true),
        starter.sections.recent_files(10, false),
        starter.sections.recent_files(10, true),
    },
    -- header = footer_time,
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(3, 2),
    },
})

-- local my_items = {
--     { name = 'Echo random number', action = 'lua print(math.random())', section = 'Section 1' },
--     function()
--         return {
--             { name = 'Item #1 from function', action = [[echo 'Item #1']], section = 'From function' },
--             { name = 'Placeholder (always inactive) item', action = '', section = 'From function' },
--             function()
--                 return {
--                     name = 'Item #1 from double function',
--                     action = [[echo 'Double function']],
--                     section = 'From double function',
--                 }
--             end,
--         }
--     end,
--     { name = [[Another item in 'Section 1']], action = 'lua print(math.random() + 10)', section = 'Section 1' },
-- }
--
-- local footer_n_seconds = (function()
--     local timer = vim.loop.new_timer()
--     local n_seconds = 0
--     timer:start(0, 1000, vim.schedule_wrap(function()
--         if vim.bo.filetype ~= 'ministarter' then
--             timer:stop()
--             return
--         end
--         n_seconds = n_seconds + 1
--         MiniStarter.refresh()
--     end))
--
--     return function()
--         return 'Number of seconds since opening: ' .. n_seconds
--     end
-- end)()
-- --
-- -- local hook_top_pad_10 = function(content)
-- --     -- Pad from top
-- --     for _ = 1, 10 do
-- --         -- Insert at start a line with single content unit
-- --         table.insert(content, 1, { { type = 'empty', string = '' } })
-- --     end
-- --     return content
-- -- end
-- --
-- -- local starter = require('mini.starter')
-- -- starter.setup({
-- --     items = my_items,
-- --     footer = footer_n_seconds,
-- --     content_hooks = { hook_top_pad_10 },
-- -- })
-- --
