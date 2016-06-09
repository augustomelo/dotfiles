" --- vim-plug begin.
call plug#begin('~/.vim/plugged')

" Global
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'wombat256.vim'
Plug 'xolox/vim-session'
Plug 'vim-misc'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
"Plug 'godlygeek/tabular'
 
" ------- Web development.
"Plug 'pangloss/vim-javascript'
"Plug 'alvan/vim-closetag'

" ------- C# development.
Plug 'tpope/vim-dispatch'
Plug 'omnisharp/omnisharp-vim'
Plug 'oranget/vim-csharp'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'


" ------- Cosmetic 
Plug 'ryanoasis/vim-devicons'

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
set spell spelllang=en_us

" ------- COLOR
syntax on
set background=dark
colorscheme wombat256mod

" ------- INDENTATION 
set expandtab
set shiftround
set shiftwidth=4
set tabstop=4

" ------- SEARCH
set hlsearch
set ignorecase
set smartcase
set incsearch

" ------- MOVIMENT
nnoremap j gj
nnoremap k gk

" ------- Abbreviation
cabbrev h vert h
cabbrev sb vert sb

" ------- GVIM
" Hide toolbar vim
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" Start window size
set lines=50 columns=100
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata\ for\ Powerline\ Bold\ 11,Inconsolata\ Bold\ 11
		cd ~/workspace
	elseif has("gui_win32")
		cd ~\workspace
		set guifont=DejaVuSansMonoForPowerline_NF:h9:b,DejaVuSansMonoForPowerline_Nerd:h9:b,Consolas:h10:b
		"Better font rendering 
		if (v:version == 704 && has("patch393")) || v:version > 704
			set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1	
		endif
		
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
"function! ToggleVExplorer()
"	if exists("t:expl_buf_num")
"		let expl_win_num = bufwinnr(t:expl_buf_num)
"		if expl_win_num != -1
"			let cur_win_nr = winnr()
"			exec expl_win_num . 'wincmd w'
"			close
"			exec cur_win_nr . 'wincmd w'
"			unlet t:expl_buf_num
"		else
"			unlet t:expl_buf_num
"		endif
"	else
"		exec '1wincmd w'
"		Vexplore
"		let t:expl_buf_num = bufnr("%")
"	endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>
"
"" Hit enter in the file browser to open the selected
"" file with :vsplit to the right of the browser.
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"
"" Default to tree mode
"let g:netrw_liststyle=3


" ------- Plugin Config
" AIRLINE
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
 let g:airline_detect_spell=0
"let g:airline_left_sep=''
"let g:airline_right_sep=''

" NERDTREE
map <C-e> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.csproj$'] 

"SUPERTAB
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>"]
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabCrMapping=1
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
	\ 	call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
    \ endif

" CTRL-P
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bower_components/*,*/node_modules/*,*/.tmp/*,*.csproj,*.sln,*.suo,*.csproj.*
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1

" SYNTASTIC
let g:syntastic_error_symbol = '✗✗'
let g:syntastic_style_error_symbol = '✠✠'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

" VIM-SESSION
set sessionoptions-=buffers
set sessionoptions-=options
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" TAGBAR
let g:tagbar_ctags_bin = '~\.vim\ctags58\ctags.exe'
nmap <F8> :TagbarToggle<CR>

" OMNISHARP
let g:OmniSharp_timeout = 1
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
set noshowmatch
set foldmethod=syntax
set completeopt=menuone,preview
set splitbelow
set updatetime=500
set hidden
nnoremap <F2> :OmniSharpRename<cr>
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
augroup omnisharp_commands
	autocmd!

	autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
	autocmd TextChanged,InsertLeave *.cs SyntasticCheck
	autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

	autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
	autocmd FileType cs nnoremap <S-A-F10>  :OmniSharpFixIssue<cr> :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
	"navigate up/down by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END
