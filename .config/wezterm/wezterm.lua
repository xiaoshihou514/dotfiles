local wezterm = require("wezterm")
local action = wezterm.action
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- disable wayland until it has been properly fixed
-- config.enable_wayland = false

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- visual stuff
config.font = wezterm.font(
	"Fira Code",
	-- "Monaspace Radon"
	-- "Rec Mono Casual",
	{
		-- weight = "Medium",
	}
)
config.default_prog = { "/bin/fish" }
config.font_size = 15.0
config.custom_block_glyphs = false
config.cursor_blink_rate = 0
config.default_cursor_style = "SteadyBar"
config.enable_scroll_bar = false
config.enable_tab_bar = false
config.window_padding = {
	left = 5,
	right = 0,
	top = 5,
	bottom = 0,
}

-- ibus integration
config.use_ime = true
config.xim_im_name = "ibus"

-- keybindings
config.leader = { mods = "CTRL", key = "a" }
config.keys = {
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
	{ key = "-", mods = "LEADER", action = action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "LEADER", action = action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "c", mods = "LEADER", action = action({ SpawnTab = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "LEADER", action = action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "LEADER", action = action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "LEADER", action = action({ ActivatePaneDirection = "Right" }) },
	{ key = "x", mods = "LEADER", action = action({ CloseCurrentPane = { confirm = false } }) },
	{ key = "p", mods = "LEADER", action = action.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = action.ActivateTabRelative(1) },
	{ key = "[", mods = "LEADER", action = action.ActivateCopyMode },
	{ key = "g", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
	{
		key = "]",
		mods = "LEADER",
		action = action.Search({ CaseInSensitiveString = "" }),
	},

	-- gdb stuff
	{ key = "F5", action = wezterm.action({ SendString = "continue\n" }) },
	{ key = "F10", action = wezterm.action({ SendString = "next\n" }) },
	{ key = "F11", action = wezterm.action({ SendString = "step\n" }) },
	{
		key = "F11",
		mods = "SHIFT",
		action = wezterm.action({ SendString = "finish\n" }),
	},

	-- slower scroll
	{ key = "UpArrow", mods = "SHIFT", action = action.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = action.ScrollByLine(1) },
}

-- moonlight
config.colors = {
	foreground = "#a8aeb4",
	background = "#1F2224",

	cursor_bg = "#6a7175",
	cursor_fg = "#1F2224",
	cursor_border = "#6a7175",

	selection_fg = "#a8aeb4",
	selection_bg = "#44494c",

	split = "#7e858a",

	ansi = { "#4b5054", "#d89e98", "#738b58", "#c9bb7f", "#51849e", "#876aa8", "#42868d", "#8b9297" },
	brights = { "#62696d", "#d5a37b", "#738b58", "#c9bb7f", "#51849e", "#c59eb4", "#42868d", "#9ba2a7" },

	-- I don't need leader hinting
	compose_cursor = "#6a7175",
}

return config
