return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		vim.keymap.set("n", "<leader>a", "<cmd> Alpha <CR>")
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		_Gopts = {
			position = "center",
			hl = "Type",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
			dashboard.button("w", "🔎  Find word", ":Telescope live_grep<CR>"),
			dashboard.button("v", "🐙  Git", ":LazyGit<CR>"),
			dashboard.button("h", "✅  Health", ":checkhealth<CR>"),
			dashboard.button("c", "⚙️   Config", ":e $MYVIMRC <CR>"),
			dashboard.button("m", "🔨  Mason", ":Mason<CR>"),
			dashboard.button("l", "😴  Lazy", ":Lazy<CR>"),
			dashboard.button("u", "⬆️   Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
			dashboard.button("q", "⏻   Quit NVIM", ":qa<CR>"),
		}

		local function footer()
			return "Happy Coding!"
		end
		dashboard.section.footer.val = footer()

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)

		require("alpha").setup(dashboard.opts)
	end,
}
