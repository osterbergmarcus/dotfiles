# dotfiles
[Alacritty](https://github.com/jwilm/alacritty) + [Oh My Zsh](https://ohmyz.sh/) + [Tmux](https://github.com/tmux/tmux) +  [Neovim](https://github.com/neovim/neovim) = 🔑

## What is this?
My web dev environment using vim with language support for python, typescript, javascript.
See [extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions) to add support for other languages or filetypes.

## Usage
### install brew files
`brew bundle`

### italic fonts and true color in tmux
- check if italic fonts are supported
```
echo -e "\e[3mitalic\e[23m"
```
- copy .terminfo > `$HOME`
- translate terminfo files
```
tic .terminfo/.tmux-256color.terminfo
tic .terminfo/.tmux-terminfo
tic .terminfo/.xterm-256color.terminfo
```
