# download a few essentials
sudo apt update
sudo apt install -y build-essential libgl1-mesa-dev vim git zip unzip

# install miniconda
cd $HOME
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda3
rm -f miniconda.sh
. "$HOME/miniconda3/etc/profile.d/conda.sh"
conda init
conda config --set auto_activate_base false

# some useful bashrc stuff
{
  echo 'alias rm="rm -i"'
  echo 'alias ls="ls --color -h --group-directories-first"'
  echo 'alias sdf="tmux at -dt"'
  echo 'PS1="\h:\W\$ "'
  echo 'export PATH="$HOME/software:$PATH"'
} >> $HOME/.bashrc

# install nnn
mkdir -p $HOME/software
cd $HOME/software
wget https://github.com/jarun/nnn/releases/download/v4.9/nnn-static-4.9.x86_64.tar.gz
tar xzvf nnn-static-4.9.x86_64.tar.gz
mv nnn-static nnn

# configure nnn cd-on-quit
curl https://raw.githubusercontent.com/jarun/nnn/master/misc/quitcd/quitcd.bash_sh_zsh >> $HOME/.bashrc

# setup Vim
mkdir -p $HOME/.vim/colors
curl https://raw.githubusercontent.com/weiliansong/dotfiles/main/vimrc -o $HOME/.vim/vimrc
curl https://raw.githubusercontent.com/nordtheme/vim/main/colors/nord.vim -o $HOME/.vim/colors/nord.vim

# setup tmux (prefix + I to install plugins)
curl https://raw.githubusercontent.com/weiliansong/dotfiles/main/tmux -o $HOME/.tmux.conf
