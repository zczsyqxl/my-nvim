if vim.g.vscode then
    return {}
else
    return {
        "Kurama622/llm.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
        cmd = { "LLMSessionToggle", "LLMSelectedTextHandler" },
        keys = {
            { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "Kimi 对话" },
            { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释这段代码<cr>", desc = "解释选区" },
            { "<leader>at", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
        },
        config = function()
            require("llm").setup({
                -- 关键三项：url / model / api_type
                url = "https://api.moonshot.cn/v1/chat/completions",
                model = "moonshot-v1-8k",          -- 也可换 32k / 128k
                api_type = "openai",               -- Kimi 接口兼容 OpenAI
                max_tokens = 4096,
                temperature = 0.3,
                top_p = 0.7,
                prompt = 'You are a helpful chinese assistand.',
                prefix = {
                    user = { text = "󰭻  ", hl = "Title" },
                    assistant = { text = "  ", hl = "Added" },
                },
                save_session = true,
                max_history = 15,
                max_history_name_length = 20,
                fetch_key = vim.env.KIMI_KEY,
                keys = {
                }
            })
        end,
    }
end




