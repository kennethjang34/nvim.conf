
let maplocalleader = " "
let path_to_open = expand('%:p:h')
exec "lcd " . path_to_open
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
set guicursor=i:block

let g:rooter_target='*.yml,*.yaml'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_manual_only = 1
nnoremap <SPACE> <Nop>
let mapleader=" "
autocmd FileType * nnoremap <nowait> <buffer> <leader>cd :cd %:p:h<CR>: pwd<CR>
command! -nargs=* W 
augroup razorToHTML
    autocmd!
    autocmd BufNewFile,BufRead **/*.cshtml :set filetype=html
augroup END
" nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
" nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
" xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
" nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
" nnoremap <silent>       <LocalLeader>d :MagmaDelete<CR>
" nnoremap <silent>       <LocalLeader>o :MagmaShowOutput<CR>


let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "kitty"

set ignorecase
set smartcase
set directory^=$HOME/.vim/swap//
set backupdir^=$HOME/.vim/backup//
set undodir^=$HOME/.vim/undo//

autocmd FocusGained * checktime
se cursorline
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=4
set smartindent
autocmd Filetype python setlocal expandtab
" inoremap jk <ESC>
" let g:NERDCreateDefaultMappings = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
set number
set relativenumber
set smarttab
set cindent
set termguicolors
" let g:airline_powerline_fonts = 1
" let g:airline_theme='base16_gruvbox_dark_hard'
hi Visual term=NONE cterm=NONE gui=NONE

set hidden 
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <Leader>el : e ~/.config/nvim/lua/init.lua<CR>
nnoremap <Leader>ev : e $MYVIMRC<cr>
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
  	let [l:_,l:prevJmp] =getjumplist()
    exe "normal! \<c-o>"
    let nowName = bufname('%')
    if nowName != startName
      break
    endif
	let [l:_, l:pos] = getjumplist()
	if l:prevJmp == l:pos
		break
	endif
	
  endwhile
endfunction

nnoremap <silent> <S-TAB> :call GoBackToRecentBuffer()<Enter>

" Fast window resizing with left/right keys (horizontal); / and up/down keys (vertical)
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
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex="lualatex --shell-escape %O %S"',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ]
    \}
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
set title
set titlestring=%f


" nnoremap <silent> K :call <sid>show_documentation()<cr>
"     function! s:show_documentation()
"       if index(['vim', 'help'], &filetype) >= 0
"         execute 'help ' . expand('<cword>')
"       elseif &filetype ==# 'tex'
"         VimtexDocPackage
"       else
"         call CocAction('doHover')
"       endif
" endfunction

" silent! inoremap  <C-l>   <Plug>(eskk:toggle)
let g:eskk#directory = "~/.config/eskk"
let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
"
autocmd User eskk-initialize-post call s:eskk_initial_pre()
function! s:eskk_initial_pre() abort
    EskkUnmap -type=sticky ;
    EskkMap -type=sticky Q
endfunction
function L_eskk_get_mode()
    if (mode() == 'i') && eskk#is_enabled()
        return g:eskk#statusline()
    else
        return ''
    endif
endfunction
let g:lightline = {
\   'active': {
\     'left': [ ['mode', 'paste'], ['readonly', 'filename', 'eskk', 'modified'] ]
\   },
\   'component_function': {
\     'eskk': 'L_eskk_get_mode'
\   },
\ }
