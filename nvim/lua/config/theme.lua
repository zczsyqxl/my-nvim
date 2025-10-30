if vim.g.vscode == nil then
-- 一次性写到 init.lua / colors.lua
    local function set(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    set('LspGlobalVar',  { fg = '#f9c74f', bold = true })   -- 亮黄
    set('LspLocalVar',   { fg = '#9cdcfe', italic = true }) -- 浅蓝
    set('LspMacro',      { fg = '#4170ff', italic = true }) -- 蓝


    local set_hl = function(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- 1. 先关掉默认 link，防止被配色主题冲掉
    -- set_hl('@lsp.type.variable', {})               -- 清空默认 link
    -- set_hl('@lsp.typemod.variable.fileScope',   {})

    -- 2. 按你想染的颜色写
    set_hl('@lsp.typemod.variable.fileScope.c',   { link = 'LspGlobalVar'})
    set_hl('@lsp.type.variable.c',   { link = 'LspLocalVar'})
    set_hl('@lsp.type.macro.c',   { link = 'LspMacro'})

    -- 3. 如果主题切换后仍生效，包一层自动命令
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
            -- 1. 先关掉默认 link，防止被配色主题冲掉
            -- set_hl('@lsp.type.variable', {})               -- 清空默认 link
            -- set_hl('@lsp.typemod.variable.fileScope',   {})

            -- 2. 按你想染的颜色写
            set_hl('@lsp.typemod.variable.fileScope.c',   { link = 'LspGlobalVar'})
            set_hl('@lsp.type.variable.c',   { link = 'LspLocalVar'})
            set_hl('@lsp.type.macro.c',   { link = 'LspMacro'})
            -- 把上面 set 再跑一遍即可
        end,
    })
end
