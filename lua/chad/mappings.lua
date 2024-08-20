local M = {}

M.general = {
  i = {
    ["jk"] = { "<Esc>", "Exit insert mode" },
  },
  n = {
    ["<leader>ii"] = { "gg0vG$=", "Indent whole file" },
    ["<leader>cop"] = { "<cmd>%yank<CR>", "Copy entire file" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
  },
}

M.tmux = {
  plugin = {
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<cr>", "Navigate Left" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>", "Navigate Down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<cr>", "Navigate Up" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>", "Navigate Right" },
  },
}

function M.setup()
  local wk = require("which-key")
  wk.register(M.general.i, { mode = "i" })
  wk.register(M.general.n, { mode = "n" })
  wk.register(M.tmux.plugin, { mode = "n" })
end

return M
