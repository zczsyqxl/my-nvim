return {
    -- leap moved from GitHub to Codeberg (the GitHub repo was emptied by its author,
    -- leaving only a README; installing from there yields an empty dir)
    url = 'https://codeberg.org/andyg/leap.nvim.git',
    name = 'leap.nvim',
    -- leap is the same author's successor to lightspeed: type two chars to filter + label jump
    -- vim-repeat lets . repeat the last leap
    dependencies = { 'tpope/vim-repeat' },
    -- Upstream recommends against lazy keys: plugin/ only creates lightweight Plug
    -- mappings and requires the main module on demand, so it lazy-loads itself;
    -- also a keys-only first trigger in op-pending (yz/dz) may drop the operator (#84)
    lazy = false,
    opts = {
        -- Label pool: order = assignment priority (earlier chars go to targets closer
        -- to the cursor), 33 keys; every char is a literal label -- '/' has no special
        -- meaning (leap's default string also contains '/' and '?')
        labels = "asdfjklghqweruioptyzxcvmbn;',./[]",
        -- safe_labels = '': disables autojump -- never auto-jump to the nearest match,
        -- always confirm with an explicit label (everything goes through the pool above;
        -- the cost: even a unique match needs one extra label press)
        safe_labels = '',
    },
    config = function(_, opts)
        -- Highlights live in theme/zz.lua (nvim) / zzvs.lua (vscode):
        --   ZZ.LeapBackdrop (dimmed #4c5372, same color as hop) / ZZ.LeapLabel (green fg, no bg).
        -- Requiring it here before setup is an ordering need: leap's backdrop registration
        -- is a one-time check at setup (only enabled if the LeapBackdrop group already exists),
        -- while theme files are normally loaded by after/plugin, later than setup.
        -- require is cached, so the after/plugin call becomes a no-op.
        require(vim.g.vscode and 'theme.zzvs' or 'theme.zz')

        -- LeapLabelDimmed (the dimmed dots of concealed/preview labels) is not a
        -- configurable group: leap re-derives it from LeapLabel inside
        -- highlight.init (on module load and on every ColorScheme), and its public
        -- init_hl() only recomputes the same derivation. To pin it to our own
        -- group, wrap init -- the metatable dispatcher in leap/init.lua resolves
        -- `leap.init_hl` and the ColorScheme autocmd through this same table
        -- field, so every call path lands here. Must be installed before
        -- require('leap') so the module-level init is covered too. Same pattern
        -- as the scissors patch (_zz_mini_patched) elsewhere in this config.
        local hl = require('leap.highlight')
        if not hl._zz_dimmed_patched then
            local orig_init = hl.init
            hl.init = function(self, force)
                orig_init(self, force)
                vim.api.nvim_set_hl(0, 'LeapLabelDimmed', { link = 'ZZ.LeapLabelDimmed' })
            end
            hl._zz_dimmed_patched = true
            -- leap's module-level init may have run before this patch (if some
            -- other plugin required leap first); catch that up now
            vim.api.nvim_set_hl(0, 'LeapLabelDimmed', { link = 'ZZ.LeapLabelDimmed' })
        end

        require('leap').setup(opts)
        local map = vim.keymap.set
        -- normal/visual jump: s/S (visual's native s is v_c substitute, and an equivalent command exists)
        map({ 'n', 'v' }, 's', '<Plug>(leap)', { desc = 'zz:Leap:Jump' })
        map({ 'n', 'v' }, 'S', '<Plug>(leap-from-window)', { desc = 'zz:Leap:AllWindows' })
        -- One-way search (traversal needs a one-way session; with bidirectional s,
        -- pressing enter ends the session):
        --   ,x ab<enter><enter>... walks matches, <backspace> steps back;
        --   s{char}<enter> jumps to the nearest match (multiline f/t), s<enter> repeats the last search
        map({ 'n', 'v' }, ',x', '<Plug>(leap-forward)', { desc = 'zz:Leap:fwd' })
        map({ 'n', 'v' }, ',X', '<Plug>(leap-backward)', { desc = 'zz:Leap:bwd' })
        -- After an operator (y/d/c... + motion): replicate lightspeed's z/x/Z/X,
        -- avoiding surround's ys/ds/cs; normal-mode z/x keep native behavior (zz/zt/zb intact).
        --   Forward: z excludes the target char (t-style), x includes it (f-style);
        --   backward: X includes the target, Z excludes it
        map('o', 'z', '<Plug>(leap-forward-next-to)', { desc = 'zz:Leap:fwd-excl' })
        map('o', 'x', '<Plug>(leap-forward)', { desc = 'zz:Leap:fwd-incl' })
        map('o', 'X', '<Plug>(leap-backward-next-to)', { desc = 'zz:Leap:bwd-incl' })
        map('o', 'Z', '<Plug>(leap-backward)', { desc = 'zz:Leap:bwd-excl' })
        -- Visitor mode (remote ops; gs is taken by mini.operators' sort, so use gk):
        --   gk{leap}y = remote yank; 2gk{leap} selects by line; y1gk{leap} = yank one remote line
        map({ 'n', 'v', 'o' }, 'gk', '<Plug>(leap-visit)', { desc = 'zz:Leap:Visit' })
    end,
}
