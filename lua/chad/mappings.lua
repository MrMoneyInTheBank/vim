vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<leader>ii", "gg0vG$=")
vim.keymap.set("n", "<leader>cop", "<cmd>%yank<CR>")

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
