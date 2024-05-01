return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "n",
        desc = "Format buffer",
      },
    },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          markdown = { "markdownlint" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })
    end,
    init = function()
      vim.o.formatexpr = "v:lua.require(\"conform\").formatexpr()"
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.4.1",
    config = function()
      require("fidget").setup {}
    end
  },
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
  { "scrooloose/nerdcommenter" },
  {
    "epwalsh/obsidian.nvim",
    version = "3.7.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "notes",
          path = "~/workspace/personal/notes",
        },
      },
    },
  },
}
