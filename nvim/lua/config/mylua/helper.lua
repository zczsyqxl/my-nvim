local function echo_color(hl, text)
	vim.cmd(string.format('echohl %s', hl))
	vim.cmd(string.format('echo "%s"', text:gsub('"', '\\"')))
	vim.cmd 'echohl None'
end

return {
	echo_color = echo_color,
}
