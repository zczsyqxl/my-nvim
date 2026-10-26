# 自定义快捷键总表

共 305 条。treesitter 解析全部配置源码生成，覆盖 `vim.keymap.set`、leap 的 `map` 别名、lazy spec 的 `keys` 表、`Snacks.toggle:map`，以及 mini.snippets / mini.surround / mini.diff 在 opts `mappings` 表里的键。

> 说明：`lua/config/keymap.lua` 中 RHS 为 `vscode.call(...)` 的条目属于 vscode-neovim 分支，仅在 VSCode 内嵌 nvim 时生效；其余为普通 nvim 生效。

| # | LHS | Mode | RHS | Description | 文件:行 |
|---|-----|------|-----|-------------|---------|
| 1 | `<c-s>` | i | `<esc>gUiwea` | zz:UppercaseInputChars | `lua/config/keymap.lua:1` |
| 2 | `'` | n | `` ` `` | zz:exchange'` | `lua/config/keymap.lua:3` |
| 3 | `` ` `` | n | `'` | zz:exchange'` | `lua/config/keymap.lua:4` |
| 4 | `z;` | n | `<cmd>w<cr>` | zz:WriteBuffer | `lua/config/keymap.lua:5` |
| 5 | `<space>` | n+o+x | `$` | zz:GoToEndOfLine | `lua/config/keymap.lua:6` |
| 6 | `<leader>y` | n+v+x | `"+y` | zz:YankToSysClipboard | `lua/config/keymap.lua:8` |
| 7 | `<leader>p` | n+v+x | `"+p` | zz:PasteFromSysClipboard | `lua/config/keymap.lua:9` |
| 8 | `<leader>P` | n+v+x | `"+P` | zz:PasteFromSysClipboard | `lua/config/keymap.lua:10` |
| 9 | `<leader>]p` | n+v+x | `"+]p` | zz:PasteFromSysClipboard | `lua/config/keymap.lua:11` |
| 10 | `<leader>[p` | n+v+x | `"+[p` | zz:PasteFromSysClipboard | `lua/config/keymap.lua:12` |
| 11 | `<backspace>` | n | `<cmd>noh<cr>` | zz:RemoveHighlight | `lua/config/keymap.lua:13` |
| 12 | `<leader>\\e` | n | `<cmd>vsplit $MYVIMRC<cr>` | zz:EditVimConfig | `lua/config/keymap.lua:16` |
| 13 | `<leader>\\s` | n | `<cmd>source $MYVIMRC<cr>` | zz:SourceVimConfig | `lua/config/keymap.lua:17` |
| 14 | `<leader>\\S` | n | `<cmd>exe "Lazy reload " . @l<cr>` | zz:LazyReloadFromReg-l | `lua/config/keymap.lua:18` |
| 15 | `gh` | n | `<c-w>d` | zz:ShowDiagnosticHover | `lua/config/keymap.lua:19` |
| 16 | `jk` | i+s | `<esc>` | zz:escape | `lua/config/keymap.lua:22` |
| 17 | `<c-l>` | i | `<c-x>` | zz:Complete | `lua/config/keymap.lua:23` |
| 18 | `<C-q>` | t | `[[<c-\><c-n>]]` | zz:TerminalEscape | `lua/config/keymap.lua:25` |
| 19 | `<esc><esc>` | t | `[[<c-\><c-n>]]` | zz:TerminalEscape | `lua/config/keymap.lua:26` |
| 20 | `<C-y>` | t | `fn: vim.fn.getcharstr()` | zz:Paste from register in terminal mode | `lua/config/keymap.lua:28` |
| 21 | `<c-h>` | n | `<c-w>h` | zz:N.GotoLeftWin | `lua/config/keymap.lua:35` |
| 22 | `<c-j>` | n | `<c-w>j` | zz:N.GotoDownWin | `lua/config/keymap.lua:36` |
| 23 | `<c-k>` | n | `<c-w>k` | zz:N.GotoUpWin | `lua/config/keymap.lua:37` |
| 24 | `<c-l>` | n | `<c-w>l` | zz:N.GotoRightWin | `lua/config/keymap.lua:38` |
| 25 | `<leader>tn` | n | `<cmd>tabnew<cr>` | zz:N.TabNew | `lua/config/keymap.lua:39` |
| 26 | `<leader>tj` | n | `<cmd>tabnext<cr>` | zz:N.TabNext | `lua/config/keymap.lua:40` |
| 27 | `<leader>tt` | n | `<cmd>exe v:count1 . "tabnext"<cr>` | zz:N.TabNum | `lua/config/keymap.lua:41` |
| 28 | `<leader>tk` | n | `<cmd>tabprevious<cr>` | zz:N.TabPre | `lua/config/keymap.lua:42` |
| 29 | `<leader>tc` | n | `<cmd>tabclose<cr>` | zz:N.TabClose | `lua/config/keymap.lua:43` |
| 30 | `<leader>ts` | n | `<cmd>tabonly<cr>` | zz:N.TabOnly | `lua/config/keymap.lua:44` |
| 31 | `<leader>q` | n | `<cmd>q<cr>` | zz:Quit | `lua/config/keymap.lua:45` |
| 32 | `<leader>Q` | n | `<cmd>qa<cr>` | zz:QuitAll | `lua/config/keymap.lua:46` |
| 33 | `<leader><tab>` | n | `fn: vim.fn.expand('%:p')` | zz:SystemOpen | `lua/config/keymap.lua:48` |
| 34 | `za` | n | `fn: vscode.call('editor.toggleFold')` |  | `lua/config/keymap.lua:64` |
| 35 | `zA` | n | `fn: vscode.call('diffEditor.toggleCollapseUnchangedRegions')` |  | `lua/config/keymap.lua:67` |
| 36 | `zo` | n | `fn: vscode.call('editor.unfold')` |  | `lua/config/keymap.lua:70` |
| 37 | `zc` | n | `fn: vscode.call('editor.fold')` |  | `lua/config/keymap.lua:73` |
| 38 | `zO` | n | `fn: vscode.call('editor.unfoldRecursively')` |  | `lua/config/keymap.lua:76` |
| 39 | `zC` | n | `fn: vscode.call('editor.foldRecursively')` |  | `lua/config/keymap.lua:79` |
| 40 | `zM` | n | `fn: vscode.call('editor.foldAll')` |  | `lua/config/keymap.lua:82` |
| 41 | `zR` | n | `fn: vscode.call('editor.unfoldAll')` |  | `lua/config/keymap.lua:85` |
| 42 | `<leader>;` | n | `fn: vscode.call('editor.action.toggleWordWrap')` |  | `lua/config/keymap.lua:90` |
| 43 | `<leader>vf` | n | `fn: vscode.call('workbench.files.action.showActiveFileInExplorer` |  | `lua/config/keymap.lua:94` |
| 44 | `<leader>vo` | n | `fn: vscode.call('outline.focus')` |  | `lua/config/keymap.lua:97` |
| 45 | `<leader>vh` | n | `fn: vscode.call('timeline.focus')` |  | `lua/config/keymap.lua:100` |
| 46 | `<leader>ve` | n | `fn: vscode.call('workbench.action.focusActiveEditorGroup')` |  | `lua/config/keymap.lua:103` |
| 47 | `<leader>vn` | n | `fn: vscode.call('workbench.action.toggleSidebarVisibility')` |  | `lua/config/keymap.lua:106` |
| 48 | `<leader>vm` | n | `fn: vscode.call('workbench.action.togglePanel')` |  | `lua/config/keymap.lua:109` |
| 49 | `<leader>.` | n | `fn: vscode.call('workbench.action.navigateToLastEditLocation')` |  | `lua/config/keymap.lua:112` |
| 50 | `<leader>q` | n | `fn: vscode.call('workbench.action.closeActiveEditor')` |  | `lua/config/keymap.lua:115` |
| 51 | `<leader>Q` | n | `fn: vscode.call('workbench.action.closeAllEditors')` |  | `lua/config/keymap.lua:118` |
| 52 | `<leader>C` | n | `fn: vscode.call('workbench.action.closeEditorsInGroup')` |  | `lua/config/keymap.lua:121` |
| 53 | `<leader>vu` | n | `fn: vscode.call('lazygit.openLazygit')` |  | `lua/config/keymap.lua:124` |
| 54 | `<leader>f[` | n | `fn: vscode.call('workbench.action.findInFiles')` |  | `lua/config/keymap.lua:128` |
| 55 | `]a` |  | `fn: vscode.call('gitlens.annotations.nextChange')` |  | `lua/config/keymap.lua:134` |
| 56 | `[a` |  | `fn: vscode.call('gitlens.annotations.previousChange')` |  | `lua/config/keymap.lua:137` |
| 57 | `]c` |  | `fn: vscode.call('workbench.action.compareEditor.nextChange')` |  | `lua/config/keymap.lua:140` |
| 58 | `[c` |  | `fn: vscode.call('workbench.action.compareEditor.previousChange')` |  | `lua/config/keymap.lua:143` |
| 59 | `]f` |  | `fn: vscode.call('merge-conflict.next')` |  | `lua/config/keymap.lua:146` |
| 60 | `[f` |  | `fn: vscode.call('merge-conflict.previous')` |  | `lua/config/keymap.lua:149` |
| 61 | `]e` |  | `fn: vscode.call('merge.goToNextUnhandledConflict')` |  | `lua/config/keymap.lua:152` |
| 62 | `[e` |  | `fn: vscode.call('merge.goToPreviousUnhandledConflict')` |  | `lua/config/keymap.lua:155` |
| 63 | `]g` |  | `fn: vscode.call('workbench.action.editor.nextChange')` |  | `lua/config/keymap.lua:158` |
| 64 | `[g` |  | `fn: vscode.call('workbench.action.editor.previousChange')` |  | `lua/config/keymap.lua:161` |
| 65 | `[d` |  | `fn: vscode.call('editor.action.marker.prev')` |  | `lua/config/keymap.lua:164` |
| 66 | `]d` |  | `fn: vscode.call('editor.action.marker.next')` |  | `lua/config/keymap.lua:167` |
| 67 | `[D` |  | `fn: vscode.call('editor.action.marker.prevInFiles')` |  | `lua/config/keymap.lua:170` |
| 68 | `]D` |  | `fn: vscode.call('editor.action.marker.nextInFiles')` |  | `lua/config/keymap.lua:173` |
| 69 | `<leader>do` |  | `fn: vscode.call('git.revertSelectedRanges')` |  | `lua/config/keymap.lua:176` |
| 70 | `<leader>dp` |  | `fn: vscode.call('git.stageSelectedRanges')` |  | `lua/config/keymap.lua:179` |
| 71 | `<leader>du` |  | `fn: vscode.call('git.unstageSelectedRanges')` |  | `lua/config/keymap.lua:182` |
| 72 | `<leader>v.` |  | `fn: vscode.call('markdown-preview-enhanced.openPreviewToTheSide'` |  | `lua/config/keymap.lua:185` |
| 73 | `s` | n+v+o | `fn: require('flash').jump()` | zz:Flash:Jump | `lua/plugins/jump/engines/flash.lua:22` |
| 74 | `S` | n+v+o | `fn: require('flash').jump()` | zz:Flash:Jump | `lua/plugins/jump/engines/flash.lua:30` |
| 75 | `,w` | n+v+o | `fn: require('flash').jump({ search = { mode = function(pat) retu` | zz:Flash:words.after | `lua/plugins/jump/engines/flash.lua:38` |
| 76 | `,l` | n+v+o | `fn: require('flash').jump({ pattern = [[^.]], search = { mode = ` | zz:Flash:lines.after | `lua/plugins/jump/engines/flash.lua:50` |
| 77 | `,r` | o | `fn: require('flash').remote()` | zz:Flash:Remote (operator) | `lua/plugins/jump/engines/flash.lua:60` |
| 78 | `<leader>w` | n+v+o | `fn: require('hop').hint_words({})` | zz:hop:hint_words.after | `lua/plugins/jump/engines/hop.lua:13` |
| 79 | `<leader>l` | n+v+o | `fn: require('hop').hint_lines({})` | zz:hop:hint_lines.after | `lua/plugins/jump/engines/hop.lua:33` |
| 80 | `<leader>L` | n+v+o | `fn: require('hop').hint_vertical({})` | zz:hop:hint_vertical.after | `lua/plugins/jump/engines/hop.lua:53` |
| 81 | `<leader>s` | n+v+o | `fn: require('hop').hint_char1({})` | zz:hop:hint_char1 | `lua/plugins/jump/engines/hop.lua:73` |
| 82 | `<leader>S` | n+v+o | `fn: require('hop').hint_patterns({})` | zz:hop:hint_patterns | `lua/plugins/jump/engines/hop.lua:86` |
| 83 | `s` | n+v | `<Plug>(leap)` | zz:Leap:Jump | `lua/plugins/jump/engines/leap.lua:85` |
| 84 | `S` | n+v | `fn: vim.api.nvim_get_current_win()` | zz:Leap:AllWindows+Picker | `lua/plugins/jump/engines/leap.lua:92` |
| 85 | `,x` | n+v | `<Plug>(leap-forward)` | zz:Leap:fwd | `lua/plugins/jump/engines/leap.lua:110` |
| 86 | `,X` | n+v | `<Plug>(leap-backward)` | zz:Leap:bwd | `lua/plugins/jump/engines/leap.lua:111` |
| 87 | `z` | o | `<Plug>(leap-forward-next-to)` | zz:Leap:fwd-excl | `lua/plugins/jump/engines/leap.lua:116` |
| 88 | `x` | o | `<Plug>(leap-forward)` | zz:Leap:fwd-incl | `lua/plugins/jump/engines/leap.lua:117` |
| 89 | `X` | o | `<Plug>(leap-backward-next-to)` | zz:Leap:bwd-incl | `lua/plugins/jump/engines/leap.lua:118` |
| 90 | `Z` | o | `<Plug>(leap-backward)` | zz:Leap:bwd-excl | `lua/plugins/jump/engines/leap.lua:119` |
| 91 | `gk` | n+v+o | `<Plug>(leap-visit)` | zz:Leap:Visit | `lua/plugins/jump/engines/leap.lua:122` |
| 92 | `<leader>mc` | n | `<cmd>LLMSessionToggle<cr>` | zz:LLM:Toggle LLM Chat | `lua/plugins/llm/init.lua:82` |
| 93 | `<leader>mt` | x+n | `<cmd>LLMAppHandler WordTranslate<cr>` | zz:LLM:Word Translate | `lua/plugins/llm/init.lua:83` |
| 94 | `<leader>me` | n+v | `<cmd>LLMAppHandler CodeExplain<cr>` | zz:LLM:Explain the Code | `lua/plugins/llm/init.lua:84` |
| 95 | `<leader>mT` | n | `<cmd>LLMAppHandler Translate<cr>` | zz:LLM:AI Translator | `lua/plugins/llm/init.lua:85` |
| 96 | `<leader>mA` | x | `<cmd>LLMAppHandler TestCode<cr>` | zz:LLM:Generate Test Cases | `lua/plugins/llm/init.lua:86` |
| 97 | `<leader>mo` | x | `<cmd>LLMAppHandler OptimCompare<cr>` | zz:LLM:Optimize the Code | `lua/plugins/llm/init.lua:87` |
| 98 | `<leader>mu` | n | `<cmd>LLMAppHandler UserInfo<cr>` | zz:LLM:Check Account Information | `lua/plugins/llm/init.lua:88` |
| 99 | `<leader>mg` | n | `<cmd>LLMAppHandler CommitMsg<cr>` | zz:LLM:Generate AI Commit Message | `lua/plugins/llm/init.lua:89` |
| 100 | `<leader>md` | v | `<cmd>LLMAppHandler DocString<cr>` | zz:LLM:Generate a Docstring | `lua/plugins/llm/init.lua:90` |
| 101 | `<leader>mk` | v+n | `<cmd>LLMAppHandler Ask<cr>` | zz:LLM:Ask LLM | `lua/plugins/llm/init.lua:91` |
| 102 | `<leader>ma` | v+n | `<cmd>LLMAppHandler AttachToChat<cr>` | zz:LLM:Ask LLM (multi-turn) | `lua/plugins/llm/init.lua:92` |
| 103 | `<leader>mi` | v+n | `<cmd>LLMAppHandler FormulaRecognition<cr>` | zz:LLM:formula recognition | `lua/plugins/llm/init.lua:94` |
| 104 | `]g` | n | `opts: mini.diff` | zz:mini.diff:Goto next hunk | `lua/plugins/mini/diff.lua:2` |
| 105 | `]G` | n | `opts: mini.diff` | zz:mini.diff:Goto last hunk | `lua/plugins/mini/diff.lua:2` |
| 106 | `[g` | n | `opts: mini.diff` | zz:mini.diff:Goto prev hunk | `lua/plugins/mini/diff.lua:2` |
| 107 | `[G` | n | `opts: mini.diff` | zz:mini.diff:Goto first hunk | `lua/plugins/mini/diff.lua:2` |
| 108 | `gY` | n+x | `opts: mini.diff` | zz:mini.diff:Reset hunks | `lua/plugins/mini/diff.lua:2` |
| 109 | `gy` | n+x | `opts: mini.diff` | zz:mini.diff:Apply hunks | `lua/plugins/mini/diff.lua:2` |
| 110 | `gy` | o | `opts: mini.diff` | zz:mini.diff:TextObject | `lua/plugins/mini/diff.lua:2` |
| 111 | `gxc` | n | `<c-c>` | zz:mini.operators:CancelPendingExchange | `lua/plugins/mini/operators.lua:2` |
| 112 | `z'` | n | `fn: vim.cmd('wa')` | zz:mini.sessions:WriteSession | `lua/plugins/mini/sessions.lua:27` |
| 113 | `<C-c>` | i | `opts: mini.snippets` | zz:MiniSnippets:stop (session) | `lua/plugins/mini/snippet.lua:12` |
| 114 | `<C-h>` | i | `opts: mini.snippets` | zz:MiniSnippets:jump prev | `lua/plugins/mini/snippet.lua:12` |
| 115 | `<C-l>` | i | `opts: mini.snippets` | zz:MiniSnippets:jump next | `lua/plugins/mini/snippet.lua:12` |
| 116 | `<C-]>` | i | `opts: mini.snippets` | zz:MiniSnippets:expand (insert) | `lua/plugins/mini/snippet.lua:12` |
| 117 | `<C-c>` | n | `fn: require('mini.snippets')` | zz:MiniSnippets:stop session (normal) | `lua/plugins/mini/snippet.lua:29` |
| 118 | `Sh` | n+x | `opts: mini.surround` | zz:mini.surround:Highlight | `lua/plugins/mini/surround.lua:4` |
| 119 | `cs` | n+x | `opts: mini.surround` | zz:mini.surround:Replace | `lua/plugins/mini/surround.lua:4` |
| 120 | `SF` | n+x | `opts: mini.surround` | zz:mini.surround:FindLeft | `lua/plugins/mini/surround.lua:4` |
| 121 | `Sn` | n | `opts: mini.surround` | zz:mini.surround:UpdateNLines | `lua/plugins/mini/surround.lua:4` |
| 122 | `ds` | n+x | `opts: mini.surround` | zz:mini.surround:Delete | `lua/plugins/mini/surround.lua:4` |
| 123 | `ys` | n+x | `opts: mini.surround` | zz:mini.surround:Add | `lua/plugins/mini/surround.lua:4` |
| 124 | `Sf` | n+x | `opts: mini.surround` | zz:mini.surround:Find | `lua/plugins/mini/surround.lua:4` |
| 125 | `yss` | n | `ys_` | zz:mini.surround:AddLineSurround | `lua/plugins/mini/surround.lua:43` |
| 126 | `S` | x | `[[:<C-u>lua MiniSurround.add('visual')<CR>]]` | zz:mini.surround:AddVisSurround | `lua/plugins/mini/surround.lua:45` |
| 127 | `]e` | n | `fn: require("obsidian.actions").nav_link("next", false)` | zz:obsidian:next_link | `lua/plugins/note/obsidian.lua:69` |
| 128 | `[e` | n | `fn: require("obsidian.actions").nav_link("prev", false)` | zz:obsidian:prev_link | `lua/plugins/note/obsidian.lua:72` |
| 129 | `<leader>ob` | n | `<cmd>Obsidian backlinks<cr>` | zz:obsidian:backlinks | `lua/plugins/note/obsidian.lua:75` |
| 130 | `<leader>of` | n | `<cmd>Obsidian footnotes<cr>` | zz:obsidian:footnotes | `lua/plugins/note/obsidian.lua:76` |
| 131 | `<leader>oF` | n | `<cmd>Obsidian follow_link<cr>` | zz:obsidian:follow_link | `lua/plugins/note/obsidian.lua:77` |
| 132 | `<leader>ol` | n | `<cmd>Obsidian links<cr>` | zz:obsidian:links | `lua/plugins/note/obsidian.lua:78` |
| 133 | `<leader>op` | n | `<cmd>Obsidian paste_img<cr>` | zz:obsidian:paste_img | `lua/plugins/note/obsidian.lua:79` |
| 134 | `<leader>or` | n | `<cmd>Obsidian rename<cr>` | zz:obsidian:rename | `lua/plugins/note/obsidian.lua:80` |
| 135 | `<leader>ot` | n | `<cmd>Obsidian toc<cr>` | zz:obsidian:toc | `lua/plugins/note/obsidian.lua:81` |
| 136 | `<leader>oT` | n | `<cmd>Obsidian template<cr>` | zz:obsidian:template | `lua/plugins/note/obsidian.lua:82` |
| 137 | `<leader>oc` | n | `<cmd>Obsidian check<cr>` | zz:obsidian:check | `lua/plugins/note/obsidian.lua:87` |
| 138 | `<leader>odl` | n | `<cmd>Obsidian dailies<cr>` | zz:obsidian:dailies | `lua/plugins/note/obsidian.lua:88` |
| 139 | `<leader>odt` | n | `<cmd>Obsidian today<cr>` | zz:obsidian:today | `lua/plugins/note/obsidian.lua:89` |
| 140 | `<leader>odm` | n | `<cmd>Obsidian tomorrow<cr>` | zz:obsidian:tomorrow | `lua/plugins/note/obsidian.lua:90` |
| 141 | `<leader>ody` | n | `<cmd>Obsidian yesterday<cr>` | zz:obsidian:yesterday | `lua/plugins/note/obsidian.lua:91` |
| 142 | `<leader>ov` | n | `<cmd>Obsidian<cr>` | zz:obsidian:obsidian | `lua/plugins/note/obsidian.lua:92` |
| 143 | `<leader>oh` | n | `<cmd>Obsidian help<cr>` | zz:obsidian:help | `lua/plugins/note/obsidian.lua:93` |
| 144 | `<leader>oH` | n | `<cmd>Obsidian helpgrep<cr>` | zz:obsidian:helpgrep | `lua/plugins/note/obsidian.lua:94` |
| 145 | `<leader>om` | n | `<cmd>Obsidian bookmarks<cr>` | zz:obsidian:bookmarks | `lua/plugins/note/obsidian.lua:95` |
| 146 | `<leader>on` | n | `<cmd>Obsidian new<cr>` | zz:obsidian:new | `lua/plugins/note/obsidian.lua:96` |
| 147 | `<leader>oN` | n | `<cmd>Obsidian new_from_template<cr>` | zz:obsidian:new_from_template | `lua/plugins/note/obsidian.lua:97` |
| 148 | `<leader>oo` | n | `<cmd>Obsidian open<cr>` | zz:obsidian:open | `lua/plugins/note/obsidian.lua:98` |
| 149 | `<leader>oq` | n | `<cmd>Obsidian quick_switch<cr>` | zz:obsidian:quick_switch | `lua/plugins/note/obsidian.lua:99` |
| 150 | `<leader>oR` | n | `<cmd>Obsidian rebuild_cache<cr>` | zz:obsidian:rebuild_cache | `lua/plugins/note/obsidian.lua:100` |
| 151 | `<leader>os` | n | `<cmd>Obsidian search<cr>` | zz:obsidian:search | `lua/plugins/note/obsidian.lua:101` |
| 152 | `<leader>og` | n | `<cmd>Obsidian tags<cr>` | zz:obsidian:tags | `lua/plugins/note/obsidian.lua:102` |
| 153 | `<leader>ou` | n | `<cmd>Obsidian unique_note<cr>` | zz:obsidian:unique_note | `lua/plugins/note/obsidian.lua:103` |
| 154 | `<leader>ow` | n | `<cmd>Obsidian workspace<cr>` | zz:obsidian:workspace | `lua/plugins/note/obsidian.lua:104` |
| 155 | `<leader>vo` | n | `<cmd>AerialToggle!<cr>` | zz:aerial:Toggle | `lua/plugins/nvim/aerial.lua:5` |
| 156 | `{` | n | `<cmd>AerialPrev<cr>` | zz:aerial:Prev | `lua/plugins/nvim/aerial.lua:41` |
| 157 | `}` | n | `<cmd>AerialNext<cr>` | zz:aerial:Next | `lua/plugins/nvim/aerial.lua:42` |
| 158 | `<leader>cb` | n | `<cmd>CMakeBuild<cr>` | zz:cmake:Build | `lua/plugins/nvim/cmake.lua:42` |
| 159 | `<leader>cB` | n | `<cmd>CMakeBuildCurrentFile<cr>` | zz:cmake:BuildCurFile | `lua/plugins/nvim/cmake.lua:43` |
| 160 | `<leader>cc` | n | `<cmd>CMakeClean<cr>` | zz:cmake:Clean | `lua/plugins/nvim/cmake.lua:44` |
| 161 | `<leader>cg` | n | `<cmd>CMakeGenerate<cr>` | zz:cmake:Generate | `lua/plugins/nvim/cmake.lua:45` |
| 162 | `<leader>cr` | n | `<cmd>CMakeRun<cr>` | zz:cmake:Run | `lua/plugins/nvim/cmake.lua:46` |
| 163 | `<leader>cR` | n | `<cmd>CMakeRunCurrentFile<cr>` | zz:cmake:RunCurFile | `lua/plugins/nvim/cmake.lua:47` |
| 164 | `<leader>csc` | n | `<cmd>CMakeSelectConfigurePreset<cr>` | zz:cmake:SelectConPreset | `lua/plugins/nvim/cmake.lua:48` |
| 165 | `<leader>csd` | n | `<cmd>CMakeSelectBuildDir<cr>` | zz:cmake:SelectBuildDir | `lua/plugins/nvim/cmake.lua:49` |
| 166 | `<leader>cst` | n | `<cmd>CMakeSelectBuildTarget<cr>` | zz:cmake:SelectBuildTarget | `lua/plugins/nvim/cmake.lua:50` |
| 167 | `<leader>csp` | n | `<cmd>CMakeSelectBuildType<cr>` | zz:cmake:SelectBuildType | `lua/plugins/nvim/cmake.lua:51` |
| 168 | `<leader>csb` | n | `<cmd>CMakeSelectBuildPreset<cr>` | zz:cmake:SelectBuildPreset | `lua/plugins/nvim/cmake.lua:52` |
| 169 | `<leader>csw` | n | `<cmd>CMakeSelectCwd<cr>` | zz:cmake:SelectCWD | `lua/plugins/nvim/cmake.lua:53` |
| 170 | `<leader>csk` | n | `<cmd>CMakeSelectKit<cr>` | zz:cmake:SelectKit | `lua/plugins/nvim/cmake.lua:54` |
| 171 | `<leader>csl` | n | `<cmd>CMakeSelectLaunchTarget<cr>` | zz:cmake:SelectLaunchTarget | `lua/plugins/nvim/cmake.lua:55` |
| 172 | `<leader>nn` | n | `<cmd>CodeCompanion<cr>` | zz:CC:Chat | `lua/plugins/nvim/codecompanion.lua:76` |
| 173 | `<leader>na` | n | `<cmd>CodeCompanionAction<cr>` | zz:CC:Action | `lua/plugins/nvim/codecompanion.lua:77` |
| 174 | `<leader>nc` | n | `<cmd>CodeCompanionChat Toggle<cr>` | zz:CC:Chat Toggle | `lua/plugins/nvim/codecompanion.lua:78` |
| 175 | `<leader>ni` | n | `<cmd>CodeCompanionCLI<cr>` | zz:CC:CLI | `lua/plugins/nvim/codecompanion.lua:79` |
| 176 | `<leader>nw` | n | `<cmd>CodeCompanionCmd<cr>` | zz:CC:Cmd | `lua/plugins/nvim/codecompanion.lua:80` |
| 177 | `<leader>do` | n | `<cmd>DiffviewOpen<cr>` | zz:diffview:Open | `lua/plugins/nvim/diffview.lua:7` |
| 178 | `<leader>dc` | n | `<cmd>DiffviewClose<cr>` | zz:diffview:Close | `lua/plugins/nvim/diffview.lua:8` |
| 179 | `<leader>dr` | n | `<cmd>DiffviewRefresh<cr>` | zz:diffview:Refresh | `lua/plugins/nvim/diffview.lua:9` |
| 180 | `<leader>dh` | n | `<cmd>DiffviewFileHistory %<cr>` | zz:diffview:fileHistory | `lua/plugins/nvim/diffview.lua:10` |
| 181 | `<leader>dh` | x | `:'<,'>DiffviewFileHistory %<cr>` | zz:diffview:fileHistory[range] | `lua/plugins/nvim/diffview.lua:11` |
| 182 | `<leader>rw` | n+v | `fn: require('grug-far').open({ prefills = { search = vim.fn.expa` | zz:grugfar:SearchCWordInCurFile | `lua/plugins/nvim/grugFar.lua:6` |
| 183 | `<leader>rW` | n+v | `fn: require('grug-far').open({ prefills = { search = vim.fn.expa` | zz:grugfar:SearchCWordInCWD | `lua/plugins/nvim/grugFar.lua:16` |
| 184 | `<leader>rg` | n | `fn: require('grug-far').open({ prefills = { paths = vim.fn.expan` | zz:grugfar:SearchInCurFile | `lua/plugins/nvim/grugFar.lua:26` |
| 185 | `<leader>rG` | n | `fn: require('grug-far').open({})` | zz:grugfar:SearchInCWD | `lua/plugins/nvim/grugFar.lua:35` |
| 186 | `<F4>` | n | `<cmd>CMakeDebug<cr>` | zz:DAP:CmakeDebug | `lua/plugins/nvim/lspDap.lua:29` |
| 187 | `<F5>` | n | `<cmd>DapNew<cr>` | zz:DAP:New | `lua/plugins/nvim/lspDap.lua:30` |
| 188 | `<F6>` | n | `<cmd>DapPause<cr>` | zz:DAP:Pause | `lua/plugins/nvim/lspDap.lua:31` |
| 189 | `<F7>` | n | `<cmd>DapContinue<cr>` | zz:DAP:Continue | `lua/plugins/nvim/lspDap.lua:32` |
| 190 | `<F8>` | n | `<cmd>DapStepOver<cr>` | zz:DAP:StepOver | `lua/plugins/nvim/lspDap.lua:33` |
| 191 | `<F9>` | n | `<cmd>DapToggleBreakpoint<cr>` | zz:DAP:ToggleBreakpoint | `lua/plugins/nvim/lspDap.lua:34` |
| 192 | `<F10>` | n | `<cmd>DapStepInto<cr>` | zz:DAP:StepInto | `lua/plugins/nvim/lspDap.lua:35` |
| 193 | `<F11>` | n | `<cmd>DapStepOut<cr>` | zz:DAP:StepOut | `lua/plugins/nvim/lspDap.lua:36` |
| 194 | `<F12>` | n | `<cmd>DapTerminate<cr>` | zz:DAP:Terminate | `lua/plugins/nvim/lspDap.lua:37` |
| 195 | `<F1>` | n | `fn: require('dapui').open()` | zz:dapui:open | `lua/plugins/nvim/lspDap.lua:38` |
| 196 | `<F2>` | n | `fn: require('dapui').close()` | zz:dapui:close | `lua/plugins/nvim/lspDap.lua:39` |
| 197 | `<F3>` | n | `fn: require('dapui').toggle()` | zz:dapui:toggle | `lua/plugins/nvim/lspDap.lua:40` |
| 198 | `<leader>vd` | n | `fn: require('dapui').toggle()` | zz:dapui:toggle | `lua/plugins/nvim/lspDap.lua:41` |
| 199 | `<leader>vt` | n | `fn: require('dapui').float_element('console', { position = 'cent` | zz:dapui:FlotTerm | `lua/plugins/nvim/lspDap.lua:42` |
| 200 | `<A-l>` | i+s | `fn: ls.jump(1)` | zz:LuaSnip:JumpNext | `lua/plugins/nvim/luaSnip.lua:97` |
| 201 | `<A-h>` | i+s | `fn: ls.jump(-1)` | zz:LuaSnip:JumpPrev | `lua/plugins/nvim/luaSnip.lua:100` |
| 202 | `<esc>` | n | `fn: ls.unlink_current()` | zz:LuaSnip:Cancel | `lua/plugins/nvim/luaSnip.lua:104` |
| 203 | `<A-j>` | i+s | `fn: ls.choice_active()` | zz:LuaSnip:ChangeChoiceNext | `lua/plugins/nvim/luaSnip.lua:108` |
| 204 | `<A-k>` | i+s | `fn: ls.choice_active()` | zz:LuaSnip:ChangeChoicePrev | `lua/plugins/nvim/luaSnip.lua:114` |
| 205 | `<leader>ep` | n | `<cmd>PasteImage<cr>` | ZZ:ImgClip:PasteImageFromSystemClipboard | `lua/plugins/nvim/md/imgClip.lua:13` |
| 206 | `<leader>e/` | n | `<cmd>MarkdownPreviewToggle<cr>` | zz:MDPreview:Toggle | `lua/plugins/nvim/md/markdownPreview.lua:50` |
| 207 | `<leader>e/` | n | `<cmd>Markview<cr>` | zz:markview:Toggle | `lua/plugins/nvim/md/markview.lua:22` |
| 208 | `<leader>e.` | n | `<cmd>Markview splitToggle<cr>` | zz:markview:SplitToggle | `lua/plugins/nvim/md/markview.lua:23` |
| 209 | `<leader>e,` | n | `<cmd>RenderMarkdown buf_toggle<cr>` | zz:RenderMD:Toggle | `lua/plugins/nvim/md/renderMarkdown.lua:14` |
| 210 | `<leader>e.` | n | `<cmd>RenderMarkdown preview<cr>` | zz:RenderMD:SplitToggle | `lua/plugins/nvim/md/renderMarkdown.lua:15` |
| 211 | `<leader>za` | n+x | `fn: require('scissors').addNewSnippet()` | zz:Scissor:AddNewSnippet | `lua/plugins/nvim/nvimScissors.lua:4` |
| 212 | `<leader>ze` | n+x | `fn: require('scissors').editSnippet()` | zz:Scissor:EditSnippet | `lua/plugins/nvim/nvimScissors.lua:5` |
| 213 | `<leader>eo` | n | `<cmd>BufferLinePick<cr>` | zz:bufferline:BufPick | `lua/plugins/nvim/tab/bufferline.lua:145` |
| 214 | `<leader>ec` | n | `<cmd>BufferLinePickClose<cr>` | zz:bufferline:BufPickClose | `lua/plugins/nvim/tab/bufferline.lua:146` |
| 215 | `<leader>es` | n | `<cmd>BufferLineCloseOthers<cr>` | zz:bufferline:BufCloseOthers | `lua/plugins/nvim/tab/bufferline.lua:147` |
| 216 | `<leader>1` | n | `fn: require('bufferline').go_to(1, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:158` |
| 217 | `<leader>2` | n | `fn: require('bufferline').go_to(2, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:161` |
| 218 | `<leader>3` | n | `fn: require('bufferline').go_to(3, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:164` |
| 219 | `<leader>4` | n | `fn: require('bufferline').go_to(4, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:167` |
| 220 | `<leader>5` | n | `fn: require('bufferline').go_to(5, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:170` |
| 221 | `<leader>6` | n | `fn: require('bufferline').go_to(6, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:173` |
| 222 | `<leader>7` | n | `fn: require('bufferline').go_to(7, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:176` |
| 223 | `<leader>8` | n | `fn: require('bufferline').go_to(8, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:179` |
| 224 | `<leader>9` | n | `fn: require('bufferline').go_to(9, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:182` |
| 225 | `<leader>0` | n | `fn: require('bufferline').go_to(-1, true)` | zz:bufferline:GoToBufNum | `lua/plugins/nvim/tab/bufferline.lua:185` |
| 226 | `<leader>vm` | n | `fn: require('toggleterm.terminal').Terminal:new({ cmd = vim.fn.h` | zz:toggleterm:ShellToggle | `lua/plugins/nvim/toggleterm.lua:10` |
| 227 | `<leader>vy` | n | `fn: require('toggleterm.terminal').Terminal:new({ cmd = 'yazi', ` | zz:toggleterm:YaziToggle | `lua/plugins/nvim/toggleterm.lua:25` |
| 228 | `<leader><space>` | n | `fn: Snacks.picker.smart()` | zz:snacks:Smart Find Files | `lua/plugins/snacks/snacks.lua:30` |
| 229 | `<leader>v.` | n | `fn: Snacks.notifier.show_history()` | zz:snacks:Notifier show History | `lua/plugins/snacks/snacks.lua:31` |
| 230 | `<leader>v>` | n | `fn: Snacks.notifier.hide()` | zz:snacks:Dismiss All Notifications | `lua/plugins/snacks/snacks.lua:32` |
| 231 | `<leader>vn` | n | `fn: Snacks.explorer()` | zz:snacks:File Explorer | `lua/plugins/snacks/snacks.lua:33` |
| 232 | `<leader>vs` | n | `fn: Snacks.scratch()` | zz:snacks:Toggle Scratch Buffer | `lua/plugins/snacks/snacks.lua:34` |
| 233 | `<leader>vS` | n | `fn: Snacks.scratch.select()` | zz:snacks:Select Scratch Buffer | `lua/plugins/snacks/snacks.lua:35` |
| 234 | `<leader>vu` | n | `fn: Snacks.lazygit()` | zz:snacks:Lazygit | `lua/plugins/snacks/snacks.lua:36` |
| 235 | `<leader>v[` | n | `fn: Snacks.zen()` | zz:snacks:Toggle Zen Mode | `lua/plugins/snacks/snacks.lua:37` |
| 236 | `<leader>v]` | n | `fn: Snacks.zen.zoom()` | zz:snacks:Toggle Zoom | `lua/plugins/snacks/snacks.lua:38` |
| 237 | `<leader>fa` | n | `fn: Snacks.picker.autocmds()` | zz:snacks:Autocmds | `lua/plugins/snacks/snacks.lua:40` |
| 238 | `<leader>fb` | n | `fn: Snacks.picker.buffers()` | zz:snacks:Buffers | `lua/plugins/snacks/snacks.lua:41` |
| 239 | `<leader>fc` | n | `fn: Snacks.picker.files({ cwd = vim.fn.stdpath("config") })` | zz:snacks:Find Config File | `lua/plugins/snacks/snacks.lua:42` |
| 240 | `<leader>fd` | n | `fn: Snacks.picker.diagnostics()` | zz:snacks:Diagnostics | `lua/plugins/snacks/snacks.lua:43` |
| 241 | `<leader>fD` | n | `fn: Snacks.picker.diagnostics_buffer()` | zz:snacks:Buffer Diagnostics | `lua/plugins/snacks/snacks.lua:44` |
| 242 | `<leader>ff` | n | `fn: Snacks.picker.files()` | zz:snacks:Find Files | `lua/plugins/snacks/snacks.lua:45` |
| 243 | `<leader>fg` | n | `fn: Snacks.picker.git_files()` | zz:snacks:Find Git Files | `lua/plugins/snacks/snacks.lua:46` |
| 244 | `<leader>fh` | n | `fn: Snacks.picker.help()` | zz:snacks:Help Pages | `lua/plugins/snacks/snacks.lua:47` |
| 245 | `<leader>fH` | n | `fn: Snacks.picker.highlights()` | zz:snacks:Highlights | `lua/plugins/snacks/snacks.lua:48` |
| 246 | `<leader>fi` | n | `fn: Snacks.picker.icons()` | zz:snacks:Icons | `lua/plugins/snacks/snacks.lua:49` |
| 247 | `<leader>fj` | n | `fn: Snacks.picker.jumps()` | zz:snacks:Jumps | `lua/plugins/snacks/snacks.lua:50` |
| 248 | `<leader>fk` | n | `fn: Snacks.picker.keymaps()` | zz:snacks:Keymaps | `lua/plugins/snacks/snacks.lua:51` |
| 249 | `<leader>fl` | n | `fn: Snacks.picker.lines()` | zz:snacks:Buffer Lines | `lua/plugins/snacks/snacks.lua:52` |
| 250 | `<leader>fL` | n | `fn: Snacks.picker.loclist()` | zz:snacks:Location List | `lua/plugins/snacks/snacks.lua:53` |
| 251 | `<leader>fm` | n | `fn: Snacks.picker.man()` | zz:snacks:Man Pages | `lua/plugins/snacks/snacks.lua:54` |
| 252 | `<leader>fp` | n | `fn: Snacks.picker.projects()` | zz:snacks:Projects | `lua/plugins/snacks/snacks.lua:55` |
| 253 | `<leader>fq` | n | `fn: Snacks.picker.qflist()` | zz:snacks:Quickfix List | `lua/plugins/snacks/snacks.lua:56` |
| 254 | `<leader>fr` | n | `fn: Snacks.picker.resume()` | zz:snacks:Resume | `lua/plugins/snacks/snacks.lua:57` |
| 255 | `<leader>fR` | n | `fn: Snacks.picker.recent()` | zz:snacks:Recent | `lua/plugins/snacks/snacks.lua:58` |
| 256 | `<leader>fu` | n | `fn: Snacks.picker.undo()` | zz:snacks:Undo History | `lua/plugins/snacks/snacks.lua:59` |
| 257 | `<leader>fw` | n+x | `fn: Snacks.picker.grep_word()` | zz:snacks:Visual selection or word | `lua/plugins/snacks/snacks.lua:60` |
| 258 | `<leader>fy` | n | `fn: Snacks.picker.lazy()` | zz:snacks:Search for Plugin Spec | `lua/plugins/snacks/snacks.lua:61` |
| 259 | `<leader>f;` | n | `fn: Snacks.picker.command_history()` | zz:snacks:Command History | `lua/plugins/snacks/snacks.lua:62` |
| 260 | `<leader>f:` | n | `fn: Snacks.picker.commands()` | zz:snacks:Commands | `lua/plugins/snacks/snacks.lua:63` |
| 261 | `<leader>f'` | n | `fn: Snacks.picker.marks()` | zz:snacks:Marks | `lua/plugins/snacks/snacks.lua:64` |
| 262 | `<leader>f"` | n | `fn: Snacks.picker.registers()` | zz:snacks:Registers | `lua/plugins/snacks/snacks.lua:65` |
| 263 | `<leader>f/` | n | `fn: Snacks.picker.search_history()` | zz:snacks:Search History | `lua/plugins/snacks/snacks.lua:66` |
| 264 | `<leader>f[` | n | `fn: Snacks.picker.grep()` | zz:snacks:Grep | `lua/plugins/snacks/snacks.lua:67` |
| 265 | `<leader>f]` | n | `fn: Snacks.picker.grep_buffers()` | zz:snacks:Grep Open Buffers | `lua/plugins/snacks/snacks.lua:68` |
| 266 | `<leader>f,` | n | `fn: Snacks.picker.lsp_symbols()` | zz:snacks:LSP Symbols | `lua/plugins/snacks/snacks.lua:69` |
| 267 | `<leader>f<` | n | `fn: Snacks.picker.lsp_workspace_symbols()` | zz:snacks:LSP Workspace Symbols | `lua/plugins/snacks/snacks.lua:70` |
| 268 | `<leader>f.` | n | `fn: Snacks.picker.notifications()` | zz:snacks:Notification History | `lua/plugins/snacks/snacks.lua:71` |
| 269 | `<leader>gb` | n | `fn: Snacks.picker.git_branches()` | zz:snacks:Git Branches | `lua/plugins/snacks/snacks.lua:73` |
| 270 | `<leader>glg` | n | `fn: Snacks.picker.git_log()` | zz:snacks:Git Log | `lua/plugins/snacks/snacks.lua:74` |
| 271 | `<leader>gll` | n | `fn: Snacks.picker.git_log_line()` | zz:snacks:Git Log Line | `lua/plugins/snacks/snacks.lua:75` |
| 272 | `<leader>glf` | n | `fn: Snacks.picker.git_log_file()` | zz:snacks:Git Log File | `lua/plugins/snacks/snacks.lua:76` |
| 273 | `<leader>gs` | n | `fn: Snacks.picker.git_status()` | zz:snacks:Git Status | `lua/plugins/snacks/snacks.lua:77` |
| 274 | `<leader>gh` | n | `fn: Snacks.picker.git_stash()` | zz:snacks:Git Stash | `lua/plugins/snacks/snacks.lua:78` |
| 275 | `<leader>gd` | n | `fn: Snacks.picker.git_diff()` | zz:snacks:Git Diff (Hunks) | `lua/plugins/snacks/snacks.lua:79` |
| 276 | `<leader>gi` | n | `fn: Snacks.picker.gh_issue()` | zz:snacks:GitHub Issues (open) | `lua/plugins/snacks/snacks.lua:81` |
| 277 | `<leader>gI` | n | `fn: Snacks.picker.gh_issue({ state = "all" })` | zz:snacks:GitHub Issues (all) | `lua/plugins/snacks/snacks.lua:82` |
| 278 | `<leader>gp` | n | `fn: Snacks.picker.gh_pr()` | zz:snacks:GitHub Pull Requests (open) | `lua/plugins/snacks/snacks.lua:83` |
| 279 | `<leader>gP` | n | `fn: Snacks.picker.gh_pr({ state = "all" })` | zz:snacks:GitHub Pull Requests (all) | `lua/plugins/snacks/snacks.lua:84` |
| 280 | `gd` | n | `fn: Snacks.picker.lsp_definitions()` | zz:snacks:Goto Definition | `lua/plugins/snacks/snacks.lua:87` |
| 281 | `gD` | n | `fn: Snacks.picker.lsp_declarations()` | zz:snacks:Goto Declaration | `lua/plugins/snacks/snacks.lua:88` |
| 282 | `gf` | n | `fn: Snacks.picker.lsp_references()` | zz:snacks:References | `lua/plugins/snacks/snacks.lua:89` |
| 283 | `gp` | n | `fn: Snacks.picker.lsp_implementations()` | zz:snacks:Goto Implementation | `lua/plugins/snacks/snacks.lua:90` |
| 284 | `gt` | n | `fn: Snacks.picker.lsp_type_definitions()` | zz:snacks:Goto T[y]pe Definition | `lua/plugins/snacks/snacks.lua:91` |
| 285 | `gi` | n | `fn: Snacks.picker.lsp_incoming_calls()` | zz:snacks:C[a]lls Incoming | `lua/plugins/snacks/snacks.lua:92` |
| 286 | `go` | n | `fn: Snacks.picker.lsp_outgoing_calls()` | zz:snacks:C[a]lls Outgoing | `lua/plugins/snacks/snacks.lua:93` |
| 287 | `<leader>bC` | n | `fn: Snacks.picker.colorschemes()` | zz:snacks:Colorschemes | `lua/plugins/snacks/snacks.lua:96` |
| 288 | `<leader>ed` | n | `fn: Snacks.bufdelete()` | zz:snacks:Delete Buffer | `lua/plugins/snacks/snacks.lua:99` |
| 289 | `<leader>er` | n | `fn: Snacks.rename.rename_file()` | zz:snacks:Rename File | `lua/plugins/snacks/snacks.lua:100` |
| 290 | `<c-/>` | n | `fn: Snacks.terminal()` | zz:snacks:Toggle Terminal | `lua/plugins/snacks/snacks.lua:101` |
| 291 | `<c-_>` | n | `fn: Snacks.terminal()` | zz:snacks:Toggle Terminal | `lua/plugins/snacks/snacks.lua:102` |
| 292 | `]s` | n+t | `fn: Snacks.words.jump(vim.v.count1)` | zz:snacks:Next Reference | `lua/plugins/snacks/snacks.lua:103` |
| 293 | `[s` | n+t | `fn: Snacks.words.jump(-vim.v.count1)` | zz:snacks:Prev Reference | `lua/plugins/snacks/snacks.lua:104` |
| 294 | `<leader>N` | n | `fn: Snacks.win({ file = vim.api.nvim_get_runtime_file("doc/news.` | Neovim News | `lua/plugins/snacks/snacks.lua:105` |
| 295 | `<leader>bs` | n | `fn: Snacks.toggle.option("spell", { name = "Spelling" })` | toggle: Spelling | `lua/plugins/snacks/snacks.lua:152` |
| 296 | `<leader>bw` | n | `fn: Snacks.toggle.option("wrap", { name = "Wrap" })` | toggle: Wrap | `lua/plugins/snacks/snacks.lua:153` |
| 297 | `<leader>br` | n | `fn: Snacks.toggle.option("relativenumber", { name = "Rel` | toggle: Relative Number | `lua/plugins/snacks/snacks.lua:154` |
| 298 | `<leader>bd` | n | `fn: Snacks.toggle.diagnostics()` | Snacks toggle | `lua/plugins/snacks/snacks.lua:155` |
| 299 | `<leader>bl` | n | `fn: Snacks.toggle.line_number()` | Snacks toggle | `lua/plugins/snacks/snacks.lua:156` |
| 300 | `<leader>bc` | n | `fn: Snacks.toggle.option("conceallevel", { off = 0, on =` | Snacks toggle | `lua/plugins/snacks/snacks.lua:157` |
| 301 | `<leader>bt` | n | `fn: Snacks.toggle.treesitter()` | Snacks toggle | `lua/plugins/snacks/snacks.lua:158` |
| 302 | `<leader>bb` | n | `fn: Snacks.toggle.option("background", { off = "light", ` | toggle: Dark Background | `lua/plugins/snacks/snacks.lua:159` |
| 303 | `<leader>bh` | n | `fn: Snacks.toggle.inlay_hints()` | Snacks toggle | `lua/plugins/snacks/snacks.lua:160` |
| 304 | `<leader>bi` | n | `fn: Snacks.toggle.indent()` | Snacks toggle | `lua/plugins/snacks/snacks.lua:161` |
| 305 | `<leader>bD` | n | `fn: Snacks.toggle.dim()` | Snacks toggle | `lua/plugins/snacks/snacks.lua:162` |
