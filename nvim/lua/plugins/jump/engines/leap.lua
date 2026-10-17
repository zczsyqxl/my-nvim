return {
	-- leap 已从 GitHub 迁至 Codeberg（GitHub 仓库被作者清空只留 README，装上去是空目录）
	url = 'https://codeberg.org/andyg/leap.nvim.git',
	name = 'leap.nvim',
	-- leap 是 lightspeed 同作者的继任者：输两个字符过滤 + 标签跳转
	-- vim-repeat 支持 . 重复上一次 leap
	dependencies = { 'tpope/vim-repeat' },
	-- 官方建议不用 lazy keys：plugin/ 只建轻量 Plug 映射，主模块按下时才 require，
	-- 自身已懒加载；且 keys 首次触发若在 op-pending（yz/dz）可能丢 operator（#84）
	lazy = false,
	opts = {
		-- 标签池：顺序 = 分配优先级（前面的字符给离光标近的目标），33 键；
		-- 每个字符都是字面标签——'/' 无特殊含义（leap 默认串里也含 '/' 和 '?'）
		labels = "asdfjklghqweruioptyzxcvmbn;',./[]",
		-- safe_labels = ''：关闭 autojump——不自动跳最近匹配，永远显式按标签
		-- （全部走上面的池子；代价：唯一匹配也要补按一下它的标签）
		safe_labels = '',
	},
	config = function(_, opts)
		-- 高亮集中在 theme/zz.lua（nvim）/ zzvs.lua（vscode）：
		--   ZZ.LeapBackdrop（变灰 #4c5372，与 hop 同色）/ ZZ.LeapLabel（无底色绿字）
		-- 这里 setup 前提前 require 是时序需要：leap 的 backdrop 注册是 setup 时
		-- 的一次性判断（LeapBackdrop 组已定义才启用），而 theme 文件平时由
		-- after/plugin 加载、晚于 setup。require 有缓存，after/plugin 那次变空操作
		require(vim.g.vscode and 'theme.zzvs' or 'theme.zz')
		require('leap').setup(opts)
		local map = vim.keymap.set
		-- normal/visual 跳转：s/S（visual 的 s 原生是 v_c 替换，被占有等价命令）
		map({ 'n', 'v' }, 's', '<Plug>(leap)', { desc = 'zz:Leap:Jump' })
		map({ 'n', 'v' }, 'S', '<Plug>(leap-from-window)', { desc = 'zz:Leap:AllWindows' })
		-- 单向搜索（traversal 需单向会话，双向的 s 按了 enter 会话即结束）：
		--   ,x ab<enter><enter>... 连续遍历匹配，<backspace> 回退；
		--   s{char}<enter> 跳最近匹配（跨行 f/t）、s<enter> 重复上次搜索
		map({ 'n', 'v' }, ',x', '<Plug>(leap-forward)', { desc = 'zz:Leap:fwd' })
		map({ 'n', 'v' }, ',X', '<Plug>(leap-backward)', { desc = 'zz:Leap:bwd' })
		-- operator 后（y/d/c… 接 motion）：复刻 lightspeed 的 z/x/Z/X，
		-- 避开 surround 的 ys/ds/cs；normal 的 z/x 原生行为不受影响（zz/zt/zb 完好）
		--   前向：z 不含目标字符(t式)  x 含(f式)；后向：X 含目标  Z 不含
		map('o', 'z', '<Plug>(leap-forward-next-to)', { desc = 'zz:Leap:fwd-excl' })
		map('o', 'x', '<Plug>(leap-forward)', { desc = 'zz:Leap:fwd-incl' })
		map('o', 'X', '<Plug>(leap-backward-next-to)', { desc = 'zz:Leap:bwd-incl' })
		map('o', 'Z', '<Plug>(leap-backward)', { desc = 'zz:Leap:bwd-excl' })
		-- Visitor mode（远程操作，gs 被 mini.operators 的 sort 占用，改 gk）：
		--   gk{leap}y = 远程 yank；2gk{leap} 按行选；y1gk{leap} = yank 远程一行
		map({ 'n', 'v', 'o' }, 'gk', '<Plug>(leap-visit)', { desc = 'zz:Leap:Visit' })
	end,
}
