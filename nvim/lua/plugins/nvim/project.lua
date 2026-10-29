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
        -- A nested repo (a git submodule carries a `.git` *file*, which pattern
        -- matching cannot tell apart from a real one) gets detected as the
        -- project root and hijacks the cwd via a global chdir; the DirChanged
        -- event then re-roots the snacks explorer to the submodule. Skip the
        -- chdir when the detected root lies inside the current cwd; every other
        -- case (root outside cwd / equal to cwd / no root at all) keeps the
        -- default flow (history + auto project switch).
        local project = require('project_nvim.project')
        local orig_set_pwd = project.set_pwd
        project.set_pwd = function(dir, method)
            if dir and vim.fn.getcwd() ~= dir then
                local cwd = vim.fs.normalize(vim.fn.getcwd())
                local root = vim.fs.normalize(dir)
                -- the trailing "/" (hence the +1) rules out sibling dirs that
                -- merely share a string prefix (e.g. 5507_bds_mult_appl vs
                -- 5507_bds_mult_appl_extra)
                if root:sub(1, #cwd + 1) == cwd .. '/' then
                    return true
                end
            end
            return orig_set_pwd(dir, method)
        end
    end,
}
