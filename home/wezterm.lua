local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Jellybeans (Gogh)'
config.font = wezterm.font_with_fallback {
  'IosevkaTerm Nerd Font',
}
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true


-- and finally, return the configuration to wezterm
return config

