local tools = require('llm.tools')
return {
    handler = tools.action_handler,
    opts = {
        url = 'https://open.bigmodel.cn/api/coding/paas/v4/chat/completions',
        model = 'glm-5.3',
        api_type = 'zhipu',
        fetch_key = vim.env.ZHIPUAI_API_KEY,
        language = 'Chinese',
    },
}
