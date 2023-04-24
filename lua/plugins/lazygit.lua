return {
	'kdheepak/lazygit.nvim',
	config = function()
		vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>LazyGit<CR>', { noremap = true, silent = true })
	end
}
