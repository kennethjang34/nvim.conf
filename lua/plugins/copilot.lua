return {
	'zbirenbaum/copilot.lua',
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		vim.keymap.set("i", "<M-s>",
			function()
				local cp_sg = require("copilot.suggestion")
				-- if require("copilot.suggestion").is_visible() then
				if require("copilot.suggestion").is_visible() then
					cp_sg.dismiss()
					cp_sg.toggle_auto_trigger()
				elseif not cp_sg.auto_trigger then
					cp_sg.toggle_auto_trigger()
					cp_sg.next()
				end
			end,
			{ noremap = true, silent = true, expr = false, replace_keycodes = false })
		-- '<cmd>lua require("copilot.suggestion").dismiss()<cr> <cmd>lua require("copilot.suggestion").toggle_auto_trigger()<cr>',
		vim.keymap.set("i", "<M-a>", '<nop>', {})
		vim.keymap.set("i", "<M-n>", '<nop>', {})
		vim.keymap.set("i", "<M-p>", '<nop>', {})
		vim.keymap.set("i", "<M-j>", '<nop>', {})
		vim.keymap.set("i", "<M-k>", '<nop>', {})
		vim.keymap.set("i", "<M-o>", '<nop>', {})
		require('copilot').setup({
			panel = {
				enabled = false,
				auto_refresh = false,
				keymap = {
					jump_prev = "<C-k>",
					jump_next = "<C-j>",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-O>"
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<M-a>",
					accept_word = false,
					accept_line = false,
					next = "<M-n>",
					prev = "<M-p>",
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
					if string.match(vim.fn.expand('%:p'), '.*/lc/.*/%.py') or string.match(vim.fn.expand('%:p'), '.*/algorithm_study/.*/*%.py') then
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
