return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		local opts = {
      mode = "buffers",
			themeable = true,
			separator_style = "slant",
			diagnostics = false,
		}

		bufferline.setup({ options = opts })

		vim.keymap.set("n", "<Tab>", "<cmd> bnext <CR>")
		vim.keymap.set("n", "<S-Tab>", "<cmd> bprev <CR>")
		vim.keymap.set("n", "<leader>x", "<cmd> bdelete <CR>")
	end,
}
