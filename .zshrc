# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# Distrobox Shape-Shifter
if [ -f /run/.containerenv ]; then
    export PROMPT="%F{blue}minaco@fedora-box%f %F{green}%~%f %# "
    fastfetch --logo fedora
else
    fastfetch
fi
PROMPT='%n %1~ %# '
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.local/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"



# AI Frame Generation Aliases (Homebrew MPV)
# Usage: play60 /path/to/movie.mkv
alias play60='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia $(brew --prefix)/bin/mpv "--vf=vapoursynth=~/.config/mpv/rife.vpy:buffered-frames=2:concurrent-frames=2" --hwdec=nvdec --video-sync=display-resample'
# Obsidian Auto-Sync Alias
alias gsync='git add . && git commit -m "Vault Update: $(date +%Y-%m-%d_%H:%M)" && git push origin main'


bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

export PATH="$HOME/.cargo/bin:$PATH"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
