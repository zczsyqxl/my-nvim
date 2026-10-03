return {
    "yetone/avante.nvim",
    -- 如果您想从源代码构建，请执行 `make BUILD_FROM_SOURCE=true`
    -- ⚠️ 一定要加上这一行配置！！！！！
    build = vim.fn.has("win32") ~= 0
    and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
    event = "VeryLazy",
    version = false, -- 永远不要将此值设置为 "*"！永远不要！
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        -- 在此处添加任何选项
        -- 例如
        provider = "opencode",
        providers = {
            glm = {
                endpoint = "https://open.bigmodel.cn/api/coding/paas/v4",
                api_key_name = "ZHIPUAI_API_KEY",
                model = "glm-5.3-flash",
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 1,
                    max_tokens = 131072,
                },
            }
        },
        acp_providers = {
            ["opencode"] = {
                command = "opencode",
                args = { "acp" },
            },
        },
        windows = {
            sidebar_header = {
                rounded = false,
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
    },
}
