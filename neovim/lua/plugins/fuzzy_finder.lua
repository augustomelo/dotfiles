return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
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

    vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
    vim.keymap.set('n', '<leader>ft', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
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

    require("telescope").load_extension "file_browser"
    vim.keymap.set('n', '<C-n>', '<cmd>Telescope file_browser<cr>')
  end
}
