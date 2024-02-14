function source_config
    source $HOME/.config/fish/$argv[1]
end

if status is-interactive
    set -g fish_greeting ""
    fish_hybrid_key_bindings
    bind -M insert -m default qi backward-char force-repaint
    set -g fish_cursor_insert line blink
    set -g fish_cursor_default block
    set -g fish_cursor_visual block
    set -g fish_cursor_replace_one underscore
    set -g fish_vi_force_cursor 1

    source_config env.fish
    source_config alias.fish
    source_config functions.fish
    source_config private.fish
end
