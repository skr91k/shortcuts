export PATH="/Users/shakir/flutter/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

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

bd() {
    echo "Running: npm run build && firebase deploy --only hosting"
    npm run build && firebase deploy --only hosting
}
