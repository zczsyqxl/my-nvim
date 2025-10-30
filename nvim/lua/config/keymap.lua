vim.keymap.set('i', '<c-s>', '<esc>gUiwea', { remap = false, desc = 'escape' })

vim.keymap.set('n', '\'', '`', { remap = false })
vim.keymap.set('n', '`', '\'', { remap = false })
vim.keymap.set('n', 'z;', '<cmd>w<cr>', { remap = false })
vim.keymap.set('n', '<space>', '$', { remap = false })

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y', {remap = false})
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', {remap = false})
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', {remap = false})
vim.keymap.set({'n', 'v', 'x'}, '<leader>]p', '"+]p', {remap = false})
vim.keymap.set({'n', 'v', 'x'}, '<leader>[p', '"+[p', {remap = false})
vim.keymap.set('n', '<backspace>', '<cmd>noh<cr>', {remap = false, silent = true})



if vim.g.vscode == nil then
    local echo_color = require('config.mylua.helper').echo_color
    vim.keymap.set('n', '<leader>;', '<cmd>set wrap!<cr>', {remap = false})
    vim.keymap.set('n', '<leader>\\e', '<cmd>vsplit $myvimrc<cr>', {remap = false})
    vim.keymap.set('n', '<leader>\\s', '<cmd>source $myvimrc<cr>', {remap = false})
    vim.keymap.set('n', '<leader>\\S', '<cmd>exe "Lazy reload " . @l<cr>', {remap = false, silent=false})
    vim.keymap.set('n', 'gh', '<c-w>d', {remap = true, silent = true})
    -- vim.keymap.set('n', '<leader>vm', '<cmd>botright split term://zsh<cr>i', {remap = false, silent = true})

    vim.keymap.set('i', 'jk', '<esc>', { remap = false, desc = 'escape' })
    vim.keymap.set('i', '<c-l>', '<c-x>', {remap = true, silent = true})

    vim.keymap.set('t', '<C-q>', [[<c-\><c-n>]], {remap = false})
    -- vim.keymap.set('t', 'jk', [[<c-\><c-n>]], {remap = false})
    vim.keymap.set('t', '<C-i>', function()
        local char = vim.fn.nr2char(vim.fn.getchar())
        return '<C-\\><C-N>"' .. char .. 'pi'
    end, { expr = true, desc = "Paste from register in terminal mode" })
    vim.keymap.set({'t', 'i'}, '<A-;>','<C-\\><C-n><C-w>h', {remap = false, silent = true})
    vim.keymap.set({'t', 'i'}, '<A-/>','<C-\\><C-n><C-w>j', {remap = false, silent = true})
    vim.keymap.set({'t', 'i'}, '<A-[>','<C-\\><C-n><C-w>k', {remap = false, silent = true})
    vim.keymap.set({'t', 'i'}, '<A-\'>','<C-\\><C-n><C-w>l', {remap = false, silent = true})
    vim.keymap.set('n', '<c-h>', '<c-w>h', { remap = false})
    vim.keymap.set('n', '<c-j>', '<c-w>j', { remap = false})
    vim.keymap.set('n', '<c-k>', '<c-w>k', { remap = false})
    vim.keymap.set('n', '<c-l>', '<c-w>l', { remap = false})
    vim.keymap.set('n', '<A-;>','<C-w>h', {remap = false, silent = true})
    vim.keymap.set('n', '<A-/>','<C-w>j', {remap = false, silent = true})
    vim.keymap.set('n', '<A-[>','<C-w>k', {remap = false, silent = true})
    vim.keymap.set('n', '<A-\'>','<C-w>l', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>en','<cmd>tabnew<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ej','<cmd>tabnext<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>et','<cmd>exe v:count1 . "tabnext"<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ek','<cmd>tabprevious<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ec','<cmd>tabclose<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>eo','<cmd>tabonly<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>eh','<cmd>exe "bprevious" . v:count1<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>el','<cmd>exe "bnext" . v:count1<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ee','<cmd>exe "b" . v:count1<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>q','<cmd>q<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader>Q','<cmd>qa<cr>', {remap = false, silent = true})
    vim.keymap.set('n', '<leader><tab>',function() vim.fn.system('start explorer /select,' .. vim.fn.fnamemodify(vim.fn.expand('%:p'), ':8')) end, {remap = false, silent = true})
		--   vim.keymap.set('n', 'z\'',function()
		--       vim.cmd('wa')
		--       vim.cmd('exe "mksession! " .. v:this_session')
		-- echo_color('WarningMsg','Session have been write to ' .. vim.v.this_session)
		--   end, {remap = false, silent = true})
    vim.keymap.set('n', 'z\'', function()
        vim.cmd('wa')

        vim.ui.input({
            prompt = 'Save session to: ',
            default = (vim.v.this_session ~='' and vim.v.this_session) or [[d:\workspace\nvim\Session.vim]],
            completion = 'file',
        }, function(path)
            if not path or path == '' then return end          -- 用户按了 <Esc> 或留空
            vim.cmd.mksession({args = {path}, bang = true})    -- 强制写入
            vim.api.nvim_echo({{'Session saved → ' .. path, 'WarningMsg'}}, false, {})
        end)
    end, { remap = false, silent = true })

    package.loaded["config.mylua.exkeymap"] = nil
    require('config.mylua.exkeymap')
else
    local vscode = require('vscode')

    -- Editor
    -- vim.keymap.set('n', 'za', '<cmd>lua require("vscode").call("editor.toggleFold")<cr>', {remap = false})
    vim.keymap.set('n', 'za', function() vscode.call('editor.toggleFold') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zA', function() vscode.call('diffEditor.toggleCollapseUnchangedRegions') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zo', function() vscode.call('editor.unfold') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zc', function() vscode.call('editor.fold') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zO', function() vscode.call('editor.unfoldRecursively') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zC', function() vscode.call('editor.foldRecursively') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zM', function() vscode.call('editor.foldAll') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zR', function() vscode.call('editor.unfoldAll') end, {remap = false, silent = true})
    vim.keymap.set('n', 'zR', function() vscode.call('editor.unfoldAll') end, {remap = false, silent = true})

    -- view 
    vim.keymap.set('n', '<leader>;', function() vscode.call('editor.action.toggleWordWrap') end, {remap = false, silent = true})

    vim.keymap.set('n', '<leader>vf', function() vscode.call('workbench.files.action.showActiveFileInExplorer') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vo', function() vscode.call('outline.focus') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vh', function() vscode.call('timeline.focus') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ve', function() vscode.call('workbench.action.focusActiveEditorGroup') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vn', function() vscode.call('workbench.action.toggleSidebarVisibility') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vm', function() vscode.call('workbench.action.togglePanel') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>.', function() vscode.call('workbench.action.navigateToLastEditLocation') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>q', function() vscode.call('workbench.action.closeActiveEditor') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>Q', function() vscode.call('workbench.action.closeAllEditors') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ec', function() vscode.call('workbench.action.closeEditorsInGroup') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vl', function() vscode.call('lazygit.openLazygit') end, {remap = false, silent = true})
    -- Search
    vim.keymap.set('n', '<leader>[', function() vscode.call('workbench.action.findInFiles') end, {remap = false, silent = true})

    -- Git

    vim.keymap.set('', ']c',         function() vscode.call('workbench.action.compareEditor.nextChange') end, {remap = false, silent = true})
    vim.keymap.set('', '[c',         function() vscode.call('workbench.action.compareEditor.previousChange') end, {remap = false, silent = true})
    vim.keymap.set('', ']a',         function() vscode.call('workbench.action.editor.nextChange') end, {remap = false, silent = true})
    vim.keymap.set('', '[a',         function() vscode.call('workbench.action.editor.previousChange') end, {remap = false, silent = true})
    vim.keymap.set('', '[e',         function() vscode.call('editor.action.marker.prev') end, {remap = false, silent = true})
    vim.keymap.set('', ']e',         function() vscode.call('editor.action.marker.next') end, {remap = false, silent = true})
    vim.keymap.set('', '[g',         function() vscode.call('editor.action.marker.prevInFiles') end, {remap = false, silent = true})
    vim.keymap.set('', ']g',         function() vscode.call('editor.action.marker.nextInFiles') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>do', function() vscode.call('git.revertSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>dp', function() vscode.call('git.stageSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>du', function() vscode.call('git.unstageSelectedRanges') end, {remap = false, silent = true})
end

