return {
	'neoclide/coc.nvim',
	branch = 'release',
	init = function()
		if os.getenv("NVM_BIN") then
			vim.g.coc_node_path = "$NVM_BIN/node"
		end
	end,
	config = function()
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end

		local opts = { silent = true, noremap = true, expr = true }
		vim.g.coc_global_extensions = {
			'coc-snippets',
			'coc-eslint',
			'coc-prettier',
			'coc-json',
			'coc-tsserver',
		}
		map('v', '<leader>f', '<Plug>(coc-format-selected)', opts)

		map('i', '<S-CR>',
			[[coc#pum#visible() ? coc#pum#confirm() :  "<S-CR>"]],
			opts)
		vim.g.coc_snippet_next = '<TAB>'
		vim.g.coc_snippet_prev = '<S-TAB>'
		-- map('i', '<TAB>',
		-- 	[[coc#jumpable() ? "\<C-r>=coc#snippet#next()\<CR>": "<TAB>"]],
		-- 	opts)
		-- map('i', '<S-TAB>',
		-- 	[[coc#jumpable() ? "\<C-r>=coc#snippet#prev()\<CR>": "<S-TAB>"]],
		-- 	opts)
		map('x', '<TAB>', '<Plug>(coc-snippets-select)', { silent = true, noremap = true })

		map("i", "<C-q>", "coc#pum#visible() ? '<C-o>coc#_hide()':'\\<C-q>'", opts)
		map("i", "<C-k>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"]], opts)
		map("i", "<C-j>", 'coc#pum#visible() ? coc#pum#next(1) : "<C-j>"',
			opts)
		map("i", "<C-u>", [[coc#pum#visible() ? coc#pum#scroll(0) : "\<C-u>"]], opts)
		map("i", "<C-d>", 'coc#pum#visible() ? coc#pum#scroll(1) : v:lua.check_back_space() ? "<C-d>" : coc#refresh()',
			opts)
		map("i", "<C-q>", "coc#pum#visible() ? '<C-o>coc#_hide()':'\\<C-q>'", opts)
		map("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true, noremap = true })
		vim.opt.backup = false
		vim.opt.writebackup = false
		local keyset = vim.keymap.set
		keyset("i", "<c-space>", "coc#refresh()", opts)

		keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true, noremap = true })
		keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true, noremap = true })

		keyset("n", "gd", "<Plug>(coc-definition)", { silent = true, noremap = true })
		keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true, noremap = true })
		keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true, noremap = true })
		keyset("n", "gr", "<Plug>(coc-references)", { silent = true, noremap = true })
		keyset("n", "gh", "<Plug>(coc-diagnostic-info)",
			{ silent = true, noremap = true })
		keyset("n", "<c-q>", "<Plug>(coc-float-hide)", { silent = true, noremap = true })
		_G.show_docs = function()
			local cw = vim.fn.expand('<cword>')
			if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
				vim.api.nvim_command('h ' .. cw)
			elseif vim.api.nvim_eval('coc#rpc#ready()') then
				vim.fn.CocActionAsync('definitionHover')
				-- vim.fn.CocActionAsync('doHover')
			else
				vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
			end
		end

		-- -- following keybinding is currently set in init.vim for tex specific issue. (can just migrate here if needed)
		keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })


		vim.api.nvim_create_augroup("CocGroup", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "CocGroup",
			command = "silent call CocActionAsync('highlight')",
			desc = "Highlight symbol under cursor on CursorHold"
		})
		keyset("n", "<F2>", "<Plug>(coc-rename)", { silent = true, noremap = true })
		keyset("n", "<leader>cc", "<Plug>(coc-codeaction-cursor)", { silent = true, noremap = true })
		keyset("n", "<leader>cf", "<Plug>(coc-codeaction)", { silent = true, noremap = true })
		keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true, noremap = true })
		keyset("x", "<leader>rf", "<Plug>(coc-codeaction-refactor-selected)", { silent = true, noremap = true })
		keyset("n", "<leader>rf", "<Plug>(coc-codeaction-refactor)", { silent = true, noremap = true })
		vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

		vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

		vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
		local opts = { silent = true, nowait = true, expr = true, noremap = true }
		keyset("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1,1) : ":wincmd j<CR>"', opts)
		keyset("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0,1) : ":wincmd k<CR>"', opts)

		-- keyset("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
		-- keyset("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
		-- keyset("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1,1) : "<C-j>"', opts)
		-- keyset("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0,1) : "<C-k>"', opts)
		keyset("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
		keyset("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)

		keyset('n', '<leader>jm', '<plug>(coc-float-jump)', { silent = true, noremap = true })
		keyset('n', '<space>y', '<cmd>CocList --normal yank<cr>', { silent = true, noremap = true })
		-- keyset('i', '<M-j>', '<C-r>=coc#snippet#next()<CR>', { silent = true, noremap = true })
		-- keyset('i', '<M-k>', '<C-r>=coc#snippet#prev()<CR>', { silent = true, noremap = true })
	end
}
