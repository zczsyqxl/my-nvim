return {
  -- stylua: ignore
  keys = {
    -- The keyboard mapping for the input window.
    ["Input:Submit"]      = { mode = "n", key = "<cr>" },
    ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
    ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },

    -- only works when "save_session = true"
    ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
    ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },

    ["Input:ModelsNext"]  = { mode = {"n", "i"}, key = "<C-S-J>" },
    ["Input:ModelsPrev"]  = { mode = {"n", "i"}, key = "<C-S-K>" },

    -- The keyboard mapping for the output window in "split" style.
    ["Output:Ask"]        = { mode = "n", key = "i" },
    ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
    ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

    -- The keyboard mapping for the output and input windows in "float" style.
    ["Session:Open"]     = { mode = "n", key = "<leader>ac" },
    ["Session:Hide"]     = { mode = "n", key = "<esc>" },
    ["Session:Close"]    = { mode = "n", key = "Q" },
    ["Session:New"]      = { mode = "n", key = "<C-n>" },
    ["Session:History"]  = { mode = "n", key = "<C-h>" },
    -- ["Session:Models"]     = { mode = "i", key = "@" },
    -- ["Session:Models"]     = { mode = "n", key = "<C-m>" },

    -- Focus
    ["Focus:Input"]       = { mode = "n", key = {"i" } },
    ["Focus:Output"]      = { mode = { "n", "i" }, key = "<C-o>" },

    -- Scroll [default]
    ["PageUp"]            = { mode = {"i","n"}, key = "<C-b>" },
    ["PageDown"]          = { mode = {"i","n"}, key = "<C-f>" },
    ["HalfPageUp"]        = { mode = {"i","n"}, key = "<C-u>" },
    ["HalfPageDown"]      = { mode = {"i","n"}, key = "<C-d>" },
    ["JumpToTop"]         = { mode = "n", key = "gg" },
    ["JumpToBottom"]      = { mode = "n", key = "G" }
  },
}
