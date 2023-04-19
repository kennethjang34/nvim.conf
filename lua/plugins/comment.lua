return {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup({
			toggler = {
				line = "gcc"
			},
			mappings = {
				basic = true,
				extra = true,
			}
		})
		vim.keymap.set("n", "--", '<plug>(comment_toggle_linewise_current)', { noremap = true, silent = true })
		vim.keymap.set("v", "--", '<plug>(comment_toggle_linewise_visual)',
			{ noremap = true, silent = true })
	end
}
