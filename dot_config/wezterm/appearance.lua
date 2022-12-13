require("lib/table")
local wezterm = require 'wezterm'

local config = {}
config.font = wezterm.font 'FiraCode Nerd Font'
config.hide_tab_bar_if_only_one_tab = true

local appearance_config = {}
appearance_config = MergeAllTables(
  config,
  require("colors"),
  {} -- so the last table can have an ending comma for git diffs
)

return appearance_config
