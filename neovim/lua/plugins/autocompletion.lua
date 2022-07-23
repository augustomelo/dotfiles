return {
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    require('cmp').setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<S-Tab>'] = require('cmp').mapping.select_prev_item(),
        ['<Tab>'] = require('cmp').mapping.select_next_item(),
        ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
        ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
        ['<C-e>'] = require('cmp').mapping.abort(),
        ['<CR>'] = require('cmp').mapping.confirm {
          behavior = require('cmp').ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = require('cmp').config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
        },
        {
          { name = 'buffer' },
        }
      )
    })
  end,
}
