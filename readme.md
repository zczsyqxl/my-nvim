> [!Tip] T1. Render-markdown.nvim plugin, preview latex in markdown documents
>> 1. need to install tree-sitter.latex parser
>> ```vim
>> :TSInstall latex
>> ```
>> 2. need to install latex2text
>> ```python
>> python -m pip install pylatexenc
>> ```
>> 3. checkhealth.python need to be ok (guess)

> [!Tip] T2. markdown-preview.nvim plugin install
>> After Install, need to open .md file and, run vim command
>> Because, lazy load, the final step is failed.
>> ```vim
>> :call mkdp#util#install()
>> ```

> [!tip] T3. image.nvim plugin (https://github.com/3rd/image.nvim)
>> 1. only support in linux
>> 2. in kitty performance is better than wezterm
>> 3. need to install ImageMagick
>> ```zsh
>> sudo apt install imagemagick
>> ```

> [!ERROR] E1. Use snippet to insert time, display time in chinese, althogh, the systme setting for time format is US To fix this problem
>> Method1, add setting in nvim config script
>> ```lua
>>    if vim.fn.has('win32') ~= 0 then
>>        vim.cmd[[
>>             language time English_United States.1252
>>         ]]
>>    end
>> ```
>> Method2, change system region setting
>> ![SysRegionSetting](images/2025-12-03-19-31-25.png)

> [!ERROR] E2. latex2text default output encoding is CP936, display in nvim in utf-8 is not corect 
>> To ifx this problem, use **Method2** of **E1**


## Tree-sitter
---
* tree-sitter cli need to installed and the path shall be in environment
* TSInstall markdown markdown_inline c python lua rust bash c_sharp cmake cpp diff git_config html json json5 make ninja ruby sql ssh_config vim vimdoc yaml latex

### tree-sitter-cli for tree-sitter.latex
#### Option1: Install rust
* https://rust-lang.org/zh-CN/learn/get-started/
* cargo install tree-sitter-cli

#### Option2: Github
* https://github.com/tree-sitter/tree-sitter/releases
* Copy and set path environment variable

### Node.js for tree-sitter.latex
* https://nodejs.org/en/download/

## Git
* LazyGit need to be installed/copy
    * https://github.com/jesseduffield/lazygit/releases

## Telescope
* fd need to be installed/copy, and shall be located in environment path
    * https://github.com/sharkdp/fd
* rg need to be installed/copy, and shall be located in environment path 
    * https://github.com/BurntSushi/ripgrep
    
## Lsp/Dap/Tree-sitter
* cland need to be installed
* python need to be installed
* Mason
    * LSP
        * clangd
        * rust-analyzer
        * lua-language-server
        * yaml-language-server
        * pyright
    * Dap
        * codelldb
        * debugpy
