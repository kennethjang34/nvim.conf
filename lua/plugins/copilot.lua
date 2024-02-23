return {
	'zbirenbaum/copilot.lua',
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		vim.keymap.set("i", "<c-s>",
			function()
				local cp_sg = require("copilot.suggestion")
				if require("copilot.suggestion").is_visible() then
					cp_sg.dismiss()
					cp_sg.toggle_auto_trigger()
				else
					cp_sg.toggle_auto_trigger()
					cp_sg.next()
				end
			end,
			{ noremap = true, silent = true, expr = false, replace_keycodes = false })
		-- '<cmd>lua require("copilot.suggestion").dismiss()<cr> <cmd>lua require("copilot.suggestion").toggle_auto_trigger()<cr>',
		require('copilot').setup({
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = "<c-k>",
					jump_next = "<c-j>",
					accept = "<CR>",
					refresh = "gr",
					open = "<C-CR>"
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<c-l>",
					accept_word = false,
					accept_line = false,
					next = "<c-n>",
					prev = "<c-p>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				['*'] = function()
					if string.find(vim.fn.expand('%:p'), '/lc/**/*.py') or string.find(vim.fn.expand('%:p'), '/algorithm_study/**/*.py') then
						return false
					else
						return true
					end
				end,
			}
		})
	end
}
-- return {
-- 	'github/copilot.vim',
-- 	config = function()
-- 		vim.keymap.set("i", "<c-l>", 'copilot#Accept("")',
-- 			{ noremap = true, silent = true, expr = true, replace_keycodes = false })
-- 		vim.keymap.set("i", "<c-p>", '<Plug>(copilot-previous)',
-- 			{ noremap = true, silent = true, expr = false, replace_keycodes = false })
-- 		vim.keymap.set("i", "<c-n>", '<Plug>(copilot-next)',
-- 			{ noremap = true, silent = true, expr = false, replace_keycodes = false })
-- 	end,
-- }
