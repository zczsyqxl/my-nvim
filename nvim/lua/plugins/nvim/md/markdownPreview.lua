return {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function(plugin)
        -- Not mkdp#util#install*: during build the plugin isn't on the rtp yet (E117),
        -- and :! goes through &shell -- when nvim is launched from git-bash,
        -- shell=bash can't run the batch script.
        -- Not install.cmd: its PowerShell layer has endless environment pitfalls --
        -- when PATH resolves to pwsh7, Expand-Archive hits a Write-Progress bug;
        -- a live session may also inherit pwsh7's PSModulePath so 5.1 loads PS7
        -- modules; and it doesn't set an exit code on failure.
        -- Instead, use Windows' own System32 curl.exe + tar.exe to download and
        -- extract the release prebuilt package (the zip holds a single
        -- markdown-preview-win.exe), with real exit codes and --retry for the
        -- connection resets common with GitHub assets; Linux uses the plugin's
        -- own install.sh
        local version = vim.fn.json_decode(table.concat(vim.fn.readfile(plugin.dir .. '/package.json'), '')).version
        local app = plugin.dir .. '/app'
        local bin = app .. '/bin'
        local r
        if vim.fn.has('win32') == 1 then
            local sys = (os.getenv('SystemRoot') or 'C:\\Windows') .. '\\System32\\'
            local zip = app .. '/markdown-preview-win.zip'
            vim.fn.mkdir(bin, 'p')
            r = vim.system({
                sys .. 'curl.exe',
                '-sSL',
                '--fail',
                '--retry',
                '5',
                '--retry-all-errors',
                '-o',
                zip,
                ('https://github.com/iamcco/markdown-preview.nvim/releases/download/v%s/markdown-preview-win.zip'):format(version),
            }, { text = true }):wait()
            if r.code == 0 then
                r = vim.system({ sys .. 'tar.exe', '-xf', zip, '-C', bin }, { text = true }):wait()
                os.remove(zip)
            end
        else
            r = vim.system({ 'sh', '-c', './install.sh v' .. version }, { cwd = app, text = true }):wait()
        end
        -- success is ultimately judged by whether the artifact exists
        if r.code ~= 0 or vim.fn.isdirectory(bin) == 0 or #vim.fn.readdir(bin) == 0 then
            error(('markdown-preview install failed (code %d)\nstdout:\n%s\nstderr:\n%s'):format(r.code, r.stdout or '', r.stderr or ''))
        end
    end,
    config = function()
        vim.keymap.set('n', '<leader>e/', '<cmd>MarkdownPreviewToggle<cr>', { remap = false, desc = 'zz:MDPreview:Toggle' })
    end,
}
