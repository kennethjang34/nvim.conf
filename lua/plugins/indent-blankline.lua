return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		--vim.opt.list = false
		--vim.opt.listchars:append "eol:↴"
		require("indent_blankline").setup {
			buftype_exclude = { "terminal" },
			show_current_context = true,
			show_current_context_start = true,
			show_end_of_line = true,

		}
	end
}
