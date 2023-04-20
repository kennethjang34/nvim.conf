return {
	'neoclide/coc.nvim',
	branch = 'release',
	config = function()
		local function map(mode, lhs, rhs, opts)
			local options = { noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend('force', options, opts)
			end
			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
		end

		--local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
		local opts = { silent = true, noremap = true, expr = true }
		vim.g.coc_global_extensions = {
			'coc-snippets',
			'coc-tsserver',
			'coc-eslint',
			'coc-prettier',
			'coc-json',
		}
		map('v', '<leader>f', '<Plug>(coc-format-selected)', opts)
		--vmap <leader>f <Plug>(coc-format-selected)
		--let g:coc_global_extensions = [
		--\ 'coc-snippets',
		--"\ 'coc-tsserver',
		--\ 'coc-eslint',
		--\ 'coc-prettier',
		--\ 'coc-json',
		--\ ]
		--inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
		map('i', '<cr>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>"', opts)
		map("i", "<C-q>", "coc#pum#visible() ? '<C-o>coc#_hide()':'<C-q>'", opts)
		map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
			opts)
		map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
		map("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true, noremap = true })
		map("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true, noremap = true })
		map("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-j>"', { silent = true, noremap = true })
		map("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-k>"', { silent = true, noremap = true })
		map("i", "<C-j>",
			'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
		map("i", "<C-k>",
			'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
		map("v", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-j>"', { silent = true, noremap = true })
		map("v", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-k>"', { silent = true, noremap = true })
		vim.opt.backup = false
		vim.opt.writebackup = false
		local keyset = vim.keymap.set
		keyset("i", "<c-space>", "coc#refresh()", opts)

		-- Use `[g` and `]g` to navigate diagnostics
		-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
		keyset("n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true, noremap = true })
		keyset("n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true, noremap = true })

		-- GoTo code navigation
		keyset("n", "gd", "<Plug>(coc-definition)", { silent = true, noremap = true })
		keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true, noremap = true })
		keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true, noremap = true })
		keyset("n", "gr", "<Plug>(coc-references)", { silent = true, noremap = true })
		function _G.show_docs()
			local cw = vim.fn.expand('<cword>')
			if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
				vim.api.nvim_command('h ' .. cw)
			elseif vim.api.nvim_eval('coc#rpc#ready()') then
				vim.fn.CocActionAsync('doHover')
			else
				vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
			end
		end

		keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })
		vim.api.nvim_create_augroup("CocGroup", {})
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
		-- Add `:Format` command to format current buffer
		vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

		-- " Add `:Fold` command to fold current buffer
		vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

		-- Add `:OR` command for organize imports of the current buffer
		vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
		local opts = { silent = true, nowait = true, expr = true }
		keyset("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : ":wincmd j<CR>"', opts)
		keyset("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : ":wincmd k<CR>"', opts)
		keyset("i", "<C-f>",
			'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
		keyset("i", "<C-b>",
			'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
		keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
		keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
	end
}
