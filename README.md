# dotfiles

This setup requires [Alacritty](https://github.com/jwilm/alacritty), [Oh My Zsh](https://ohmyz.sh/), [Tmux](https://github.com/tmux/tmux), [Neovim](https://github.com/neovim/neovim)

## What is this?

Daily vim dev environment with language support for Elixir, Python, TypeScript, JavaScript.
See [extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#implemented-coc-extensions) to add support for other languages or filetypes.

## Usage

### install brew files

`brew bundle`

### setup elixir language server

_Requires `elixir-ls` in your home path_

- `cd ~/.elixir-ls`
- `mix deps.get`
- `mix deps.compile`
- `mix elixir_ls.release -o release`

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
