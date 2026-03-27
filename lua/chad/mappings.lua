local csv = require("chad.utils.csv")
local M = {}

function M.setup()
  local wk = require("which-key")
  -- insert mode
  wk.add({ "jk", "<Esc>", desc = "Exit insert mode", mode = "i" })
  -- normal mode
  wk.add({ "<leader>ii", "gg0vG$=", desc = "Indent whole file", mode = "n" })
  wk.add({ "<leader>cop", "<cmd>%yank<CR>", desc = "Copy entire file", mode = "n" })
  wk.add({ "<leader>vipp", "gg0VGp", desc = "Paste over entire buffer", mode = "n" })
  wk.add({ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition", mode = "n" })
  -- tmux
  wk.add({ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left", mode = "n" })
  wk.add({ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down", mode = "n" })
  wk.add({ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up", mode = "n" })
  wk.add({ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right", mode = "n" })
  -- DAP
  wk.add({ "<leader>dn", "<cmd>DapContinue<cr>", desc = "DapContinue", mode = "n" })
  -- Typst
  wk.add({ "<leader>p", "<cmd>TypstPreview<cr>", desc = "Typst Preview", mode = "n" })
  wk.add({ "<leader>b", "<cmd>Export<cr>", desc = "Export to pdf", mode = "n" })
  -- Markdown
  wk.add({ "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle", mode = "n" })
  -- Supermaven
  wk.add({ "<leader>smo", "<cmd>SupermavenStop<cr>", desc = "Supermaven Stop", mode = "n" })
  wk.add({ "<leader>sms", "<cmd>SupermavenStart<cr>", desc = "Supermaven Start", mode = "n" })
  -- csv view
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "csv", "tsv" },
    callback = function()
      wk.add({
        { "<leader>csv", csv.toggle, desc = "CSV toggle (autodelimiter)" },
      }, { buffer = true })
    end,
  })
end

return M
