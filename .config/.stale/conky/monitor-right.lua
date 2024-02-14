conky.config = {
	background = true,
	color1 = "A6DA95", -- #A6DA95 subtitle
	color2 = "CAD3F5", -- #CAD3F5 text
	color3 = "7DC4E4", -- #7DC4E4 title
	alignment = "top_left",
	own_window = true,
	own_window_type = "normal",
	own_window_transparent = false,
	own_window_hints = "undecorated,sticky,below,skip_taskbar,skip_pager",
	own_window_argb_visual = true,
	double_buffer = true,
	draw_shades = false,
	own_window_argb_value = 0, --transparency
	text_buffer_size = 10000,
	gap_x = 400,
	gap_y = 118,
	font = "Fira Code Nerd Font",
	font1 = "Fira Code Nerd Font:size=16",
	font2 = "Fira Code Nerd Font:size=24",
	use_xft = true,
	update_interval = 3,
}
-- net, battery
conky.text = [[
╭───────────────────────────────────╮
│  ${color3}${font1} Network${font}${color2}${alignr}│
│  ${color1} IP: ${color2}${addr wlp4s0}${alignr}│
│  ${color1} Bitrate: ${color2}${wireless_bitrate wlp4s0}${alignr}│
│  ${color1} Up: ${color2}${upspeed wlp4s0} (${totalup wlp4s0} total)${alignr}│
│  ${color1} Down: ${color2}${downspeed wlp4s0} (${totaldown wlp4s0} total)${alignr}│
│  ${color1}${upspeedgraph wlp4s0 40,310 A6DA95 ED8796}${color2}  ${voffset -40}│
│                                   │
│                                   │
│  ${color1}${downspeedgraph wlp4s0 40,310 A6DA95 ED8796}${color2}  ${voffset -40}│
│                                   │
│                                   │
╰───────────────────────────────────╯
╭───────────────────────────────────╮
│  ${color3}${font1} Battery${font}${color2}${alignr}│
│  ${color1} Status: ${color2}${battery_status}${alignr}│
│  ${color1} Percentage: ${color2}${battery_percent}%${alignr}│
│  ${color1} Time left: ${color2}${battery_time}${alignr}│
╰───────────────────────────────────╯
]]
