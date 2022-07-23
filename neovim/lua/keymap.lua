vim.keymap.set('c', '<c-a>', '<home>')
vim.keymap.set('c', '<c-e>', '<end>')

vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set('n', '<leader>n', '<cmd>nohlsearch<cr>')
vim.keymap.set('n', '<leader>q', '<cmd>quit<cr>')
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')

vim.keymap.set('n', '<c-n>', '<cmd>Lexplore!<cR>')
vim.keymap.set('n', 'j', function () if vim.v.count == 0 then return 'gj' end return 'j' end, { expr = true })
vim.keymap.set('n', 'k', function () if vim.v.count == 0 then return 'gk' end return 'k' end, { expr = true })
vim.keymap.set('n', '<space>', 'za')
vim.keymap.set('n', 'Y', 'y$')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')
vim.keymap.set('n', '<c-tab>', 'gt')
vim.keymap.set('n', '<c-s-tab>', 'gT')

vim.keymap.set({ 'n', 'i' }, '<f1>', '<nop>')

