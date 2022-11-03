return {
  'RRethy/nvim-base16',
  config = function()
    require('base16-colorscheme').with_config {
      telescope = false,
    }
    require'base16-colorscheme'.setup('ocean')

    vim.api.nvim_set_hl(0, 'SpellBad', { fg = '#bf616a', bg = '#2b303b', undercurl = true })
  end,
}
