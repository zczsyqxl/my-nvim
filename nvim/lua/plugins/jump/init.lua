-- Jump engine selector: hop / lightspeed / flash / leap
-- Engine specs live in engines/ (no init.lua there, so lazy.nvim won't auto-import);
-- only the engines listed below take effect. Restart nvim after editing.
--
-- Keymap usage (leader = ,):
--   hop        <leader>w b j k J K s z
--   lightspeed s  S
--   flash      s  S   ,s ,w ,b ,j ,k ,r   + / ? search labels
--   leap       s  S   ,x ,X (one-way + traversal)  gk (Visitor remote ops)
-- s is shared by lightspeed/flash/leap (don't enable two of them at once);
-- hop is all <leader>-prefixed and can coexist with any of them -- with flash
-- enabled, ,s ,w ,b ,j ,k are shadowed by flash.
local engines = { 'hop','leap' }

local specs = {}
for _, name in ipairs(engines) do
    table.insert(specs, require('plugins.jump.engines.' .. name))
end
return specs
