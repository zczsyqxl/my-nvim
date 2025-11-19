if vim.g.vscode == nil then
-- 一次性写到 init.lua / colors.lua
    local function set_hl_full(group, opts)
        vim.api.nvim_set_hl(0, group, opts)
    end


    local function set_hl(g, fg, bg, bold, underline)
        vim.api.nvim_set_hl(0, g, { fg = fg, bg = bg, bold = bold, underline = underline })
    end


    local function setMySyntaxHl()
        -- hop
        set_hl('HopNextKey',                               '#80dcfe',        '',             false,              false)
        set_hl('HopNextKey1',                              '#adff2f',        '',             false,              false)
        set_hl('HopNextKey2',                              '#1e90ff',        '',             false,              false)
        set_hl('HopPreview',                               'white',          '#191970',      false,              false)

        -- lightspeed
        set_hl("LightspeedMaskedChar",                     "#adff2f",        "",             false,              false)
        set_hl("LightspeedLabel",                          "#80dcfe",        "",             false,              false)
        set_hl("LightspeedCursor",                         "#191970",        "#adff2f",      false,              false)
        set_hl("LightspeedLabelDistant",                   "#4170ff",        "",             false,              true)

        -- telescope
        set_hl_full('TelescopeMatching',                   { fg = '#adff2f', italic = true,  bold = true })

        -- MatchParen
        set_hl_full('MatchParen',                          { fg = '#ffff00', italic = false, underdouble = true, bold = true, sp = '#FFFF00' })                         -- sp -> underline color

        -- coc
        set_hl_full('CocInlayHint',                        { fg = '#2ac3de', bg = '#292e42', italic = false,     })           -- sp -> underline color
        set_hl_full('CocPumDetail',                        { fg = '#617dbe', bg = 'NONE',    italic = false,     bold = false }) -- sp -> underline color
        -- set_hl_full('NormalFloat',                      { bg = '#000000'})
        -- set_hl_full('CocFloatBorder',                   { fg = '#5e81ac',  bg = 'NONE',    blend = 100,        })

        -- luasnip
        set_hl_full('ZZ.ViHolder',                         { fg = '#ffffff', bg = '#4170ff', sp = '#ffff00',     underdouble = true })
        set_hl_full('ZZ.UnHolder',                         { fg = '#ffffff', bg = '#4170ff', sp = '#0000ff',     underdouble = true })

        --  diff
        set_hl_full('DiffText',                            { fg = '#FFFF00', bg = '#FF0000', italic = false,     bold = false })                               -- sp -> underline color
        set_hl_full('DiffDelete',                          { bg = '#FF0000', italic = false, bold = false })                                             -- sp -> underline color
        set_hl_full('DiffAdd',                             { bg = '#3333ff', italic = false, bold = false })                                                -- sp -> underline color
        set_hl_full('DiffChange',                          { bg = '#000066', italic = false, bold = false })                                             -- sp -> underline color

        -- LSP
        set_hl_full('ZZ.LspGlobalVar',                     { fg = '#adff2f', italic = false })                    -- 亮黄
        set_hl_full('ZZ.LspLocalVar',                      { fg = '#9cdcfe', italic = true })                      -- 浅蓝
        set_hl_full('ZZ.LspMacro',                         { fg = '#4170ff', italic = true })                         -- 蓝
        set_hl_full('ZZ.LspTsConstant',                    { fg = '#b5cea8' })
        set_hl_full('ZZ.LspEnum',                          { fg = '#40b070', italic = true })                          -- green

        set_hl_full('@lsp.typemod.variable.fileScope',     { link = 'ZZ.LspGlobalVar' })
        set_hl_full('@lsp.typemod.variable.globalScope',   { link = 'ZZ.LspGlobalVar' })
        set_hl_full('@lsp.typemod.variable.functionScope', { link = 'ZZ.LspLocalVar' })
        set_hl_full('@lsp.type.macro',                     { link = 'ZZ.LspMacro' })
        set_hl_full('@lsp.type.enumMember',                { link = 'ZZ.LspEnum' })
        set_hl_full('@number',                             { link = 'ZZ.LspTsConstant' })
        set_hl_full('@constant',                           { link = 'ZZ.LspTsConstant' })
        set_hl_full('@property',                           { fg = '#00bfff', italic = true})
        set_hl_full('@variable.parameter',                 { fg = '#e0af68', italic = true})
        set_hl_full('Function',                            { fg = '#dcdcaa' })
        set_hl_full('Type',                                { fg = '#4ec9a4' })
        set_hl_full('String',                              { fg = '#ce9178' })
        set_hl_full('DiagnosticError',                     { fg = '#d27319' })
    end

    setMySyntaxHl()

    -- 3. 如果主题切换后仍生效，包一层自动命令
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = setMySyntaxHl,
    })
end
