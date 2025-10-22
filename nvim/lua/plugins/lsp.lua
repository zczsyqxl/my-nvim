if vim.g.vscode then
    return {}
else
    return {
        {
            'mason-org/mason-lspconfig.nvim',
            opts = {},
            dependencies = {
                {
                    'neovim/nvim-lspconfig'
                },
                {
                    'mfussenegger/nvim-dap',
                    dependencies = {
                        {'mason-org/mason.nvim'},
                        {'jay-babu/mason-nvim-dap.nvim'},
                    },
                    opts = {},
                    config = function()
                        require('mason').setup()
                        require('mason-nvim-dap').setup(
                            {
                                -- ensure_installed = {'codelldb'},
                                handlers = {
                                    function(config)
                                        require('mason-nvim-dap').default_setup(config)
                                    end,
                                }
                            }
                        )
                    end
                }
            }
        },
    }
end
