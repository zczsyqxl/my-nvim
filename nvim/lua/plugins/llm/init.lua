if vim.g.vscode then
    return {}
else
    local models = require('plugins.llm.models')
    local ui = require('plugins.llm.ui')
    local keymaps = require('plugins.llm.keymaps')
    local api, tbl_deep_extend, env = vim.api, vim.tbl_deep_extend, vim.env

    return {
        {
            'Kurama622/llm.nvim',
            -- dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "Kurama622/windsurf.nvim" },
            dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
            cmd = { 'LLMSessionToggle', 'LLMSelectedTextHandler', 'LLMAppHandler' },
            config = function()
                api.nvim_set_hl(0, 'LlmCmds', { link = 'String' })
                local extensions = require('plugins.llm.extensions')
                local opts = {
                    prompt = 'You are a helpful Chinese assistant.',
                    enable_trace = false,
                    -- log_level = 1,

                    spinner = {
                        text = { '󰧞󰧞', '󰧞󰧞', '󰧞󰧞', '󰧞󰧞' },
                        hl = 'Title',
                    },

                    prefix = {
                        user = { text = '  ', hl = 'Title' },
                        assistant = { text = '  ', hl = 'Added' },
                    },

                    display = {
                        diff = {
                            layout = 'vertical', -- vertical|horizontal split for default provider
                            opts = { 'internal', 'filler', 'closeoff', 'algorithm:patience', 'followwrap', 'linematch:120' },
                            provider = 'mini_diff', -- default|mini_diff
                            -- disable_diagnostic = true,
                        },
                    },
                    lsp = {
                        methods = { 'definition', 'declaration' },
                        root_dir = { '.git' },
                    },
                    web_search = {
                        url = 'https://api.tavily.com/search',
                        fetch_key = env.TAVILY_TOKEN,
                        params = {
                            auto_parameters = false,
                            topic = 'general',
                            search_depth = 'basic',
                            chunks_per_source = 3,
                            max_results = 3,
                            include_answer = true,
                            include_raw_content = true,
                            include_images = false,
                            include_image_descriptions = false,
                            include_favicon = false,
                        },
                    },
                    --[[ custom request args ]]
                    -- args = [[return {url, "-s", "-N", "-X", "POST", "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],
                    -- history_path = "/tmp/llm-history",
                    save_session = true,
                    max_history = 15,
                    max_history_name_length = 20,

                    -- set models list
                    models = {
                        models.GLM_5_3,
                        models.Kimi,
                        models.DeepSeek,
                    },
                }
                for _, conf in pairs({ ui, extensions, keymaps }) do
                    opts = tbl_deep_extend('force', opts, conf)
                end

                require('llm').setup(opts)
            end,
            keys = {
                { '<leader>mc', mode = 'n', '<cmd>LLMSessionToggle<cr>', desc = 'zz:LLM:Toggle LLM Chat' },
                { '<leader>mt', mode = { 'x', 'n' }, '<cmd>LLMAppHandler WordTranslate<cr>', desc = 'zz:LLM:Word Translate' },
                { '<leader>me', mode = { 'n', 'v' }, '<cmd>LLMAppHandler CodeExplain<cr>', desc = 'zz:LLM:Explain the Code' },
                { '<leader>mT', mode = 'n', '<cmd>LLMAppHandler Translate<cr>', desc = 'zz:LLM:AI Translator' },
                { '<leader>mA', mode = 'x', '<cmd>LLMAppHandler TestCode<cr>', desc = 'zz:LLM:Generate Test Cases' },
                { '<leader>mo', mode = 'x', '<cmd>LLMAppHandler OptimCompare<cr>', desc = 'zz:LLM:Optimize the Code' },
                { '<leader>mu', mode = 'n', '<cmd>LLMAppHandler UserInfo<cr>', desc = 'zz:LLM:Check Account Information' },
                { '<leader>mg', mode = 'n', '<cmd>LLMAppHandler CommitMsg<cr>', desc = 'zz:LLM:Generate AI Commit Message' },
                { '<leader>md', mode = 'v', '<cmd>LLMAppHandler DocString<cr>', desc = 'zz:LLM:Generate a Docstring' },
                { '<leader>mk', mode = { 'v', 'n' }, '<cmd>LLMAppHandler Ask<cr>', desc = 'zz:LLM:Ask LLM' },
                { '<leader>ma', mode = { 'v', 'n' }, '<cmd>LLMAppHandler AttachToChat<cr>', desc = 'zz:LLM:Ask LLM (multi-turn)' },
                -- { "<leader>mb", mode = { "v", "n" }, "<cmd>LLMAppHandler BashRunner<cr>", desc = "zz:LLM:bash runner" }, -- poor UX, disabled for now (2026-10-17)
                { '<leader>mi', mode = { 'v', 'n' }, '<cmd>LLMAppHandler FormulaRecognition<cr>', desc = 'zz:LLM:formula recognition' },
                -- { "<leader>ap", mode = { "v", "n" }, "<cmd>LLMAppHandler Completion<cr>", desc = "zz:LLM:Code Completion" },
                -- { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>", desc = "zz:LLM:OptimizeCode" },
                -- { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>", desc = "zz:LLM:Explain code" },
                -- { "<leader>at", mode = { "x", "n" }, "<cmd>LLMSelectedTextHandler 英译汉<cr>", desc = "zz:LLM:Translate" },
            },
        },
    }
end
