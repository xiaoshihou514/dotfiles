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
	draw_graph_borders = false,
	gap_x = 910,
	font = "Fira Code Nerd Font",
	font1 = "Fira Code Nerd Font:size=16",
	use_xft = true,
	update_interval = 300,
}
-- pkg count, display info, hardware info, system info, sv services
conky.text = [[


                                 ${font}${color2}╭─────── ${font1}${color3}${voffset -5}Packages${color2}${font} ────────${voffset 0}
                                 │ ${color1} Installed: ${color2}${exec xbps-query -l | wc -l}
                                 │ ${color1} Explicit: ${color2}${exec xbps-query -m | wc -l}
                                 │ ${color1} Flatpak: ${color2}${exec echo $(($(flatpak list | wc -l)-1))}
                                 │ ${color1} Flatpak Explicit: ${color2}${exec echo $(($(flatpak list --app | wc -l)-1))}
          ╭──────────────────────╯
          │
                                 ╭────── ${font1}${color3}${voffset -5}Display${color2}${font} ────────────${voffset 0}
                                 │ ${color1} Resolution: ${color2}1920x1080 165Hz
                                 │ ${color1} DE: ${color2} ${exec cinnamon --version}
                                 │ ${color1} Theme: ${color2} Material-DeepOcean-BL
                                 │ ${color1} Icons: ${color2} DeepOcean
                                 │ ${color1} Font: ${color2} CaskaydiaCove Nerd Font
         ────────────────────────╯
                                 ╭─────────── ${font1}${color3}${voffset -5}Hardware${color2}${font} ────────────${voffset 0}
                                 │ ${color1} Model: ${color2}82JW Lenovo Legion R7000P2021
                                 │ ${color1} Processor: ${color2}AMD Ryzen 5 5600H (Radeon Graphics)
                                 │ ${color1} Graphics Card: ${color2}NVIDIA GeForce RTX 3050 Ti
  ╭──────────────────────────────┤ ${color1} Graphics Card: ${color2}AMD ATI Radeon Vega Series
  │                              │ ${color1} Battery: ${color2}Celxpert L20C4PC1
             ────╮               │ ${color1} Keyboard: ${color2}AT Translated Set 2 keyboard
                 │               ╰ ${color1} Disk: ${color2}KXG70ZNV1T02 NVMe KIOXIA
                 │               ╭───────────── ${font1}${color3}${voffset -5}System${color2}${font} ────────────${voffset 0}
                 ╰───────────────┤ ${color1} OS: ${color2}Void Linux
                                 │ ${color1} Kernel: ${color2}$kernel
  │                              ╰ ${color1} Arch: ${color2}$machine
  │                              ╭──────── ${font1}${color3}${voffset -5}Services${color2}${font} ────────${voffset 0}
  ╰──────────────────────────────┤ ${color1}STATE      SERVICE${color2}
${execp ls /var/service | awk '{for(i=1; i<=NF; i++){printf "\t\t\t\t  │ \${offset 275}\${color1}\${color2} enabled  %s\n",$i}}'}
                                 ╰──────────────────────────────
]]
