local tools = require("llm.tools")

-- cross-platform: PowerShell (pwsh) on Windows, bash on other platforms
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
    -- must use the openai backend: llm.nvim's zhipu backend doesn't implement
    -- function-calling, but this handler's CodeRunner tool depends on it
    -- (the zhipu endpoint itself supports OpenAI-style tools, verified)
    api_type = "openai",
    fetch_key = vim.env.ZHIPUAI_API_KEY,
    -- NOTE: don't set enable_thinking=false -- the openai backend passes it through
    -- as-is; glm-5.3 is an always-thinking model that rejects disabling it (error
    -- code 1210), keep the default profile
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
        -- tempname(): generates a unique file under /tmp on Linux, %TEMP% on Windows;
        -- both exist and are writable (hardcoding /tmp on Windows lands on the current
        -- drive's root, which often fails)
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
            -- -Command + UTF-8 prefix: keeps Chinese output from garbling (under
            --   -NoProfile the console defaults to OEM encoding)
            -- -ExecutionPolicy Bypass: skips the default script execution policy,
            --   otherwise -File/*.ps1 would be blocked
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
