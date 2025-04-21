return {
	'vim-airline/vim-airline',
	config = function()
		vim.g.airline_powerline_fonts = 1
		vim.g.airline_theme = 'base16_gruvbox_dark_hard'
		vim.g['airline#extensions#tabline#enabled'] = 1
		vim.g['airline#extensions#tabline#left_sep'] = ' '
		vim.g['airline#extensions#tabline#left_alt_sep'] = '|'
	end,
}
