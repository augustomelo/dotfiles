require('statusline')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  command = 'setlocal textwidth=120',
  group = vim.api.nvim_create_augroup('GitCommitMessage', { clear = true})
})

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
  pattern = '*',
  command = 'setlocal statusline=%!v:lua.statusline()',
  group = vim.api.nvim_create_augroup('Statusline', { clear = true})
})

--https://neovim.discourse.group/t/reload-init-lua-and-all-require-d-scripts/971/9
--vim.api.nvim_create_user_command('ReloadCfg', 'source $MYVIMRC', { nargs = 1 })
