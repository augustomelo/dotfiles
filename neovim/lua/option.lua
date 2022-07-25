require('wildignore')

vim.opt.breakindent = true
vim.opt.breakindentopt = 'shift:2'
vim.opt.completeopt = 'menuone,preview,noinsert'
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
  eol = '¬',
  nbsp = '⦸',
  tab = '» ',
  trail = '•',
}
vim.opt.mouse = 'a'
vim.opt.magic = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.showbreak = '⤷ '
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.statusline = require('statusline').get_statusline()
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.termguicolors = true
vim.opt.wildignorecase = true
vim.opt.wildignore = table.concat(require('wildignore').as_glob(), ',')
if vim.fn.executable('rg') then
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
  vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
end
