function proxy
    set port "127.0.0.1:9910"
    if test -n "$http_proxy" -a "$http_proxy" -eq $port; and test -n "$https_proxy" -a "$https_proxy" -eq $port
        set -g http_proxy ''
        set -g https_proxy ''
        echo 'Proxy closed'
        return
    end
    set -g http_proxy $port
    set -g https_proxy $port
    echo 'Proxy ready'
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
    test (/bin/ls -l | count) -lt 141; and ls
end

function z
    __zoxide_z $argv
    test (/bin/ls -l | count) -lt 141; and ls
end

function zi
    __zoxide_zi $argv
    test (/bin/ls -l | count) -lt 141; and ls
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
    set url "https://github.com/neovim/neovim/releases/download/nightly/"
    # set url "https://mirror.ghproxy.com/https://github.com/neovim/neovim/releases/download/nightly/"
    set tarball "nvim-linux64.tar.gz"
    set chksum "nvim-linux64.tar.gz.sha256sum"
    builtin cd $HOME/Applications/
    wget $url$tarball
    wget $url$chksum
    if test (sha256sum -c $chksum) != "nvim-linux64.tar.gz: OK"
        set_color red
        echo "Neovim binary corrupted!"
        set_color normal
        rm $tarball $chksum
        builtin cd $OLDPWD
        return 1
    end
    echo "sha256 verified"
    rm -rf nvim-nightly 2>/dev/null
    tar -xf $tarball
    mv nvim-linux64 nvim-nightly
    rm $tarball $chksum
    echo "Neovim updated successfully"
    echo
    ./nvim-nightly/bin/nvim --version
    builtin cd $OLDPWD
end

function flac
    if test (count $argv) -eq 1
        set extension $argv[1]
        for f in *.$extension
            set out (string replace -r '\.'$extension'$' '.flac' $f)
            ffmpeg -i $f -c:a flac $out; or echo "mission for $out failed" && return
        end
        rm *.$extension
    else
        echo "only accepts one argument"
    end
end

function icat
    if test $TERM = xterm-kitty
        kitty +kitten icat $argv
    else if test $TERM = xterm-256color
        wezterm imgcat $argv
    end
end

function man
    vi "+tab Man $argv" \
        "+norm gt" \
        "+quit"
end

function subaudio
    if test $argc != 4
        echo subaudio [file] [start] [length] [out]
        return
    end
    ffmpeg -i $argv[1] -ss $argv[2] -t $argv[3] $argv[4]
end
