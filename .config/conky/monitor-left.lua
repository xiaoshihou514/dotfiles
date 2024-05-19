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
	gap_x = 20,
	font = "Fira Code Nerd Font",
	font1 = "Fira Code Nerd Font:size=16",
	font2 = "Fira Code Nerd Font:size=24",
	use_xft = true,
	update_interval = 3,
}
-- time, cpu, ram, disk
conky.text = [[
${color2}${alignc}${font2}${time %R}
${alignc}${font1}${time %Y %B %d %A}
${font}╭───────────────────────────────────╮
│  ${color3}${font1} CPU${font}${color2}${alignr}│
│  ${color1} Temperature: ${color2}${hwmon 4 temp 1}°C${alignr}│
│  ${color1} Frequency: ${color2}${freq 0} Mhz${alignr}│
│  ${color1} Usage: ${color2}${cpu cpu0}%${alignr}│
│  ${voffset 5}${color1}${cpubar cpu0 14,310}${color2}${alignr}│
│                                   │
│  ${voffset -5}${color1} Individual Usage:${color2}${alignr}│
│  ${color1}${cpugraph cpu1 40,85 A6DA95 ED8796}  ${cpugraph cpu2 40,85 A6DA95 ED8796}  ${cpugraph cpu3 40,85 A6DA95 ED8796}${color2}${offset 35}${voffset -36}│
│                                   │
│                                   │
│  ${color1}${cpugraph cpu4 40,85 A6DA95 ED8796}  ${cpugraph cpu5 40,85 A6DA95 ED8796}  ${cpugraph cpu6 40,85 A6DA95 ED8796}${color2}${offset 35}${voffset -36}│
│                                   │
│                                   │
│  ${color1}${cpugraph cpu7 40,85 A6DA95 ED8796}  ${cpugraph cpu8 40,85 A6DA95 ED8796}  ${cpugraph cpu9 40,85 A6DA95 ED8796}${color2}${offset 35}${voffset -36}│
│                                   │
│                                   │
│  ${color1}${cpugraph cpu10 40,85 A6DA95 ED8796}  ${cpugraph cpu11 40,85 A6DA95 ED8796}  ${cpugraph cpu12 40,85 A6DA95 ED8796}${color2}${offset 35}${voffset -36}│
│                                   │
│                                   │
╰───────────────────────────────────╯
╭───────────────────────────────────╮
│  ${color3}${font1} Memory${font}${color2}${offset 226}│
│  ${color1} Used: ${color2}${mem} (${memperc}%)${alignr}│
│  ${color1} Cached: ${color2}${memeasyfree}${alignr}│
│  ${color1} Free: ${color2}${memfree}${alignr}│
│  ${color1} Total: ${color2}${memmax}${alignr}│
│  ${color1}${memgraph cpu10 40,310 A6DA95 ED8796}${color2}  ${voffset -40}│
│                                   │
│                                   │
╰───────────────────────────────────╯
╭───────────────────────────────────╮
│  ${color3}${font1} Disk${font}${color2}${alignr}│
│  ${color1} Info: ${color2}NVMe KIOXIA(${fs_type})${alignr}│
│  ${color1} Used: ${color2}${fs_used} (${fs_used_perc}%)${alignr}│
│  ${color1} Free: ${color2}${fs_free}${alignr}│
│  ${color1} Read: ${color2}${diskio_read}${alignr}│
│  ${color1} Write: ${color2}${diskio_write}${alignr}│
│  ${color1} Temperature: ${color2}${hwmon 0 temp 1}°C${alignr}│
│  ${color1}${diskiograph_read nvme0ni 40,310 A6DA95 ED8796}${color2}  ${voffset -40}│
│                                   │
│                                   │
│  ${color1}${diskiograph_read nvme0n1 40,310 A6DA95 ED8796}${color2}  ${voffset -40}│
│                                   │
│                                   │
╰───────────────────────────────────╯
]]
