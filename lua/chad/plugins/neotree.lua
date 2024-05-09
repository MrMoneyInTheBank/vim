return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require("neo-tree")

    neotree.setup({
      close_if_last_window = false,
      enable_diagnostics = true,
      enable_git_status = true,
      popup_border_style = "rounded",
      sort_case_insensitive = false,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
    vim.keymap.set("n", "<leader>fe", ":Neotree filesystem focus<CR>")
  end,
}
