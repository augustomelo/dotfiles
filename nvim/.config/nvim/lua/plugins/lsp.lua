return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup{
      automatic_installation = true,
    }

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )

    require('lspconfig').gopls.setup{
      capabilities = capabilities,
    }

    require('lspconfig').jdtls.setup {
      capabilities = capabilities,
    }

    require('lspconfig').tsserver.setup{
      capabilities = capabilities,
    }

    require('lspconfig').lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }

    require('lspconfig').terraformls.setup{
      capabilities = capabilities,
    }

    require('lspconfig').yamlls.setup {
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = true
      end,
      capabilities = capabilities,
      settings = {
        yaml = {
          format = {
            enable = true,
          },
          validate = true,
          completion = true
        }
      }
    }
  end,
}
