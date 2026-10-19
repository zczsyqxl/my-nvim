local function set_hl_full(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local function setMySyntaxHl()
    set_hl_full('ZZ.HopNextKey', { fg = '#80dcfe', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey1', { fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey2', { fg = '#1e90ff', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopPreview', { fg = 'white', bg = '#191970', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedMaskedChar', { fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedLabel', { fg = '#80dcfe', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedCursor', { fg = '#191970', bg = '#adff2f', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedLabelDistant', { fg = '#4170ff', bg = '', bold = false, italic = true })

    set_hl_full('ZZ.HopUnmatched', { fg = '#4c5372' })
    set_hl_full('ZZ.LeapBackdrop', { fg = '#4c5372' })
    set_hl_full('ZZ.LeapLabel', { fg = '#ccff66', bold = true })
    set_hl_full('ZZ.LeapLabelDimmed', { fg = '#61AFEF' }) -- preview/next-round label dot (leap auto-derives it from LeapLabel otherwise, see engines/leap.lua)
    set_hl_full('ZZ.LeapLabelPreview', { fg = '#61AFEF' }) -- inactive labels of the preview phase (first input char), brightened to LeapLabel once confirmed -- via the beacons patch in engines/leap.lua
    set_hl_full('ZZ.LeapMatch', { fg = '#c0caf5', bg = '#3d59a1' })

    set_hl_full('HopNextKey', { link = 'ZZ.HopNextKey' })
    set_hl_full('HopNextKey1', { link = 'ZZ.HopNextKey1' })
    set_hl_full('HopNextKey2', { link = 'ZZ.HopNextKey2' })
    set_hl_full('HopPreview', { link = 'ZZ.HopPreview' })
    set_hl_full('LightspeedMaskedChar', { link = 'ZZ.LightspeedMaskedChar' })
    set_hl_full('LightspeedLabel', { link = 'ZZ.LightspeedLabel' })
    set_hl_full('LightspeedCursor', { link = 'ZZ.LightspeedCursor' })
    set_hl_full('LightspeedLabelDistant', { link = 'ZZ.LightspeedLabelDistant' })
    set_hl_full('HopUnmatched', { link = 'ZZ.HopUnmatched' })
    set_hl_full('LeapBackdrop', { link = 'ZZ.LeapBackdrop' })
    set_hl_full('LeapLabel', { link = 'ZZ.LeapLabel' })
    set_hl_full('LeapLabelDimmed', { link = 'ZZ.LeapLabelDimmed' })
    set_hl_full('LeapLabelPreview', { link = 'ZZ.LeapLabelPreview' })
    set_hl_full('LeapMatch', { link = 'ZZ.LeapMatch' })
end

setMySyntaxHl()
