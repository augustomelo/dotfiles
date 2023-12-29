local opts = { noremap = true, silent = true }

vim.keymap.set('c', '<C-a>', '<home>')
vim.keymap.set('c', '<C-e>', '<end>')

vim.keymap.set('n', '<leader>fdc', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', '<leader>fdf', vim.lsp.buf.definition, opts)
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>fi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>frf', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>gn', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>sl', vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

vim.keymap.set('n', '<leader><leader>', '<c-^>', opts)
vim.keymap.set('n', '<leader>n', '<Cmd>nohlsearch<CR>', opts)
vim.keymap.set('n', '<leader>q', '<Cmd>quit<CR>', opts)
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>', opts)
vim.keymap.set('n', '<leader>cfn', '<Cmd>let @* = expand("%:p")<CR>', opts)

vim.keymap.set('n', 'j', function() if vim.v.count == 0 then return 'gj' end return 'j' end, { expr = true }, opts)
vim.keymap.set('n', 'k', function() if vim.v.count == 0 then return 'gk' end return 'k' end, { expr = true }, opts)
vim.keymap.set('n', '<space>', 'za', opts)
vim.keymap.set('n', 'Y', 'y$', opts)
vim.keymap.set('n', '<C-h>', '<c-w>h', opts)
vim.keymap.set('n', '<C-j>', '<c-w>j', opts)
vim.keymap.set('n', '<C-k>', '<c-w>k', opts)
vim.keymap.set('n', '<C-l>', '<c-w>l', opts)
vim.keymap.set('n', '<C-Tab>', 'gt', opts)
vim.keymap.set('n', '<C-S-tab>', 'gT', opts)

vim.keymap.set({ 'n', 'i' }, '<f1>', '<nop>', opts)


if package.loaded.telescope then
  vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
  vim.keymap.set('n', '<leader>fs', '<Cmd>Telescope live_grep<CR>')
  vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers<CR>')
  vim.keymap.set('n', '<leader>fc', function()
    local dotfiles = vim.fn.expand('~/workspace/dotfiles/')
    require('telescope.builtin').find_files({
      cwd = dotfiles,
      attach_mappings = function(prompt_bufnr)
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()

          vim.api.nvim_command('tabnew ' .. dotfiles .. selection[1])
          vim.api.nvim_command('tcd' .. dotfiles)
        end)

        return true
      end,
    })
  end)

  if package.loaded.telescope.extensions.file_browser then
    vim.keymap.set('n', '<C-n>', '<Cmd>Telescope file_browser<CR>')
  end
end
