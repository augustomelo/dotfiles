return {
  { 'scrooloose/nerdcommenter' },
  { 'tpope/vim-fugitive' },
  {
    "jellydn/hurl.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "hurl",
    opts = {
      debug = false,
      mode = "split",
      formatters = {}
    },
  },
}
