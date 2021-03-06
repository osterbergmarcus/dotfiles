#! /bin/bash

# install node version manager
curl -o- https://github.com/nvm-sh/nvm/blob/master/install.sh | bash
nvm install --lts

# npm packages
npm install -g bash-language-server
npm install -g dockerfile-language-server-nodejs

#zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

