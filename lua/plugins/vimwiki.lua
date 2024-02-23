return {
	'vimwiki/vimwiki',
	enabled = false,
	config = function()
		local keyset = vim.keymap.set
		-- vim.g.vimwiki_key_mappings = { all_maps = 1, global = 1 }
		keyset('n', '<leader>ww', '<Plug>VimwikiIndex', { noremap = true, silent = true })
		keyset('n', '<leader>wt', '<Plug>VimwikiTabIndex', { noremap = true, silent = true })
		keyset('n', '<leader>ws', '<Plug>VimwikiUISelect', { noremap = true, silent = true })
		local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
		local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
		augroup('VimWiki', { clear = true })
		autocmd('BufRead,BufNewFile', {
			group = 'VimWiki',
			pattern = "*.wiki",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ll', '<Plug>VimwikiBaddLink',
					{ noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<Plug>VimwikiFollowLink',
					{ noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ln', '<Plug>VimwikiNextLink',
					{ noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(0, 'n', '<leader>lp', '<Plug>VimwikiPrevLink',
					{ noremap = true, silent = true })
			end
		})
		-- vim.g.db_ui_save_location = '~/.config/db_ui'
		-- vim.g.db_ui_execute_on_save = 1
		-- keyset('n', '<leader>du', '<cmd>DBUIToggle<CR>', { noremap = true })
		-- keyset('n', '<leader>df', '<cmd>DBUIFindBuffer<CR>', { noremap = true })
		-- keyset('n', '<leader>dr', '<cmd>DBUIRenameBuffer<CR>', { noremap = true })
		-- keyset('n', '<leader>dl', '<cmd>DBUILastQueryInfo<CR>', { noremap = true })
	end
}
