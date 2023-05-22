return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { "nvim-telescope/telescope-file-browser.nvim" }
  },
  config = function() require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        file_browser = {
          hijack_netrw = true,
          dir_icon = "",
          mappings = {
            ["i"] = {
              ['<leader>cf'] = require('telescope').extensions.file_browser.actions.create
            },
          }
        },
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
        file_ignore_patterns = require('wildignore').as_lua_regex(),
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
            ['<c-j>'] = require('telescope.actions').move_selection_next,
            ['<c-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
    }

    require("telescope").load_extension "file_browser"
  end
}
