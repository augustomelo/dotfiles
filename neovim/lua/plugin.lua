local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  print("Installing packer...")
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'editorconfig/editorconfig-vim'
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-fugitive'

  use(require('plugins.autocompletion'))
  use(require('plugins.autopairs'))
  use(require('plugins.colorscheme'))
  use(require('plugins.fuzzy_finder'))
  use(require('plugins.lsp'))
  use(require('plugins.treesitter'))
  use(require('plugins.spellchecker'))

  if packer_bootstrap then
    require('packer').sync()
  end
end)
