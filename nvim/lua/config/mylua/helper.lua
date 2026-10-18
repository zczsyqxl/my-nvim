local function echo_color(hl, text)
    vim.cmd(string.format('echohl %s', hl))
    local escaped = text:gsub('\\', '\\\\'):gsub('"', '\\"')
    vim.cmd(string.format('echo "%s"', escaped))
    vim.cmd('echohl None')
end

return {
    echo_color = echo_color,
}
