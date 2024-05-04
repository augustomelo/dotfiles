vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  pattern = "*",
  command = "setlocal cursorline",
  group = vim.api.nvim_create_augroup("CursorLine", { clear = true })
})

vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  pattern = "*",
  command = "setlocal nocursorline",
  group = vim.api.nvim_create_augroup("CursorLine", { clear = false })
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP attach keymaps',
  callback = function(event)
    local default_opts = { noremap = true, silent = true, buffer = event.buf }

    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration,
      { unpack(default_opts), desc = "Jumps to decalation." })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
      { unpack(default_opts), desc = "Jumps to definition." })
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover,
      { unpack(default_opts), desc = "Displays hover information." })
    vim.keymap.set("n", "<leader>fi", vim.lsp.buf.implementation,
      { unpack(default_opts), desc = "List all the implementations." })
    vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help,
      { unpack(default_opts), desc = "Displays signature information." })
    vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition,
      { unpack(default_opts), desc = "Jumps to the definition." })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
      { unpack(default_opts), desc = "Renames all references." })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
      { unpack(default_opts), desc = "Selects a code action available." })
    vim.keymap.set("n", "<leader>fr", vim.lsp.buf.references,
      { unpack(default_opts), desc = "Lists all the references" })
  end
})
