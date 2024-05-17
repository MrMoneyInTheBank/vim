return {
	{
		"williamboman/mason.nvim",
		name = "mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason-lspconfig",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ruff_lsp",
					"gopls",
					"rust_analyzer",
					"clangd",
					"tsserver",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				filetypes = { "python" },
			})

			lspconfig.ruff_lsp.setup({
				init_options = {
					settings = {
						args = {},
					},
				},
				capabilities = capabilities,
				filetypes = { "python" },
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
				filetypes = { "go" },
			})

			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				filetypes = { "rust" },
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				filetypes = { "cpp" },
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			})

			-- mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
