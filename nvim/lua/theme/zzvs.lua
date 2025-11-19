local function set_hl_full(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local function setMySyntaxHl()
    set_hl_full('ZZ.HopNextKey',                       { fg = '#80dcfe', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey1',                      { fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey2',                      { fg = '#1e90ff', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopPreview',                       { fg = 'white',   bg = '#191970', bold = false, italic = false })
    set_hl_full("ZZ.LightspeedMaskedChar",             { fg = "#adff2f", bg = "", bold = false, italic = false })
    set_hl_full("ZZ.LightspeedLabel",                  { fg = "#80dcfe", bg = "", bold = false, italic = false })
    set_hl_full("ZZ.LightspeedCursor",                 { fg = "#191970", bg = "#adff2f", bold = false, italic = false })
    set_hl_full("ZZ.LightspeedLabelDistant",           { fg = "#4170ff", bg = "", bold = false, italic = true })

    set_hl_full('HopNextKey',                          { link = 'ZZ.HopNextKey'            })
    set_hl_full('HopNextKey1',                         { link = 'ZZ.HopNextKey1'           })
    set_hl_full('HopNextKey2',                         { link = 'ZZ.HopNextKey2'           })
    set_hl_full('HopPreview',                          { link = 'ZZ.HopPreview'            })
    set_hl_full("LightspeedMaskedChar",                { link = "ZZ.LightspeedMaskedChar"  })
    set_hl_full("LightspeedLabel",                     { link = "ZZ.LightspeedLabel"       })
    set_hl_full("LightspeedCursor",                    { link = "ZZ.LightspeedCursor"      })
    set_hl_full("LightspeedLabelDistant",              { link = "ZZ.LightspeedLabelDistant"})
end

setMySyntaxHl()
