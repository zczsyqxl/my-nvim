local prompts = require('plugins.llm.prompts')
local tools = require('llm.tools')
return {
    handler = tools.flexi_handler,
    prompt = prompts.CommitMsg,

    opts = {
        url = 'https://open.bigmodel.cn/api/coding/paas/v4/chat/completions',
        model = 'glm-5.3',
        api_type = 'zhipu',
        fetch_key = vim.env.ZHIPUAI_API_KEY,
        enter_flexible_window = true,
        apply_visual_selection = false,
        win_opts = {
            relative = 'editor',
            position = '50%',
            zindex = 70,
        },
        accept = {
            mapping = {
                mode = 'n',
                keys = '<cr>',
            },
            action = function()
                local contents = vim.api.nvim_buf_get_lines(0, 0, -1, true)

                -- Read the commit message from a temp file via -F: multi-line text is
                -- preserved verbatim and shell quoting is fully bypassed (chars like
                -- " # ! need no special handling under cmd.exe or bash)
                local msgfile = vim.fn.tempname()
                vim.fn.writefile(contents, msgfile)
                vim.api.nvim_command('!git commit -F ' .. vim.fn.shellescape(msgfile))
                os.remove(msgfile)

                -- just for lazygit
                vim.schedule(function()
                    vim.api.nvim_command('LazyGit')
                end)
            end,
        },
    },
}
