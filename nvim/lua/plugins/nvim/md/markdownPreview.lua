return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
        -- 不用 mkdp#util#install*：build 阶段插件不在 rtp（E117），:! 走 &shell，
        -- git-bash 启动 nvim 时 shell=bash 跑不动批处理。
        -- 不用 install.cmd：其 PowerShell 层层环境坑修不完——PATH 解析到 pwsh7 时
        -- Expand-Archive 有 Write-Progress bug；live 会话还可能继承 pwsh7 的
        -- PSModulePath 使 5.1 也加载 PS7 模块；且失败不设退出码。
        -- 直接用 Windows 系统自带的 curl.exe + tar.exe 下载解压 release 预编译包
        -- （zip 内是单个 markdown-preview-win.exe），真实退出码，--retry 应对
        -- GitHub 资产下载常见的连接重置；Linux 走插件自带的 install.sh
        local version = vim.fn.json_decode(
            table.concat(vim.fn.readfile(plugin.dir .. "/package.json"), "")
        ).version
        local app = plugin.dir .. "/app"
        local bin = app .. "/bin"
        local r
        if vim.fn.has("win32") == 1 then
            local sys = (os.getenv("SystemRoot") or "C:\\Windows") .. "\\System32\\"
            local zip = app .. "/markdown-preview-win.zip"
            vim.fn.mkdir(bin, "p")
            r = vim.system({
                sys .. "curl.exe", "-sSL", "--fail", "--retry", "5", "--retry-all-errors",
                "-o", zip,
                ("https://github.com/iamcco/markdown-preview.nvim/releases/download/v%s/markdown-preview-win.zip"):format(version),
            }, { text = true }):wait()
            if r.code == 0 then
                r = vim.system({ sys .. "tar.exe", "-xf", zip, "-C", bin }, { text = true }):wait()
                os.remove(zip)
            end
        else
            r = vim.system({ "sh", "-c", "./install.sh v" .. version }, { cwd = app, text = true }):wait()
        end
        -- 最终以产物存在与否判定成败
        if r.code ~= 0 or vim.fn.isdirectory(bin) == 0 or #vim.fn.readdir(bin) == 0 then
            error(("markdown-preview install failed (code %d)\nstdout:\n%s\nstderr:\n%s")
                :format(r.code, r.stdout or "", r.stderr or ""))
        end
    end,
    config = function()
        vim.keymap.set('n', '<leader>v/', '<cmd>MarkdownPreviewToggle<cr>', { remap = false, desc='zz:MDPreview:Toggle'})
    end,
}
