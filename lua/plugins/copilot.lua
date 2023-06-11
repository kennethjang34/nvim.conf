return {
	'github/copilot.vim',
	config = function()
		vim.keymap.set("i", "<c-l>", 'copilot#Accept("")',
			{ noremap = true, silent = true, expr = true, replace_keycodes = false })
		vim.keymap.set("i", "<c-p>", '<Plug>(copilot-previous)',
			{ noremap = true, silent = true, expr = false, replace_keycodes = false })
		vim.keymap.set("i", "<c-n>", '<Plug>(copilot-next)',
			{ noremap = true, silent = true, expr = false, replace_keycodes = false })
	end,
}
