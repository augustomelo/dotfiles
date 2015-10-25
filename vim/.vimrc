" --- vim-plug begin.
call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'

" ------- Web development.
Plug 'pangloss/vim-javascript'

" ------- University
Plug 'javacomplete'
call plug#end()
" --- vim-plug end.

" ------- EDITOR CONFIG
" be iMproved, required.
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set cursorline
set noswapfile
set number
set relativenumber
set linebreak

" ------- COLOR
syntax on
colorscheme codeschool
set t_Co=256

" ------- INDENTATION 
set noexpandtab
set shiftround
set shiftwidth=4
set tabstop=4

"  ------- SEARCH
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
    set guifont=Inconsolata\ Bold\ 11
	set clipboard=unnamedplus
	cd /home/augusto/workspace
  elseif has("gui_win32")
    set guifont=Consolas:h10:b
	set clipboard=unnamed
	cd C:\Users\augustomelo\workspace
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


" ------- Plugin Config
" airline
set laststatus=2
"let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3
