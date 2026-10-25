return {
    'ahmedkhalf/project.nvim',
    -- start plugin: BufEnter/VimEnter autocmds must be registered before the
    -- startup buffer arrives, otherwise the first file never gets chdir'd.
    -- (on_buf_enter early-returns on the pre-VimEnter BufEnter, but its
    -- VimEnter autocmd catches the startup buffer instead.)
    lazy = false,
    opts = {
        manual_mode = false, -- fully automatic
        detection_methods = { 'pattern' },
        patterns = {
            '.git',
            'Cargo.toml',
            'go.mod',
            'CMakeLists.txt',
            '.project',
            '.cproject',
        },
        -- the two lines below are the key to "pinning" the cwd
        silent_chdir = true, -- no noise when changing directory
        scope_chdir = 'global', -- global scope, shared by all windows
    },
    config = function(_, opts)
        require('project_nvim').setup(opts)
    end,
}
