return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load ({
            paths = {
                vim.fn.stdpath('config') .. '/snippets',
            },
        })
        local ls = require('luasnip')
        vim.keymap.set({"i"}, "<A-j>", function() ls.expand() end, {silent = true, desc = 'zz:LuaSnip:expand'})
        vim.keymap.set({"i", "s"}, "<A-l>", function() ls.jump( 1) end, {silent = true, desc = 'zz:LuaSnip:JumpNext'})
        vim.keymap.set({"i", "s"}, "<A-h>", function() ls.jump(-1) end, {silent = true, desc = 'zz:LuaSnip:JumpPrev'})

        vim.keymap.set({"i", "s"}, "<A-k>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})
    end
}



