local prompts = require('plugins.llm.prompts')
local tools = require('llm.tools')
return {
    handler = tools.flexi_handler,
    prompt = prompts.WordTranslate,
    -- prompt = "Translate the following text to English, please only return the translation",
    opts = {
        -- fetch_key = vim.env.ZHIPUAI_API_KEY,
        -- url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
        -- model = "glm-4-flash",
        -- api_type = "zhipu",
        url = 'https://open.bigmodel.cn/api/coding/paas/v4/chat/completions',
        model = 'glm-5.3',
        api_type = 'zhipu',
        fetch_key = vim.env.ZHIPUAI_API_KEY,
        win_opts = {
            zindex = 120,
        },
        exit_on_move = false,
        enter_flexible_window = true,
        enable_cword_context = true,
    },
}
