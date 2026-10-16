return {
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
        vim.keymap.set('i', '<cr>', function()
            return vim.fn['coc#pum#visible']() ~= 0
                and vim.fn['coc#pum#confirm']()
                or vim.api.nvim_replace_termcodes('<c-g>u<cr>', true, true, true)
        end, { expr = true, silent = true, remap = false, desc='zz:coc:confirm'})
        vim.keymap.set('i', '<c-]>', 'coc#refresh()', {expr = true, silent = true, desc='zz:coc:Refresh'})

        -- 获取 snippets 根目录
        local root = string.gsub(vim.fn.stdpath('config'), '\\', '/') .. '/snippets/snippets'

        -- 遍历 root 下的所有目录
        local function list_dirs(path)
            local dirs = {}
            local handle = vim.loop.fs_scandir(path)
            if handle then
                while true do
                    local name, type = vim.loop.fs_scandir_next(handle)
                    if not name then break end
                    if type == 'directory' then
                        table.insert(dirs, path .. '/' .. name)
                    end
                end
            end
            return dirs
        end

        -- 获取根目录本身和所有一级子目录
        local all_dirs = {root}
        for _, dir in ipairs(list_dirs(root)) do
            table.insert(all_dirs, dir)
        end

        -- 设置 coc_user_config
        vim.g.coc_user_config = {
            snippets = {
                textmateSnippetsRoots = all_dirs
            }
        }

    end
}



