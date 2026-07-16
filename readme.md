### .zshrc file:
```sh
# Enable Powerlevel10k instant prompt.
# Keep this near the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load custom zsh configurations
if [[ -d "$HOME/.config/zsh/conf.d" ]]; then
  for file in "$HOME/.config/zsh/conf.d"/*.zsh(N); do
    source "$file"
  done
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"

# Powerlevel10k theme configuration
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
```