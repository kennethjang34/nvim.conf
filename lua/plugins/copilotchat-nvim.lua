return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		debug = true, -- Enable debugging
		mappings = {
			submit_prompt = {
				normal = '<Leader>s',
				insert = '<C-s>'
			},
			reset = {
				normal = '<C-q>',
				insert = '<C-q>'
			}
		}
	},
	-- See Commands section for default commands if you want to lazy load on them
}
