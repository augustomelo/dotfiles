require("conform").setup({
  formatters_by_ft = {
    markdown = { "markdownlint" },
  },
})

vim.o.formatexpr = "v:lua.require(\"conform\").formatexpr()"

vim.keymap.set("n", "<leader>f", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Move cursor to the beginning of the line." })
