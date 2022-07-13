# my Linux bashrc/vimrc/tmux setting

## How to use
## backup your .vim/ .bashrc .vimrc .tmux.conf first

cd ~

git clone https://github.com/lgbin879/my_rc.git .vim/

cp .vim/.vimrc ~/.vimrc

cp .vim/.bashrc ~/.bashrc

cp .vim/.tmux.conf ~/.tmux.conf

cp -r .vim/.autojump/ ~/

source ~/.bashrc

## Done

## use ctags.sh

cp .vim/ctags.sh PROJECT_FOLDER

cd PROJECT_FOLDER

sh ctags.sh

## use autojump
$ ~ > j -s
________________________________________

0:       total weight
0:       number of entries
0.00:    current directory weight

data:    /home/ligb/.local/share/autojump/autojump.txt
