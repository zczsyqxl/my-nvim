local function set_hl_full(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local function setMySyntaxHl()
    -- hop
    set_hl_full('ZZ.HopNextKey',            {fg = '#80dcfe', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey1',           {fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey2',           {fg = '#1e90ff', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopPreview',            {fg = 'white',   bg = '#191970', bold = false, italic = false })

    -- lightspeed
    set_hl_full("ZZ.LightspeedMaskedChar",  {fg = "#adff2f", bg = "", bold = false, italic = false })
    set_hl_full("ZZ.LightspeedLabel",       {fg = "#80dcfe", bg = "", bold = false, italic = false })
    set_hl_full("ZZ.LightspeedCursor",      {fg = "#191970", bg = "#adff2f", bold = false, italic = false })
    set_hl_full("ZZ.LightspeedLabelDistant",{fg = "#4170ff", bg = "", bold = false, italic = true })

    -- telescope
    set_hl_full('ZZ.TelescopeMatching',     {fg = '#adff2f', italic = true, bold = true })

    -- MatchParen
    set_hl_full('ZZ.MatchParen',            {fg = '#ffff00', italic = false, underdouble = true, bold = true, sp = '#FFFF00' })                    -- sp -> underline color

    -- coc
    set_hl_full('ZZ.CocInlayHint',          {fg = '#2ac3de', bg = '#292e42', italic = false, })                                            -- sp -> underline color
    set_hl_full('ZZ.CocPumDetail',          {fg = '#617dbe', bg = 'NONE', italic = false, bold = false })                                  -- sp -> underline color

    -- luasnip
    set_hl_full('ZZ.ViHolder',              {fg = '#ffffff', bg = '#4170ff', sp = '#ffff00', underdouble = true })
    set_hl_full('ZZ.UnHolder',              {fg = '#ffffff', bg = '#4170ff', sp = '#0000ff', underdouble = true })

    --  diff
    set_hl_full('ZZ.DiffText',              {fg = '#FFFF00', bg = '#FF0000', italic = false, bold = false })                                      -- sp -> underline color
    set_hl_full('ZZ.DiffDelete',            {bg = '#FF0000', italic = false, bold = false })                                                    -- sp -> underline color
    set_hl_full('ZZ.DiffAdd',               {bg = '#3333ff', italic = false, bold = false })                                                       -- sp -> underline color
    set_hl_full('ZZ.DiffChange',            {bg = '#000066', italic = false, bold = false })                                                    -- sp -> underline color

    -- Rainbow
    set_hl_full("ZZ.RainbowRed",            {fg = "#ff7173" })
    set_hl_full("ZZ.RainbowOrange",         {fg = "#D19A66" })
    set_hl_full("ZZ.RainbowYellow",         {fg = "#E1EE00" })
    set_hl_full("ZZ.RainbowGreen",          {fg = "#00ff00" })
    set_hl_full("ZZ.RainbowCyan",           {fg = "#00FFFF" })
    set_hl_full("ZZ.RainbowBlue",           {fg = "#61AFEF" })
    set_hl_full("ZZ.RainbowPurple",         {fg = "#D600D1" })
    set_hl_full("ZZ.RainbowGray",           {fg = "#4d4d4d" })

    -- LSP
    set_hl_full('ZZ.LspGlobalVar',          {fg = '#adff2f', italic = false })                    -- 亮黄
    set_hl_full('ZZ.LspLocalVar',           {fg = '#9cdcfe', italic = true })                      -- 浅蓝
    set_hl_full('ZZ.LspMacro',              {fg = '#4170ff', italic = true })                         -- 蓝
    set_hl_full('ZZ.LspTsConstant',         {fg = '#b5cea8' })
    set_hl_full('ZZ.LspEnum',               {fg = '#40b070', italic = true })                          -- green
    set_hl_full('ZZ.Property',              {fg = '#00bfff', italic = true })
    set_hl_full('ZZ.Parameter',             {fg = '#da70d6', italic = true })
    set_hl_full('ZZ.Function',              {fg = '#dcdcaa' })
    set_hl_full('ZZ.Type',                  {fg = '#4ec9a4' })
    set_hl_full('ZZ.String',                {fg = '#ce9178' })
    set_hl_full('ZZ.DiagnosticError',       {fg = '#d27319' })

    set_hl_full('DiffText',                            { link = 'ZZ.DiffText'  })
    set_hl_full('DiffDelete',                          { link = 'ZZ.DiffDelete'})
    set_hl_full('DiffAdd',                             { link = 'ZZ.DiffAdd'   })
    set_hl_full('DiffChange',                          { link = 'ZZ.DiffChange'})
    set_hl_full('TelescopeMatching',                   { link = 'zz.TelescopeMatching' })
    set_hl_full('HopNextKey',                          { link = 'ZZ.HopNextKey'            })
    set_hl_full('HopNextKey1',                         { link = 'ZZ.HopNextKey1'           })
    set_hl_full('HopNextKey2',                         { link = 'ZZ.HopNextKey2'           })
    set_hl_full('HopPreview',                          { link = 'ZZ.HopPreview'            })
    set_hl_full("LightspeedMaskedChar",                { link = "ZZ.LightspeedMaskedChar"  })
    set_hl_full("LightspeedLabel",                     { link = "ZZ.LightspeedLabel"       })
    set_hl_full("LightspeedCursor",                    { link = "ZZ.LightspeedCursor"      })
    set_hl_full("LightspeedLabelDistant",              { link = "ZZ.LightspeedLabelDistant"})
    set_hl_full('CocInlayHint',                        { link = 'ZZ.CocInlayHint' })
    set_hl_full('CocPumDetail',                        { link = 'ZZ.CocPumDetail' })
    set_hl_full('@lsp.typemod.variable.fileScope',     { link = 'ZZ.LspGlobalVar' })
    set_hl_full('@lsp.typemod.variable.globalScope',   { link = 'ZZ.LspGlobalVar' })
    set_hl_full('@lsp.typemod.variable.functionScope', { link = 'ZZ.LspLocalVar' })
    set_hl_full('@lsp.type.macro',                     { link = 'ZZ.LspMacro' })
    set_hl_full('@lsp.type.enumMember',                { link = 'ZZ.LspEnum' })
    set_hl_full('@number',                             { link = 'ZZ.LspTsConstant' })
    set_hl_full('@constant',                           { link = 'ZZ.LspTsConstant' })
    set_hl_full('@property',                           { link = 'ZZ.Property' })
    set_hl_full('@variable.parameter',                 { link = 'ZZ.Parameter' })
    set_hl_full('Function',                            { link = 'ZZ.Function' })
    set_hl_full('Type',                                { link = 'ZZ.Type' })
    set_hl_full('String',                              { link = 'ZZ.String' })
    set_hl_full('DiagnosticError',                     { link = 'ZZ.DiagnosticError' })
end

setMySyntaxHl()

-- 3. 如果主题切换后仍生效，包一层自动命令
vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = setMySyntaxHl,
})
