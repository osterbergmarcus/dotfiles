# dotfiles

This setup requires [Alacritty](https://github.com/jwilm/alacritty), [Oh My Zsh](https://ohmyz.sh/), [Tmux](https://github.com/tmux/tmux), [Neovim](https://github.com/neovim/neovim)

## What is this?

Daily vim dev environment with language support for Elixir, Python, TypeScript, JavaScript.
See [LazyVim](https://www.lazyvim.org/) to add support for other languages or filetypes.

## Usage

### install brew files

`brew bundle`

### install oh-my-zsh shell

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### install erlang

```bash
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf install erlang latest
asdf global erlang latest
```

### install elixir

```bash
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir latest
asdf global elixir latest
```

### install node

```bash
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
```

### install lazyvim

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

### language servers

```bash
npm install -g bash-language-server
npm install -g dockerfile-language-server-nodejs
git clone https://github.com/elixir-lsp/elixir-ls.git ~/.elixir-ls
```

### install fzf key-bindings

`$(brew --prefix)/opt/fzf/install`

## install zsh plugins

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/hlissner/zsh-autopair ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
```

### enable italic fonts and true color in tmux

check if italic fonts are supported:

```bash
echo -e "\e[3mitalic\e[23m"
copy .terminfo > $HOME
```

translate terminfo files:

```bash
tic .terminfo/.tmux-256color.terminfo
tic .terminfo/.tmux-terminfo
tic .terminfo/.xterm-256color.terminfo
```
