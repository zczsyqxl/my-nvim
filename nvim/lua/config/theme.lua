if vim.g.vscode == nil then
-- 一次性写到 init.lua / colors.lua
    local function set(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    set('LspGlobalVar',  { fg = '#adff2f', italic = false})   -- 亮黄
    set('LspLocalVar',   { fg = '#9cdcfe', italic = true }) -- 浅蓝
    set('LspMacro',      { fg = '#4170ff', italic = true }) -- 蓝


    local function setMySyntaxHl()
        local set_hl = function(group, opts)
            vim.api.nvim_set_hl(0, group, opts)
        end
        -- 1. 先关掉默认 link，防止被配色主题冲掉
        -- set_hl('@lsp.type.variable', {})               -- 清空默认 link
        -- set_hl('@lsp.typemod.variable.fileScope',   {})
        set_hl('@lsp.typemod.variable.fileScope',   { link = 'LspGlobalVar'})
        set_hl('@lsp.typemod.variable.functionScope',   { link = 'LspLocalVar'})
        set_hl('@lsp.type.macro',   { link = 'LspMacro'})
    end
    setMySyntaxHl()

    -- 3. 如果主题切换后仍生效，包一层自动命令
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
            setMySyntaxHl()
        end,
    })
end
