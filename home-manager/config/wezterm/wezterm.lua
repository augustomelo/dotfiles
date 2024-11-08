-- https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, _)
  window:set_right_status(window:active_workspace() .. "  ")
end)

return {
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "nord",
  default_cwd = wezterm.home_dir .. "/workspace/personal",
  default_workspace = "personal",

  font = wezterm.font({
    family = "Monaspace Neon Var",
    weight = "Bold",
    harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
  }),

  font_size = 12,
  front_end = "WebGpu",
  initial_cols = 160,
  initial_rows = 48,

  leader = {
    key = "s",
    mods = "CTRL",
    timeout_milliseconds = 2000,
  },

  pane_focus_follows_mouse = true,
  set_environment_variables = {
    TERMINFO_DIRS = os.getenv("HOME") .. "/.nix-profile/share/terminfo",
  },
  term = "wezterm",
  unix_domains = { { name = "unix", }, },
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",

  keys = {
    { key = "h", mods = "ALT",            action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "j", mods = "ALT",            action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "ALT",            action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "l", mods = "ALT",            action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "a", mods = "LEADER",         action = wezterm.action.AttachDomain("unix"), },
    { key = "c", mods = "LEADER",         action = wezterm.action.SpawnTab("CurrentPaneDomain"), },
    { key = "d", mods = "LEADER",         action = wezterm.action.DetachDomain("CurrentPaneDomain"), },
    { key = "g", mods = "LEADER",         action = wezterm.action.ShowTabNavigator, },
    { key = "l", mods = "LEADER",         action = wezterm.action.ActivateLastTab },
    { key = "n", mods = "LEADER",         action = wezterm.action.ActivateTabRelative(1), },
    { key = "p", mods = "LEADER",         action = wezterm.action.ActivateTabRelative(-1), },
    { key = "s", mods = "LEADER",         action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY | WORKSPACES" }), },
    { key = "x", mods = "LEADER",         action = wezterm.action.CloseCurrentPane { confirm = true }, },
    { key = "z", mods = "LEADER",         action = wezterm.action.TogglePaneZoomState, },
    { key = "-", mods = "LEADER",         action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 }, }), },
    { key = "|", mods = "LEADER | SHIFT", action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 }, }), },
    { key = "{", mods = "LEADER | SHIFT", action = wezterm.action.PaneSelect({ mode = "SwapWithActiveKeepFocus" }) },
    { key = "!", mods = "LEADER | SHIFT", action = wezterm.action_callback(function(_, pane) pane:move_to_new_tab() end), },
    {
      key = ",",
      mods = "LEADER",
      action = wezterm.action.PromptInputLine({
        description = "Enter new name for tab",
        action = wezterm.action_callback(function(window, _, line)
          if line then
            window:active_tab():set_title(line)
          end
        end),
      }),
    },
  },
}
