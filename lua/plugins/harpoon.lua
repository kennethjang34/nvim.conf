return {
	'ThePrimeagen/harpoon',
	config = function()
		--require('harpoon').setup()
		local keyset = vim.keymap.set
		keyset('n', '<leader>a', '<cmd>lua require("harpoon.mark").add_file()<cr>', { noremap = true })
		keyset('n', '<leader>hp', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true })
		keyset('n', '<leader>p', '<cmd>lua require("harpoon.ui").nav_prev()<cr>', { noremap = true })
		keyset('n', '<leader>n', '<cmd>lua require("harpoon.ui").nav_next()<cr>', { noremap = true })
		--nnoremap <silent> <Leader>a :lua require("harpoon.mark").add_file()<CR>
		--nnoremap <silent> <Leader>hp :lua require("harpoon.ui").toggle_quick_menu()<CR>
		--nnoremap <silent> <leader>n :lua require("harpoon.ui").nav_next()<CR>
		--nnoremap <silent> <leader>p :lua require("harpoon.ui").nav_prev()<CR>
	end,
}
