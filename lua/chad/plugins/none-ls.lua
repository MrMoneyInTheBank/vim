return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.mypy.with({ filetypes = { "python" } }),
				null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
				null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),
				null_ls.builtins.formatting.gofumpt.with({ filetypes = { "go" } }),
				null_ls.builtins.formatting.goimports_reviser.with({ filetypes = { "go" } }),
				null_ls.builtins.formatting.clang_format.with({ filetypes = { "c", "cpp" } }),
				null_ls.builtins.formatting.prettierd.with({
					filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				}),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
