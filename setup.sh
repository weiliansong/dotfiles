# download a few essentials
sudo apt update
sudo apt install -y build-essential libgl1-mesa-dev vim nnn git zip unzip

# install miniconda
cd $HOME
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda3
rm -f miniconda.sh
. "/root/miniconda3/etc/profile.d/conda.sh"
conda init
conda config --set auto_activate_base false

# some useful bashrc stuff
{
  echo 'alias rm="rm -i"'
  echo 'PS1="vast:\W\$ "'
} >> $HOME/.bashrc

# configure nnn cd-on-quit
curl https://raw.githubusercontent.com/jarun/nnn/master/misc/quitcd/quitcd.bash_sh_zsh >> $HOME/.bashrc

# setup Vim
mkdir -p $HOME/.vim/colors
curl https://raw.githubusercontent.com/weiliansong/dotfiles/main/vimrc -o $HOME/.vim/vimrc
curl https://raw.githubusercontent.com/nordtheme/vim/main/colors/nord.vim -o $HOME/.vim/colors/nord.vim

# setup tmux
curl https://raw.githubusercontent.com/weiliansong/dotfiles/main/tmux -o $HOME/.tmux.conf
. $HOME/.tmux/plugins/tpm/bin/install_plugins
