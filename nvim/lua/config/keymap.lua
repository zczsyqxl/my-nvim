vim.keymap.set('i', '<c-s>', '<esc>gUiwea', { remap = false, desc = 'zz:UppercaseInputChars' })

vim.keymap.set('n', '\'', '`', { remap = false,desc='zz:exchange\'`'})
vim.keymap.set('n', '`', '\'', { remap = false,desc='zz:exchange\'`'})
vim.keymap.set('n', 'z;', '<cmd>w<cr>', { remap = false, desc='zz:WriteBuffer' })
vim.keymap.set({'n', 'o'}, '<space>', '$', { remap = false, desc='zz:GoToEndOfLine' })

vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y', {remap = false, desc='zz:YankToSysClipboard'})
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p', {remap = false, desc='zz:PasteFromSysClipboard'})
vim.keymap.set({'n', 'v', 'x'}, '<leader>P', '"+P', {remap = false, desc='zz:PasteFromSysClipboard'})
vim.keymap.set({'n', 'v', 'x'}, '<leader>]p', '"+]p', {remap = false, desc='zz:PasteFromSysClipboard'})
vim.keymap.set({'n', 'v', 'x'}, '<leader>[p', '"+[p', {remap = false, desc='zz:PasteFromSysClipboard'})
vim.keymap.set('n', '<backspace>', '<cmd>noh<cr>', {remap = false, silent = true, desc='zz:RemoveHighlight'})



if vim.g.vscode == nil then
    vim.keymap.set('n', '<leader>;', '<cmd>set wrap!<cr>', {remap = false, desc='zz:ToggleWrap'})
    vim.keymap.set('n', '<leader>\\e', '<cmd>vsplit $MYVIMRC<cr>', {remap = false, desc='zz:EditVimConfig'})
    vim.keymap.set('n', '<leader>\\s', '<cmd>source $MYVIMRC<cr>', {remap = false, desc='zz:SourceVimConfig'})
    vim.keymap.set('n', '<leader>\\S', '<cmd>exe "Lazy reload " . @l<cr>', {remap = false, silent=false, desc='zz:LazyReloadFromReg-l'})
    vim.keymap.set('n', 'gh', '<c-w>d', {remap = true, silent = true, desc='zz:ShowDiagnosticHover'})
    -- vim.keymap.set('n', '<leader>vm', '<cmd>botright split term://zsh<cr>i', {remap = false, silent = true, desc='zz:N.ToggleTerm'})

    vim.keymap.set({'i', 's'}, 'jk', '<esc>', { remap = false, desc = 'zz:escape' })
    vim.keymap.set('i', '<c-l>', '<c-x>', {remap = true, silent = true, desc='zz:Complete'})

    vim.keymap.set('t', '<C-q>', [[<c-\><c-n>]], {remap = false, desc='zz:TerminalEscape'})
    -- vim.keymap.set('t', 'jk', [[<c-\><c-n>]], {remap = false, desc='zz:TerminalEscape'})
    vim.keymap.set('t', '<C-y>', function()
        local char = vim.fn.nr2char(vim.fn.getchar())
        return '<C-\\><C-N>"' .. char .. 'pi'
    end, { expr = true, desc = "zz:Paste from register in terminal mode" })
    vim.keymap.set({'t', 'i'}, '<A-;>','<C-\\><C-n><C-w>h', {remap = false, silent = true, desc='zz:TI.GotoLeftWin' })
    vim.keymap.set({'t', 'i'}, '<A-/>','<C-\\><C-n><C-w>j', {remap = false, silent = true, desc='zz:TI.GotoDownWin' })
    vim.keymap.set({'t', 'i'}, '<A-[>','<C-\\><C-n><C-w>k', {remap = false, silent = true, desc='zz:TI.GotoUpWin'   })
    vim.keymap.set({'t', 'i'}, '<A-\'>','<C-\\><C-n><C-w>l', {remap = false, silent = true,desc='zz:TI.GotoRightWin'})
    vim.keymap.set('n', '<c-h>', '<c-w>h', { remap = false, desc='zz:N.GotoLeftWin' })
    vim.keymap.set('n', '<c-j>', '<c-w>j', { remap = false, desc='zz:N.GotoDownWin' })
    vim.keymap.set('n', '<c-k>', '<c-w>k', { remap = false, desc='zz:N.GotoUpWin'   })
    vim.keymap.set('n', '<c-l>', '<c-w>l', { remap = false, desc='zz:N.GotoRightWin'})
    vim.keymap.set('n', '<A-;>',  '<C-w>h', {remap = false, silent = true, desc='zz:N.GotoLeftWin' })
    vim.keymap.set('n', '<A-/>',  '<C-w>j', {remap = false, silent = true, desc='zz:N.GotoDownWin' })
    vim.keymap.set('n', '<A-[>',  '<C-w>k', {remap = false, silent = true, desc='zz:N.GotoUpWin'   })
    vim.keymap.set('n', '<A-\'>', '<C-w>l', {remap = false, silent = true, desc='zz:N.GotoRightWin'})
    vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>',                     {remap = false, silent = true, desc='zz:N.TabNew'})
    vim.keymap.set('n', '<leader>tj', '<cmd>tabnext<cr>',                    {remap = false, silent = true, desc='zz:N.TabNext'})
    vim.keymap.set('n', '<leader>tt', '<cmd>exe v:count1 . "tabnext"<cr>',   {remap = false, silent = true, desc='zz:N.TabNum'})
    vim.keymap.set('n', '<leader>tk', '<cmd>tabprevious<cr>',                {remap = false, silent = true, desc='zz:N.TabPre'})
    vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>',                   {remap = false, silent = true, desc='zz:N.TabClose'})
    vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>',                    {remap = false, silent = true, desc='zz:N.TabOnly'})
    vim.keymap.set('n', '<leader>q','<cmd>q<cr>', {remap = false, silent = true, desc='zz:Quit'})
    vim.keymap.set('n', '<leader>Q','<cmd>qa<cr>', {remap = false, silent = true, desc='zz:QuitAll'})
    vim.keymap.set('n', '<leader><tab>',function()
        vim.fn.system('start explorer /select,' .. vim.fn.fnamemodify(vim.fn.expand('%:p'), ':8'))
    end, {remap = false, silent = true, desc='zz:SystemOpen'})
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
    vim.keymap.set('n', '<leader>C', function() vscode.call('workbench.action.closeEditorsInGroup') end, {remap = false, silent = true})
    vim.keymap.set('n', '<leader>vl', function() vscode.call('lazygit.openLazygit') end, {remap = false, silent = true})
    -- Search
    vim.keymap.set('n', '<leader>f[', function() vscode.call('workbench.action.findInFiles') end, {remap = false, silent = true})

    -- Git

    vim.keymap.set('', ']c',         function() vscode.call('workbench.action.compareEditor.nextChange') end, {remap = false, silent = true})
    vim.keymap.set('', '[c',         function() vscode.call('workbench.action.compareEditor.previousChange') end, {remap = false, silent = true})
    vim.keymap.set('', ']g',         function() vscode.call('workbench.action.editor.nextChange') end, {remap = false, silent = true})
    vim.keymap.set('', '[g',         function() vscode.call('workbench.action.editor.previousChange') end, {remap = false, silent = true})
    vim.keymap.set('', '[d',         function() vscode.call('editor.action.marker.prev') end, {remap = false, silent = true})
    vim.keymap.set('', ']d',         function() vscode.call('editor.action.marker.next') end, {remap = false, silent = true})
    vim.keymap.set('', '[D',         function() vscode.call('editor.action.marker.prevInFiles') end, {remap = false, silent = true})
    vim.keymap.set('', ']D',         function() vscode.call('editor.action.marker.nextInFiles') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>do', function() vscode.call('git.revertSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>dp', function() vscode.call('git.stageSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>du', function() vscode.call('git.unstageSelectedRanges') end, {remap = false, silent = true})
    vim.keymap.set('', '<leader>v.', function()
        local ft = vim.bo.filetype
        if ft == 'markdown' then
            vscode.call('markdown-preview-enhanced.openPreviewToTheSide')
        elseif ft == 'plantuml' then
            vscode.call('plantuml.preview')
        end
    end, {remap = false, silent = true})
end

