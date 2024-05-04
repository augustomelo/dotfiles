local default_opts = { noremap = true, silent = true }

vim.keymap.set("c", "<C-a>", "<home>", { unpack(default_opts), desc = "Move cursor to the beginning of the line." })
vim.keymap.set("c", "<C-e>", "<end>", { unpack(default_opts), desc = "Move cursor to the ending of the line." })

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
