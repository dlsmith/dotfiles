Command line dot files

```
cd dotfiles

# zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
chsh -s `which zsh`

# vim.
mkdir ~/.vim
mkdir ~/.vim/tmp
mkdir ~/.vim/backup
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/vim/UltiSnips ~/.vim/UltiSnips
ln -s $(pwd)/vim/ftplugin ~/.vim/ftplugin

# Install vim-plug. Run :PlugInstall after.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# git.
ln -s $(pwd)/git/.gitconfig ~/.gitconfig

# tmux.
ln -s $(pwd)/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# <prefix> + I to install plugins.
```

### Spacemacs

Mac OS

```
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus@27/Emacs.app /Applications
```

```
git clone https://github.com/syl20bnr/spacemacs "${HOME}/.emacs.d"
ln -s "$(pwd)/spacemacs/.spacemacs" "${HOME}/.spacemacs"
```
