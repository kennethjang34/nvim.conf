return {
	'junegunn/fzf.vim',
	dependencies = {
		'junegunn/fzf',
	},
	config = function()
		--local opts = { silent = true, nowait = true, expr = true }
		local keyset = vim.keymap.set
		keyset('i', '<C-f>', 'fzf#vim#complete#path("rg --files")', { silent = true, expr = true, noremap = true })
		keyset('n', '<C-/>', '<cmd>BLines<CR>', { silent = true, noremap = true })
		-- following is needed for tmux since tmux maps <C-/> to <C-_>
		keyset('n', '<C-_>', '<cmd>BLines<CR>', { silent = true, noremap = true })
		keyset('n', '<C-f>', '<cmd>Files<CR>', { silent = true, noremap = true })
		keyset('n', '<C-b>', '<cmd>Buffers<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>f', '<cmd>Files<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>b', '<cmd>Buffers<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>/.', '<cmd>BLines<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>/b', '<cmd>BLines<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>//', '<cmd>Lines<CR>', { silent = true, noremap = true })
		keyset('n', '<c-g>', '<cmd>GFiles?<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>gs', '<cmd>GFiles?<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>gf', '<cmd>GFiles<cr>', { silent = true, noremap = true })
		keyset('n', '<leader>m', '<cmd>Marks<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>M', '<cmd>Maps<CR>', { silent = true, noremap = true })
		-- keyset('n', '<C-M>', '<plug>(fzf-maps-n)', { silent = true, noremap = true, expr = false })

		keyset('i', '<C-_>', '<plug>(fzf-maps-i)', { silent = true, noremap = true, expr = false })
		keyset('x', '<C-_>', '<plug>(fzf-maps-x)', { silent = true, noremap = true, expr = false })
		keyset('o', '<C-_>', '<plug>(fzf-maps-o)', { silent = true, noremap = true, expr = false })
		keyset('n', '<leader>C', '<cmd>Commits<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>H', '<cmd>Helptags<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>hh', '<cmd>History<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>h:', '<cmd>History:<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>hc', '<cmd>History:<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>h/', '<cmd>History/<CR>', { silent = true, noremap = true })
		keyset('n', '<leader>hs', '<cmd>History/<CR>', { silent = true, noremap = true })
		vim.g.layout = { window = { width = 1.0, height = 0.5, highlight = 'Comment', rounded = false } }
		vim.g.fzf_buffers_jump = 1
		vim.g.fzf_preview_window = { 'right:60%' }
		vim.g.fzf_preview = { 'bat', '--style=numbers', '--line-range', ':300 {}' }
		vim.env.FZF_DEFAULT_OPTS = "--bind ctrl-y:preview-up,ctrl-e:preview-down,ctrl-b:preview-page-up," ..
			"ctrl-f:preview-page-down,alt-up:preview-up,alt-down:preview-down," ..
			"ctrl-h:preview-half-page-up,ctrl-l:preview-half-page-down," ..
			"ctrl-u:half-page-up,ctrl-d:half-page-down"
		--[[
		let $FZF_DEFAULT_OPTS="--bind ctrl-y:preview-up,ctrl-e:preview-down,
		\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
		\alt-up:preview-up,alt-down:preview-down,
		\ctrl-h:preview-half-page-up,ctrl-l:preview-half-page-down,
		\ctrl-u:half-page-up,ctrl-d:half-page-down"
		]]
		vim.cmd [[
		function! RipgrepFzf(query, fullscreen)
			let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
			let initial_command = printf(command_fmt, shellescape(a:query))
			let reload_command = printf(command_fmt, '{q}')
			let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
			let spec = fzf#vim#with_preview(spec, 'right', 'ctrl-/')
			call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
		endfunction
		command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

		command! -bang -complete=dir -nargs=? LS
		\ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))
		command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
		command! -bang -nargs=* BLines
		\ call fzf#vim#grep(
		\   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
		\   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))

		]]
		--\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
		--\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
		--\alt-up:preview-up,alt-down:preview-down,
		--\ctrl-h:preview-half-page-up,ctrl-l:preview-half-page-down,
		--\ctrl-u:half-page-up,ctrl-d:half-page-down"
		--\ call fzf#vim#grep(
		--\   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
		--\   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
		--let g:fzf_layout = { 'window': {
		--\ 'width': 1.0,
		--\ 'height': 0.5,
		--\ 'highlight': 'Comment',
		--\ 'rounded': v:false } }
		--let g:fzf_buffers_jump = 1
		--inoremap <expr> <C-f> fzf#vim#complete#path('rg --files')
		--nnoremap <silent> <C-/> :BLines<cr>
		--nnoremap <silent> <C-f> :Files<cr>
		--nnoremap <silent> <C-b> :Buffers<cr>
		--nnoremap <silent> <Leader>f :GFiles<cr>
		--nnoremap <silent> <Leader>b :Buffers<CR>
		--nnoremap <silent> <Leader>/. :BLines<CR>
		--nnoremap <silent> <Leader>//  :Lines<CR>
		--nnoremap <silent> <Leader>/b :BLines<CR>
		--
		--nnoremap <silent> <Leader>g :GFiles?<CR>
		--nnoremap <silent> <C-g> :GFiles?<cr>
		--nnoremap <silent> <Leader>/ :BLines<CR>
		--nnoremap <silent> <Leader>m :Marks<CR>
		--nnoremap <silent> <Leader>M :Maps<CR>
		--nnoremap <silent> <Leader>C :Commits<CR>
		--nnoremap <silent> <Leader>H :Helptags<CR>
		--nnoremap <silent> <Leader>hh :History<CR>
		--nnoremap <silent> <Leader>h: :History:<CR>
		--nnoremap <silent> <Leader>h/ :History/<CR>
		--let g:fzf_preview_window = ['right:57%']
		--let g:fzf_preview = ['bat','--style=numbers', '--line-range', ':300 {}']
	end
}
