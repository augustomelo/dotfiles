return {
  'jose-elias-alvarez/null-ls.nvim',
  config = function() require('null-ls').setup {
      ft = { 'gitcommit', 'markdown', 'text' },
      sources = {
        require('null-ls').builtins.diagnostics.vale.with({
          filetypes = { 'gitcommit', 'markdown', 'text' },
          args = function ()
            local vale_config = vim.fn.findfile('.vale.ini', '.;')

            if vale_config == '' then
              vale_config = vim.env.XDG_CONFIG_HOME .. '/vale/vale.ini'
            end

            return {
              '--no-exit',
              '--output=JSON',
              '--config=' .. vale_config,
              '$FILENAME',
            }
          end
        })
      }
    }
  end
}
