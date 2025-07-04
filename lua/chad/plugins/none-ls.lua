return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.mypy.with({
					extra_args = function()
						local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
						return { "--python-executable", virtual .. "/bin/python3" }
					end,
					command = "/Users/anshumansingh/.local/bin/mypy",
				}),
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
				client.offset_encoding = "utf-8"
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
