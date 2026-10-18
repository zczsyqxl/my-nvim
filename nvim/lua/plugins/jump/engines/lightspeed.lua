return {
    'ggandor/lightspeed.nvim',
    -- keys must live at spec top level for lazy loading (inside config lazy.nvim
    -- can't see them and the plugin would load at startup)
    keys = function()
        local keys = {
            { 's', '<Plug>Lightspeed_omni_s', mode = { 'n', 'v', 'o' }, remap = true, desc = 'zz:LightSpeed:omni_s' },
        }
        if vim.g.vscode == nil then
            keys[#keys + 1] = { 'S', '<Plug>Lightspeed_omni_gs', mode = 'n', remap = true, desc = 'zz:LightSpeed:omni_gs' }
        end
        return keys
    end,
    opts = {
        ignore_case = true,
        substitute_chars = { [' '] = '■' },
        safe_labels = { nil },
        labels = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' },
    },
    config = function(_, opts)
        require('lightspeed').setup(opts)
    end,
}
