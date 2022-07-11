return {
  'RRethy/nvim-base16',
  config = function()
    require('base16-colorscheme').with_config {
      telescope = false,
    }
    require'base16-colorscheme'.setup('ocean')
  end,
}
