return {
	'lervag/vimtex',
	config = function()
		vim.g.vimtex_syntax_conceal_disable = 0
		vim.g.vimtex_syntax_conceal = { math_delimiters = 0, math_bounds = 0 }
		vim.g.tex_flavor = 'latex'
		vim.g.vimtex_view_method = 'skim'
		-- vim.g.vimtex_view_method = 'zathura'
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_compiler_latexmk_engines = {
			-- _ = '-xelatex',
			xelatex = '-xelatex',
			lualatex = '-lualatex',
		}
		vim.g.vimtex_matchparen_enabled = 1
		vim.g.vimtex_fold_enabled = 0

		-- vim.g["vimtex_lint_chktex_parameters"] = {
		-- 	"-q",
		-- 	"-v0",
		-- 	"-l",
		-- 	"-f%n:%l.%c:%d:%k:%m"
		-- }
		local function setup_tex_files()
			-- vim.cmd("TSBufDisable highlight")
			vim.opt_local.conceallevel = 2
		end
		vim.api.nvim_create_augroup("TexFileSettings", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = setup_tex_files,
			group = "TexFileSettings"
		})
	end
}
