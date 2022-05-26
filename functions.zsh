mkcdir() {
    mkdir -p -- "$1" &&
        cd -P -- "$1"
}

reload-zshrc() {
    source ~/.zshrc
}

imgpaste() {
    xclip -t image/png -o >$1
}

lls() {
    clear
    ls "$@"
}

borderless() {
    xprop -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"
}

borderless-undo() {
    xprop -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x1, 0x0, 0x0"
}

ffcompare() {
    ffplay $1 &
    ffplay $2
}

update-music-library() {
    if [ $(hostname) = chronos ]; then
        rsync -Pa --delete ~/Music/beets/ atlas:/nas/plex/Music
        rsync -Pa ~/.config/beets atlas:/nas/plex/Music/beetsconfig
    fi
}

update-music-library-remote() {
    if [ $(hostname) = chronos ]; then
        rsync -Pa --delete ~/Music/beets/ home.jamiequigley.com:/nas/plex/Music
        rsync -Pa ~/.config/beets home.jamiequigley.com:/nas/plex/Music/beetsconfig
    fi
}

aur() {
    git clone "https://aur.archlinux.org/$1"
}

abs() {
    asp update "$1" && asp checkout "$1"
}

cpufreq() {
    watch -n.1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""
}

git-pull-all() {
    for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
        git branch --track "${branch##*/}" "$branch"
    done
}
