# install some useful programs
sudo apt-get install zsh fish tmux cmus git

# create necessary symlinks
./makesymlinks.sh

# powerline fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/

fc-cache -vf ~/.fonts/

mkdir -p ~/.config/fontconfig/conf.d

mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# install vundle and vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# ls colors
git clone https://github.com/seebi/dircolors-solarized
mkdir ~/.dircolors
cp ~/dircolors-solarized/dircolors.ansi-dark ~/.dircolors
