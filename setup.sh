# download a few essentials
sudo apt update
sudo apt install -y build-essential libgl1-mesa-dev vim nnn git

# install miniconda
cd $HOME
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda3
rm -f miniconda.sh
. "/root/miniconda3/etc/profile.d/conda.sh"
conda init

# some useful bashrc stuff
{
        echo 'alias rm="rm -i"'
        echo 'PS1="vast:\W\$ "'
} >> $HOME/.bashrc

# configure nnn cd-on-quit
curl https://raw.githubusercontent.com/jarun/nnn/master/misc/quitcd/quitcd.bash_sh_zsh >> $HOME/.bashrc
