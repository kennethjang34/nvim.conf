return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			require "nvim-treesitter.configs".setup {
				enable = true,
				ensure_installed = {
					"bash",
					"css",
					"dockerfile",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"python",
					"regex",
					"rust",
					"scss",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
				},
				auto_install = true,
				highlight = {
					enable = true,
					-- additional_vim_regex_highlighting = false,
					additional_vim_regex_highlighting = { "latex" },
					disable = { "latex" }
				},
				ignore_install = { 'latex' },
				matchup = {
					enable = true, -- mandatory, false will disable the whole extension
					-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
					-- [options]
				},
				-- more stuff here
				-- playground = {
				-- 	enable = true,
				-- 	disable = {},
				-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				-- 	persist_queries = false, -- Whether the query persists across vim sessions
				-- 	keybindings = {
				-- 		toggle_query_editor = 'o',
				-- 		toggle_hl_groups = 'i',
				-- 		toggle_injected_languages = 't',
				-- 		toggle_anonymous_nodes = 'a',
				-- 		toggle_language_display = 'I',
				-- 		focus_language = 'f',
				-- 		unfocus_language = 'F',
				-- 		update = 'R',
				-- 		goto_node = '<cr>',
				-- 		show_help = '?',
				-- 	},
				-- }
			}
		end
	},
}
