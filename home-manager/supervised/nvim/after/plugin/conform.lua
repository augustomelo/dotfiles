require("conform").setup({
  formatters_by_ft = {
    markdown = { "markdownlint" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
})

vim.o.formatexpr = "v:lua.require(\"conform\").formatexpr()"

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Move cursor to the beginning of the line." })
