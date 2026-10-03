return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        -- NOTE: The log_level is in `opts.opts`
        opts = {
            log_level = "DEBUG", -- or "TRACE"
        },
        adapters = {
            http = {
                zhipuai = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        name = "zhipuai",
                        formatted_name = "Zhipu GLM (Coding Plan)",
                        env = {
                            api_key = "ZHIPUAI_API_KEY",
                            -- NOTE: Coding Plan 必须用专用端点,不能用通用端点 /api/paas/v4
                            url = "https://open.bigmodel.cn/api/coding/paas/v4",
                            chat_url = "/chat/completions",
                            models_endpoint = "/models",
                        },
                        opts = {
                            vision = true, -- glm-5.3-flash 支持多模态,可处理图片
                        },
                        schema = {
                            model = {
                                default = "glm-5.3-flash",
                            },
                        },
                    })
                end,
            },
            -- acp = {
            --     opencode = function()
            --         return require("codecompanion.adapters").extend("opencode", {
            --             defaults = {
            --                 session_config_options = {
            --                     model = "zhipuai/glm-5.3",
            --                 }
            --             },
            --         })
            --     end,
            -- },
        },
        interactions = {
            chat = {
                adapter = {
                    name = "opencode",
                    -- model = "zhipuai-coding-plan/glm-5.3",
                },
            },
            cli = {
                agent = "opencode",
                agents = {
                    opencode = {
                        cmd = "opencode",
                        args = {},
                        description = "OpenCode TUI"
                    },
                },
            },
            inline = {
                adapter = "zhipuai",
            },
            cmd = {
                adapter = "zhipuai",
            },
        },
    },
    config = function(_, opts)
        require('codecompanion').setup(opts)
        vim.cmd([[cab cc CodeCompanion]])
    end,
}


