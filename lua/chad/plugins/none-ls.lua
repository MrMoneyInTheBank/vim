return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.mypy.with({ filetypes = { "python" } }),
				null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
				null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),
			},
		})

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
