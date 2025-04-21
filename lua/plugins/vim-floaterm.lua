return {
	'voldikss/vim-floaterm',
	config = function()
		vim.g.floaterm_position = "bottomright"
		vim.g.floaterm_width = 0.6
		vim.g.floaterm_height = 0.4
		vim.g.floaterm_autoinsert = true
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			-- vim.api.nvim_set_keymap(mode, lhs, rhs, options)
			vim.keymap.set(mode, lhs, rhs, options)
		end

		local function switch_term_type()
			if vim.g.floaterm_wintype == "split" then
				vim.g.floaterm_wintype = "float"
				vim.cmd("FloatermUpdate  --width=0.6 --height=0.4 --wintype=float --position=bottomright")
			elseif vim.g.floaterm_wintype == "float" then
				vim.g.floaterm_wintype = "split"
				vim.cmd("FloatermUpdate --width=1.0 --height=0.3 --wintype=split --position=botright")
			end
		end



		-- function floatermToggle()
		-- 	if vim.o.columns > 180 then
		-- 		vim.cmd("FloatermToggle --width=0.4 --height=0.4 --wintype=split --position=right")
		-- 	else
		-- 		vim.cmd("FloatermToggle --width=0.9 --height=0.9 --wintype=0.9 --position=botright")
		-- 	end
		-- end

		map("n", "<F12>", ":FloatermNew<CR>")
		map("t", "<F12>", "<C-\\><C-n>:FloatermNew<CR>")
		map("n", "<F11>", "<C-\\><C-n>:FloatermKill<CR> <bar> :FloatermToggle<CR>")
		map("t", "<F11>", "<C-\\><C-n>:FloatermKill<CR> <bar> :FloatermToggle<CR>")
		map("n", "<F7>", ":FloatermPrev<CR>")
		map("t", "<F7>", "<C-\\><C-n>:FloatermPrev<CR>")
		map("n", "<F9>", ":FloatermNext<CR>")
		map("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>")
		map("n", "<F8>", ":FloatermToggle<CR>")
		map("t", "<F8>", "<C-\\><C-n>:FloatermToggle<CR>")
		local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
		local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
		augroup('Floaterm', { clear = true })
		autocmd('User', {
			group = 'Floaterm',
			pattern = "FloatermOpen",
			callback = function(ev)
				-- vim.cmd("startinsert!")
				-- vim.fn['floaterm#util#startinsert']()
				-- autocmd! User FloatermOpen
				-- autocmd User FloatermOpen call floaterm#util#startinsert()
				-- autocmd BufEnter <buffer> call floaterm#util#startinsert()

				-- print(string.format('event fired: %s', vim.inspect(ev)))
				-- vim.api.nvim_buf_set_keymap(0, 't', '<c-l>', '<cmd>wincmd l<cr>', { silent = true, noremap = true })
				vim.api.nvim_buf_set_keymap(0, 't', '<c-h>', '<cmd>wincmd h<cr>', { silent = true, noremap = true })
				-- vim.api.nvim_buf_set_keymap(0, 't', '<c-j>', '<cmd>wincmd j<cr>', { silent = true, noremap = true })
				vim.api.nvim_buf_set_keymap(0, 't', '<c-k>', '<cmd>wincmd k<cr>', { silent = true, noremap = true })
				vim.api.nvim_buf_set_keymap(0, "n", "<F4>",
					":FloatermUpdate --width=1.0 --height=0.3 --wintype=split --position=botright<CR>",
					{ silent = true, noremap = true })
				-- vim.api.nvim_buf_set_keymap(0, "t", "<F4>",
				vim.api.nvim_buf_set_keymap(0, "t", "<F4>", "",
					{ silent = true, noremap = true, callback = switch_term_type })
				vim.api.nvim_buf_set_keymap(0, "t", "<F6>", "",
					{ silent = true, noremap = true, callback = switch_term_type })
				-- vim.api.nvim_buf_set_keymap(0, "n", "<F6>",
				-- 	":FloatermUpdate --width=0.6 --height=0.3 --wintype=float --position=botright<CR>",
				-- 	{ silent = true, noremap = true })

				-- vim.g.floaterm_width = 0.6
				-- vim.g.floaterm_height = 0.4
				vim.api.nvim_buf_set_keymap(0, "n", "<F6>",
					":FloatermUpdate --width=0.6 --height=0.4 --wintype=float --position=" ..
					vim.g.floaterm_position .. "<CR>",
					{ silent = true, noremap = true })
				-- vim.api.nvim_buf_set_keymap(0, "t", "<F6>",
				-- 	"<C-\\><C-n>:FloatermUpdate --width=" .. vim.g.floaterm_width .. " --height=" ..
				-- 	vim.g.floaterm_height .. " --wintype=float --position=" ..
				-- 	vim.g.floaterm_position .. "<CR>",
				-- 	{ silent = true, noremap = true })
				vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", "<C-\\><C-n>", { silent = true, noremap = true })
			end
		})
	end
}
