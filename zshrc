if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f ~/.dart-cli-completion/zsh-config.zsh ]] && . ~/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# amp
export PATH="$HOME/.local/bin:$PATH"

fpath=(~/.zsh/completions $fpath)
autoload -U compinit
compinit

# ===== FZF Configuration =====
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# fzf defaults with tmux popup support
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border'

# Use fd if available for faster file finding
if command -v fd &> /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# Preview files with bat, directories with eza
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {} 2>/dev/null || eza -la --color=always {}'"
export FZF_ALT_C_OPTS="--preview 'eza -la --color=always {}'"

# ===== fzf-tab (better completion menu) =====
# Clone if not present: git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
if [[ -f ~/.zsh/fzf-tab/fzf-tab.plugin.zsh ]]; then
  source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

  # Preview for cd completion
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

  # Preview for files
  zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --style=numbers --line-range=:100 $realpath 2>/dev/null || eza -la --color=always $realpath 2>/dev/null || echo $realpath'

  # Use tmux popup
  zstyle ':fzf-tab:*' fzf-command fzf
  zstyle ':fzf-tab:*' popup-min-size 80 20
fi

# ===== fzf-git.sh (git object browser) =====
# Clone if not present: git clone https://github.com/junegunn/fzf-git.sh ~/.zsh/fzf-git.sh
if [[ -f ~/.zsh/fzf-git.sh/fzf-git.sh ]]; then
  source ~/.zsh/fzf-git.sh/fzf-git.sh
fi

# ===== Better aliases with eza =====
alias ls='eza'
alias ll='eza -la'
alias la='eza -a'
alias lt='eza --tree --level=2'

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
