local cmp_default_capabilities = require('cmp_nvim_lsp').default_capabilities()

local default_setup            = function(server)
  require('lspconfig')[server].setup({
    capabilities = cmp_default_capabilities,
  })
end

require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    default_setup,

    helm_ls = function()
      require('lspconfig').helm_ls.setup {
        settings = {
          ['helm-ls'] = {
            yamlls = {
              path = "yaml-language-server",
            }
          }
        }
      }
    end,

    lua_ls = function()
      require("lspconfig").lua_ls.setup {
        capabilities = cmp_default_capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME,
              }
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }
    end,

    vale_ls = function()
      require("lspconfig").vale_ls.setup {
        capabilities = cmp_default_capabilities,
        filetypes = { "gitcommit", "markdown", "text" },
        init_options = {
          installVale = false,
          syncOnStartup = false,
        },
        root_dir = function(_)
          return vim.fn.getcwd()
        end,
        on_new_config = function(new_config, _)
          local config_path = vim.fn.findfile(".vale.ini", ".;")

          if config_path == "" then
            config_path = vim.env.XDG_CONFIG_HOME .. "/vale/vale.ini"
          else
            config_path = vim.fn.getcwd() .. "/.vale.ini"
          end

          new_config.init_options.configPath = config_path
        end,
      }
    end,

    yamlls = function()
      require("lspconfig").yamlls.setup {
        on_attach = function(client, _)
          client.server_capabilities.documentFormattingProvider = true
        end,
        capabilities = cmp_default_capabilities,
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
    end
  },
})
