return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function ()
    require('mason').setup{}

    require('mason-lspconfig').setup{
      automatic_installation = true,
    }

    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or 'rounded'
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end


    require('lspconfig').gopls.setup{
      capabilities = capabilities,
    }

    require('lspconfig').jdtls.setup {
      capabilities = capabilities,
    }

    require('lspconfig').tsserver.setup{
      capabilities = capabilities,
    }

    require('lspconfig').lua_ls.setup{
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

    -- Disbaled until fixed:
    -- https://github.com/errata-ai/vale-ls/issues/4
    require('lspconfig').vale_ls.setup{
      capabilities = capabilities,
      filetypes = { 'gitcommit', 'markdown', 'text' },
      init_options = {
        --configPath = '/Users/meloaugu/.config/vale/vale.ini',
        installVale = false,
        syncOnStartup = false,
      },
      root_dir = function (_)
        return vim.fn.getcwd()
      end,
      on_new_config = function(new_config, _)
        local config_path = vim.fn.findfile('.vale.ini', '.;')

        if config_path == '' then
          config_path = vim.env.XDG_CONFIG_HOME .. '/vale/vale.ini'
        else
          config_path = vim.fn.getcwd() .. '/.vale.ini'
        end

        new_config.init_options.configPath = config_path
      end,
    }

    require('lspconfig').yamlls.setup{
      on_attach = function (client, _)
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
