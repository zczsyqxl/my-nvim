return {
    'folke/flash.nvim',
    -- / and ? search labels are driven by a CmdlineEnter autocmd registered in
    -- search.lua at setup time; with keys-only lazy loading, a fresh session that
    -- never pressed s etc. wouldn't load the plugin and / would get no labels.
    -- VeryLazy loads after the UI is ready, keeps the autocmd alive, costs no startup time.
    -- NOTE: on nvim 0.13-dev nightly the incsearch redraw of / forward search doesn't
    -- render virt_text, so labels are invisible (? backward works fine); set noic
    -- works around it, stable releases are unaffected.
    event = 'VeryLazy',
    -- Drop-in replacement for hop + lightspeed:
    --   s     <- lightspeed omni_s (char jump, input is a regex; flash is cross-window by default)
    --   S     <- key kept (equivalent to s; flash already defaults to multi_window)
    --   ,s    <- fuzzy jump: type scattered chars of the target word to filter,
    --            good when the target's first char is very common
    --   ,w/,b <- hop hint_words: type one letter, labels land on word starts
    --   ,j/,k <- hop hint_lines: pattern ^. labels on every line head, pick one directly, no typing
    --   ,r    <- hop-yank's replacement for remote ops: y ,r <target> / d ,r <target>
    --   hop's ,z duplicates s; ,J/,K vertical jumps are covered by ,j/,k +
    --   relative line numbers, not migrated
    keys = {
        {
            's',
            mode = { 'n', 'v', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'zz:Flash:Jump',
        },
        {
            'S',
            mode = { 'n', 'v', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'zz:Flash:Jump',
        },
        {
            ',w',
            mode = { 'n', 'v', 'o' },
            function()
                require('flash').jump({ search = {
                    mode = function(pat)
                        return [[\<]] .. pat
                    end,
                } })
            end,
            desc = 'zz:Flash:words.after',
        },
        {
            ',l',
            mode = { 'n', 'v', 'o' },
            function()
                require('flash').jump({ pattern = [[^.]], search = {
                    mode = 'search',
                }, prompt = { enabled = false } })
            end,
            desc = 'zz:Flash:lines.after',
        },
        {
            ',r',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'zz:Flash:Remote (operator)',
        },
    },
    opts = {
        -- Label pool: order = assignment priority, earlier chars go to targets closer to the cursor.
        -- Default is 'asdfghjklqwertyuiopzxcvbnm' (26 keys, home row first);
        -- this 22-key version drops u i o p from the far top row, keeping the comfiest set
        labels = 'asdfghjklzxcvbnmqwerty',
        modes = { search = { enabled = true } },
        label = { uppercase = false },
    },
}
