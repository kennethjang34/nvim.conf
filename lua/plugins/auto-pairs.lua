return {
	'jiangmiao/auto-pairs',
	config = function()
		local keyset = vim.keymap.set
		-- Default System Shortcuts:
		--   <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
		--   <BS>  : Delete brackets in pair
		--   <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
		-- <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
		--   <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
		--   <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)
		-- vim.g.autopair_map_cr = 0

		-- keyset("i", '<cr>', 'coc#pum#visible() ? coc#_select_confirm() :"\\<C-g>u\\<CR><C-r>=AutoPairsReturn()\\<CR>"')
		-- vim.g.AutoPairsShortcutFastWrap = '<C-k>'
	end
}
