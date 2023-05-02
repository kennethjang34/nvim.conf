return {
	'github/copilot.vim',
	config = function()
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<c-l>", 'copilot#Accept("")',
			{ noremap = true, silent = true, expr = true, replace_keycodes = false })
	end,
	-- inoremap <silent><script><expr> <Right> copilot#Accept("")
	-- inoremap <silent> <C-p> <Plug>(copilot-previous)
	-- inoremap <silent> <C-n> <Plug>(copilot-next)
	-- let g:copilot_no_tab_map = v:true
}
