return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup()
    vim.keymap.set("n", "<leader>n", "<cmd> bnext <CR>")
    vim.keymap.set("n", "<leader>p", "<cmd> bprev <CR>")
  end
}
