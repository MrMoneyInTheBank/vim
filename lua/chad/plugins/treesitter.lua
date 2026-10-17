return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter").setup()

		require("nvim-treesitter").install({
			"lua",
			"python",
			"go",
			"cpp",
			"c",
			"javascript",
			"typescript",
			"json",
			"bash",
			"markdown",
			"markdown_inline",
			"vimdoc",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"lua",
				"python",
				"go",
				"cpp",
				"c",
				"javascript",
				"typescript",
				"json",
				"sh",
				"markdown",
				"help",
			},
			callback = function(event)
				-- Parsers install asynchronously on the first launch.
				if vim.treesitter.get_parser(event.buf) then
					vim.treesitter.start(event.buf)
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
