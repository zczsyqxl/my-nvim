
if vim.g.vscode then
	require('config.base')
	require('config.keymap')
else
	require('config.vsbase')
	require('config.vskeymap')
end

require("config.lazy")


