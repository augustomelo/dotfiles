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

local M = {}

M.get_statusline = function ()
  return table.concat {
    ' ',
    '%(',
    git_branch(),
    '%)',
    '%=',
    '%<',
    '%(',
    '%m',
    '%f',
    '%)',
    '%=',
    ' ',
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
