return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  }, 
  config = function ()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          ignore_current_buffer = true,
          sort_lastused = true,
        },
      },
      defaults = {
        vimgrep_arguments = {
          'rg',
          '--follow',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--no-ignore',
          '--trim',
        },
        mappings = {
          i = {
            ['<esc>'] = require('telescope.actions').close,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>fc', '<cmd>Telescope find_files({cwd = vim.fn.expand(\'~/dotfiles\') })<cr>')
    vim.keymap.set('n', '<leader>ft', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
    vim.keymap.set('n', '<leader>fc', function()
      require('telescope.builtin').find_files({cwd = vim.fn.expand('~/workspace/dotfiles')})
    end)
  end
}
