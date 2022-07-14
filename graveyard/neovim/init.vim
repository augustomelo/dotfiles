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
Plug 'RRethy/nvim-base16'
Plug 'junegunn/goyo.vim'
Plug 'equalsraf/neovim-gui-shim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'vim-scripts/hybris-ImpEx'
" }}}

" Global {{{
Plug 'editorconfig/editorconfig-vim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'rafamadriz/friendly-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'hrsh7th/nvim-cmp'
Plug 'neovim/nvim-lspconfig'
Plug 'kamykn/spelunker.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
Plug 'hrsh7th/vim-vsnip'
Plug 'junegunn/fzf.vim'

if (has('win32'))
    Plug 'junegunn/fzf'
else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
endif

" Fzf Config {{{
    command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)

" }}}

Plug 'Yggdroot/indentLine'
    " indentLine Config {{{
    let g:indentLine_fileTypeExclude=['json', 'tex']
    " }}}
"Plug 'scrooloose/nerdtree'
    "" NERDtree Config {{{
    "let g:NERDTreeWinPos = 'right'
    "let g:NERDTreeWinSize = 40
    "let g:NERDTreeDirArrowExpandable = '▸'
    "let g:NERDTreeDirArrowCollapsible = '▾'
    "let g:NERDTreeMapActivateNode = '<Space>'
    "let g:NERDTreeIgnore = [
                "\'\.csproj.user$[[file]]',
                "\'\.suo$[[file]]',
                "\'\.pyc$[[file]]',
                "\'Properties[[dir]]',
                "\'obj[[dir]]',
                "\'bin[[dir]]',
                "\'target[[dir]]'
                "\]
    "" }}}
"Plug 'ervandew/supertab'
    "" Supertab Config {{{
    "let g:SuperTabDefaultCompletionType = 'context'
    "let g:SuperTabDefaultCompletionTypeDiscovery = ['&omnifunc:<c-x><c-o>']
    "let g:SuperTabClosePreviewOnPopupClose = 1
    "let g:SuperTabCrMapping=1
    "autocmd FileType *
                "\ if &omnifunc != '' |
                "\   call SuperTabChain(&omnifunc, "<c-p>") |
                "\   call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
                "\ endif
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
    function! s:with_ignore(bang, args)
        let fileignore = '/tmp/fileignore-for-fzf'
        let entries = split(&wildignore, ',')
        let source = 'rg --files --follow --ignore-file ' . fileignore

        call writefile(entries, fileignore)
        call fzf#vim#files(a:args, {'source': source, 'options': ['--preview', 'cat {}']})
    endfunction

    autocmd VimEnter * command! -bang -nargs=? -complete=dir Files
          \ call s:with_ignore(<bang>0, <q-args>)
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

        nnoremap <leader>ff :Files<CR>
        nnoremap <leader>ft :Rg<space>
        nnoremap <leader>fb :Buffers<CR>

        nnoremap <Leader><Leader> <C-^>
        nnoremap <silent> <Leader>n :nohlsearch<CR>
        nnoremap <silent> <Leader>q :quit<CR>
        nnoremap <silent> <Leader>w :write<CR>
        " }}}

        " Normal {{{
        nnoremap <silent> <C-n> :Lexplore!<CR>
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
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l
        nnoremap <C-Tab> gt
        nnoremap <C-S-Tab> gT
        nnoremap <silent> gce :ll<CR>                                          " go to current error/warning
        nnoremap <silent> gne :lnext<CR>                                       " go to next error/warning
        nnoremap <silent> gpe :lprev<CR>                                       " go to previous error/warning
        nnoremap <silent> <F4> :e $MYVIMRC<CR>
        nnoremap <silent> <F5> :call TrimWhitespace()<CR>
        nnoremap <F1> :Lexplore! $HOME/util/wiki<CR>

        " }}}

        " Visual {{{
        vnoremap / /\v
        " }}}

    " }}}

    " Function {{{
    function TrimWhitespace()
        let l:prevPos = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:prevPos)
    endfunction

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

    " This function synchronize the clipboard between WSL
    let s:clip = '/mnt/c/Windows/System32/clip.exe'
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
        augroup END
    end
    " }}}

    " Lua {{{

:lua << EOF
local nvim_lsp = require('lspconfig')

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  --Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  --local opts = { noremap=true, silent=true, buffer=bufnr}

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', '<leader>fdc', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', '<leader>fdf', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>fi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>frf', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>gn', vim.lsp.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>gp', vim.lsp.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>sl', vim.lsp.diagnostic.set_loclist, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, opts)
end

nvim_lsp.jdtls.setup {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "-Xmx2g",
    "-jar",
    "/Users/meloaugu/util/ls/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
    "-configuration",
    "/Users/meloaugu/util/ls/jdt/config_mac",
    "-data",
    "/tmp",
    "--add-modules=ALL-SYSTEM",
    "--add-opens java.base/java.util=ALL-UNNAMED",
    "--add-opens java.base/java.lang=ALL-UNNAMED"
    },
  on_attach = on_attach
}

nvim_lsp.gopls.setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}

require'base16-colorscheme'.setup('ocean')

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, 
      }, {
      { name = 'buffer' },
    })
})

EOF
    " }}}

    " Settings {{{
    syntax on
    filetype plugin indent on
    cd $HOME/workspace

    set pastetoggle=<F2>
    set termguicolors
    set cursorline
    set noswapfile
    set number
    set relativenumber
    set linebreak
    set inccommand=nosplit
    set breakindent                                       " indent wrapped lines to match start
    set breakindentopt=shift:2                            " emphasize broken lines by indenting them
    let &showbreak='⤷ '
    set showcmd
    set showmode
    "set spell spelllang=en_us this is not necessary anymore because the
    "plugin spelunker
    set equalalways
    set list
    set listchars=tab:\┆\ ,nbsp:⦸,eol:¬,trail:•,
    set fillchars=vert:\|
    set noshowmatch
    "set foldmethod=syntax
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set completeopt=menuone,preview,noinsert
    set splitright
    set splitbelow
    set hidden
    set mouse=a
    set background=dark
    set ts=2 sts=2 sw=2
    set hlsearch
    set ignorecase
    set smartcase
    set incsearch
    set laststatus=3
    set lazyredraw                                        " make the macro go faster
    set scrolloff=3                                       " start scrolling 3 lines before edge of view port
    set visualbell                                        " set the visual bell so it can be assign a sound
    set t_vb=                                             " assign no sound (disable bell)
    set wildignore+=**/bin/,**/obj/,**/target/            " ignore folders
    set wildignore+=**/Properties/,**/_references/,       " ignore folders
    set wildignore+=**/.svn/,**/.git/,**/node_modules/    " ignore folders
    set wildignore+=**/typings/,**/bower_components/      " ignore folders
    set wildignore+=*.exe,*.so,*.dll,*.csproj,*.sln,*.suo " ignore files
    set wildignore+=*.class,*.pyc                         " ignore files

    " If ripgrep is available use it as default grep programming
    if executable('rg')
        set grepprg=rg\ --vimgrep\ --no-heading
        set grepformat=%f:%l:%c:%m,%f:%l:%m
    endif

    highlight Search guibg=background guifg=#2abcdf gui=underline
    highlight MatchParen guibg=background guifg=#00b400 gui=underline
    highlight Error guibg=background guifg=#c20000
    highlight VertSplit guibg=background guifg=4f5b66

    autocmd Filetype gitcommit setlocal spell textwidth=72
    autocmd Filetype tex setlocal textwidth=120
    autocmd BufRead,BufNewFile *.impex set filetype=impex

    if has('win32')
        let g:python_host_prog=$HOME . '\envs\neovim2\Scripts\python'
        let g:python3_host_prog=$HOME . '\envs\neovim3\Scripts\python'
    else
        let g:python_host_prog='/usr/bin/python2'
        let g:python3_host_prog='/usr/bin/python3.6'
    endif

    let g:netrw_banner=0
    let g:netrw_liststyle=3
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

    function! StatuslineGit()
        let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        return strlen(l:branchname) > 0? '(' . l:branchname .')' : ''
    endfunction

    let &statusline=''
    let &statusline.='%{GetStatusLine()}'
    let &statusline.=' '                       " Separator
    let &statusline.='%{StatuslineGit()}'
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