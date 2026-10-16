return {
	'ggandor/lightspeed.nvim',
    -- 键位提升到 spec 顶层 keys 才能懒加载（写在 config 里 lazy 看不见，会启动即加载）
	keys = function()
		local keys = {
			{ 's', '<Plug>Lightspeed_omni_s', mode = {'n','v','o'}, remap = true, desc = 'zz:LightSpeed:omni_s' },
		}
		if vim.g.vscode == nil then
			keys[#keys+1] = { 'S', '<Plug>Lightspeed_omni_gs', mode = 'n', remap = true, desc = 'zz:LightSpeed:omni_gs' }
		end
		return keys
	end,
	opts = {
		ignore_case = true,
		substitute_chars = { [' '] = '■' },
		safe_labels = {nil},
		labels = { "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"},
	},
	config = function(_, opts)
		require('lightspeed').setup(opts)
	end,
}
