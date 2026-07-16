### .zshrc file:
```sh
for file in "$HOME/.config/zsh/conf.d"/*.zsh(N); do
    source "$file"
done

export ZSH="$HOME/.oh-my-zsh"
source "$ZSH/oh-my-zsh.sh"
```