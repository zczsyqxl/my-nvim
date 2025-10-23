vim.keymap.set('i', '<c-s>', '<esc>gUiwea', { remap = false, desc = 'escape' })

vim.keymap.set('n', '\'', '`', { remap = false })
vim.keymap.set('n', '`', '\'', { remap = false })
vim.keymap.set('n', 'z;', '<cmd>w<cr>', { remap = false })
vim.keymap.set('n', '<space>', '$', { remap = false })

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y', {remap = false})
vim.keymap.set('n', '<leader>p', '"+p', {remap = false})
vim.keymap.set('n', '<leader>p', '"+p', {remap = false})
vim.keymap.set('n', '<leader>]p', '"+]p', {remap = false})
vim.keymap.set('n', '<leader>[p', '"+[p', {remap = false})
vim.keymap.set('n', '<backspace>', '<cmd>noh<cr>', {remap = false, silent = true})



if vim.g.vscode == nil then
    vim.keymap.set('n', '<leader>;', '<cmd>set wrap!<cr>', {remap = false})
    vim.keymap.set('n', '<leader>gv', '<cmd>vsplit $myvimrc<cr>', {remap = false})
    vim.keymap.set('n', '<leader>gs', '<cmd>source $myvimrc<cr>', {remap = false})
    vim.keymap.set('n', 'gh', '<c-w>d', {remap = true, silent = true})
    -- vim.keymap.set('n', '<leader>vm', '<cmd>botright split term://zsh<cr>i', {remap = false, silent = true})

    vim.keymap.set('i', 'jk', '<esc>', { remap = false, desc = 'escape' })
    vim.keymap.set('i', '<c-l>', '<c-x>', {remap = true, silent = true})

    vim.keymap.set('t', '<A-q>', [[<c-\><c-n>]], {remap = false})
    -- vim.keymap.set('t', 'jk', [[<c-\><c-n>]], {remap = false})
    vim.keymap.set('t', '<C-R>', function()
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
    vim.keymap.set('n', '<leader>vd', function() vscode.call('outline.focus') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vh', function() vscode.call('timeline.focus') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>ve', function() vscode.call('workbench.action.focusActiveEditorGroup') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vn', function() vscode.call('workbench.action.toggleSidebarVisibility') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vm', function() vscode.call('workbench.action.togglePanel') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>.', function() vscode.call('workbench.action.navigateToLastEditLocation') end, {remap = false, silent = true})

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
    vim.keymap.set('', '<leader>do', function() vscode.action('git.revertSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>dp', function() vscode.call('git.stageSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>du', function() vscode.call('git.unstageSelectedRanges') end, {remap = false, silent = true})
end

