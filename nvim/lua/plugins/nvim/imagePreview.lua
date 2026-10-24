return {
    'adelarsq/image_preview.nvim',
    event = 'VeryLazy',
    config = function()
        local image_preview = require('image_preview')
        image_preview.setup()

        -- 覆盖上游 PreviewImage：仅将 Windows 分支的无扩展名 "powershell" 改为 "powershell.exe"。
        -- 原因：当机器上存在 C:\Windows\System32\PowerShell "目录"时（PowerShell 7 的
        -- remoting 组件 pwrshplugin.dll 会创建它），WezTerm 对无扩展名程序名做 PATH
        -- 搜索时会把该目录当作可执行文件返回（其 exists() 检查不排除目录，且
        -- System32 在 PATH 中排在 WindowsPowerShell\v1.0 之前），导致新 pane 立即
        -- 以退出码 1 失败，显示 "didn't exit cleanly"。带扩展名的 powershell.exe
        -- 可正确解析到真实可执行文件。
        image_preview.PreviewImage = function(absolutePath)
            local term = nil
            if os.getenv('KITTY_PID') ~= nil then
                term = 'kitty'
            elseif os.getenv('WEZTERM_PANE') ~= nil then
                term = 'wezterm'
            end

            if image_preview.IsImage(absolutePath) then
                if term == 'wezterm' then
                    local command
                    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
                        command = 'silent !wezterm cli split-pane -- powershell.exe wezterm imgcat '
                            .. "'" .. absolutePath .. "'"
                            .. ' ; pause'
                    else
                        command = 'silent !wezterm cli split-pane -- bash -c \'wezterm imgcat "' .. absolutePath .. '" ; read\''
                    end
                    vim.api.nvim_command(command)
                elseif term == 'kitty' then
                    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
                        print('Kitty not supported on windows')
                    else
                        vim.api.nvim_command('silent !kitten @ launch --type=window kitten icat --hold "' .. absolutePath .. '"')
                    end
                else
                    print('No support for this terminal.')
                end
            else
                print('No preview for file ' .. absolutePath)
            end
        end
    end,
}
