# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# ZSHRC FOR PYTHON FASTAPI BACKEND AI & REACT DEVELOPMENT
# Optimized for modern full-stack development
# ============================================================================

# Path Configuration
# ============================================================================
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/python@3.11/bin:$PATH"  # Adjust Python version as needed
export PATH="$HOME/.npm-global/bin:$PATH"

# Oh My Zsh Configuration
# ============================================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Performance: Faster repo status checks
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History Configuration
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# Plugins - Essential for Python, Node, Docker, Git development
# ============================================================================
plugins=(
    git
    docker
    docker-compose
    node
    npm
    yarn
    python
    pip
    virtualenv
    vscode
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
    colored-man-pages
    copypath
    copyfile
    jsontools
)

source $ZSH/oh-my-zsh.sh

# Environment Variables
# ============================================================================
export LANG=en_US.UTF-8
export EDITOR='code -w'  # VS Code as default editor
export VISUAL='code'

# Python Configuration
export PYTHONDONTWRITEBYTECODE=1  # Prevent .pyc files
export PYTHONUNBUFFERED=1  # Real-time output
export PIPENV_VENV_IN_PROJECT=1  # Keep venvs in project folder

# Node Configuration
export NODE_ENV=development
export NPM_CONFIG_PREFIX="$HOME/.npm-global"

# AI/ML Configuration
export TF_CPP_MIN_LOG_LEVEL=2  # Reduce TensorFlow logging
export TOKENIZERS_PARALLELISM=false  # Avoid warnings with HuggingFace

# ============================================================================
# PYTHON & FASTAPI ALIASES
# ============================================================================

# Virtual Environment
alias venv='python3 -m venv venv'
alias va='source venv/bin/activate'
alias vd='deactivate'
alias vr='deactivate && rm -rf venv && python3 -m venv venv && source venv/bin/activate'

# Python Package Management
alias pi='pip install'
alias pir='pip install -r requirements.txt'
alias pidev='pip install -r requirements-dev.txt'
alias pf='pip freeze > requirements.txt'
alias plist='pip list'
alias pu='pip install --upgrade pip'

# FastAPI Development
alias uvicorn='uvicorn main:app --reload'
alias uvicornp='uvicorn main:app --reload --port'
alias uvicornh='uvicorn main:app --reload --host 0.0.0.0 --port 8000'

# Python Testing & Quality
alias pytest='pytest -v'
alias pyt='pytest -v --cov'
alias pytw='pytest -v --cov --cov-report=html'
alias black='black .'
alias isort='isort .'
alias flake='flake8 .'
alias mypy='mypy .'
alias pylint='pylint **/*.py'

# Python Shortcuts
alias py='python3'
alias ipy='ipython'
alias jnb='jupyter notebook'
alias jlab='jupyter lab'

# ============================================================================
# REACT & NODE.JS ALIASES
# ============================================================================

# NPM
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias nb='npm run build'
alias ndev='npm run dev'
alias nprod='npm run build && npm run start'
alias nci='rm -rf node_modules package-lock.json && npm install'

# Yarn (alternative)
alias yi='yarn install'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'
alias ys='yarn start'
alias yt='yarn test'
alias yb='yarn build'
alias ydev='yarn dev'

# React Development
alias cra='npx create-react-app'
alias crva='npm create vite@latest'
alias nextapp='npx create-next-app@latest'

# ============================================================================
# GIT ALIASES (Enhanced)
# ============================================================================

alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gca='git commit -am'
alias gp='git push'
alias gpl='git pull'
alias gpo='git push origin'
alias gplo='git pull origin'
alias gf='git fetch'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout main'
alias gm='git merge'
alias gl='git log --oneline --graph --decorate'
alias gll='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gd='git diff'
alias gds='git diff --staged'
alias gr='git reset'
alias grh='git reset --hard'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gclean='git clean -fd'

# ============================================================================
# DOCKER ALIASES
# ============================================================================

alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dstop='docker stop $(docker ps -aq)'
alias drm='docker rm $(docker ps -aq)'
alias drmi='docker rmi $(docker images -q)'
alias dprune='docker system prune -af --volumes'

# Docker Compose
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias dcr='docker-compose restart'
alias dcl='docker-compose logs -f'

# ============================================================================
# UTILITY ALIASES
# ============================================================================

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# Listing
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -alht'  # Sort by time
alias lsize='ls -alhS'  # Sort by size

# System
alias reload='source ~/.zshrc'
alias zshconfig='code ~/.zshrc'
alias c='clear'
alias h='history'
alias ports='lsof -i -P | grep LISTEN'
alias myip='curl ifconfig.me'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'

# Directory Operations
alias mkd='mkdir -pv'
alias rmd='rm -rf'

# ============================================================================
# DEVELOPMENT FUNCTIONS
# ============================================================================

# Create and activate a new Python virtual environment
pyenv_new() {
    python3 -m venv venv
    source venv/bin/activate
    pip install --upgrade pip
    echo "Virtual environment created and activated!"
}

# FastAPI project starter
fastapi_new() {
    if [ -z "$1" ]; then
        echo "Usage: fastapi_new <project_name>"
        return 1
    fi
    mkdir -p "$1"
    cd "$1"
    python3 -m venv venv
    source venv/bin/activate
    pip install fastapi uvicorn sqlalchemy alembic python-dotenv pydantic-settings
    pip install black isort flake8 pytest pytest-cov httpx
    mkdir -p app/{api,core,models,schemas,services}
    touch app/__init__.py app/main.py app/api/__init__.py app/core/__init__.py
    touch app/models/__init__.py app/schemas/__init__.py app/services/__init__.py
    touch .env .gitignore requirements.txt README.md
    echo "venv/\n__pycache__/\n*.pyc\n.env\n.pytest_cache/\n.coverage\nhtmlcov/" > .gitignore
    pip freeze > requirements.txt
    echo "FastAPI project '$1' created successfully!"
}

# React project with Vite
react_new() {
    if [ -z "$1" ]; then
        echo "Usage: react_new <project_name>"
        return 1
    fi
    npm create vite@latest "$1" -- --template react
    cd "$1"
    npm install
    echo "React project '$1' created with Vite!"
}

# Quick HTTP server for testing
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Find and kill process by port
killport() {
    if [ -z "$1" ]; then
        echo "Usage: killport <port_number>"
        return 1
    fi
    lsof -ti:"$1" | xargs kill -9
    echo "Killed process on port $1"
}

# Create a backup of a file or directory
backup() {
    if [ -z "$1" ]; then
        echo "Usage: backup <file_or_directory>"
        return 1
    fi
    cp -r "$1" "${1}.backup.$(date +%Y%m%d-%H%M%S)"
}

# Extract various archive formats
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"   ;;
            *.tar.gz)    tar xzf "$1"   ;;
            *.bz2)       bunzip2 "$1"   ;;
            *.rar)       unrar x "$1"   ;;
            *.gz)        gunzip "$1"    ;;
            *.tar)       tar xf "$1"    ;;
            *.tbz2)      tar xjf "$1"   ;;
            *.tgz)       tar xzf "$1"   ;;
            *.zip)       unzip "$1"     ;;
            *.Z)         uncompress "$1";;
            *.7z)        7z x "$1"      ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

yt2statusest video+audio, merge to webm/mp4
  yt-dlp \
    -f "bestvideo+bestaudio/best" \
    --merge-output-format mp4 \
    -o "${temp_file}.mp4" \
    "$url"

  if [[ $? -ne 0 ]]; then
    echo "❌ yt-dlp download failed."
    return 1
  fi

  echo "🎬 Converting to status format → ${output_name}.mp4"

  ffmpeg -i "${temp_file}.mp4" \
    -vcodec libx264 \
    -crf 28 \
    -preset fast \
    -vf "scale=1080:1920:force_original_aspect_ratio=decrease,pad=1080:1920:(ow-iw)/2:(oh-ih)/2" \
    -acodec aac \
    -b:a 128k \
    -movflags +faststart \
    -t 30 \
    "${output_name}.mp4"

  if [[ $? -ne 0 ]]; then
    echo "❌ ffmpeg conversion failed."
    rm -f "${temp_file}.mp4"
    return 1
  fi

  rm -f "${temp_file}.mp4"
  echo "✅ Done → ${output_name}.mp4"
}() {
  local usage="Usage: yt2status <youtube_url> [output_filename]"
  
  # Check for required args
  if [[ -z "$1" ]]; then
    echo "$usage"
    return 1
  fi

  local url="$1"
  local output_name="${2:-status_$(date +%Y%m%d_%H%M%S)}"
  
  # Strip .mp4 extension if user provided it (we'll add it ourselves)
  output_name="${output_name%.mp4}"

  local temp_file="yt2status_temp_$$"

  echo "⬇️  Downloading: $url"
  
  # Download b
# Git commit with conventional commits format
gcom() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: gcom <type> <message>"
        echo "Types: feat, fix, docs, style, refactor, test, chore"
        return 1
    fi
    git commit -m "$1: $2"
}

# Quick project setup checker
check_env() {
    echo "=== Development Environment Check ==="
    echo -n "Python: " && python3 --version 2>/dev/null || echo "Not installed"
    echo -n "Node: " && node --version 2>/dev/null || echo "Not installed"
    echo -n "npm: " && npm --version 2>/dev/null || echo "Not installed"
    echo -n "Docker: " && docker --version 2>/dev/null || echo "Not installed"
    echo -n "Git: " && git --version 2>/dev/null || echo "Not installed"
    echo "===================================="
}

# ============================================================================
# AUTO-COMPLETION & SYNTAX HIGHLIGHTING
# ============================================================================

# Enable completion
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ============================================================================
# CUSTOM PROMPT (if not using Oh My Zsh theme)
# ============================================================================

# Uncomment to show Python virtual environment in prompt
# VIRTUAL_ENV_DISABLE_PROMPT=
# precmd() {
#     if [ -n "$VIRTUAL_ENV" ]; then
#         RPROMPT="%F{green}($(basename $VIRTUAL_ENV))%f"
#     else
#         RPROMPT=""
#     fi
# }

# ============================================================================
# LOAD ADDITIONAL CONFIGURATIONS
# ============================================================================

# Load local/private configurations if they exist
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Load NVM (Node Version Manager) if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load pyenv if installed
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# ============================================================================
# STARTUP MESSAGE
# ============================================================================

echo "🚀 FastAPI + React Development Environment Ready!"
echo "Type 'check_env' to verify your setup"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
