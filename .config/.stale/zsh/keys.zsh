bindkey -v
export KEYTIMEOUT=500
if [[ -o menucomplete ]]; then
	# Use vim keys in tab complete menu:
	bindkey -M menuselect '^h' vi-backward-char
	bindkey -M menuselect '^l' vi-forward-char
	bindkey -M menuselect '^n' vi-down-line-or-history
	bindkey -M menuselect '^p' vi-up-line-or-history
fi
# qi to quit insert
bindkey -M viins 'qi' vi-cmd-mode
# C-n and C-p to navigate histroy
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward
# search completion
bindkey -M menuselect '?' history-incremental-search-forward
bindkey -M menuselect '/' history-incremental-search-backward
# Change cursor shape for different vi modes.
function zle-keymap-select() {
	case $KEYMAP in
	vicmd) echo -ne '\e[1 q' ;;        # block
	viins | main) echo -ne '\e[5 q' ;; # beam
	esac
}
zle -N zle-keymap-select
echo -ne '\e[5 q'                # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q'; } # Use beam shape cursor for each new prompt.
