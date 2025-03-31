# brew completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# load zgenom
source "${HOME}/.zgenom/zgenom.zsh"

# Check for plugin and zgenom updates every 7 days
zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
  echo "Creating a zgenom save"

  # Add this if you experience issues with missing completions or errors mentioning compdef.
  zgenom compdef

  # If zsh-syntax-highlighting is bundled after zsh-history-substring-search,
  # they break, so get the order right.
  zgenom load zdharma-continuum/fast-syntax-highlighting
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load zsh-users/zsh-autosuggestions
  # completions
  zgenom load zsh-users/zsh-completions

  zgenom load djui/alias-tips
  zgenom load peterhurford/git-it-on.zsh
  zgenom ohmyzsh plugins/git
  zgenom load supercrabtree/k

  # Install ohmyzsh osx plugin if on macOS
  [[ "$(uname -s)" = Darwin ]] && zgenom ohmyzsh plugins/macos

  # save all to init script
  zgenom save
  # Compile your zsh files
  zgenom compile "$HOME/.zshrc"
fi

# Set keystrokes for substring searching
# cat -v to observe key codes
bindkey '^[[A' history-substring-search-up # up arrow
bindkey '^[[B' history-substring-search-down # down arrow

# fzf
export FZF_DEFAULT_COMMAND="find . -maxdepth 1"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# kubectl autocompletion
source <(kubectl completion zsh)

# completions
autoload -Uz compinit
compinit

bindkey "^[[1;3C" forward-word # opt + ->
bindkey "^[[1;3D" backward-word # opt + <-
