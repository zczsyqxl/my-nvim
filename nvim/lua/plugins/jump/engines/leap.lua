return {
	-- leap 已从 GitHub 迁至 Codeberg（GitHub 仓库被作者清空只留 README，装上去是空目录）
	url = 'https://codeberg.org/andyg/leap.nvim.git',
	name = 'leap.nvim',
	-- leap 是 lightspeed 同作者的继任者：输两个字符过滤 + 标签跳转
	-- vim-repeat 支持 . 重复上一次 leap
	dependencies = { 'tpope/vim-repeat' },
	keys = {
		{ 's', '<Plug>(leap)', mode = { 'n', 'v', 'o' }, remap = true, desc = 'zz:Leap:Jump' },
		{ 'S', '<Plug>(leap-from-window)', mode = { 'n', 'v', 'o' }, remap = true, desc = 'zz:Leap:AllWindows' },
	},
	opts = {
		-- leap 特色：safe_labels 机制——首字符组合唯一时直接跳（不打标签），
		-- 多个候选才出标签，接近 lightspeed 的两组标签体验
		-- 标签组可配（同 lightspeed 的 labels）：
		-- labels = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
		--            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' },
	},
}
