return {
	'kristijanhusak/vim-dadbod-ui',
	dependencies = {
		'tpope/vim-dadbod'
	},
	config = function()
		vim.g.db_ui_save_location = '~/.config/db_ui'
		vim.g.db_ui_execute_on_save = 1
		local keyset = vim.keymap.set
		keyset('n', '<leader>du', '<cmd>DBUIToggle<CR>', { noremap = true })
		keyset('n', '<leader>df', '<cmd>DBUIFindBuffer<CR>', { noremap = true })
		keyset('n', '<leader>dr', '<cmd>DBUIRenameBuffer<CR>', { noremap = true })
		keyset('n', '<leader>dl', '<cmd>DBUILastQueryInfo<CR>', { noremap = true })
		--nnoremap <silent> <leader>du : DBUIToggle<CR>
		--nnoremap <silent> <leader>df : DBUIFindBuffer<CR>
		--nnoremap <silent> <leader>dr : DBUIRenameBuffer<CR>
		--nnoremap <silent> <leader>dl : DBUILastQueryInfo<CR>
	end
}
