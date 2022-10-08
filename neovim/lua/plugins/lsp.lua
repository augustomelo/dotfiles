return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').gopls.setup{}

    require('lspconfig').jdtls.setup {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "-Xmx2g",
        "-jar",
        "/Users/meloaugu/util/ls/jdt/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuration",
        "/Users/meloaugu/util/ls/jdt/config_mac",
        "-data",
        "/tmp",
        "--add-modules=ALL-SYSTEM",
        "--add-opens java.base/java.util=ALL-UNNAMED",
        "--add-opens java.base/java.lang=ALL-UNNAMED",
      },
    }

    require('lspconfig').sumneko_lua.setup {
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
  end,
}
