-- keymap generator: extract every custom mapping from nvim/lua, detect conflicts,
-- rewrite KEYMAPS.md at the repo root.
--
-- extraction covers:
--   * vim.keymap.set (+ leap's `map` alias, any *.keymap.set)
--   * lazy spec `keys = {}` tables
--   * Snacks.toggle `:map()` calls
--   * mini.snippets / mini.surround / mini.diff opts `mappings = {}` tables
--   * blink.cmp opts `keymap = {}` (insert) and `cmdline.keymap` (cmdline mode)
--
-- run from the repo root (paths are derived from this script's own location):
--   nvim --headless -u NONE +"set noswapfile" +"luafile keymap_gen.lua"
local ts = vim.treesitter

-- repo root = directory of this script
local script_path = debug.getinfo(1, 'S').source:sub(2)
local repo = vim.fs.dirname(vim.fs.normalize(vim.fn.fnamemodify(script_path, ':p')))
local repo_pat = repo:gsub('%W', '%%%0') -- pattern-escaped for gsub usage

local function txt(node, bufnr)
    return ts.get_node_text(node, bufnr)
end

local function squash(s)
    return (s:gsub('\r', ''):gsub('\n%s*', ' '):gsub('%s+', ' '))
end

local function unquote(s)
    return (s:gsub('^%s*["\']', ''):gsub('["\']%s*$', ''))
end

local SKIP = { [','] = true, [';'] = true, ['('] = true, [')'] = true, ['{'] = true, ['}'] = true }

local function positional(container, idx)
    local i = 0
    for child in container:iter_children() do
        local t = child:type()
        if t == 'field' then
            if not child:field('name')[1] then
                i = i + 1
                if i == idx then
                    return child:field('value')[1]
                end
            end
        elseif not SKIP[t] then
            i = i + 1
            if i == idx then
                return child
            end
        end
    end
end

local function field_value(tbl, bufnr, name)
    if not tbl or tbl:type() ~= 'table_constructor' then
        return nil
    end
    for child in tbl:iter_children() do
        if child:type() == 'field' then
            local nm = child:field('name')[1]
            if nm and txt(nm, bufnr) == name then
                return child:field('value')[1]
            end
        end
    end
end

local function mode_list(node, bufnr)
    local modes = {}
    if not node then
        return { 'n' }
    end
    local t = node:type()
    if t == 'string' then
        modes[1] = unquote(txt(node, bufnr))
    elseif t == 'table_constructor' then
        for c in node:iter_children() do
            local v
            if c:type() == 'field' then
                v = c:field('value')[1]
            elseif c:type() == 'string' then
                v = c
            end
            if v and v:type() == 'string' then
                modes[#modes + 1] = unquote(txt(v, bufnr))
            end
        end
    end
    if #modes == 0 then
        modes[1] = 'n'
    end
    return modes
end

local rhs_query

local function render_rhs(node, bufnr)
    if not node then
        return ''
    end
    local t = node:type()
    if t == 'string' then
        return unquote(txt(node, bufnr))
    end
    if t == 'function_definition' then
        rhs_query = rhs_query or ts.query.parse('lua', '(function_call) @rhs_call')
        for _, n in rhs_query:iter_captures(node, bufnr, 0, -1) do
            return 'fn: ' .. squash(txt(n, bufnr)):sub(1, 60)
        end
        return 'fn: ...'
    end
    return squash(txt(node, bufnr)):sub(1, 60)
end

-- plugin opts `mappings = {}` tables that never go through vim.keymap.set;
-- keyed by file path relative to nvim/lua -> { field -> {lhs fallback, desc, mode} }
-- lhs is taken from the file unless the fallback is set (omitted fields stay hidden)
local OPT_MAPPINGS = {
    ['lua/plugins/mini/snippet.lua'] = {
        family     = 'opts: mini.snippets',
        expand     = { nil, 'zz:MiniSnippets:expand (insert)', 'i' },
        jump_next  = { nil, 'zz:MiniSnippets:jump next',       'i' },
        jump_prev  = { nil, 'zz:MiniSnippets:jump prev',       'i' },
        stop       = { nil, 'zz:MiniSnippets:stop (session)',  'i' },
    },
    ['lua/plugins/mini/surround.lua'] = {
        family         = 'opts: mini.surround',
        add            = { nil, 'zz:mini.surround:Add',          'n+x' },
        delete         = { nil, 'zz:mini.surround:Delete',       'n+x' },
        find           = { nil, 'zz:mini.surround:Find',         'n+x' },
        find_left      = { nil, 'zz:mini.surround:FindLeft',     'n+x' },
        highlight      = { nil, 'zz:mini.surround:Highlight',    'n+x' },
        replace        = { nil, 'zz:mini.surround:Replace',      'n+x' },
        update_n_lines = { nil, 'zz:mini.surround:UpdateNLines', 'n' },
    },
    ['lua/plugins/mini/diff.lua'] = {
        family      = 'opts: mini.diff',
        apply       = { nil, 'zz:mini.diff:Apply hunks',     'n+x' },
        reset       = { nil, 'zz:mini.diff:Reset hunks',     'n+x' },
        textobject  = { nil, 'zz:mini.diff:TextObject',      'o' },
        goto_first  = { nil, 'zz:mini.diff:Goto first hunk', 'n' },
        goto_prev   = { nil, 'zz:mini.diff:Goto prev hunk',  'n' },
        goto_next   = { nil, 'zz:mini.diff:Goto next hunk',  'n' },
        goto_last   = { nil, 'zz:mini.diff:Goto last hunk',  'n' },
    },
}

local function relfile(file)
    return (file:gsub('^' .. repo_pat .. '/nvim/', ''))
end

-- blink.cmp opts `keymap = {}` table (insert mode) and `cmdline.keymap` (cmdline mode):
-- field names are lhs strings like ['<C-j>'], values are action lists (strings/functions)
local BLINK_SPEC = 'lua/plugins/nvim/cmpn/blinkCmp.lua'

local function handle_blink_keymaps(tbl, bufnr, mode, add, line)
    for child in tbl:iter_children() do
        if child:type() == 'field' then
            local nm_node = child:field('name')[1]
            local v = child:field('value')[1]
            if nm_node and nm_node:type() == 'string' and v and v:type() == 'table_constructor' then
                local lhs = unquote(txt(nm_node, bufnr))
                local acts = {}
                for c in v:iter_children() do
                    -- positional elements surface as anonymous `field` nodes in the lua grammar
                    if c:type() == 'field' and not c:field('name')[1] then
                        local el = c:field('value')[1]
                        if el and el:type() == 'string' then
                            acts[#acts + 1] = unquote(txt(el, bufnr))
                        elseif el and el:type() == 'function_definition' then
                            acts[#acts + 1] = 'fn'
                        end
                    end
                end
                add(line, { mode }, lhs, 'opts: blink.cmp', 'blink: ' .. table.concat(acts, '|'))
            end
        end
    end
end

local function handle_mappings_field(node, file, add, bufnr)
    local spec = OPT_MAPPINGS[relfile(file)]
    if not spec then
        return
    end
    local val = node:field('value')[1]
    if not val or val:type() ~= 'table_constructor' then
        return
    end
    local line = node:start() + 1
    for child in val:iter_children() do
        if child:type() == 'field' then
            local nm_node = child:field('name')[1]
            local v_node = child:field('value')[1]
            local nm = nm_node and txt(nm_node, bufnr)
            local rule = nm and spec[nm]
            if rule and v_node and v_node:type() == 'string' then
                add(line, { rule[3] }, unquote(txt(v_node, bufnr)), spec.family, rule[2])
            end
        end
    end
end

local function extract_file(file, entries)
    local bufnr = vim.fn.bufadd(file)
    vim.fn.bufload(bufnr)
    vim.bo[bufnr].filetype = 'lua'
    local root = ts.get_parser(bufnr, 'lua'):parse()[1]:root()

    local function add(line, modes, lhs, rhs, desc)
        entries[#entries + 1] = {
            file = file, line = line,
            modes = modes, lhs = lhs or '?',
            rhs = rhs or '', desc = desc or '',
        }
    end

    local function handle_call(node)
        local name_node = node:field('name')[1]
        if not name_node then
            return
        end
        local nm = txt(name_node, bufnr)
        local args = node:field('arguments')[1]
        if not args then
            return
        end
        local line = node:start() + 1

        if nm == 'vim.keymap.set' or nm == 'map' or nm:match('keymap%.set$') then
            local mode_node = positional(args, 1)
            local lhs_node = positional(args, 2)
            local rhs_node = positional(args, 3)
            local opts = positional(args, 4)
            local desc_node = field_value(opts, bufnr, 'desc')
            add(line,
                mode_list(mode_node, bufnr),
                lhs_node and lhs_node:type() == 'string' and unquote(txt(lhs_node, bufnr)) or '?',
                render_rhs(rhs_node, bufnr),
                desc_node and desc_node:type() == 'string' and unquote(txt(desc_node, bufnr)) or '')
        elseif nm:match('[.:]map$') then
            local lhs_node = positional(args, 1)
            if lhs_node and lhs_node:type() == 'string' then
                local tbl_part = name_node:field('table')
                local full = (tbl_part and tbl_part[1])
                    and squash(txt(tbl_part[1], bufnr))
                    or squash(txt(node, bufnr))
                local dname = full:match('name%s*=%s*"([^"]+)"') or full:match("name%s*=%s*'([^']+)'")
                add(line, { 'n' }, unquote(txt(lhs_node, bufnr)),
                    'fn: ' .. full:sub(1, 52), dname and ('toggle: ' .. dname) or 'Snacks toggle')
            end
        end
    end

    local function handle_keys_field(node)
        local val = node:field('value')[1]
        if not val or val:type() ~= 'table_constructor' then
            return
        end
        for child in val:iter_children() do
            local entry_tbl
            if child:type() == 'field' then
                entry_tbl = child:field('value')[1]
            elseif child:type() == 'table_constructor' then
                entry_tbl = child
            end
            if entry_tbl and entry_tbl:type() == 'table_constructor' then
                local lhs_node = positional(entry_tbl, 1)
                if lhs_node and lhs_node:type() == 'string' then
                    local rhs_node = positional(entry_tbl, 2)
                    local desc_node = field_value(entry_tbl, bufnr, 'desc')
                    local mode_node = field_value(entry_tbl, bufnr, 'mode')
                    add(entry_tbl:start() + 1,
                        mode_list(mode_node, bufnr),
                        unquote(txt(lhs_node, bufnr)),
                        render_rhs(rhs_node, bufnr),
                        desc_node and desc_node:type() == 'string' and unquote(txt(desc_node, bufnr)) or '')
                end
            end
        end
    end

    local function walk(node)
        local t = node:type()
        if t == 'function_call' then
            handle_call(node)
        elseif t == 'field' then
            local nm = node:field('name')[1]
            if nm and txt(nm, bufnr) == 'keys' then
                handle_keys_field(node)
            elseif nm and txt(nm, bufnr) == 'mappings' then
                handle_mappings_field(node, file, add, bufnr)
            elseif nm and txt(nm, bufnr) == 'keymap' and relfile(file) == BLINK_SPEC then
                -- skip if nested inside the cmdline section (handled by the cmdline branch)
                local inside_cmdline = false
                local p = node:parent()
                while p do
                    if p:type() == 'field' then
                        local pn = p:field('name')[1]
                        if pn and txt(pn, bufnr) == 'cmdline' then
                            inside_cmdline = true
                            break
                        end
                    end
                    p = p:parent()
                end
                if not inside_cmdline then
                    local v = node:field('value')[1]
                    if v and v:type() == 'table_constructor' then
                        handle_blink_keymaps(v, bufnr, 'i', add, node:start() + 1)
                    end
                end
            elseif nm and txt(nm, bufnr) == 'cmdline' and relfile(file) == BLINK_SPEC then
                local v = node:field('value')[1]
                if v and v:type() == 'table_constructor' then
                    for c in v:iter_children() do
                        if c:type() == 'field' then
                            local cn = c:field('name')[1]
                            if cn and txt(cn, bufnr) == 'keymap' then
                                local cv = c:field('value')[1]
                                if cv and cv:type() == 'table_constructor' then
                                    handle_blink_keymaps(cv, bufnr, 'c', add, c:start() + 1)
                                end
                            end
                        end
                    end
                end
            end
        end
        for child in node:iter_children() do
            walk(child)
        end
    end

    walk(root)
end

-- collect
local files = {}
local root_dir = repo .. '/nvim/lua'
local function scan(dir)
    for name, type in vim.fs.dir(dir) do
        local p = dir .. '/' .. name
        if type == 'directory' then
            scan(p)
        elseif name:match('%.lua$') then
            files[#files + 1] = p
        end
    end
end
scan(root_dir)
table.sort(files)

local entries = {}
for _, f in ipairs(files) do
    pcall(extract_file, f, entries)
end

-- ======== conflict detection ========
-- key: lhs -> mode -> list of definitions {rhs, desc, file, line}
local by_lhs = {}
for _, e in ipairs(entries) do
    by_lhs[e.lhs] = by_lhs[e.lhs] or {}
    for _, m in ipairs(e.modes) do
        local k = m
        by_lhs[e.lhs][k] = by_lhs[e.lhs][k] or {}
        table.insert(by_lhs[e.lhs][k], e)
    end
end

local conflicts, benign = {}, 0
for lhs, modes in pairs(by_lhs) do
    for m, defs in pairs(modes) do
        if #defs > 1 then
            -- identical rhs+desc = benign duplicate; otherwise conflict
            local sigs = {}
            local uniq = {}
            for _, d in ipairs(defs) do
                local sig = d.rhs .. '||' .. d.desc
                if not sigs[sig] then
                    sigs[sig] = true
                    uniq[#uniq + 1] = d
                end
            end
            if #uniq > 1 then
                conflicts[#conflicts + 1] = { lhs = lhs, mode = m, defs = defs }
            else
                benign = benign + 1
            end
        end
    end
end

table.sort(conflicts, function(a, b)
    return a.lhs < b.lhs
end)

print('=== CONFLICTS (same lhs+mode, different action): ' .. #conflicts)
for _, c in ipairs(conflicts) do
    print(('%s [%s] defined %d times:'):format(c.lhs, c.mode, #c.defs))
    for _, d in ipairs(c.defs) do
        print(('   %-40s %s (%s:%d)'):format(d.desc, d.rhs:sub(1, 40), d.file:gsub('.*/nvim/', ''), d.line))
    end
end
print('benign duplicates (same action): ' .. benign)

-- ======== write KEYMAPS.md ========
table.sort(entries, function(a, b)
    if a.file ~= b.file then
        return a.file < b.file
    end
    return a.line < b.line
end)

local function code(s)
    s = (tostring(s or '')):gsub('\n', ' '):gsub('\r', '')
    if s:find('`', 1, true) then
        return '`` ' .. s .. ' ``'
    end
    return '`' .. s .. '`'
end
local function plain(s)
    return (tostring(s or '')):gsub('\n', ' '):gsub('|', '\\|')
end

local lines = {}
lines[#lines + 1] = '# 自定义快捷键总表'
lines[#lines + 1] = ''
lines[#lines + 1] = ('共 %d 条。treesitter 解析全部配置源码生成，覆盖 `vim.keymap.set`、leap 的 `map` 别名、lazy spec 的 `keys` 表、`Snacks.toggle:map`，以及 mini.snippets / mini.surround / mini.diff 在 opts `mappings` 表里的键和 blink.cmp 的 opts `keymap` 表（插入 + cmdline）。'):format(#entries)
lines[#lines + 1] = ''
lines[#lines + 1] = '> 说明：`lua/config/keymap.lua` 中 RHS 为 `vscode.call(...)` 的条目属于 vscode-neovim 分支，仅在 VSCode 内嵌 nvim 时生效；其余为普通 nvim 生效。重新生成：`nvim --headless -u NONE +"set noswapfile" +"luafile keymap_gen.lua"'
lines[#lines + 1] = ''
lines[#lines + 1] = '| # | LHS | Mode | RHS | Description | 文件:行 |'
lines[#lines + 1] = '|---|-----|------|-----|-------------|---------|'
for i, e in ipairs(entries) do
    lines[#lines + 1] = ('| %d | %s | %s | %s | %s | `%s:%d` |'):format(
        i, code(e.lhs), plain(table.concat(e.modes, '+')), code(e.rhs), plain(e.desc), relfile(e.file), e.line)
end

local out_path = repo .. '/KEYMAPS.md'
local fd = io.open(out_path, 'w')
fd:write(table.concat(lines, '\n'), '\n')
fd:close()
print('total entries: ' .. #entries)
print('written: ' .. out_path)
vim.cmd('qa!')
