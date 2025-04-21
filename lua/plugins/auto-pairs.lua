return {
	-- 'jiangmiao/auto-pairs',
	'LunarWatcher/auto-pairs',
	lazy = false,
	enabled = true,
	config = function()
		local keyset = vim.keymap.set
		vim.g.AutoPairsShortcutFastWrap = '<M-l>'
		vim.g.AutoPairsShortcutBackInsert = '<M-h>'
		vim.g.AutoPairsMapCh = 0
		vim.g.AutoPairsShortcutToggle = ""
		vim.g.AutoPairsMultilineClose = 0
		vim.g.AutoPairsShortcutJump = 0
		vim.g.AutoPairsShortcutToggle = 0
		local texAug = vim.api.nvim_create_augroup("AutoPairs", { clear = true })
		vim.g.AutoPairsSearchCloseAfterSpace = 0
		vim.g.AutoPairsStringHandlingMode = 1
		vim.g.AutoPairsMapBS = 1,
			vim.api.nvim_create_autocmd('FileType', {
				pattern = { "tex", "markdown", "racket" },
				callback = function()
					if vim.bo.filetype == 'tex' or vim.bo.filetype == 'markdown' then
						vim.b.AutoPairs = vim.fn["autopairs#AutoPairsDefine"]({
							["$"] = "$",
							["'"] = "",
							["`"] = "",
							["'''"] = "",
							["```"] = ""
						}
						)
					elseif vim.bo.filetype == 'racket' then
						vim.b.AutoPairs = vim.fn["autopairs#AutoPairsDefine"]({
							["'"] = "",
							["`"] = ""
						}
						)
					else
					end
				end,
				group = "AutoPairs"
			})
	end
}
