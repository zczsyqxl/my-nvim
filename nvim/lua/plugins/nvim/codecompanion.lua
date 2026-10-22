return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    opts = {
        -- NOTE: The log_level is in `opts.opts`
        opts = {
            log_level = 'ERROR', -- set to DEBUG when debugging (log: codecompanion.log)
        },
        adapters = {
            http = {
                zhipuai = function()
                    return require('codecompanion.adapters').extend('openai_compatible', {
                        name = 'zhipuai',
                        formatted_name = 'Zhipu GLM (Coding Plan)',
                        env = {
                            api_key = 'ZHIPUAI_API_KEY',
                            -- NOTE: the Coding Plan must use its dedicated endpoint, not the generic /api/paas/v4
                            url = 'https://open.bigmodel.cn/api/coding/paas/v4',
                            chat_url = '/chat/completions',
                            models_endpoint = '/models',
                        },
                        opts = {
                            vision = true, -- glm-5.3-flash is multimodal, can process images
                        },
                        schema = {
                            model = {
                                default = 'glm-5.3-flash',
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
                    name = 'opencode',
                    -- model = "zhipuai-coding-plan/glm-5.3",
                },
            },
            cli = {
                agent = 'opencode',
                agents = {
                    opencode = {
                        cmd = 'opencode',
                        args = {},
                        description = 'OpenCode TUI',
                    },
                },
            },
            inline = {
                adapter = 'zhipuai',
            },
            cmd = {
                adapter = 'zhipuai',
            },
        },
    },
    -- lazy-load on first use (saves ~65ms of startup time)
    cmd = { 'CodeCompanion', 'CodeCompanionAction', 'CodeCompanionChat', 'CodeCompanionCLI', 'CodeCompanionCmd' },
    keys = {
        { '<leader>nn', '<cmd>CodeCompanion<cr>', desc = 'zz:CC:Chat' },
        { '<leader>na', '<cmd>CodeCompanionAction<cr>', desc = 'zz:CC:Action' },
        { '<leader>nc', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'zz:CC:Chat Toggle' },
        { '<leader>ni', '<cmd>CodeCompanionCLI<cr>', desc = 'zz:CC:CLI' },
        { '<leader>nw', '<cmd>CodeCompanionCmd<cr>', desc = 'zz:CC:Cmd' },
    },
    config = function(_, opts)
        require('codecompanion').setup(opts)
        -- the cmd-line abbreviations still live here: they are only usable once
        -- a CodeCompanion command exists anyway (after first lazy load)
        vim.cmd([[cab cn CodeCompanion]])
        vim.cmd([[cab ca CodeCompanionAction]])
        vim.cmd([[cab cc CodeCompanionChat]])
        vim.cmd([[cab ci CodeCompanionCLI]])
        vim.cmd([[cab cw CodeCompanionCmd]])
        vim.cmd([[cab tl Toggle]])
    end,
}
