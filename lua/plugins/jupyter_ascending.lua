return {
	'untitled-ai/jupyter_ascending.vim',
	config = function()
		--require('jupyter_ascending').setup()
		local keyset = vim.keymap.set
		keyset('n', '<leader>x', '<Plug>JupyterExecute', { noremap = true, silent = true })
		keyset('n', '<leader>S', '<Plug>JupyterExecute', { noremap = true, silent = true })
	end,
	--nnoremap <space>x <Plug>JupyterExecute
	--nnoremap <LocalLeader>X <Plug>JupyterExecuteAll
}
