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

# ── lfb: DATA file browser (local_filebrowser.py) behind a cloudflared tunnel ──
#   lfb          start tunnel if not running, (re)start server, publish to RTDB, print /p link
#   lfb status   show what is running + the current links
#   lfb stop     stop server and tunnel
lfb() {
  local dir="$HOME/PROJECTS/SHAKIR_PROJECTS/server-code"
  local rtdb="https://kline-data-default-rtdb.asia-southeast1.firebasedatabase.app/ptunnel"
  local id url pub i
  case "$1" in
    stop)
      pkill -f local_filebrowser.py; pkill -f lfb_tunnel.sh
      pkill -f "cloudflared tunnel --no-autoupdate --url http://127.0.0.1:8765"
      echo "lfb stopped"; return ;;
    status)
      pgrep -f lfb_tunnel.sh >/dev/null && echo "tunnel : running" || echo "tunnel : stopped"
      pgrep -f local_filebrowser.py >/dev/null && echo "server : running" || echo "server : stopped"
      id=$(cat ~/.local_filebrowser_publish_id 2>/dev/null)
      echo "rtdb   : $(curl -s -m 10 "$rtdb/$id.json")"
      echo "link   : https://kline-data.web.app/p/$id"; return ;;
  esac

  # 1) tunnel — only if not already running (a restart would change the trycloudflare URL)
  if ! pgrep -f lfb_tunnel.sh >/dev/null; then
    echo "starting tunnel…"
    (cd "$dir" && nohup ./lfb_tunnel.sh >/dev/null 2>&1 &)
  else
    echo "tunnel already running"
  fi

  # 2) server — always (re)start so code changes take effect; it publishes the tunnel URL itself
  pkill -f local_filebrowser.py; sleep 1; pkill -9 -f local_filebrowser.py 2>/dev/null
  (cd "$dir" && nohup .venv/bin/python -u local_filebrowser.py --no-tunnel > ~/lfb.out 2>&1 &)
  echo "server started (log: ~/lfb.out)"

  # 3) wait until the newest tunnel URL is up and published to RTDB
  #    only a URL logged after the latest "starting tunnel" marker counts (older ones are dead),
  #    and it must actually answer before we call it up
  local up=""
  for i in {1..60}; do
    sleep 1
    id=$(cat ~/.local_filebrowser_publish_id 2>/dev/null)
    url=$(awk '/^=== .* starting tunnel/{u=""} match($0,/https:\/\/[a-z0-9-]+\.trycloudflare\.com/){u=substr($0,RSTART,RLENGTH)} END{print u}' ~/lfb_tunnel.log 2>/dev/null)
    [[ -z "$url" ]] && continue
    pub=$(curl -s -m 5 "$rtdb/$id.json" | tr -d '"')
    [[ "$pub" == "$url" ]] || continue
    curl -s -m 5 -o /dev/null -w '%{http_code}' "$url/isAvailable" | grep -q 200 && { up=1; break; }
  done
  if [[ -n "$up" ]]; then
    echo "tunnel : $url"
    echo "link   : https://kline-data.web.app/p/$id"
  else
    echo "not published yet — check ~/lfb.out and ~/lfb_tunnel.log, or run: lfb status"
  fi
}
