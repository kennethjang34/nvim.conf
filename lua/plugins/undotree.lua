return {
	'mbbill/undotree',
	lazy = false,
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
	keys = {
		{
			"<leader>u", "<cmd>UndotreeToggle<CR>" } }
}
