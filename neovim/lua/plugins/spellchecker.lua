return {
  'kamykn/spelunker.vim',
  config = function()
    vim.g.spelunker_spell_bad_group = "SpellBad"
    vim.g.spelunker_complex_or_compound_word_group = "SpellRare"

    vim.g.spelunker_white_list_for_user = {
      'github',
      'kuberenets',
    }
  end,
}
