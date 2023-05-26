return {
  'windwp/nvim-autopairs',
  dependencies = {
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'tpope/vim-surround', dependencies = { 'tpope/vim-repeat' } },
  },

  config = function ()
    require("nvim-autopairs").setup { }
    require("indent_blankline").setup {
      show_current_context = true
    }
  end,
}
