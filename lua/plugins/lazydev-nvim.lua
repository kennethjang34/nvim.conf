return {
	{
		enabled = false,
		lazy = false,
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				"lazy.nvim",
				"~/.local/share/nvim/lazy",
				"luvit-meta/library",
			}
		},
	}
}
