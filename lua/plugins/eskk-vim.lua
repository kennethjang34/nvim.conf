return {
	'tyru/eskk.vim',
	lazy = false,
	config = function()
		-- local eskk = require('eskk')
		-- vim.keymap.nnoremap('<Space>', '<Plug>(eskk-space)', { silent = true })
		local keyset = vim.keymap.set
		keyset('i', 'jk', '<Plug>(eskk:toggle)', { noremap = true })
		keyset('c', 'jk', '<Plug>(eskk:toggle)', { noremap = true })
	end
}
