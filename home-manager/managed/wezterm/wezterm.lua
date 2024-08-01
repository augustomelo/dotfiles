-- https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")

return {
  color_scheme = "nord",

  -- https://gist.github.com/ErebusBat/9744f25f3735c1e0491f6ef7f3a9ddc3
  font = wezterm.font({
    family = "Monaspace Neon Var",
    weight = "Bold",
    harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
  }),

  font_size = 11,

  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
}
