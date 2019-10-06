declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo Package manager: ${osInfo[$f]}
	pm=${osInfo[$f]}
    fi
done

# install some useful programs
program_list="zsh fish tmux cmus git cmake curl imagemagick rsync"
ubuntu_extras="build-essential python-dev"
case $pm in
"yum")
	sudo yum install $program_list
	;;
"apt-get")
	sudo apt-get install $program_list
    sudo apt-get install $ubuntu_extras
	;;
"emerge")
	sudo apt-get install $program_list
	;;
"pacman")
	sudo pacman -S $program_list
    sudo pacman -S python-pip
	;;
esac

# create necessary symlinks
./makesymlinks.sh

cd ~
# powerline fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir ~/.fonts
mv PowerlineSymbols.otf ~/.fonts/

fc-cache -vf ~/.fonts/

sudo mkdir -p ~/.config/fontconfig/conf.d

sudo mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# install vundle and vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

pwd
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --go-completer --rust-completer
cd ~


# colors
git clone https://github.com/seebi/dircolors-solarized
mkdir ~/.dircolors
cp ~/dircolors-solarized/dircolors.ansi-dark ~/.dircolors

git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
~/gnome-terminal-colors-solarized/install.sh

# install oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

