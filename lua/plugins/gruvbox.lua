return {
	'ellisonleao/gruvbox.nvim',
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruvbox")
		require("gruvbox").setup({
			--overrides = {
			--Directory = {
			----fg = "#7daea3",
			--bg = "#1d2021",
			--fg = "#ebdbb2",
			----fg = "#ebdbb2",
			--folder_icon = {
			--default = "",
			--open = "",
			--},
			--},
			--[NVimTree = {
			--bg = "#1d2021",
			--fg = "#ebdbb2",
			--folder_icon = {
			--default = "",
			--open = "",
			--},
			--},
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			dim_inactive = false,
			transparent_mode = false,
			overrides = {
				NvimTreeFolderIcon = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeFileIcon = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeSymlink = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeIndentMarker = {
					bg = "#1d2021",
					fg = "#ebdbb2",
					--icon = "│",
				},
				NvimTreeExecFile = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeOpenedFile = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeSpecialFile = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeWindowPicker = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
				NvimTreeImageFile = {
					bg = "#1d2021",
					fg = "#ebdbb2",
				},
			},
		})
	end
}
