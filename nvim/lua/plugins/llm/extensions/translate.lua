local tools = require('llm.tools')
return {
    handler = tools.qa_handler,
    opts = {
        -- fetch_key = vim.env.ZHIPUAI_API_KEY,
        -- url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
        -- model = "glm-4-flash",
        -- api_type = "zhipu",
        url = 'https://open.bigmodel.cn/api/coding/paas/v4/chat/completions',
        model = 'glm-5.3',
        api_type = 'zhipu',
        fetch_key = vim.env.ZHIPUAI_API_KEY,

        -- args = [[return {url, "-s", "-N", "-X", "POST", "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],
        component_width = '60%',
        component_height = '50%',
        input_box_opts = {
            size = '15%',
            border = {
                text = { top = ' 󰊿 Trans ' },
            },
            win_options = {
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,FloatTitle:Search',
            },
        },
        preview_box_opts = {
            size = '85%',
            win_options = {
                winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
            },
        },
    },
}
