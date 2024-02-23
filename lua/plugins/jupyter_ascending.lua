return {
	'untitled-ai/jupyter_ascending.vim',
	config = function()
		--require('jupyter_ascending').setup()
		local keyset = vim.keymap.set
		-- keyset('n', '<leader>jx', '<Plug>JupyterExecute', { noremap = true, silent = true })
		-- keyset('n', '<leader>jX', '<Plug>JupyterExecute', { noremap = true, silent = true })
		local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
		local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
		augroup('JupyterAscending', { clear = true })
		autocmd({ 'BufRead', 'BufNewFile' }, {
			group = 'JupyterAscending',
			pattern = "*.sync.py",
			callback = function()
				vim.api.nvim_buf_set_keymap(0, 'n', '<leader>jx', '<Plug>JupyterExecute',
					{ noremap = true, silent = true })
				vim.api.nvim_buf_set_keymap(0, 'n', '<leader>jX', '<Plug>JupyterExecuteAll',
					{ noremap = true, silent = true })
			end
		})
	end
	--nnoremap <space>x <Plug>JupyterExecute
	--nnoremap <LocalLeader>X <Plug>JupyterExecuteAll
}
