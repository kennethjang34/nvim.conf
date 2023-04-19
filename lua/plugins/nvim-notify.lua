return {
	"rcarriga/nvim-notify",
	enabled = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local nvim_notify = require('notify')
		nvim_notify.setup({
			stages = 'fade',
			timeout = 3000,
			top_down = true,
			minimum_width = 30,
			--maximum_width = 10,
			render = 'simple',
			icons = {
				ERROR = " ",
				WARN = " ",
				INFO = " ",
				DEBUG = " ",
				TRACE = " ",
			},
		})
		vim.api.nvim_set_keymap('n', '<leader>dn', ':lua require("notify").dismiss()<CR>',
			{ noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader>kn', ':lua require("notify").dismiss()<CR>',
			{ noremap = true, silent = true })
	end
}
