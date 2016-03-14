" --- vim-plug begin.
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'wombat256.vim'
" ------- Web development.
"Plug 'pangloss/vim-javascript'
"Plug 'alvan/vim-closetag'

" ------- University
call plug#end()
" --- vim-plug end.

" ------- EDITOR CONFIG
" be iMproved, required.
set nocompatible
filetype plugin indent on
set encoding=utf-8
set fileencoding=utf-8
set cursorline
set noswapfile
set number
set relativenumber
set linebreak
set showcmd

" ------- COLOR
syntax on
set background=dark
colorscheme wombat256mod

" ------- INDENTATION 
set noexpandtab
set shiftround
set shiftwidth=4
set tabstop=4

" ------- SEARCH
set hlsearch
set smartcase

" ------- GVIM
" Hide toolbar vim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" Start window size
set lines=50 columns=100
if has("gui_running")
  if has("gui_gtk2")
    "set guifont=Inconsolata\ Bold\ 11
	set guifont=Inconsolata\ for\ Powerline\ Bold\ 11
	cd ~/workspace
  elseif has("gui_win32")
    set guifont=Consolas:h10:b
	cd C:\Users\augustomelo\workspace
	
	" Syntastic config to find jshint in windows.
	let g:syntastic_javascript_jshint_exec='C:\Users\augustomelo\AppData\Roaming\npm\jshint.cmd'
  endif
endif

" ------- FIXES
" This make the alt biding work on the gnome-terminal, vim, etc.
let c='a'
while c <= 'z'
  exec "set <M-".c.">=\e".c
  exec "imap \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

set backspace=2

" ------- NETRW config
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3


" ------- Plugin Config
" AIRLINE
set laststatus=2
let g:airline_powerline_fonts = 1
"let g:airline_left_sep=''
"let g:airline_right_sep=''

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3


" CLOSETAG
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" CTRL-P
"ignore folders
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bower_components/*,*/node_modules/*,*/.tmp/*
"ignore files
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"set local working directory. 
let g:ctrlp_working_path_mode = 'ra'

"INDENTLINE
let g:indentLine_char = '.'

" SUPERTAB
let g:SuperTabDefaultCompletionType = 'context'

