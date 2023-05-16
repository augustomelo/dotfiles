return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').gopls.setup{}

    require('lspconfig').jdtls.setup {
      cmd = {
        vim.env.HOME .."/util/ls/jdt/bin/jdtls",
        "-configuration",
        vim.env.HOME .. "/util/ls/jdt/config_mac",
        "-data",
        vim.env.XDG_CACHE_HOME .. "/jdtls/workspace"

      }
    }

    require('lspconfig').tsserver.setup{}

    require('lspconfig').lua_ls.setup {
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

    require('lspconfig').terraformls.setup{}

    require('lspconfig').yamlls.setup {
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = true
      end,
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
