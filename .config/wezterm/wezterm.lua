local wezterm = require "wezterm"
local action = wezterm.action
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
    "JetBrainsMono Nerd Font Mono"
}
config.font_size = 16.0

config.default_cursor_style = "SteadyBar"

config.enable_scroll_bar = false
config.enable_tab_bar = false
config.window_padding = {
    left = 5,
    right = 0,
    top = 5,
    bottom = 0,
}
config.leader = { mods = "CTRL", key = "a" }

config.keys = {
    { key = "a",  mods = "LEADER|CTRL", action = wezterm.action { SendString = "\x01" } },
    { key = "-",  mods = "LEADER",      action = action { SplitVertical = { domain = "CurrentPaneDomain" } } },
    { key = "\\", mods = "LEADER",      action = action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
    { key = "c",  mods = "LEADER",      action = action { SpawnTab = "CurrentPaneDomain" } },
    { key = "h",  mods = "LEADER",      action = action { ActivatePaneDirection = "Left" } },
    { key = "j",  mods = "LEADER",      action = action { ActivatePaneDirection = "Down" } },
    { key = "k",  mods = "LEADER",      action = action { ActivatePaneDirection = "Up" } },
    { key = "l",  mods = "LEADER",      action = action { ActivatePaneDirection = "Right" } },
    { key = "x",  mods = "LEADER",      action = action { CloseCurrentPane = { confirm = false } } },
    { key = "b",  mods = "LEADER",      action = action.ActivateTabRelative(-1) },
    { key = "n",  mods = "LEADER",      action = action.ActivateTabRelative(1) },
    { key = "[",  mods = "LEADER",      action = action.ActivateCopyMode },
    {
        key = "]",
        mods = "LEADER",
        action = action.Search { CaseInSensitiveString = "hash" },
    },
}

config.colors = {
    foreground = "#a8aeb4",
    background = "#1F2224",

    cursor_bg = "#6a7175",
    cursor_fg = "#1F2224",
    cursor_border = "#6a7175",

    selection_fg = "#1F2224",
    selection_bg = "#a8aeb4",

    split = "#7e858a",

    ansi = {
        "#4b5054",
        "#738b58",
        "#d89e98",
        "#c9bb7f",
        "#51849e",
        "#876aa8",
        "#42868d",
        "#8b9297",
    },
    brights = {
        "#62696d",
        "#d89e98",
        "#738b58",
        "#c9bb7f",
        "#51849e",
        "#cb98c3",
        "#42868d",
        "#9ba2a7",
    },

    -- I don"t need leader hinting
    compose_cursor = "#6a7175",
}

return config
