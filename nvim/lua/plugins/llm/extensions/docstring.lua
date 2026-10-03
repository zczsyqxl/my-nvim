local prompts = require("plugins.llm.prompts")
local tools = require("llm.tools")
return {
  prompt = prompts.DocString,
  handler = tools.action_handler,
  opts = {
    url = "https://open.bigmodel.cn/api/coding/paas/v4/chat/completions",
    model = "glm-5.3",
    api_type = "zhipu",
    fetch_key = vim.env.ZHIPUAI_API_KEY,
    only_display_diff = true,
    templates = {
      lua = [[- For the Lua language, you should use the LDoc style.
- Start all comment lines with "---".]],
      python = [[- For the python language, you should use the numpy style.]],
    },
  },
}
