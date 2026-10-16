local tools = require("llm.tools")

-- 跨平台：Windows 用 PowerShell（pwsh），其他平台用 bash
local is_win = vim.fn.has('win32') == 1
local script_lang = is_win and 'PowerShell' or 'bash'

return {
  handler = tools.qa_handler,
  prompt = string.format(
    [[Write a suitable %s script and run it through CodeRunner]],
    script_lang
  ),
  opts = {
    url = "https://open.bigmodel.cn/api/coding/paas/v4/chat/completions",
    model = "glm-5.3",
    -- 必须用 openai 后端：llm.nvim 的 zhipu 后端没实现 function-calling，
    -- 而本 handler 的 CodeRunner 工具依赖它（智谱端点本身支持 OpenAI 格式 tools，已实测）
    api_type = "openai",
    fetch_key = vim.env.ZHIPUAI_API_KEY,
    -- 注意：不能设 enable_thinking=false——openai 后端会原样透传，
    -- glm-5.3 是永远思考模型，拒绝关闭（错误码 1210），默认档即可
    max_tokens = 4096,

    -- url = "http://localhost:11434/api/chat",
    -- model = "qwen3:1.7b",
    -- api_type = "ollama",
    -- fetch_key = vim.env.LOCAL_LLM_KEY,
    -- enable_thinking = false,
    component_width = "60%",
    component_height = "50%",
    query = {
      title = "  CodeRunner ",
      hl = { link = "Define" },
    },
    input_box_opts = {
      size = "15%",
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    preview_box_opts = {
      size = "85%",
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
    functions_tbl = {
      CodeRunner = function(code)
        -- tempname()：Linux 在 /tmp、Windows 在 %TEMP% 下生成唯一文件名，
        -- 两平台都存在且可写（写死 /tmp 在 Windows 会落到当前盘符根目录，常失败）
        local filepath = vim.fn.tempname() .. (is_win and '.ps1' or '')

        vim.notify(
          string.format("CodeRunner running...\n```%s\n%s\n```", script_lang:lower(), code),
          vim.log.levels.INFO,
          { title = "llm: CodeRunner" }
        )
        local file = io.open(filepath, "w")
        if file then
          file:write(code)
          file:close()
          local script_result
          if is_win then
            -- -Command + UTF-8 前置：保证中文输出不乱码（-NoProfile 下控制台默认 OEM 编码）
            -- -ExecutionPolicy Bypass：绕过默认脚本执行策略，否则 -File/*.ps1 会被拦
            script_result = vim.system({
              'pwsh', '-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass',
              '-Command',
              string.format("[Console]::OutputEncoding=[System.Text.Encoding]::UTF8; & '%s'", filepath),
            }, { text = true }):wait()
          else
            script_result = vim.system({ "bash", filepath }, { text = true }):wait()
          end
          os.remove(filepath)
          return script_result.stdout
        else
          return ""
        end
      end,
    },
    schema = {
      {
        type = "function",
        ["function"] = {
          name = "CodeRunner",
          description = script_lang .. " code interpreter",
          parameters = {
            properties = {
              code = {
                type = "string",
                description = script_lang .. " code",
              },
            },
            required = { "code" },
            type = "object",
          },
        },
      },
    },
  },
}
