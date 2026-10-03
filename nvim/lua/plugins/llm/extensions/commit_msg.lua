local prompts = require("plugins.llm.prompts")
local tools = require("llm.tools")
return {
  handler = tools.flexi_handler,
  prompt = prompts.CommitMsg,

  opts = {
    url = "https://open.bigmodel.cn/api/coding/paas/v4/chat/completions",
    model = "glm-5.3",
    api_type = "zhipu",
    fetch_key = vim.env.ZHIPUAI_API_KEY,
    enter_flexible_window = true,
    apply_visual_selection = false,
    win_opts = {
      relative = "editor",
      position = "50%",
      zindex = 70,
    },
    accept = {
      mapping = {
        mode = "n",
        keys = "<cr>",
      },
      action = function()
        local contents = vim.api.nvim_buf_get_lines(0, 0, -1, true)

        local cmd = string.format('!git commit -m "%s"', table.concat(contents, '" -m "'))
        cmd = (cmd:gsub(".", {
          ["#"] = "\\#",
        }))
        vim.api.nvim_command(cmd)

        -- just for lazygit
        vim.schedule(function()
          vim.api.nvim_command("LazyGit")
        end)
      end,
    },
  },
}
