return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup({
            highlights = {
                buffer_selected = {
                    fg = '#FFFFFF',
                    bold = true,
                    italic = true,
                },
                tab_selected = {
                    fg = '#FFFFFF',
                    bold = true,
                    italic = true,
                },
                pick = {
                    fg = '#61AFEF',
                    bold = true,
                    italic = true,
                },
            },
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                style_preset = bufferline.style_preset.default, --bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
                themable = true, --| false, -- allows highlight groups to be overriden i.e. sets highlights as default
                -- numbers = 'both', --"none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
                numbers = function(opts)
                    return string.format('%s·%s', opts.ordinal, opts.lower(opts.id))
                end,
                close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'underline', --'icon' | 'underline' | 'none',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '● ',
                close_icon = ' ',
                left_trunc_marker = ' ',
                right_trunc_marker = ' ',
                --- name_formatter can be used to change the buffer's label in the bufferline.
                --- Please note some names can/will break the
                --- bufferline so use this at your discretion knowing that it has
                --- some limitations that will *NOT* be fixed.
                -- name_formatter = function(buf)  -- buf contains:
                --     -- name                | str        | the basename of the active file
                --     -- path                | str        | the full path of the active file
                --     -- bufnr               | int        | the number of the active buffer
                --     -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
                --     -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
                -- end,
                max_name_length = 18,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                truncate_names = true, -- whether or not tab names should be truncated
                tab_size = 18,
                diagnostics = 'nvim_lsp', --false | "nvim_lsp" | "coc",
                diagnostics_update_in_insert = false, -- only applies to coc
                diagnostics_update_on_event = true, -- use nvim's diagnostic handler
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    _ = diagnostics_dict
                    _ = context
                    local icon = level:match("error") and " " or " "
                    return "[" .. icon .. count .. "]"
                end,
                -- NOTE: this will be called a lot so don't do any heavy processing here
                -- custom_filter = function(buf_number, buf_numbers)
                --     -- filter out filetypes you don't want to see
                --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                --         return true
                --     end
                --     -- filter out by buffer name
                --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                --         return true
                --     end
                --     -- filter out based on arbitrary rules
                --     -- e.g. filter out vim wiki buffer from tabline in your work repo
                --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                --         return true
                --     end
                --     -- filter out by it's index number in list (don't show first buffer)
                --     if buf_numbers[1] ~= buf_number then
                --         return true
                --     end
                -- end,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = 'File Explorer', --"File Explorer" | function ,
                        text_align = 'left',--"left" | "center" | "right"
                        separator = true
                    }
                },
                color_icons = true, --true | false, -- whether or not to add the filetype icon highlights
                -- get_element_icon = function(element)
                --     -- element consists of {filetype: string, path: string, extension: string, directory: string}
                --     -- This can be used to change how bufferline fetches the icon
                --     -- for an element e.g. a buffer or a tab.
                --     -- e.g.
                --     local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
                --     return icon, hl
                --     -- or
                --     local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
                --     return custom_map[element.filetype]
                -- end,
                show_buffer_icons = true, --true | false, -- disable filetype icons for buffers
                show_buffer_close_icons = true, --true | false,
                show_close_icon = true, --true | false,
                show_tab_indicators = true, --true | false,
                show_duplicate_prefix = true, --true | false, -- whether to show duplicate buffer prefix
                duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
                persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
                move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
                -- can also be a table containing 2 custom separators
                -- [focused and unfocused]. eg: { '|', '|' }
                separator_style = 'slope', --"slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
                enforce_regular_tabs = false, --false | true,
                always_show_bufferline = true, --true | false,
                auto_toggle_bufferline = true, --true | false,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
                --     -- add custom logic
                --     local modified_a = vim.fn.getftime(buffer_a.path)
                --     local modified_b = vim.fn.getftime(buffer_b.path)
                --     return modified_a > modified_b
                -- end,
                pick = {
                    alphabet = "abcdefghijklmopqrstuvwxyz1234567890",
                },
            },
        })
        vim.keymap.set('n', '<leader>bo', '<cmd>BufferLinePick<cr>', {remap = false, silent=true, desc='zz:bufferline:BufPick'})
        vim.keymap.set('n', '<leader>bc', '<cmd>BufferLinePickClose<cr>', {remap = false, silent=true, desc='zz:bufferline:BufPickClose'})
        -- vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', {remap = false, silent=true})
        -- vim.keymap.set('n', '<leader>-1', '<cmd>BufferLineGoToBuffer 0<cr>', {remap = false, silent=true})
        vim.keymap.set('n', '<leader>1', function() require('bufferline').go_to(1,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>2', function() require('bufferline').go_to(2,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>3', function() require('bufferline').go_to(3,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>4', function() require('bufferline').go_to(4,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>5', function() require('bufferline').go_to(5,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>6', function() require('bufferline').go_to(6,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>7', function() require('bufferline').go_to(7,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>8', function() require('bufferline').go_to(8,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>9', function() require('bufferline').go_to(9,  true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
        vim.keymap.set('n', '<leader>0', function() require('bufferline').go_to(-1, true) end, {remap = false, silent=true ,desc='zz:bufferline:GoToBufNum'})
    end
}

