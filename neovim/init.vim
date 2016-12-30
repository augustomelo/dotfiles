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

" C# {{{
"Plug 'oranget/vim-csharp', {'for': 'cs'}
"Plug 'tpope/vim-dispatch', {'for': 'cs'}

"Plug 'omnisharp/omnisharp-vim', {'for': 'cs'}
    " Omnisharp {{{
    "let g:Omnisharp_start_server = 0
    "let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
    let g:OmniSharp_selector_ui = 'ctrlp'
    let g:OmniSharp_timeout = 1
    augroup omnisharp_commands
        autocmd!

        autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
        "autocmd TextChanged,InsertLeave *.cs SyntasticCheck
        "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

        autocmd FileType cs nnoremap <F12> :OmniSharpGotoDefinition<cr>
        autocmd FileType cs nnoremap <S-A-F10>  :OmniSharpFixIssue<cr> :OmniSharpFixUsings<cr>
        autocmd FileType cs nnoremap <Leader>dc :OmniSharpDocumentation<cr>
        autocmd FileType cs nnoremap <F2> :OmniSharpRename<cr>
        autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<cr>
        "navigate up/down by method/property/field
        "autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
        "autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
    augroup END
    " }}}
" }}}

" Cosmetic {{{
"Plug 'flazz/vim-colorschemes'
"Plug 'sotte/presenting.vim'
"Plug 'tpope/vim-markdown'
    "" Vim-Markdown Config  {{{
    "let g:markdown_fenced_languages = ['cs']
    "" }}}

Plug 'chriskempson/base16-vim'
Plug 'equalsraf/neovim-gui-shim'
" }}}

" Global {{{
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'ctrlpvim/ctrlp.vim'
    " Ctrl-P Config {{{
    let g:ctrlp_status_func = {
                \ 'main': 'CtrlPMainStatus',
                \ 'prog': 'CtrlPProressStatus',
                \ }
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v\/(bin|obj|Properties|_references|.svn|.git|node_modules|typings|bower_components)',
                \ 'file': '\v\.(exe|so|dll|csproj|sln|suo)$',
                \ }
    let g:ctrlp_working_path_mode = 0

    function! CtrlPMainStatus(focus, byfname, regex, prev, item, next, marked)
        let stLine=''
        let stLine.=' '      " Separator
        let stLine.=a:item   " The current search mode
        let stLine.='%='     " Right side of status line
        let stLine.='%<'     " Truncate

        return stLine
    endf

    function! CtrlPProressStatus(str)
        let stLine=''
        let stLine.=' '      " Separator
        let stLine.=a:str " Number of files scanned so for
        let stLine.='%='     " Right side of status line
        let stLine.='%<'     " Truncate
        let stLine.=getcwd()
        let stLine.=' '      " Separator

        return stLine
    endf



    " }}}
Plug 'Valloric/MatchTagAlways'
    " MatchTagAlways Config {{{
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'vue': 1,
        \}
    " }}}
Plug 'neomake/neomake'
    " Neomake Config {{{
    "let g:neomake_verbose = 3
    let g:neomake_open_list = 2
    let g:neomake_list_height  = 4
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:neomake_error_sign = {
                \ 'text': '✗',
                \ 'texthl': 'ErrorMsg',
                \ }
    let g:neomake_warning_sign = {
                \ 'text': '!',
                \ 'texthl': 'WarningMsg',
                \ }

    autocmd! BufWritePost * Neomake

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
Plug 'scrooloose/nerdtree'
    " NERDtree Config {{{
    let g:NERDTreeWinPos = "right"
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
    let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>"]
    let g:SuperTabClosePreviewOnPopupClose = 1
    let g:SuperTabCrMapping=1
    autocmd FileType *
                \ if &omnifunc != '' |
                \   call SuperTabChain(&omnifunc, "<c-p>") |
                \ 	call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
                \ endif
    " }}}
Plug 'majutsushi/tagbar'
    " Tagbar Config {{{
    if has("win32")
        let g:tagbar_ctags_bin = '~\AppData\Local\nvim\autoload\ctags58\ctags.exe'
    endif
    " }}}
Plug 'alvan/vim-closetag'
    " Closetag Config {{{
    let g:closetag_filenames = "*.html,*.xml,*.ts,*.vue"
    " }}}
Plug 'MarcWeber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'honza/vim-snippets' | Plug 'garbas/vim-snipmate'
    " SnipMate Config {{{
    let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
    let g:snipMate.scope_aliases = {}
    let g:snipMate.scope_aliases['vue'] = 'html,javascript,sass,css'
    " }}}
" }}}

" Web {{{
"Plug 'leafgarland/typescript-vim'
"Plug 'othree/html5.vim'
"Plug 'pangloss/vim-javascript'
"Plug 'posva/vim-vue'
" }}}

call plug#end()
" }}}

" Neovim Config {{{

    " Abbreviation {{{
    cabbrev h vert h
    cabbrev sb vert sb
    " }}}

    " Bindings {{{

        " Command {{{
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
        " }}}

        " Leader {{{
        let mapleader=","

        nnoremap <Leader><Leader> <C-^>
        nnoremap <silent> <Leader>n :nohlsearch<CR>
        nnoremap <silent> <Leader>q :quit<CR>
        nnoremap <silent> <Leader>w :write<CR>

        if has("win32")
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
        nnoremap <silent> gce :ll<CR>                                          " go to current error/warning
        nnoremap <silent> gne :lnext<CR>                                       " go to next error/warning
        nnoremap <silent> gpe :lprev<CR>                                       " go to previous error/warning
        nnoremap <silent> <F4> :e $MYVIMRC<CR>
        nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\v\s+$//e<Bar>:let @/=_s<CR> " Remove all trailing whitespace

        if has("win32")
            nnoremap <C-h> <C-w>h
            nnoremap <silent> <C-=> :Guifont DejaVuSansMonoForPowerline NF:h17<CR>
            nnoremap <silent> <C--> :Guifont DejaVuSansMonoForPowerline NF:h9<CR>
        else
            nnoremap <BS> <C-w>h " workaround issues=2048
        endif

        " }}}

        " Visual {{{
        vnoremap / /\v
        " }}}

    " }}}

    " Settings {{{
    syntax on
    filetype plugin indent on
    cd ~/workspace

    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1                   " makes the cursor a pipe in insert mode, and a block in normal-mode. Temporary measure
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
    set listchars=nbsp:⦸,eol:¬,trail:•,tab:▸\
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
    set laststatus=2                                      " always show status line
    set lazyredraw                                        " make the macro go faster
    set scrolloff=3                                       " start scrolling 3 lines before edge of view port
    set visualbell                                        " set the visual bell so it can be assign a sound
    set t_vb=                                             " assign no sound (disable bell)
    set concealcursor=n                                   " conceal the only on normal mode
    set wildignore+=*/bin/*,*/obj/*                       " ignore files
    set wildignore+=*/Properties/*,*/_references/*,       " ignore files
    set wildignore+=*/.svn/*,*/.git/*,*/node_modules/*    " ignore files
    set wildignore+=*/typings/*,*/bower_components/*      " ignore files
    set wildignore+=*.exe,*.so,*.dll,*.csproj,*.sln,*.suo " ignore files

    colorscheme base16-ocean
    let base16colorspace=256
    highlight Search guibg=background guifg=#2abcdf gui=underline
    highlight MatchParen guibg=background guifg=#00b400 gui=underline
    highlight Error guibg=background guifg=#c20000

    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd Filetype tex setlocal textwidth=120
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
            return ' '
        else
            return ''
        endif
    endfunction

    function! GetEncoding()
        if !empty(&fenc)
            return &fenc
        else
            return &enc
        endif
    endfunction

    function! GetCurrentFunction()
        if exists(':Tagbar')
            return tagbar#currenttag('%s', '')
        endif

        return ''
    endfunction

    let &statusline=''
    let &statusline.='%{GetStatusLine()}'
    let &statusline.=' '                       " Separator
    let &statusline.='%<'                      " Truncate
    let &statusline.='%f'                      " File tail
    let &statusline.='%('                      " Start of item group
    let &statusline.='%{GetModified()}'
    let &statusline.='%{ReadOnly()}'
    let &statusline.='%w'                      " Show if buffer is a preview item?
    let &statusline.='%)'                      " End of item group

    let &statusline.='%='                      " Right side of status line
    let &statusline.=' '                       " Separator
    let &statusline.='%<'                      " Truncate
    let &statusline.='%{GetCurrentFunction()}'
    let &statusline.=' '                       " Separator
    let &statusline.='Col %-3v'                " Show the virtual column
    let &statusline.=' '                       " Separator
    let &statusline.='%0*Ln %-4L'              " Show total lines in the file
    let &statusline.=' '                       " Separator

    highlight StatusLine guifg=#efefef guibg=#4271ae
    "}}}
"}}}
