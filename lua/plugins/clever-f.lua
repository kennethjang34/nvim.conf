return {
	"rhysd/clever-f.vim",
	config = function()
		vim.g.clever_f_fix_key_direction = 1
		vim.keymap.set("n", "q", "<cmd>noh<CR><cmd>call clever_f#reset()<CR>", { silent = true, noremap = false })
	end
}
