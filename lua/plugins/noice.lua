return ({
	"folke/noice.nvim",
	enabled = false,
	config = function()
		require("noice").setup({
			-- add any options here
			--lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			--override = {
			--["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			--["vim.lsp.util.stylize_markdown"] = true,
			--["cmp.entry.get_documentation"] = true,
			--},
			--},
			cmdline = {
				view = "cmdline",
				format = {
					cmdline = { icon = "▸" },
					search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
				}
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				--lsp_doc_border = false, -- add a border to hover docs and signature help
			},
			popupmenu = {
				enabled = false, -- enables the Noice popupmenu UI
				---@type 'nui'|'cmp'
				backend = "nui", -- backend to use to show regular cmdline completions
				-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
				kind_icons = {}, -- set to `false` to disable icons
			},
			rediret = {
				enabled = true, -- enables the Noice redirect UI
				-- NOTE: If you enable redirect, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				view = "notify", -- default view for messages
			},
			hover = {
				enabled = false,
				silent = true,
			},
			documentation = {
				view = "notify"
			},
			messages = {
				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				enabled = true,  -- enables the Noice messages UI
				view = "notify", -- default view for messages
				view_error = "notify", -- view for errors
				view_warn = "notify", -- view for warnings
				view_history = "messages", -- view for :messages
				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
			notify = {
				enabled = true, -- enables the Noice notify UI
				view = "notify",
				-- NOTE: If you enable notify, then the cmdline is enabled automatically.
				-- This is a current Neovim limitation.
				--view = "notify", -- default view for messages
				--view_error = "notify", -- view for errors
				--view_warn = "notify", -- view for warnings
				--view_history = "messages", -- view for :messages
				--view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
			},
		})
	end,
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	}
})
