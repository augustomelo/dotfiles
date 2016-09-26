" vim:fdm=marker

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       __             "
"   _____   __ __  ____  __ __  _______/  |_  ____     "
"   \__  \ |  |  \/ ___\|  |  \/  ___/\   __\/  _ \    "
"    / __ \|  |  / /_/  >  |  /\___ \  |  | (  <_> )   "
"   (____  /____/\___  /|____//____  > |__|  \____/    "
"        \/     /_____/            \/                  "
"                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug {{{
call plug#begin()
    " Global {{{
    Plug 'scrooloose/nerdtree'
    Plug 'neomake/neomake'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'ervandew/supertab'
    Plug 'Raimondi/delimitMate'
    Plug 'scrooloose/nerdcommenter'
    Plug 'majutsushi/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'honza/vim-snippets' | Plug 'garbas/vim-snipmate'
    Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
    Plug 'vim-airline/vim-airline-themes' | Plug 'bling/vim-airline'
    Plug 'godlygeek/tabular'
    Plug 'alvan/vim-closetag'
    Plug 'Valloric/MatchTagAlways'
    " }}}

    " Web development {{{
    "Plug 'pangloss/vim-javascript'
    "Plug 'alvan/vim-closetag'
    " }}}

    " C# {{{
    "Plug 'omnisharp/omnisharp-vim', {'for': 'cs'}
    "Plug 'tpope/vim-dispatch', {'for': 'cs'}
    "Plug 'oranget/vim-csharp', {'for': 'cs'}
    "Plug 'scrooloose/syntastic', {'for': 'cs'}
    " }}}

    " Typescript {{{
    Plug 'leafgarland/typescript-vim'
    " }}}

    " Cosmetic {{{
    "Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'
    Plug 'equalsraf/neovim-gui-shim'
    Plug 'ryanoasis/vim-devicons'
    " }}}

    " University {{{
    " }}}
call plug#end()
" }}}

" Editor {{{
filetype plugin indent on
cd ~/workspace

set termguicolors
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
set noshowmatch
set foldmethod=syntax
set completeopt=menuone,preview,noinsert
set splitright
set splitbelow
set updatetime=500
set hidden
set mouse=a
set background=dark
set ts=4 sts=4 sw=4 expandtab
set hlsearch
set ignorecase
set smartcase
set incsearch
" }}}

" Color {{{
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme base16-ocean
let base16colorspace=256
highlight Search guibg=none guifg=#d70000 gui=underline
" }}}

" Abbreviation {{{
cabbrev h vert h
cabbrev sb vert sb
cabbrev %s %s/\v
" }}}

" Bindings {{{

" Leader {{{
let mapleader=","

nnoremap <Leader>n :nohlsearch<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>w :write<CR>
" }}}

" Command {{{
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" }}}

" Insert {{{
if has("win32")
    inoremap <S-Insert> <Esc>:set paste<CR>"*P:set nopaste<CR>:echo <CR>
else
    inoremap <S-Insert> <Esc>:set paste<CR>"+P:set nopaste<CR>:echo <CR>
endif
" }}}

" Normal {{{
nnoremap j gj
nnoremap k gk
nnoremap / /\v
nnoremap <space> za
nnoremap Y y$
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
nnoremap Q <nop>
nnoremap q: <nop>
nnoremap K <nop>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has("win32")
    nnoremap <S-Insert> :set paste<CR>"*P:set nopaste<CR>
else
    nnoremap <S-Insert> :set paste<CR>"+P:set nopaste<CR>
endif
" }}}

" Visual {{{
vnoremap / /\v
if has("win32")
    vnoremap <C-Insert> "*y
else
    vnoremap <C-Insert> "+y
endif
" }}}


" }}}

" Plugin Config {{{
" Airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_spell=0
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
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
" }}}

" NERDtree {{{
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.csproj.user$', '\.suo$']
" }}}

" Supertab {{{
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>"]
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabCrMapping=1
autocmd FileType *
            \ if &omnifunc != '' |
            \   call SuperTabChain(&omnifunc, "<c-p>") |
            \ 	call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
            \ endif
" }}}

" Ctrl-P {{{
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/][\._]?(bin|obj|references|svn|git|node_modules|typings)',
            \ 'file': '\v\.(exe|so|dll|csproj|sln|suo)$',
            \ }
let g:ctrlp_working_path_mode = 0
" }}}

" Neomake {{{
"let g:neomake_verbose = 3
let g:neomake_open_list = 2
let g:neomake_list_height=4
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
" }}}

" Closetag {{{
let g:closetag_filenames = "*.html,*.xml,*.ts"
" }}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>
if has("win32")
    let g:tagbar_ctags_bin = '~\AppData\Local\nvim\autoload\ctags58\ctags.exe'
endif
" }}}

" Omnisharp {{{
"let g:Omnisharp_start_server = 0
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_timeout = 1
nnoremap <F2> :OmniSharpRename<cr>
nnoremap <Leader><space> :OmniSharpGetCodeActions<cr>
augroup omnisharp_commands
    autocmd!

    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
    "autocmd TextChanged,InsertLeave *.cs SyntasticCheck
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <S-A-F10>  :OmniSharpFixIssue<cr> :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <Leader>dc :OmniSharpDocumentation<cr>
    "navigate up/down by method/property/field
    "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END
" }}}
" }}}
