return {
    'folke/flash.nvim',
    -- / ? 搜索标签靠 search.lua 在 setup 时注册的 CmdlineEnter autocmd 驱动，
    -- 只有 keys 触发 lazy-load 的话，新会话没按过 s 等键插件就不加载，/ 没标签。
    -- VeryLazy 在 UI 就绪后加载，autocmd 常驻，不占启动耗时。
    -- 注意：nvim 0.13-dev nightly 上 / 前向搜索的 incsearch 重绘不渲染 virt_text，
    -- 标签看不见（? 向后正常）；set noic 可绕过，稳定版无此问题。
    event = 'VeryLazy',
    -- 归一替换 hop + lightspeed：
    --   s     ← lightspeed omni_s（字符跳转，输入即正则；flash 默认就是跨窗口）
    --   S     ← 保留键位（与 s 等价，flash 默认已 multi_window）
    --   ,s    ← fuzzy 跳转：打目标词里任意散字符过滤，适合首字符很常见的目标
    --   ,w/,b ← hop hint_words：输一个字母，标签打在词首
    --   ,j/,k ← hop hint_lines：pattern ^. 标签打在每行行首，无需输入直接选标签
    --   ,r    ← hop-yank 的远程操作替代：y ,r <目标> / d ,r <目标>
    --   hop 的 ,z 与 s 重复；,J/,K 垂直跳由 ,j/,k + 相对行号覆盖，不迁移
    keys = {
        { 's', mode = { 'n', 'v', 'o' }, function() require('flash').jump() end, desc = 'zz:Flash:Jump' },
        { 'S', mode = { 'n', 'v', 'o' }, function() require('flash').jump() end, desc = 'zz:Flash:Jump' },
        { ',s', mode = { 'n', 'v', 'o' }, function()
            require('flash').jump({ search = { mode = 'fuzzy' } })
        end, desc = 'zz:Flash:fuzzy jump' },
        { ',w', mode = { 'n', 'v', 'o' }, function()
            require('flash').jump({ search = { mode = function(pat) return [[\<]] .. pat end, forward = true } })
        end, desc = 'zz:Flash:words.after' },
        { ',b', mode = { 'n', 'v', 'o' }, function()
            require('flash').jump({ search = { mode = function(pat) return [[\<]] .. pat end, forward = false } })
        end, desc = 'zz:Flash:words.before' },
        { ',j', mode = { 'n', 'v', 'o' }, function()
            require('flash').jump({ pattern = [[^.]], search = { mode = 'search', forward = true }, prompt = { enabled = false } })
        end, desc = 'zz:Flash:lines.after' },
        { ',k', mode = { 'n', 'v', 'o' }, function()
            require('flash').jump({ pattern = [[^.]], search = { mode = 'search', forward = false }, prompt = { enabled = false } })
        end, desc = 'zz:Flash:lines.before' },
        { ',r', mode = 'o', function() require('flash').remote() end, desc = 'zz:Flash:Remote (operator)' },
    },
    opts = {
        -- 标签池：顺序 = 分配优先级，前面的字符给离光标近的目标
        -- 默认 'asdfghjklqwertyuiopzxcvbnm'（26 键，home row 优先）；
        -- 此处 22 键版，剔除上排远端的 u i o p，减到最顺手的一批
        labels = 'asdfghjklzxcvbnmqwerty',
        modes = { search = { enabled = true } },
        label = { uppercase = false },
    },
}
