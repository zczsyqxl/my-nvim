local md = 'render'
local imgclip = nil
if vim.fn.has('win32') ~= 0 then
    imgclip = require('plugins.nvim.md.imgClip')
end
return {
    require(
        ({
            markview = 'plugins.nvim.md.markview',
        })[md]
        or 'plugins.nvim.md.renderMarkdown'
    ),
    require('plugins.nvim.md.markdownPreview'),
    imgclip,
    -- require('plugins.nvim.md.image'),  -- Zhang,Yingqi: effect for markdown edit, not used for now
}
