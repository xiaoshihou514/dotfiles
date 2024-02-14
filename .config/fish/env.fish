# Path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/Applications/nvim-nightly/bin
fish_add_path $HOME/.local/share/nanovim/mason/bin
fish_add_path $HOME/Applications/lua_ls/bin
fish_add_path $HOME/Applications/stylua-linux
fish_add_path $HOME/.luarocks/bin
fish_add_path $HOME/Applications/kotlin_ls/bin
fish_add_path $HOME/Applications/kotlin_dap/bin
fish_add_path $HOME/Applications/detekt-cli-1.23.3/bin
fish_add_path $HOME/Applications/flutter/bin
fish_add_path $HOME/Applications/android_sdk/cmdline-tools/latest/bin

# Setup programs
zoxide init fish | source

flutter config --android-sdk $HOME/Applications/android_sdk/ >/dev/null &

wezterm shell-completion --shell fish | source
