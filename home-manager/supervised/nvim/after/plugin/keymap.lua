local default_opts = { noremap = true, silent = true }

vim.keymap.set("c", "<C-a>", "<home>", { unpack(default_opts), desc = "Move cursor to the beginning of the line." })
vim.keymap.set("c", "<C-e>", "<end>", { unpack(default_opts), desc = "Move cursor to the ending of the line." })

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
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float,
  { unpack(default_opts), desc = "Show diagnostics in a floating window" })
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev,
  { unpack(default_opts), desc = "Move to the previous diagnostic." })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next,
  { unpack(default_opts), desc = "Move to the next diagnostic." })
vim.keymap.set("n", "<leader>da", vim.diagnostic.setloclist,
  { unpack(default_opts), desc = "Add buffer diagnostics to the location list." })

vim.keymap.set("n", "<leader><leader>", "<C-^>",
  { unpack(default_opts), desc = "Edit the alternate file." })
vim.keymap.set("n", "<leader>n", "<Cmd>nohlsearch<CR>",
  { unpack(default_opts), desc = "Stop the highlighting for the 'hlsearch'." })
vim.keymap.set("n", "<leader>q", "<Cmd>quit<CR>",
  { unpack(default_opts), desc = "Quit the current window." })
vim.keymap.set("n", "<leader>w", "<Cmd>write<CR>",
  { unpack(default_opts), desc = "Write the whole buffer to the current file." })
vim.keymap.set("n", "<leader>cfp", "<Cmd>let @* = expand(\"%:p\")<CR>",
  { unpack(default_opts), desc = "Copy buffer full path into unnamed buffer" })

vim.keymap.set("n", "j", function()
  if vim.v.count == 0 then return "gj" end
  return "j"
end, { expr = true }, default_opts)
vim.keymap.set("n", "k", function()
  if vim.v.count == 0 then return "gk" end
  return "k"
end, { expr = true }, default_opts)

vim.keymap.set("n", "Y", "y$", default_opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", default_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", default_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", default_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", default_opts)

vim.keymap.set({ "n", "i" }, "<f1>", "<nop>", default_opts)

if package.loaded.telescope then
  vim.keymap.set("n", "<leader>ff", "<Cmd>Telescope find_files<CR>",
    { unpack(default_opts), desc = "Find file on the current working directory." })
  vim.keymap.set("n", "<leader>fs", "<Cmd>Telescope live_grep<CR>",
    { unpack(default_opts), desc = "Live grep on the current working directory." })
  vim.keymap.set("n", "<leader>*", "<Cmd>Telescope grep_string<CR>",
    { unpack(default_opts), desc = "Searches for the string in the current working directory." })
  vim.keymap.set("n", "<leader>fb", "<Cmd>Telescope buffers<CR>",
    { unpack(default_opts), desc = "Find open buffers." })

  if package.loaded.telescope.extensions.file_browser then
    vim.keymap.set("n", "<C-n>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { unpack(default_opts), desc = "File browser based on the selected buffer" })
  end
end
