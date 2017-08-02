Command line dot files

```
cd dotfiles

# zsh.
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
chsh -s `which zsh`

# vim.
mkdir ~/.vim
mkdir ~/.vim/tmp
ln -s $(pwd)/vim/.vimrc ~/.vimrc
ln -s $(pwd)/vim/UltiSnips ~/.vim/UltiSnips

# Install vim-plug. Run :PlugInstall after.
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# git.
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
```
