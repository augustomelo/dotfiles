-- iutocmd


--autocmd Filetype tex setlocal textwidth=120
--autocmd BufEnter * call DetectIndentation()


--" This function make fzf use wildignore from neovim from neovim
--function! s:with_ignore(bang, args)
--let fileignore = '/tmp/fileignore-for-fzf'
--let entries = split(&wildignore, ',')
--let source = 'rg --files --follow --ignore-file ' . fileignore

--call writefile(entries, fileignore)
--call fzf#vim#files(a:args, {'source': source, 'options': ['--preview', 'cat {}']})
--endfunction

--autocmd VimEnter * command! -bang -nargs=? -complete=dir Files
--\ call s:with_ignore(<bang>0, <q-args>)

-- Keymaps
--vim.keymap.set("n", "<F5>", ":call TrimWhitespace()<CR>")
-- other mappins
--vim.keymap.set <leader>ff :Files<CR>
--vim.keymap.set <leader>ft :Rg<space>
--vim.keymap.set <leader>fb :Buffers<CR>

-- Options
--highlight Search guibg=background guifg=#2abcdf gui=underline
--highlight MatchParen guibg=background guifg=#00b400 gui=underline
--highlight Error guibg=background guifg=#c20000
--highlight VertSplit guibg=background guifg=4f5b66

--autocmd Filetype gitcommit setlocal spell textwidth=72
--autocmd Filetype tex setlocal textwidth=120
--autocmd BufRead,BufNewFile *.impex vim.opt.filetype=impex
