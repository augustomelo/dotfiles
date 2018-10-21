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
" Plugins {{{
call plug#begin()

" Cosmetic {{{
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
Plug 'equalsraf/neovim-gui-shim'
Plug 'sheerun/vim-polyglot'
" }}}

" Global {{{
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
au User lsp_setup call lsp#register_server({
    \ 'name': 'java',
    \ 'cmd': {server_info->['java',
        \ '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \ '-Dosgi.bundles.defaultStartLevel=4',
        \ '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \ '-Dlog.protocol=true',
        \ '-Dlog.level=ALL',
        \ '-noverify',
        \ '-Xmx1G',
        \ '-jar',
        \ $HOME . '\\util\\programs\\java\\jdt-language-server\\plugins\\org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar',
        \ '-configuration',
        \ $HOME . '\\util\\programs\\java\\jdt-language-server\\config_win',
        \ '-data',
        \ $TEMP]},
    \ 'whitelist': ['java'],
    \ })
"let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': 'X'}
let g:lsp_signs_warning = {'text': '!'}
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'

if (has('win32'))
    Plug 'junegunn/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
endif

" Fzf Config {{{

    " Fzf to use ripgrep
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

    nnoremap <silent> <C-p> :Files <CR>
" }}}

Plug 'Yggdroot/indentLine'
    " indentLine Config {{{
    let g:indentLine_fileTypeExclude=['json', 'tex']
    " }}}
Plug 'neomake/neomake'
    " Neomake Config {{{
    "let g:neomake_verbose = 3

    let g:neomake_open_list = 2
    let g:neomake_list_height  = 4
    let g:neomake_error_sign = {
                \ 'text': 'X',
                \ 'texthl': 'ErrorMsg',
                \ }
    let g:neomake_warning_sign = {
                \ 'text': '!',
                \ 'texthl': 'WarningMsg',
                \ }

    let g:neomake_cs_enabled_makers = ['msbuild']
    "let g:neomake_java_enabled_makers = ['mvn']
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_php_enabled_makers = ['php']
    let g:neomake_python_enabled_makers = ['flake8']

    autocmd! BufWritePost * Neomake
    " }}}
Plug 'scrooloose/nerdtree'
    " NERDtree Config {{{
    let g:NERDTreeWinPos = 'right'
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let g:NERDTreeMapActivateNode = '<Space>'
    let g:NERDTreeIgnore = [
                \'\.csproj.user$[[file]]',
                \'\.suo$[[file]]',
                \'Properties[[dir]]',
                \'obj[[dir]]',
                \'bin[[dir]]'
                \]
    " }}}
Plug 'ervandew/supertab'
    " Supertab Config {{{
    let g:SuperTabDefaultCompletionType = 'context'
    let g:SuperTabDefaultCompletionTypeDiscovery = ['&omnifunc:<c-x><c-o>']
    let g:SuperTabClosePreviewOnPopupClose = 1
    let g:SuperTabCrMapping=1
    autocmd FileType *
                \ if &omnifunc != '' |
                \   call SuperTabChain(&omnifunc, "<c-p>") |
                \   call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
                \ endif
    " }}}
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'honza/vim-snippets' | Plug 'SirVer/ultisnips'
    " UltiSnips Config {{{
    let g:UltiSnipsEnableSnipMate=0
    let g:UltiSnipsExpandTrigger='<tab>'
    let g:UltiSnipsJumpForwardTrigger='<tab>'
    let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
    let g:UltiSnipsEditSplit='vertical'
    " }}}
" }}}

call plug#end()
" }}}

" Neovim Config {{{

    " Abbreviation {{{
    cabbrev h vert h
    cabbrev sb vert sb
    " }}}

    " Autocommands {{{
    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd Filetype tex setlocal textwidth=120
    autocmd BufEnter * call DetectIndentation()


    " This function make fzf use wildignore from neovim from neovim
    function! s:with_agignore(bang, args)
        let fileignore = $TEMP . '/fileignore-for-fzf'
        let entries = split(&wildignore, ',')
        let source = 'rg --files --follow --ignore-file ' . fileignore

        call writefile(entries, fileignore)
        call fzf#vim#files(a:args, {'source': source})
    endfunction

    autocmd VimEnter * command! -bang -nargs=? -complete=dir Files
          \ call s:with_agignore(<bang>0, <q-args>)
    " }}}

    " Bindings {{{

        " Command {{{
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
        cnoremap w!! w !sudo tee % > /dev/null
        " }}}

        " Insert {{{
        inoremap <C-h> <Left>
        inoremap <C-j> <Down>
        inoremap <C-k> <Up>
        inoremap <C-l> <Right>
        " }}}

        " Leader {{{
        let mapleader=','

        nnoremap <Leader><Leader> <C-^>
        nnoremap <silent> <Leader>n :nohlsearch<CR>
        nnoremap <silent> <Leader>q :quit<CR>
        nnoremap <silent> <Leader>w :write<CR>

        if has('win32')
            nnoremap <silent> <Leader>v :set paste<CR>"*P:set nopaste<CR>
            vnoremap <Leader>c "*y
            vnoremap <Leader>x "*d
        else
            nnoremap <silent> <Leader>v :set paste<CR>"+P:set nopaste<CR>
            vnoremap <Leader>c "+y
            vnoremap <Leader>x "+d
        endif

        " }}}

        " Normal {{{
        nnoremap <silent> <C-n> :NERDTreeToggle<CR>
        nnoremap <silent> <F8> :TagbarToggle<CR>

        nnoremap j gj
        nnoremap k gk
        nnoremap / /\v
        nnoremap ? ?\v
        nnoremap <Space> za
        nnoremap Y y$
        nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
        nnoremap Q <nop>
        nnoremap K <nop>
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l
        nnoremap <C-Tab> gt
        nnoremap <C-S-Tab> gT
        nnoremap <silent> gce :ll<CR>                                          " go to current error/warning
        nnoremap <silent> gne :lnext<CR>                                       " go to next error/warning
        nnoremap <silent> gpe :lprev<CR>                                       " go to previous error/warning
        nnoremap <silent> <F4> :e $MYVIMRC<CR>
        nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\v\s+$//e<Bar>:let @/=_s<CR> " remove all trailing whitespace
        nnoremap <F10> :e $HOME/util/wiki

        if has('win32')
            nnoremap <C-h> <C-w>h
            nnoremap <silent> <C-=> :Guifont Consolas:b:h17<CR>
            nnoremap <silent> <C--> :Guifont Consolas:b:h9<CR>
        else
            nnoremap <BS> <C-w>h " workaround issues=2048
        endif

        " }}}

        " Visual {{{
        vnoremap / /\v
        " }}}

    " }}}

    " Functions GetIndentation {{{
    function SearchPattern(pattern)
        return search(a:pattern, 'Wnc', 0, 20) > 0 || search(a:pattern, 'Wnb', 0, 20) > 0
    endfunction

    " This functions are inspired in this plugin:
    " https://github.com/luochen1990/indent-detector.vim
    function DetectIndentation()
        if &readonly == 0
            let leadTab = SearchPattern('^\t')
            let leadSpace = SearchPattern('^ ')

            if leadTab && leadSpace
                set noexpandtab
            elseif leadTab
                set noexpandtab
            else
                set expandtab
            endif
        endif
    endfunction
    " }}}

    " Settings {{{
    syntax on
    set synmaxcol=200                                     " do not highlight long lines
    filetype plugin indent on
    cd ~/workspace

    set guicursor                                        " makes the cursor a pipe in insert mode, and a block in normal-mode. Temporary measure
    set termguicolors
    set cursorline
    set noswapfile
    set number
    set relativenumber
    set linebreak
    set breakindent                                       " indent wrapped lines to match start
    set breakindentopt=shift:2                            " emphasize broken lines by indenting them
    let &showbreak='⤷ '
    set showcmd
    set showmode
    set spell spelllang=en_us
    set equalalways
    set list
    set listchars=tab:»\ ,nbsp:⦸,eol:¬,trail:•,
    set noshowmatch
    set foldmethod=syntax
    set completeopt=menuone,preview,noinsert
    set splitright
    set splitbelow
    set hidden
    set mouse=a
    set background=dark
    set tabstop=4 sts=4 sw=4
    set hlsearch
    set ignorecase
    set smartcase
    set incsearch
    set laststatus=2                                      " always show status line
    set lazyredraw                                        " make the macro go faster
    set scrolloff=3                                       " start scrolling 3 lines before edge of view port
    set visualbell                                        " set the visual bell so it can be assign a sound
    set t_vb=                                             " assign no sound (disable bell)
    set wildignore+=**/bin/,**/obj/,**/target/            " ignore folders
    set wildignore+=**/Properties/,**/_references/,       " ignore folders
    set wildignore+=**/.svn/,**/.git/,**/node_modules/    " ignore folders
    set wildignore+=**/typings/,**/bower_components/      " ignore folders
    set wildignore+=*.exe,*.so,*.dll,*.csproj,*.sln,*.suo " ignore files
    set wildignore+=*.class                               " ignore files

    " If ripgrep is available use it as default grep programming
    if executable('rg')
        set grepprg=rg\ --vimgrep\ --no-heading
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    endif

    colorscheme base16-ocean
    let base16colorspace=256
    highlight Search guibg=background guifg=#2abcdf gui=underline
    highlight MatchParen guibg=background guifg=#00b400 gui=underline
    highlight Error guibg=background guifg=#c20000

    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd Filetype tex setlocal textwidth=120

    if has('win32')
        let g:python_host_prog=$HOME . '\envs\neovim2\Scripts\python.exe'
        let g:python3_host_prog=$HOME . '\envs\neovim3\Scripts\python.exe'
    else
        let g:python_host_prog='/usr/bin/python2'
        let g:python3_host_prog='/usr/bin/python3.6'
    endif

    " }}}

    " Status Line {{{
    function! GetStatusLine()
        if !empty(&buftype)
            if &buftype ==# 'help'
                return ' Help'
            elseif &buftype ==# 'nofile'
                return ''
            else
                return ' %q'
            endif
        elseif &paste
            return 'P'
        endif

        return ''
    endfunction

    function! GetModified()
        if &modified
            return '*'
        else
            return ''
        endif
    endfunction

    function! ReadOnly()
        if &readonly || !&modifiable
            return ' Read only'
        else
            return ''
        endif
    endfunction

    function! GetEncoding()
        if !empty(&fileencoding)
            return &fileencoding
        else
            return &encoding
        endif
    endfunction

    let &statusline=''
    let &statusline.='%{GetStatusLine()}'
    let &statusline.=' '                       " Separator
    let &statusline.='%<'                      " Truncate
    let &statusline.='%f'                      " Relative path to the file in buffer
    let &statusline.='%('                      " Start of item group
    let &statusline.='%{GetModified()}'
    let &statusline.='%{ReadOnly()}'
    let &statusline.='%w'                      " Show if buffer is a preview item?
    let &statusline.='%)'                      " End of item group

    let &statusline.='%='                      " Right side of status line
    let &statusline.=' '                       " Separator
    let &statusline.='Col %-3v'                " Show the virtual column
    let &statusline.=' '                       " Separator
    let &statusline.='%0*Ln %-4L'              " Show total lines in the file
    let &statusline.=' '                       " Separator
    let &statusline.=':)'              " Show total lines in the file
    let &statusline.=' '                       " Separator

    highlight StatusLine guifg=#efefef guibg=#4271ae
    "}}}

"}}}
