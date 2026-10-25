return {
    'folke/lazydev.nvim',
    ft = 'lua', -- 只在编辑 lua 文件时加载
    opts = {
        library = {
            -- luv 类型：文件里出现 vim.uv 才加载
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            -- 插件库按需注入（path 写插件名，lazydev 自动解析安装路径）：
            -- words = buffer 内容匹配到才注入 → 不再整库扫描 →
            -- 跨插件模块撞名歧义消失（avante.llm / _toggleterm 等元凶不再进 library）
            { path = 'snacks.nvim', words = { 'Snacks' } },
            { path = 'mini.nvim', words = { 'Mini' } },
            { path = 'toggleterm.nvim', words = { 'toggleterm' } },
            { path = 'llm.nvim', words = { '%f[%w]llm' } },
            { path = 'codecompanion.nvim', words = { 'codecompanion' } },
        },
    },
}
