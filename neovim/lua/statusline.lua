local git_branch = function()
  local branch_name = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")

  if string.len(branch_name) > 0 then
    return '(' .. branch_name .. ')'
  else
    return ""
  end
end

local buffer_encoding = function()
  if vim.bo.fileencoding == nil or vim.bo.fileencoding == "" then
    return vim.o.encoding
  else
    return vim.bo.fileencoding
  end
end

-- colors based on nord color pallet
-- https://www.nordtheme.com/docs/colors-and-palettes
vim.api.nvim_set_hl(0, 'StatuslineEdge', {fg = '#3B4252', bg = '#88C0D0'})
vim.api.nvim_set_hl(0, 'StatuslineSeparator', {fg = '#88C0D0', bg = '#3B4252'})
vim.api.nvim_set_hl(0, 'StatuslineMiddle', {fg = '#ECEFF4', bg = '#3B4252'})


local M = {}


M.get_statusline = function ()
  return table.concat {
    '%#StatuslineEdge#',
    ' ',
    '%(',
    git_branch(),
    ' ',
    '%#StatuslineSeparator#',
    '',
    '%#StatuslineMiddle#',
    '%)',
    '%=',
    '%<',
    '%(',
    '%m',
    '%f',
    '%)',
    '%=',
    ' ',
    '%#StatuslineSeparator#',
    '',
    '%#StatuslineEdge#',
    '%3v',
    ':',
    '%{v:lua.vim.fn.line(\'.\')}',
    '/',
    '%-4L',
    ' ',
    buffer_encoding(),
    ' ',
  }
end

return M
