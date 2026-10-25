return {
    enabled = true,
    -- 列表在上、输入框在下（自带 reverse=true 列表倒序，telescope 经典交互）
    -- layout = {
    --     preset = function()
    --         return vim.o.columns >= 120 and 'telescope' or 'vertical'
    --     end,
    -- },
    sources = {
        explorer = {
            -- preview = "main": 预览显示在主窗口（右侧正常 buffer 区域，关闭
            -- explorer 后恢复原 buffer），而不是 sidebar 底部的小窗格
            -- （preset 内置的是 height=0.4 的底部窗）。
            -- hidden: 预览默认隐藏（避免 nvim <dir> 启动时盖住 dashboard），
            -- 在 explorer 里按 P（toggle_preview）按需开启。
            -- win.preview: 预览浮层的样式（尺寸走默认=铺满主窗口）。
            -- border 可选: nvim 原生 "none"/"single"/"double"/"rounded"/"solid"/
            -- "shadow"，snacks 特有单边 "left"/"right"/"top"/"bottom"/
            -- "top_bottom"，留白 "hpad"/"vpad"，或 8 字符串/8 元素表自定义。
            -- 注意：源级覆盖必须挂在 picker.sources.explorer 下（见
            -- snacks/picker/config/init.lua 的合并表），顶层 opts.explorer
            -- 是模块配置位，picker 的源解析不读它。
            layout = { preset = 'sidebar', preview = 'main', hidden = { 'preview' } },
            win = {
                preview = {
                    border = 'double',
                    title = '{preview}',
                    title_pos = 'center',
                },
            },
        },
    },
}
