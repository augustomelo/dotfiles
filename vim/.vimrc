" --- vim-plug begin.
call plug#begin('~/.vim/plugged')

call plug#end()
" --- vim-plug end.


" be iMproved, required.
set nocompatible

" Set the default color.
syntax on
colorscheme codeschool

" Set font.
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ Bold\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11:b
  endif
endif

" Configure the identation.
set noexpandtab
set shiftround
set shiftwidth=4
set tabstop=4
"
" Display the line numbers and relative to the position.
set number
set relativenumber

" Highligth search.
set hlsearch
set smartcase

" Invisible characters.
set list
set listchars=tab:▸\ ,eol:¬

" Start window size
set lines=50 columns=100

" Hide toolbar vim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

" This make the alt biding work on the gnome-terminal, vim, etc.
let c='a'
while c <= 'z'
  exec "set <M-".c.">=\e".c
  exec "imap \e".c." <M-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Enable 256 color in vim.
set t_Co=256

" Vim copy to the OS clipboard.
set clipboard=unnamedplus

