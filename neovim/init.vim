""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       __             "
"   _____   __ __  ____  __ __  _______/  |_  ____     "
"   \__  \ |  |  \/ ___\|  |  \/  ___/\   __\/  _ \    "
"    / __ \|  |  / /_/  >  |  /\___ \  |  | (  <_> )   "
"   (____  /____/\___  /|____//____  > |__|  \____/    "
"        \/     /_____/            \/                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- vim-plug begin.
call plug#begin()

" Global
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'honza/vim-snippets' | Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes' | Plug 'bling/vim-airline'
"Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
"Plug 'godlygeek/tabular'

" ------- Web development.
"Plug 'pangloss/vim-javascript'
"Plug 'alvan/vim-closetag'

" ------- C# development.
Plug 'tpope/vim-dispatch', {'for': 'cs'}
Plug 'omnisharp/omnisharp-vim', {'for': 'cs'}
Plug 'oranget/vim-csharp', {'for': 'cs'}
"Plug 'scrooloose/syntastic', {'for': 'cs'}

" ------- Cosmetic
Plug 'flazz/vim-colorschemes'
Plug 'equalsraf/neovim-gui-shim'
Plug 'ryanoasis/vim-devicons'

" ------- University
call plug#end()
" --- vim-plug end.

" ------- EDITOR CONFIG
" be iMproved, required.
cd ~/workspace
set nocompatible
set termguicolors
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
set equalalways
set listchars=eol:¬,trail:·,tab:▸\

" ------- COLOR
syntax on
set background=dark
colorscheme wombat256mod

" ------- INDENTATION
set ts=4 sts=4 sw=4 expandtab

" ------- SEARCH
set hlsearch
set ignorecase
set smartcase
set incsearch

" ------- MOVIMENT
nnoremap j gj
nnoremap k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
let mapleader=","

" ------- ABBREVIATION
cabbrev h vert h
cabbrev sb vert sb

" ------- BINDINGS
nnoremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ------- Plugin Config
" AIRLINE
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_spell=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'VL',
            \ '' : 'VC',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
"let g:airline_left_sep=''
"let g:airline_right_sep=''

" NERDTREE
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.csproj$', '\.suo$']

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

" SYNTASTIC
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_style_error_symbol = '✠'
"let g:syntastic_warning_symbol = '!'
"let g:syntastic_style_warning_symbol = '≈'


" CTRL-P
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/][\._]?(bin|obj|references|svn|git)',
            \ 'file': '\v\.(exe|so|dll|csproj|sln|suo)$',
            \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1

" NEOMAKE
"let g:neomake_verbose = 3
let g:neomake_open_list = 2
autocmd! BufWritePost * Neomake

let g:neomake_error_sign = {
            \ 'text': '✗',
            \ 'texthl': 'ErrorMsg',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '!',
            \ 'texthl': 'WarningMsg',
            \ }

" FUNCTION find *.sln file going up directory
function! FindSLN()
    let dir = expand('%:p:h')
    let solution_files = ""

    while empty(solution_files)
        let solution_files = globpath(dir , '*.sln')
        let lastfolder = dir
        let dir = fnamemodify(dir, ':h')

        if dir ==# lastfolder
            break
        endif
    endwhile

    if empty(solution_files)
        let solution_files = ''
    endif

    let solution_files = lastfolder
    return solution_files
endfunction

"autocmd FileType cs let &l:makeprg="msbuild " . FindSLN() . " -nologo -v:q -property:GenerateFullPaths=true"
"autocmd FileType cs setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
"let g:neomake_cs_enabled_makers = []

augroup neomake_cs_maker
    au!
    au FileType cs let g:neomake_cs_msbuild_maker = {
                \ 'args': [ '-nologo', '-v:q', '-property:GenerateFullPaths=true' ],
                \ 'cwd' : FindSLN(),
                \ 'errorformat': '\ %#%f(%l\\\,%c):\ %m',
                \ 'append_file' : 0,
                \ }
    au FileType cs let g:neomake_cs_enabled_makers = ['msbuild']
augroup END

" VIM-SESSION
"set sessionoptions-=buffers
"set sessionoptions-=options
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_lock_enabled = 0
"nmap <C-S-o> :OpenSession <cr>

" TAGBAR
nmap <F8> :TagbarToggle<CR>
if has("win32")
    let g:tagbar_ctags_bin = '~\AppData\Local\nvim\autoload\ctags58\ctags.exe'

" OMNISHARP
let g:Omnisharp_start_server = 0
let g:OmniSharp_selector_ui = 'ctrlp'
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:OmniSharp_timeout = 1
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
    "autocmd TextChanged,InsertLeave *.cs SyntasticCheck
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <S-A-F10>  :OmniSharpFixIssue<cr> :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up/down by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END
