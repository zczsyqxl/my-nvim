return {
    'yetone/avante.nvim',
    -- To build from source, run `make BUILD_FROM_SOURCE=true`
    -- ⚠️ This build line must be kept!
    build = vim.fn.has('win32') ~= 0 and 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false' or 'make',
    event = 'VeryLazy',
    version = false, -- never set this to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    ---@diagnostic disable-next-line: missing-fields -- opts 与 avante 内部 defaults 深度合并,缺省字段为合法覆盖写法
    opts = {
        -- add any options here
        -- for example
        provider = 'opencode',
        providers = {
            glm = {
                endpoint = 'https://open.bigmodel.cn/api/coding/paas/v4',
                api_key_name = 'ZHIPUAI_API_KEY',
                model = 'glm-5.3-flash',
                timeout = 30000, -- Timeout in milliseconds
                extra_request_body = {
                    temperature = 1,
                    max_tokens = 131072,
                },
            },
        },
        acp_providers = {
            ['opencode'] = {
                command = 'opencode',
                args = { 'acp' },
            },
        },
        windows = {
            sidebar_header = {
                rounded = false,
            },
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        { 'ColinKennedy/mega.cmdparse', dependencies = { 'ColinKennedy/mega.logging' } },
    },
}
