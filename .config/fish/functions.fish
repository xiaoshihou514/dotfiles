function proxy
    set port "127.0.0.1:7897"
    if test -n "$http_proxy" -a "$http_proxy" = $port; and test -n "$https_proxy" -a "$https_proxy" = $port
        set -g http_proxy ''
        set -g https_proxy ''
        echo 'Proxy closed'
    else
        set -g http_proxy $port
        set -g https_proxy $port
        echo 'Proxy ready'
    end
end

function full-upgrade
    sudo dnf upgrade -y
    sudo dnf autoremove -y
    sudo dnf clean all
    flatpak update -y
    flatpak remove --unused -y
    update-neovim
end

function cd
    builtin cd $argv
    if test (/bin/ls -l | count) -lt 141
        ls
    end
end

function z
    __zoxide_z $argv
    if test (/bin/ls -l | count) -lt 141
        ls
    end
end

function zi
    __zoxide_zi $argv
    if test (/bin/ls -l | count) -lt 141
        ls
    end
end

function psa
    ps -aux | grep $argv[1] | grep -v grep
end

function wcls
    for file in *
        wc -l "$file"
    end
end

function audio-truncate
    set file $argv[1]
    ffmpeg -i $file -ss $argv[2] -c copy "truncated_"$file; and rm $file; and mv "truncated_"$file $file
end

function update-neovim
    # set url "https://github.com/neovim/neovim/releases/download/nightly/"
    set url "https://ghfast.top/https://github.com/neovim/neovim/releases/download/nightly/"
    set tarball "nvim-linux-x86_64.tar.gz"
    builtin cd $HOME/Applications/
    wget $url$tarball
    rm -rf nvim-nightly 2>/dev/null
    tar -xf $tarball
    mv nvim-linux-x86_64 nvim-nightly
    rm $tarball
    echo "Neovim updated successfully"
    echo
    ./nvim-nightly/bin/nvim --version
    builtin cd $OLDPWD
end

function trash
    for f in $argv
        set rp (realpath $f)
        kioclient move "file://$rp" 'trash:/'
    end
end

function atr
    set dest $argv[1]
    for f in $argv[2..-1]
        set out (string replace -r '\..+$' ".$dest" $f)
        ffmpeg -i $f $out; or echo "mission for $out failed" && return
    end
    trash $argv[2..-1]
end

function icat
    if test $TERM = xterm-kitty
        kitty +kitten icat $argv
    else if test $TERM = xterm-256color
        wezterm imgcat $argv
    end
end

function subaudio
    if test (count $argv) -ne 4
        echo subaudio [file] [start] [length] [out]
        return
    end
    ffmpeg -i $argv[1] -ss $argv[2] -t $argv[3] $argv[4]
end

function create-desktop
    read -l -P "Name: " name
    if not test name
        return
    end
    read -l -P "Icon path: " icon_path
    set file "$HOME/.local/share/applications/$name.desktop"
    echo "\
[Desktop Entry]
Exec=$(pwd)/$argv" >$file
    if test icon_path
        echo "Icon=$(pwd)/$icon_path" >>$file
    end
    echo "\
Type=Application
Name=$name
" >>$file
end

function vimf
    set nvim (which nvim)
    $nvim $(fzf) -c "if argc() == 0 | qa! | endif"
end

function vimg
    set nvim (which nvim)
    echo 'Type to start grepping' | fzf \
        --layout=reverse \
        --disabled --ansi \
        --border=sharp \
        --delimiter : \
        --preview='bat --theme=moonlight-ansi --color=always -pp --highlight-line {2} {1}' \
        --preview-window '+{2}/2' \
        --bind "change:reload:rg --column --color=always {q} || :" \
        --bind "enter:become:$nvim {1}"
end

function each
    for f in *
        $argv $f
    end
end

function wireless-adb
    set adb "$FL_ANDROID_SDK/platform-tools/adb"
    $adb devices
    if not test (ps -aux | rg adb | rg fork-server)
        echo "adbd not running..."
        $adb tcpip 5555
    else
        echo "adbd is running, connect"
    end
    $adb connect $argv
end

function merge
	bash -c 'find . -maxdepth 1 -name "*.AVI" -printf "file \'%p\'\n" | sort > target.txt'
	ffmpeg -f concat -safe 0 -i target.txt -c copy $argv
end
