local wezterm = require('wezterm')
local act = wezterm.action

local function isViProcess(pane)
    return pane:get_foreground_process_name():find('n?vim') ~= nil
end

function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if isViProcess(pane) then
        window:perform_action(
            -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = 'ALT' }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end

