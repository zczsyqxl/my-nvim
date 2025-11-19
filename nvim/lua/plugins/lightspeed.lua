return {
	'ggandor/lightspeed.nvim',
    opts = {
        ignore_case = true,
        substitute_chars = { [' '] = '■' },
        safe_labels = {nil},
        labels = { "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"},
    },
	config = function(_, opts)
		require'lightspeed'.setup(opts)
		vim.keymap.set('', 's', '<Plug>Lightspeed_omni_s', {remap=true, desc='zz:LightSpeed:omni_s'})
	end,
}
