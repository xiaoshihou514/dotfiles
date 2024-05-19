#!/bin/bash
if [ $(ps -aux | grep conky | wc -l) -lt 4 ]; then
	conky -c $HOME/.config/conky/stats.lua
	conky -c $HOME/.config/conky/monitor-left.lua
	conky -c $HOME/.config/conky/monitor-right.lua
else
	pkill conky
fi
