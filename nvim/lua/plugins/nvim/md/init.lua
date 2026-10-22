local md = 'render'
local imgclip = nil
imgclip = require('plugins.nvim.md.imgClip')
return {
    require(({
        markview = 'plugins.nvim.md.markview',
    })[md] or 'plugins.nvim.md.renderMarkdown'),
    require('plugins.nvim.md.markdownPreview'),
    imgclip,
    -- require('plugins.nvim.md.image'),  -- Zhang,Yingqi: effect for markdown edit, not used for now
}
