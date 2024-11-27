#! /bin/fish

function sync
    set dest ~/.config/$argv[1]
    set source .config/$argv[1]
    test -e $source; and rm -rf $dest && cp -r $source $dest && return
    set alt_source .config/.stale/$argv[1]
    test -e $alt_source; and rm -rf $dest && cp -r $alt_source $dest && return
    echo "Error: $argv[1] not found"
end

sync fish
sync wezterm
