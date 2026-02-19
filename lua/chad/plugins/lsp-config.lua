return {
	{
		"williamboman/mason.nvim",
		name = "mason",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		name = "mason-tool-installer",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local installer = require("mason-tool-installer")

			installer.setup({
				ensure_installed = {
					"mypy",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		name = "mason-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ruff",
					"gopls",
					"rust_analyzer",
					"clangd",
					"ts_ls",
					"zls",
					"tinymist",
					"jsonls",
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
				offset_encoding = "utf-8",
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
				init_options = {
					fallbackFlags = { "--std=c++20" },
				},
				capabilities = capabilities,
				filetypes = { "c", "cpp" },
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
				offset_encoding = "utf-8",
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			})

			lspconfig.eslint.setup({
				capabilities = capabilities,
				filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
			})

			lspconfig.zls.setup({
				capabilities = capabilities,
				filetypes = { "zig" },
			})

			lspconfig.tinymist.setup({
				capabilities = capabilities,
				filetypes = { "typst" },
				settings = {
					formatterMode = "typstyle",
					exportPdf = "never",
					semanticTOkens = "disable",
				},
			})

			lspconfig.jsonls.setup({
				capabilities = capabilities,
				filetypes = { "json" },
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
