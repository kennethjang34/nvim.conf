return {
	"epwalsh/obsidian.nvim",
	config = function()
		require('obsidian').setup({
			-- your config options...

			vim.keymap.set("n", "<leader>o", function()
				return "<cmd>ObsidianOpen<CR>"
			end, { noremap = false, expr = true })
		})
	end,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		-- "BufReadPre /Users/JANG/Documents/kennethjang34/**.md",
		-- "BufNewFile /Users/JANG/Documents/kennethjang34/**.md",
		"BufReadPre /Users/JANG/Library/Mobile Documents/iCloud~md~obsidian/Documents/kennethjang34/**.md",
		"BufNewFile /Users/JANG/Library/Mobile Documents/iCloud~md~obsidian/Documents/kennethjang34/**.md",

	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

	},
	opts = {
		-- dir = "~/Documents/kennethjang34", -- no need to call 'vim.fn.expand' here
		dir = "/Users/JANG/Library/Mobile Documents/iCloud~md~obsidian/Documents/kennethjang34",
		mappings = {
		},
		open_app_foreground = true,
		-- see below for full list of options 👇
	},
}
