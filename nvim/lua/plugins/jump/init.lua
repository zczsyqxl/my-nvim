-- 跳转引擎选择器：hop / lightspeed / flash / leap
-- 引擎 spec 在 engines/ 子目录（无 init.lua，lazy 不会自动导入），
-- 只有下面列表里列出的才生效；改完重启 nvim 即可。
--
-- 键位占用（leader = ,）：
--   hop        <leader>w b j k J K s z   ,x ,X
--   lightspeed s  S
--   flash      s  S   ,s ,w ,b ,j ,k ,r   + / ? 搜索标签
--   leap       s  S
-- s 键三家共用（lightspeed/flash/leap 互相别同开）；
-- hop 全是 , 前缀，可与任一家同开——与 flash 同开时 ,s ,w ,b ,j ,k 被 flash 覆盖。
local engines = { 'hop','lightspeed' }

local specs = {}
for _, name in ipairs(engines) do
    table.insert(specs, require('plugins.jump.engines.' .. name))
end
return specs
