require("lib/table")

local full_config = {}
full_config = MergeAllTables(
  require("appearance"),
  require("keybindings"),
  config,
  {} -- so the last table can have an ending comma for git diffs
)
return full_config
