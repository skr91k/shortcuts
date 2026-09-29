export PATH="/Users/shakir/flutter/bin:$PATH"

export NVM_DIR="$HOME/.nvm"  # Replace with your actual nvm directory if different
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


export PATH="$PATH":"$HOME/.pub-cache/bin"





export PATH="$PATH:$HOME/flutter/bin"

export LC_ALL=en_US.UTF-8


export LANG=en_US.UTF-8


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"



export PATH=/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.0.0/bin:$PATH 


export HDC_SERVER_PORT=7035

export PATH="$HOME:$PATH"

export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/shakir/.dart-cli-completion/zsh-config.zsh ]] && . /Users/shakir/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="/Users/shakir/.shorebird/bin:$PATH"
export PATH="$HOME/depot_tools:$PATH"
export PATH="$HOME/depot_tools:$PATH"
export PATH="$HOME/depot_tools:$PATH"
export PATH="$HOME/depot_tools:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin





# Function to automatically beep for commands over 10 seconds
auto_beep() {
    local start_time=$(date +%s)
    "$@"
    local exit_code=$?
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    
    if [ $duration -gt 10 ]; then
        if [ $exit_code -eq 0 ]; then
            say "completed"
        else
            say "failed"
        fi
    fi
    
    return $exit_code
}
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Added by Antigravity
export PATH="/Users/shakir/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/shakir/.antigravity/antigravity/bin:$PATH"
gitt() {
    if [ $# -eq 0 ]; then
        echo "Running: git add . && git commit -m \"commit\" && git push"
        git add . && git commit -m "commit" && git push
    else
        echo "Running: git add . && git commit -m \"$*\" && git push"
        git add . && git commit -m "$*" && git push
    fi
}
function bd {
    local msg="${*:-auto commit on deploy}"
    echo "Running: npm run build && firebase deploy --only hosting && git add . && git commit -m \"$msg\" && git push"
    npm run build && firebase deploy --only hosting && git add . && git commit -m "$msg" && git push
}
alias bd='noglob bd'
function ba {
    if [ -z "$1" ]; then echo "Usage: ba <url>"; return 1; fi
    echo "Running: yt-dlp -f bestaudio \"$1\""
    yt-dlp -f bestaudio -o "$HOME/Downloads/%(title)s.%(ext)s" "$1"
}
alias ba='noglob ba'
function bv {
    if [ -z "$1" ]; then echo "Usage: bv <url>"; return 1; fi
    echo "Running: yt-dlp -f bestvideo+bestaudio \"$1\""
    yt-dlp -f "bestvideo+bestaudio" -o "$HOME/Downloads/%(title)s.%(ext)s" "$1"
}
alias bv='noglob bv'
function uz {
    local repo="$HOME/.shortcuts"
    echo "Running: source ~/.zshrc"
    source ~/.zshrc || return 1
    if [ ! -d "$repo/.git" ]; then
        git clone https://github.com/skr91k/shortcuts.git "$repo" || return 1
    fi
    git -C "$repo" pull --rebase -q || return 1
    cp ~/.zshrc "$repo/zshrc"
    if git -C "$repo" diff --quiet -- zshrc && ! git -C "$repo" ls-files --others --exclude-standard | grep -q '^zshrc$'; then
        echo "zshrc unchanged, nothing to push"
        return 0
    fi
    local msg="${*:-update zshrc}"
    echo "Running: git commit -m \"$msg\" && git push (in $repo)"
    git -C "$repo" add zshrc && git -C "$repo" commit -q -m "$msg" && git -C "$repo" push -q
}
alias uz='noglob uz'
ramdisk() {
    if [ "$1" = "stop" ]; then
        local found=0
        for dev in $(hdiutil info | awk '/^image-path.*ram:\/\//{f=1} /^\/dev\/disk[0-9]+[[:space:]]/{if(f){print $1; f=0}}'); do
            echo "Ejecting $dev"
            diskutil eject "$dev" >/dev/null 2>&1 || hdiutil detach "$dev" -force >/dev/null 2>&1
            found=1
        done
        [ $found -eq 0 ] && echo "No ramdisk volumes mounted." || echo "All ramdisks ejected."
        return 0
    fi
    local mb=${1:-100}
    if ! [[ "$mb" =~ ^[0-9]+$ ]]; then echo "Usage: ramdisk [size_mb|stop]"; return 1; fi
    local sectors=$((mb * 2048))
    local dev=$(hdiutil attach -nomount ram://$sectors | tr -d '[:space:]')
    diskutil erasevolume HFS+ "RAMDisk" "$dev" >/dev/null || return 1
    echo "Mounted ${mb}MB ramdisk at /Volumes/RAMDisk ($dev)"
}
source "$HOME/PROJECTS/SHAKIR_PROJECTS/adb-files/adbb.zsh"

# Added by Antigravity IDE
export PATH="/Users/shakir/.antigravity-ide/antigravity-ide/bin:$PATH"
