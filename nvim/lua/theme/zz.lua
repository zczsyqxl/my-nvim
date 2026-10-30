local function set_hl_full(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Color
local zzBlack = '#000000'
-- local zzBrightBlack = '#666666'
-- local zzRed = '#cd3131'
-- local zzBrightRed = '#F14c4c'
-- local zzGreen = '#0d8c79'
-- local zzBrightGreen = '#23d18b'
-- local zzYellow = '#e5e510'
-- local zzBrightYellow = '#F5f543'
-- local zzBlue = '#2472c8'
local zzBrightBlue = '#3b8eea'
-- local zzPurple = '#bc3fbc'
-- local zzBrightPurple = '#d670d6'
-- local zzCyan = '#11a8cd'
-- local zzBrightCyan = '#a9b8db'
-- local zzWhite = '#e5e5e5'
-- local zzBrightWhite = '#e5e5e5'

local function setNvimSyntaxHl()
    set_hl_full('ZZ.WinSeparator', { fg = '#3b4261', bold = true, bg = 'NONE' })
    -- telescope
    set_hl_full('ZZ.TelescopeMatching', { fg = '#adff2f', italic = true, bold = true })
    -- snacks
    set_hl_full('ZZ.SnacksPickerMatch', { fg = '#adff2f', italic = true, bold = true })

    -- MatchParen
    set_hl_full('ZZ.MatchParen', { fg = '#ffff00', italic = false, underdouble = true, bold = true, sp = '#FFFF00' }) -- sp -> underline color

    -- luasnip
    set_hl_full('ZZ.ViHolder', { fg = '#ffffff', bg = '#4170ff', sp = '#ffff00', underdouble = true })
    set_hl_full('ZZ.UnHolder', { fg = '#ffffff', bg = '#4170ff', sp = '#0000ff', underdouble = true })

    -- blink.cmp windows (pure black background)
    set_hl_full('ZZ.BlinkCmpMenu', { fg = '#c0caf5', bg = '#101010' })
    set_hl_full('ZZ.BlinkCmpSelection', { fg = '#ffffff', bg = '#2a3f6f' }) -- deep navy, distinct from CursorLine
    set_hl_full('ZZ.BlinkCmpDoc', { fg = '#c0caf5', bg = zzBlack })
    set_hl_full('ZZ.BlinkCmpSignatureHelp', { fg = '#c0caf5', bg = '#101010' })
    set_hl_full('ZZ.BlinkCmpBorder', { fg = '#3b4261', bg = '#101010' })

    --  diff
    set_hl_full('ZZ.DiffText', { fg = '#FFFF00', bg = '#000066', italic = false, bold = true }) -- sp -> underline color
    set_hl_full('ZZ.DiffDelete', { bg = '#660000', italic = false, bold = false }) -- sp -> underline color
    set_hl_full('ZZ.DiffAdd', { bg = '#000033', italic = false, bold = false }) -- sp -> underline color
    set_hl_full('ZZ.DiffChange', { bg = '#000066', italic = false, bold = false }) -- sp -> underline color

    -- Rainbow
    set_hl_full('ZZ.RainbowRed', { fg = '#ff7173' })
    set_hl_full('ZZ.RainbowOrange', { fg = '#D19A66' })
    set_hl_full('ZZ.RainbowYellow', { fg = '#E1EE00' })
    set_hl_full('ZZ.RainbowGreen', { fg = '#00ff00' })
    set_hl_full('ZZ.RainbowCyan', { fg = '#00FFFF' })
    set_hl_full('ZZ.RainbowBlue', { fg = '#61AFEF' })
    set_hl_full('ZZ.RainbowPurple', { fg = '#D600D1' })
    set_hl_full('ZZ.RainbowGray', { fg = '#4d4d4d' })

    -- LSP
    set_hl_full('ZZ.LspGlobalVar', { fg = '#adff2f', italic = false }) -- bright yellow
    set_hl_full('ZZ.LspLocalVar', { fg = '#9cdcfe', italic = true }) -- light blue
    set_hl_full('ZZ.LspMacro', { fg = '#4170ff', italic = true }) -- blue
    set_hl_full('ZZ.LspTsConstant', { fg = '#b5cea8' })
    set_hl_full('ZZ.LspEnum', { fg = '#40b070', italic = true }) -- green
    set_hl_full('ZZ.Property', { fg = '#00bfff', italic = true })
    set_hl_full('ZZ.Parameter', { fg = '#da70d6', italic = true })
    set_hl_full('ZZ.Function', { fg = '#dcdcaa' })
    set_hl_full('ZZ.Type', { fg = '#4ec9a4' })
    set_hl_full('ZZ.String', { fg = '#ce9178' })
    set_hl_full('ZZ.DiagnosticError', { fg = '#d27319' })

    -- NvimCmp
    set_hl_full('ZZ.NvimCmp.WinHighlight', { bg = '#101010' })
    set_hl_full('ZZ.NvimCmp.ItemAbbrMatch', { fg = zzBrightBlue })

    set_hl_full('RenderMarkdownCode', { bg = zzBlack })
    set_hl_full('RenderMarkdownCodeInline', { bg = zzBlack })

    -- Links
    set_hl_full('CmpItemAbbrMatch', { link = 'ZZ.NvimCmp.ItemAbbrMatch' })
    set_hl_full('MatchParen', { link = 'ZZ.MatchParen' })
    set_hl_full('WinSeparator', { link = 'ZZ.WinSeparator' })
    set_hl_full('DiffText', { link = 'ZZ.DiffText' })
    set_hl_full('DiffDelete', { link = 'ZZ.DiffDelete' })
    set_hl_full('DiffAdd', { link = 'ZZ.DiffAdd' })
    set_hl_full('DiffChange', { link = 'ZZ.DiffChange' })
    set_hl_full('TelescopeMatching', { link = 'ZZ.TelescopeMatching' })
    set_hl_full('SnacksPickerMatch', { link = 'ZZ.SnacksPickerMatch' })
    -- blink.cmp windows
    set_hl_full('BlinkCmpMenu', { link = 'ZZ.BlinkCmpMenu' })
    set_hl_full('BlinkCmpMenuSelection', { link = 'ZZ.BlinkCmpSelection' })
    set_hl_full('BlinkCmpMenuBorder', { link = 'ZZ.BlinkCmpBorder' })
    set_hl_full('BlinkCmpDoc', { link = 'ZZ.BlinkCmpDoc' })
    set_hl_full('BlinkCmpDocBorder', { link = 'ZZ.BlinkCmpBorder' })
    set_hl_full('BlinkCmpSignatureHelp', { link = 'ZZ.BlinkCmpSignatureHelp' })
    set_hl_full('BlinkCmpSignatureHelpBorder', { link = 'ZZ.BlinkCmpBorder' })
    set_hl_full('@lsp.typemod.variable.fileScope', { link = 'ZZ.LspGlobalVar' })
    set_hl_full('@lsp.typemod.variable.globalScope', { link = 'ZZ.LspGlobalVar' })
    set_hl_full('@lsp.typemod.variable.functionScope', { link = 'ZZ.LspLocalVar' })
    set_hl_full('@lsp.typemod.variable.static.c', { link = 'ZZ.LspLocalVar' })
    set_hl_full('@lsp.type.macro', { link = 'ZZ.LspMacro' })
    set_hl_full('@lsp.type.enumMember', { link = 'ZZ.LspEnum' })
    set_hl_full('@number', { link = 'ZZ.LspTsConstant' })
    set_hl_full('@constant', { link = 'ZZ.LspTsConstant' })
    set_hl_full('@property', { link = 'ZZ.Property' })
    set_hl_full('@variable.parameter', { link = 'ZZ.Parameter' })
    set_hl_full('Function', { link = 'ZZ.Function' })
    set_hl_full('Type', { link = 'ZZ.Type' })
    set_hl_full('String', { link = 'ZZ.String' })
    set_hl_full('DiagnosticError', { link = 'ZZ.DiagnosticError' })
    set_hl_full('RainbowRed', { link = 'ZZ.RainbowRed' })
    set_hl_full('RainbowOrange', { link = 'ZZ.RainbowOrange' })
    set_hl_full('RainbowYellow', { link = 'ZZ.RainbowYellow' })
    set_hl_full('RainbowGreen', { link = 'ZZ.RainbowGreen' })
    set_hl_full('RainbowCyan', { link = 'ZZ.RainbowCyan' })
    set_hl_full('RainbowBlue', { link = 'ZZ.RainbowBlue' })
    set_hl_full('RainbowPurple', { link = 'ZZ.RainbowPurple' })
    set_hl_full('RainbowGray', { link = 'ZZ.RainbowGray' })
end

local function setMySyntaxHl()
    if vim.g.vscode == nil then
        setNvimSyntaxHl()
    end

    -- hop
    set_hl_full('ZZ.HopNextKey', { fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey1', { fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopNextKey2', { fg = '#7aa2f7', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.HopPreview', { fg = 'white', bg = '#191970', bold = false, italic = false })
    set_hl_full('ZZ.HopUnmatched', { fg = '#4c5372' })

    -- leap
    set_hl_full('ZZ.LeapBackdrop', { fg = '#4c5372' }) -- dimmed, same color as ZZ.HopUnmatched
    set_hl_full('ZZ.LeapLabel', { fg = '#adff2f', bold = true }) -- labels without background
    set_hl_full('ZZ.LeapLabelDimmed', { fg = '#7aa2f7' }) -- preview/next-round label dot (leap auto-derives it from LeapLabel otherwise, see engines/leap.lua)
    set_hl_full('ZZ.LeapLabelPreview', { fg = '#7aa2f7' }) -- inactive labels of the preview phase (first input char), brightened to LeapLabel once confirmed -- via the beacons patch in engines/leap.lua
    set_hl_full('ZZ.LeapMatch', { fg = '#c0caf5', bg = '#3d59a1' }) -- traversal highlight (taken from tokyonight night's Search, consistent on both platforms)

    -- lightspeed
    set_hl_full('ZZ.LightspeedMaskedChar', { fg = '#adff2f', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedLabel', { fg = '#80dcfe', bg = '', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedCursor', { fg = '#191970', bg = '#adff2f', bold = false, italic = false })
    set_hl_full('ZZ.LightspeedLabelDistant', { fg = '#4170ff', bg = '', bold = false, italic = true })
    -- set_hl_full("ZZ.LightspeedUnlabeledMatch", {fg = "#e5e5e5", bg = "",        bold = false, italic = true })

    -- Links
    set_hl_full('HopNextKey', { link = 'ZZ.HopNextKey' })
    set_hl_full('HopNextKey1', { link = 'ZZ.HopNextKey1' })
    set_hl_full('HopNextKey2', { link = 'ZZ.HopNextKey2' })
    set_hl_full('HopPreview', { link = 'ZZ.HopPreview' })
    set_hl_full('HopUnmatched', { link = 'ZZ.HopUnmatched' }) -- hop dimmed
    set_hl_full('LeapBackdrop', { link = 'ZZ.LeapBackdrop' }) -- leap dimmed
    set_hl_full('LeapLabel', { link = 'ZZ.LeapLabel' }) -- leap labels
    set_hl_full('LeapLabelDimmed', { link = 'ZZ.LeapLabelDimmed' }) -- leap preview/next-round dot
    set_hl_full('LeapLabelPreview', { link = 'ZZ.LeapLabelPreview' }) -- leap inactive preview labels
    set_hl_full('LeapMatch', { link = 'ZZ.LeapMatch' }) -- leap traversal
    set_hl_full('LightspeedMaskedChar', { link = 'ZZ.LightspeedMaskedChar' })
    set_hl_full('LightspeedLabel', { link = 'ZZ.LightspeedLabel' })
    set_hl_full('LightspeedCursor', { link = 'ZZ.LightspeedCursor' })
    set_hl_full('LightspeedLabelDistant', { link = 'ZZ.LightspeedLabelDistant' })
    -- set_hl_full("LightspeedUnlabeledMatch",            { link = "ZZ.LightspeedUnlabeledMatch"})
end

setMySyntaxHl()

-- 3. re-apply after colorscheme switches via an autocmd wrapper.
-- every :colorscheme run starts with :hi clear, wiping all ZZ.* groups and links;
-- this callback re-establishes them on top of the new theme.
-- augroup clear=true: a manual module reload (wipe package.loaded + require)
-- replaces the previous listener instead of stacking duplicates
vim.api.nvim_create_augroup('ZZTheme', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
    group = 'ZZTheme',
    pattern = '*',
    callback = setMySyntaxHl,
})
