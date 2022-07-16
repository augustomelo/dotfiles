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

vim.api.nvim_create_user_command('ReloadConfig',
function (_)
  local init_file_location = vim.env.MYVIMRC

  for name,_ in pairs(package.loaded) do
    package.loaded[name] = nil
  end

  dofile(init_file_location)
  vim.cmd('PackerCompile')
end,
{ nargs = 0 })
