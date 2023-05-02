call plug#begin() 
call plug#end()
"autocmd BufEnter * lcd %:p:h
let path_to_open = expand('%:p:h')
exec "lcd " . path_to_open
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
set guicursor=i:block
"augroup terminal
	"autocmd!
	"autocmd FileType floaterm tnoremap <buffer> <ESC> <C-\><C-n>
"augroup END

let g:rooter_target='*.yml,*.yaml'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
let g:rooter_change_directory_for_non_project_files = 'current'
"let g:rooter_change_directory_for_non_project_files = ''
let g:rooter_manual_only = 1
"set noautochdir
nnoremap <SPACE> <Nop>
let mapleader=" "
"for which key plugin
"set timeoutlen=500
"nnoremap <silent><leader> :WhichKey '<Space>'<CR>
autocmd FileType * nnoremap <nowait> <buffer> <leader>cd :cd %:p:h<CR>: pwd<CR>
"function! StartUp()
    "if !argc() && !exists("s:std_in")
        "NvimTreeToggle
    "end
    "if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
        "exe 'NvimTreeOpen' argv()[0]
		
        "wincmd p
        "ene
    "end
"endfunction

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * call StartUp()
"function! StartUp()
    "if 0 == argc()
		"NvimTreeToggle
        ""NERDTree
    "end
"endfunction

"if the following line is removed, making a type of :W when trying to type :w
"will execute fzf's Windows command as vim autocompletes the command to
"Windows (because there is no other commands starting with W)
command! -nargs=* W 
augroup razorToHTML
    autocmd!
    autocmd BufNewFile,BufRead **/*.cshtml :set filetype=html
augroup END
let g:floaterm_position ='bottomright'
let g:floaterm_width = 0.4
let g:floaterm_height = 0.4
nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <LocalLeader>d :MagmaDelete<CR>
nnoremap <silent>       <LocalLeader>o :MagmaShowOutput<CR>


let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "kitty"

set ignorecase
set smartcase
set directory^=$HOME/.vim/swap//
set backupdir^=$HOME/.vim/backup//
set undodir^=$HOME/.vim/undo//

"autocmd VimEnter * call StartUp()
autocmd FocusGained * checktime
se cursorline
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=4
"nnoremap <expr><nowait> <C-q> coc#_hide()
"nnoremap <expr><nowait> <C-q> coc#pum#visible() ? coc#_hide():'<C-q>'
"inoremap <expr><C-q> coc#pum#visible() ? "\<C-o>coc#_hide()":"\<C-q>"
set smartindent
inoremap jk <ESC>
let g:NERDCreateDefaultMappings = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
set number
set relativenumber
set smarttab
set cindent
set termguicolors
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'
hi Visual term=NONE cterm=NONE gui=NONE



set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
"nnoremap <silent> <F2> <Plug> (coc-rename)

" Remap keys for gotos
"nnoremap <silent> gd <Plug>(coc-definition)
"nnoremap <silent> gy <Plug>(coc-type-definition)
"nnoremap <silent> gi <Plug>(coc-implementation)
"nnoremap <silent> gr <Plug>(coc-references)
"function! ShowDocumentation()
  "if CocAction('hasProvider', 'hover')
    "call CocActionAsync('doHover')
  "else
    "call feedkeys('K', 'in')
  "endif
"endfunction
" Use K to show documentation in preview window
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"nnoremap <silent> K :call ShowDocumentation()<CR>

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nnoremap <F2> <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nnoremap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xnoremap <leader>a  <Plug>(coc-codeaction-selected)
"nnoremap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
"nnoremap <leader>cc  <Plug>(coc-codeaction-cursor)
"nnoremap <leader>cf  <Plug>(coc-codeaction)
" Fix autofix problem of current line
"nnoremap <leader>qf  <Plug>(coc-fix-current)
"xmap <silent> <leader>rf  <Plug>(coc-codeaction-refactor-selected)
"nmap <silent> <leader>rf  <Plug>(coc-codeaction-refactor)
" Create mappings for function text object, requires document symbols feature of languageserver.
"xnoremap if <Plug>(coc-funcobj-i)
"xnoremap af <Plug>(coc-funcobj-a)
"onoremap if <Plug>(coc-funcobj-i)
"onoremap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"let g:fzf_layout = { 'window': {
				"\ 'width': 1.0,
				"\ 'height': 0.5,
				"\ 'highlight': 'Comment',
				"\ 'rounded': v:false } }
"let g:fzf_buffers_jump = 1

"command! -bang -complete=dir -nargs=? LS
	"\ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
"command! -bang -nargs=* BLines
    "\ call fzf#vim#grep(
    "\   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    "\   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))

"inoremap <expr> <C-f> fzf#vim#complete#path('rg --files')
"nnoremap <silent> <C-/> :BLines<cr>
"nnoremap <silent> <C-f> :Files<cr>
"nnoremap <silent> <C-f> :Files<cr>
"nnoremap <silent> <C-b> :Buffers<cr>
"nnoremap <silent> <Leader>f :GFiles<cr>
"nnoremap <silent> <Leader>b :Buffers<CR>
"nnoremap <silent> <Leader>/. :BLines<CR>
"nnoremap <silent> <Leader>//  :Lines<CR>
"nnoremap <silent> <Leader>/b :BLines<CR>
"nnoremap <silent> <Leader>g :GFiles?<CR>
"nnoremap <silent> <C-g> :GFiles?<cr>
"nnoremap <silent> <Leader>/ :BLines<CR>
"nnoremap <silent> <Leader>m :Marks<CR>
"nnoremap <silent> <Leader>M :Maps<CR>
"nnoremap <silent> <Leader>C :Commits<CR>
"nnoremap <silent> <Leader>H :Helptags<CR>
"nnoremap <silent> <Leader>hh :History<CR>
"nnoremap <silent> <Leader>h: :History:<CR>
"nnoremap <silent> <Leader>h/ :History/<CR> 
"let g:fzf_preview_window = ['right:57%']
"let g:fzf_preview = ['bat','--style=numbers', '--line-range', ':300 {}']
"let g:fzf_preview =
"

"let $FZF_DEFAULT_OPTS="
"\ --bind ctrl-y:preview-up,ctrl-e:preview-down,
"\ctrl-b:preview-page-up,ctrl-f:preview-page-down,
"\alt-up:preview-up,alt-down:preview-down,
"\ctrl-h:preview-half-page-up,ctrl-l:preview-half-page-down,
"\ctrl-u:half-page-up,ctrl-d:half-page-down"
"--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
"nnoremap <silent> <Leader>a :lua require("harpoon.mark").add_file()<CR>
"nnoremap <silent> <Leader>hp :lua require("harpoon.ui").toggle_quick_menu()<CR>
"nnoremap <silent> <leader>n :lua require("harpoon.ui").nav_next()<CR>
"nnoremap <silent> <leader>p :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <Leader>el : e ~/.config/nvim/lua/init.lua<CR>
nnoremap <Leader>ev : e $MYVIMRC<cr>
"inoremap <c-x><c-l> <plug>(fzf-complete-line)
if !exists('*ReloadVimrc')
    fun! ReloadVimrc()
	let save_cursor = getcurpos()
	source $MYVIMRC
	call setpos('.',save_cursor)
    endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()
set nofoldenable
lua require("init")
"augroup packer_user_config
  "autocmd!
  "autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  " INSERT mode floating window scrolling {{{
function! s:coc_float_scroll(amount) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  try
    let last_amount = nvim_win_get_var(float, 'coc_float_scroll_last_amount')
  catch
    let last_amount = 0
  endtry
  if a:amount > 0
    if pos[0] == 1
      let pos[0] += a:amount + win_height - 2
    elseif last_amount > 
      let pos[0] += a:amount
    else
      let pos[0] += a:amount + win_height - 3
    endif
    let pos[0] = pos[0] < buf_height ? pos[0] : buf_height
  elseif a:amount < 0
    if pos[0] == buf_height
      let pos[0] += a:amount - win_height + 2
    elseif last_amount < 0
      let pos[0] += a:amount
    else
      let pos[0] += a:amount - win_height + 3
    endif
    let pos[0] = pos[0] > 1 ? pos[0] : 1
  endif
  call nvim_win_set_var(float, 'coc_float_scroll_last_amount', a:amount)
  call nvim_win_set_cursor(float, pos)
  return ''
endfunction
  set scrolloff=8
vnoremap <c-j> :m+<cr>gv
vnoremap <c-k> :m-2<cr>gv
function! GoBackToRecentBuffer()
  let startName = bufname('%')
  while 1
    exe "normal! \<c-o>"
    let nowName = bufname('%')
    if nowName != startName
      break
    endif
  endwhile
endfunction
nnoremap <silent> <S-TAB> :call GoBackToRecentBuffer()<Enter>
" nnoremap <C-q> <Nop>

" Fast window resizing with +/- keys (horizontal); / and * keys (vertical)
if bufwinnr(1)
  nnoremap <S-Up> <C-W>+
  nnoremap <S-Down> <C-W>-
  nnoremap <S-Left> <c-w><
  nnoremap <S-Right> <c-w>>
endif
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>
"nnoremap <space>x <Plug>JupyterExecute
"nnoremap <LocalLeader>X <Plug>JupyterExecuteAll
