local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Batman'

config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 15.0

config.color_scheme = 'Catppuccin Frappe'

config.window_frame = {
  active_titlebar_bg = '#353C50',
  inactive_titlebar_bg = '#353C50',
  font = wezterm.font("JetBrainsMono NF"),
  font_size = 14.0,
}

config.colors = {
  tab_bar = {
    background = '#353C50',
    active_tab = {
      bg_color = '#2F3546',
      fg_color = '#FFFFFF',
    },
    inactive_tab = {
      bg_color = '#414559',
      fg_color = '#FFFFFF',
    },
    inactive_tab_hover = {
      bg_color = '#353C50',
      fg_color = '#FFFFFF',
    },
  },
}

config.send_composed_key_when_left_alt_is_pressed = true

  config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

  config.keys = {
    {
      key = '"',
      mods = 'LEADER',
      action = wezterm.action {
        SplitVertical = {
          domain = "CurrentPaneDomain",
        },
      },
    },
    {
      key = ':',
      mods = 'LEADER',
      action = wezterm.action {
        SplitHorizontal = {
          domain = "CurrentPaneDomain",
        },
      },
    },
    {
      key = "RightArrow",
      mods = "SHIFT",
    action = wezterm.action { ActivateTabRelative = 1 },
  },
  {
    key = "LeftArrow",
    mods = "SHIFT",
    action = wezterm.action { ActivateTabRelative = -1 },
  },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action { SpawnTab = "CurrentPaneDomain" },
  },
}

config.window_decorations = "RESIZE"

return config
