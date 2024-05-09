return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup()
    vim.keymap.set("n", "1", "<cmd> bprev <CR>")
    vim.keymap.set("n", "2", "<cmd> bnext <CR>")
    vim.keymap.set("n", "<leader>x", "<cmd> bdelete <CR>")
  end,
}
