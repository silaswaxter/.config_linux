local wezterm = require "wezterm"
local act = wezterm.action

local config = {}
config.disable_default_key_bindings = true
config.keys = {
  ----------------------------------------------------------------------------
  ---- About Formatting
  ----------------------------------------------------------------------------
  -- The order of keybinding assignments of:
  --  1) key
  --  2) mods
  --  3) action
  -- is based on the official documentation. Also, when outputting the 
  -- currently applied keybindings, they are in this format.
  --
  -- When declaring mods, "SHIFT" should always occur first in the list.
  -- Additional modifiers in the list should be in alphabetical order.
  ----------------------------------------------------------------------------
  { key = "r", mods = "ALT|CTRL", action = act.ReloadConfiguration },
  { key = "F", mods = "CTRL", action = act.Search "CurrentSelectionOrEmptyString" },

  ---- Font
  { key = "0", mods = "CTRL", action = act.ResetFontSize},
  { key = "=", mods = "CTRL", action = act.IncreaseFontSize},
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize},
  -- insert unicode
  { key = "u", mods = "ALT", action = act.CharSelect{
      copy_on_select = true,
      copy_to =  "ClipboardAndPrimarySelection"
    }
  },

  ---- Copy & Paste
  { key = "C", mods = "SHIFT|CTRL", action = act.CopyTo "Clipboard" },
  { key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom "Clipboard" },
  -- consider changing to "v" to make it like visual mode. is it like visual
  -- mode or is it just simlliar?
  { key = "c", mods = "ALT", action = act.ActivateCopyMode },

  ---- Tab Management
  -- open/close
  { key = "t", mods = "ALT", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "Q", mods = "SHIFT|ALT", action = act.CloseCurrentTab{ confirm = true } },
  -- next/prev tab
  { key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
  { key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },
  { key = "H", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
  { key = "L", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
  -- specific tab
  { key = "1", mods = "ALT", action = act.ActivateTab(0) },
  { key = "2", mods = "ALT", action = act.ActivateTab(1) },
  { key = "3", mods = "ALT", action = act.ActivateTab(2) },
  { key = "4", mods = "ALT", action = act.ActivateTab(3) },
  { key = "5", mods = "ALT", action = act.ActivateTab(4) },
  { key = "6", mods = "ALT", action = act.ActivateTab(5) },
  { key = "7", mods = "ALT", action = act.ActivateTab(6) },
  { key = "8", mods = "ALT", action = act.ActivateTab(7) },
  { key = "9", mods = "ALT", action = act.ActivateTab(8) },
  { key = "!", mods = "SHIFT|ALT", action = act.MoveTab(0) },
  { key = "@", mods = "SHIFT|ALT", action = act.MoveTab(1) },
  { key = "#", mods = "SHIFT|ALT", action = act.MoveTab(2) },
  { key = "$", mods = "SHIFT|ALT", action = act.MoveTab(3) },
  { key = "%", mods = "SHIFT|ALT", action = act.MoveTab(4) },
  { key = "^", mods = "SHIFT|ALT", action = act.MoveTab(5) },
  { key = "&", mods = "SHIFT|ALT", action = act.MoveTab(6) },
  { key = "*", mods = "SHIFT|ALT", action = act.MoveTab(7) },
  { key = "(", mods = "SHIFT|ALT", action = act.MoveTab(8) },

  ---- Pane Management
  -- open/close
  { key = "q", mods = "ALT", action = act.CloseCurrentPane{ confirm = false } },
  { key = "s", mods = "ALT", action = act.SplitVertical{ domain =  "CurrentPaneDomain" } },
  { key = "v", mods = "ALT", action = act.SplitHorizontal{ domain =  "CurrentPaneDomain" } },
  -- focus
  { key = "P", mods = "CTRL", action = act.PaneSelect{ alphabet =  "", mode =  "Activate" } },
  { key = "h", mods = "CTRL", action = act.ActivatePaneDirection "Left" },
  { key = "j", mods = "CTRL", action = act.ActivatePaneDirection "Down" },
  { key = "k", mods = "CTRL", action = act.ActivatePaneDirection "Up" },
  { key = "l", mods = "CTRL", action = act.ActivatePaneDirection "Right" },
  -- move
  -- resize
  { key = "H", mods = "CTRL", action = act.AdjustPaneSize{"Left", 2} },
  { key = "J", mods = "CTRL", action = act.AdjustPaneSize{"Down", 2} },
  { key = "K", mods = "CTRL", action = act.AdjustPaneSize{"Up", 2} },
  { key = "L", mods = "CTRL", action = act.AdjustPaneSize{"Right", 2} },
  { key = "Z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState},

  ---- Scrolling
  { key = "J", mods = "SHIFT|CTRL", action = act.ScrollByLine(15) },
  { key = "K", mods = "SHIFT|CTRL", action = act.ScrollByLine(-15) },

}

config.key_tables = {
  copy_mode = {
    { key = "Tab", mods = "NONE", action = act.CopyMode "MoveForwardWord" },
    { key = "Tab", mods = "SHIFT", action = act.CopyMode "MoveBackwardWord" },
    { key = "Enter", mods = "NONE", action = act.CopyMode "MoveToStartOfNextLine" },
    { key = "Escape", mods = "NONE", action = act.CopyMode "Close" },
    { key = "Space", mods = "NONE", action = act.CopyMode{ SetSelectionMode =  "Cell" } },
    { key = "$", mods = "NONE", action = act.CopyMode "MoveToEndOfLineContent" },
    { key = "$", mods = "SHIFT", action = act.CopyMode "MoveToEndOfLineContent" },
    { key = ",", mods = "NONE", action = act.CopyMode "JumpReverse" },
    { key = "0", mods = "NONE", action = act.CopyMode "MoveToStartOfLine" },
    { key = ";", mods = "NONE", action = act.CopyMode "JumpAgain" },
    { key = "F", mods = "NONE", action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = "F", mods = "SHIFT", action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = "G", mods = "NONE", action = act.CopyMode "MoveToScrollbackBottom" },
    { key = "G", mods = "SHIFT", action = act.CopyMode "MoveToScrollbackBottom" },
    { key = "H", mods = "NONE", action = act.CopyMode "MoveToViewportTop" },
    { key = "H", mods = "SHIFT", action = act.CopyMode "MoveToViewportTop" },
    { key = "L", mods = "NONE", action = act.CopyMode "MoveToViewportBottom" },
    { key = "L", mods = "SHIFT", action = act.CopyMode "MoveToViewportBottom" },
    { key = "M", mods = "NONE", action = act.CopyMode "MoveToViewportMiddle" },
    { key = "M", mods = "SHIFT", action = act.CopyMode "MoveToViewportMiddle" },
    { key = "O", mods = "NONE", action = act.CopyMode "MoveToSelectionOtherEndHoriz" },
    { key = "O", mods = "SHIFT", action = act.CopyMode "MoveToSelectionOtherEndHoriz" },
    { key = "T", mods = "NONE", action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = "T", mods = "SHIFT", action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = "V", mods = "NONE", action = act.CopyMode{ SetSelectionMode =  "Line" } },
    { key = "V", mods = "SHIFT", action = act.CopyMode{ SetSelectionMode =  "Line" } },
    { key = "^", mods = "NONE", action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "^", mods = "SHIFT", action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "b", mods = "NONE", action = act.CopyMode "MoveBackwardWord" },
    { key = "b", mods = "ALT", action = act.CopyMode "MoveBackwardWord" },
    { key = "b", mods = "CTRL", action = act.CopyMode "PageUp" },
    { key = "c", mods = "CTRL", action = act.CopyMode "Close" },
    { key = "f", mods = "NONE", action = act.CopyMode{ JumpForward = { prev_char = false } } },
    { key = "f", mods = "ALT", action = act.CopyMode "MoveForwardWord" },
    { key = "f", mods = "CTRL", action = act.CopyMode "PageDown" },
    { key = "g", mods = "NONE", action = act.CopyMode "MoveToScrollbackTop" },
    { key = "g", mods = "CTRL", action = act.CopyMode "Close" },
    { key = "h", mods = "NONE", action = act.CopyMode "MoveLeft" },
    { key = "j", mods = "NONE", action = act.CopyMode "MoveDown" },
    { key = "k", mods = "NONE", action = act.CopyMode "MoveUp" },
    { key = "l", mods = "NONE", action = act.CopyMode "MoveRight" },
    { key = "m", mods = "ALT", action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "o", mods = "NONE", action = act.CopyMode "MoveToSelectionOtherEnd" },
    { key = "q", mods = "NONE", action = act.CopyMode "Close" },
    { key = "t", mods = "NONE", action = act.CopyMode{ JumpForward = { prev_char = true } } },
    { key = "v", mods = "NONE", action = act.CopyMode{ SetSelectionMode =  "Cell" } },
    { key = "v", mods = "CTRL", action = act.CopyMode{ SetSelectionMode =  "Block" } },
    { key = "w", mods = "NONE", action = act.CopyMode "MoveForwardWord" },
    { key = "y", mods = "NONE", action = act.Multiple{ { CopyTo =  "ClipboardAndPrimarySelection" }, { CopyMode =  "Close" } } },
    { key = "PageUp", mods = "NONE", action = act.CopyMode "PageUp" },
    { key = "PageDown", mods = "NONE", action = act.CopyMode "PageDown" },
    { key = "LeftArrow", mods = "NONE", action = act.CopyMode "MoveLeft" },
    { key = "LeftArrow", mods = "ALT", action = act.CopyMode "MoveBackwardWord" },
    { key = "RightArrow", mods = "NONE", action = act.CopyMode "MoveRight" },
    { key = "RightArrow", mods = "ALT", action = act.CopyMode "MoveForwardWord" },
    { key = "UpArrow", mods = "NONE", action = act.CopyMode "MoveUp" },
    { key = "DownArrow", mods = "NONE", action = act.CopyMode "MoveDown" },
  },

  search_mode = {
    { key = "Enter", mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "Escape", mods = "NONE", action = act.CopyMode "Close" },
    { key = "n", mods = "CTRL", action = act.CopyMode "NextMatch" },
    { key = "p", mods = "CTRL", action = act.CopyMode "PriorMatch" },
    { key = "r", mods = "CTRL", action = act.CopyMode "CycleMatchType" },
    { key = "u", mods = "CTRL", action = act.CopyMode "ClearPattern" },
    { key = "PageUp", mods = "NONE", action = act.CopyMode "PriorMatchPage" },
    { key = "PageDown", mods = "NONE", action = act.CopyMode "NextMatchPage" },
    { key = "UpArrow", mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "DownArrow", mods = "NONE", action = act.CopyMode "NextMatch" },
  },
}

return config
