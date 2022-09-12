require('statusline')

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  command = 'setlocal textwidth=120',
  group = vim.api.nvim_create_augroup('GitCommitMessage', { clear = true})
})

vim.api.nvim_create_autocmd({'BufEnter', 'WinEnter', 'FocusGained'}, {
  pattern = '*',
  command = 'setlocal cursorline',
  group = vim.api.nvim_create_augroup('CursorLine', { clear = true})
})

vim.api.nvim_create_autocmd({'BufLeave', 'WinLeave', 'FocusLost'}, {
  pattern = '*',
  command = 'setlocal nocursorline',
  group = vim.api.nvim_create_augroup('CursorLine', { clear = false})
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = 'Jenkinsfile',
  command = 'setfiletype groovy',
  group = vim.api.nvim_create_augroup('JenkinsfileFileType', { clear = false})
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
