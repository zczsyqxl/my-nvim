local md = 'render'
return {
    require(
        ({
            markview = 'plugins.nvim.md.markview',
        })[md]
        or 'plugins.nvim.md.renderMarkdown'
    ),
    require('plugins.nvim.md.markdownPreview'),
    require('plugins.nvim.md.imgClip'),
    -- require('plugins.nvim.md.image'),  -- Zhang,Yingqi: effect for markdown edit, not used for now
}
