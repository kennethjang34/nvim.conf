return {
	"epwalsh/obsidian.nvim",
	lazy = false,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		-- "BufReadPre /Users/JANG/Documents/kennethjang34/**.md",
		-- "BufNewFile /Users/JANG/Documents/kennethjang34/**.md",
		-- "BufReadPre /Users/JANG/Library/Mobile Documents/iCloud~md~obsidian/Documents/kennethjang34/**.md",
		-- "BufNewFile /Users/JANG/Library/Mobile Documents/iCloud~md~obsidian/Documents/kennethjang34/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

	},
	config = function()
		require("obsidian").setup({
			-- dir = "~/Documents/kennethjang34", -- no need to call 'vim.fn.expand' here
			workspaces = {
				{
					name = "kennethjang34",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/kennethjang34",
				}
			},
			templates = {
				folder = "templates",
			},
			picker = {
				name = "fzf-lua",
			},

			mappings = {
				["<leader>o"] = {
					action =
						function()
							return "<cmd>ObsidianOpen<CR>"
						end,
					opts = { noremap = false, expr = true }
				}
			},
			open_app_foreground = true,
			-- see below for full list of options 👇
		})
		vim.keymap.set("n", "<leader>o",
			function()
				return "<cmd>ObsidianOpen<CR>"
			end, { noremap = false, expr = true })
		local function setup_md_files()
			vim.opt_local.conceallevel = 2
		end
		vim.api.nvim_create_augroup("MDFileSettings", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = setup_md_files,
			group = "MDFileSettings"
		})
	end,
}
