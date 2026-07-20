# dotfiles

My personal shell and terminal configuration.

## What's in here

| File / Folder | What it does |
|---|---|
| `.zshrc`, `.zprofile` | Zsh shell configuration |
| `.tmux.conf` | tmux configuration |
| `.vimrc` | Vim configuration |
| `.hushlogin` | Suppresses the login message on shell start |
| `.config/alacritty` | Alacritty terminal config |
| `iterm2/` | iTerm2 color scheme (Catppuccin Mocha) and profile |

## Usage

Symlink the files you want into your home directory, e.g.:

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
```
