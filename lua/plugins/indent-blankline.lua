return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		--vim.opt.list = false
		--vim.opt.listchars:append "eol:↴"
		require("ibl").setup {
			exclude = { buftypes = { "terminal" } },
			scope = { show_end = true, enabled = true, show_start = true },
		}
	end
}
