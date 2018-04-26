#!/bin/bash

echo(){
    args=($*)
    string=${args[0]}

    if [ -z ${args[1]} ]; then
        args[1]=0
    fi
    
    type=${args[1]}
 
    if [ $type -eq 1 ]; then
        command echo "##################################### $string #########################################"
    elif [ $type -eq 2 ]; then
        command echo "------------------ $string -------------------"
    else
        command echo $string
    fi

}

dpkg_install(){
    link=$1
    name=$2
    path="/tmp/$name"

    dl $link $path && sudo gdebi -n $path || echo "Download failed" 2 && return 1
}

opt_install(){
    link=$1
    name=$2
    path="/tmp/$name"

    dl $link $path || (echo "Download failed" 2 && return 1)

    echo "Done! Creating simlink..."
    mkdir /opt/$name
    tar -xvf $path -C /opt/$name
    sudo ln -s /opt/$name/bin/$name /usr/local/bin/$name
}

dl(){
    link=$1
    path=$2

    echo "Downloading $link to $path"

    if [ -f $path ];then
        echo "File already exists" 2 && return 0
    fi

    wget -q $link --output-document=$path
    return $?
}

#Script d'installation de base du pc de kevin
echo "Exécution du script d'installation des utilitaires" 1

echo "Adding software-properties-commmon"
sudo apt-get install -y software-properties-common python-software-properties

echo "Adding gdebi"
sudo apt install -y gdebi

echo "Adding repository ..."
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo add-apt-repository -y ppa:atareao/telegram
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo add-apt-repository ppa:webupd8team/java -y
sudo add-apt-repository -y ppa:tista/adapta
sudo add-apt-repository -y ppa:snwh/pulp

echo "Update..." 1

sudo apt update
sudo apt upgrade -y
sudo apt install -y wget

echo "#" 1
exit 0
echo "Graphic pilot"
sudo apt install -y vim
#sudo apt update
#sudo apt install -y nvidia-304
echo "Spotify" 1

#Spotify
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt install -y spotify-client

#Telegram
echo  "telegram" 1
sudo apt-get update
sudo apt install -y telegram

#Mouse Binding
#sudo apt install -y xbindkeys
#sudo apt install -y xbindkeys-config
echo "UTILS" 1

#Git
sudo apt install -y git

#Sublime Text
sudo apt install -y sublime-text-installer

#Filezilla
sudo apt install -y filezilla

#Tweak Tool
sudo apt install -y unity-tweak-tool

#Meld 
sudo apt install -y meld

#Shutter 
sudo apt install -y shutter

#Caffeine
sudo apt install caffeine -y

#Indicator Multiload 
sudo apt install -y indicator-multiload

#Filezilla
sudo apt install -y filezilla

#gparted
sudo apt install -y gparted

#disord
sudo apt install discord -y

#VLC
sudo apt install vlc -y

#pep
sudo apt install pep -y

#pi
sudo apt install python-pip -y
sudo apt install pip -y
#curl
sudo apt install curl -y

#ACPI
sudo apt install acpi -y

#Ms Core fonts
sudo apt install ttf-mscorefonts-installer -y

#JAVA 
echo "JAVA" 1
sudo apt update -y 
sudo apt install oracle-java8-installer -y
#PHP
echo "PHP" 1
sudo apt install php -y
sudo apt install -y php-mysql php-xml php-curl php-intl php-gd

#Composer 
echo "Composer" 1
curl -sS https://getcomposer.org/installer | php
mkdir -p /opt/composer
mv compser.phar /opt/composer/
sudo ln -s /opt/composer/composer.phar /usr/bin/composer

#Chromium
echo "Chromium" 1
sudo apt install chromium-browser -y

#Npm
echo "Npm" 1
sudo apt install npm -y

#nvm
echo "NODE VERSION MANAGER" 1
wget --show-progress -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
if [ $? -eq 0 ]
    then
        nvm install node
    else
        echo "NVM link problem"
fi

#Adapta Theme
echo "Adapta Theme" 1

sudo apt-get update 
sudo apt-get upgrade
sudo apt install adapta-backgrounds adapta-gtk-theme -y
sudo apt install paper-icon-theme -ye
sudo apt install plank -y

#GIT KRAKEN
echo "Download Git Kraken" 1
dpkg_install https://release.gitkraken.com/linux/gitkraken-amd64.deb gitkraken

#sollar
echo "Solaar gnome" 1
sudo apt install solaar-gnome3 -y
echo "Terminator" 1
sudo apt install terminator -y

echo "WPS Writer" 1
dpkg_install http://kdl1.cache.wps.com/ksodl/download/linux/a21/wps-office_10.1.0.5707~a21_amd64.deb wps_office_suite

#Mongodb
echo "Mongo" 1
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update -y
sudo apt install -y mongodb-org

echo "Mongo Compass" 1
dpkg_install https://downloads.mongodb.com/compass/mongodb-compass_1.8.2_amd64.deb mongodb-compass

#slack
echo "SLACK" 1
dpkg_install https://downloads.slack-edge.com/linux_releases/slack-desktop-2.7.1-amd64.deb slack-desktop

#My sql
echo "Mysql suite" 1
dpkg_install https://dev.mysql.com/get/mysql-apt-config_0.8.7-1_all.deb mysql
sudo apt install mysql-server -y
sudo apt install -yf mysql-workbench-community

#NGNINX
sudo apt install nginx -y

echo "Docker" 1
sudo apt install docker -y
sudo apt install docker-compose

echo "Robomongo" 1
opt_install https://download.robomongo.org/1.2.1/linux/robo3t-1.2.1-linux-x86_64-3e50a65.tar.gz robo3t

echo "Visual Studio Code" 1
dpkg_install https://go.microsoft.com/fwlink/?LinkID=760868 vscode

echo "PHPStorm" 1
sudo snap install phpstorm --classic

echo "Webstorm" 1
echo "Downloading ...."
opt_install -q https://download.jetbrains.com/webstorm/WebStorm-2018.1.2.tar.gz webstorm

echo "Oh My Zsh" 1

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

if [ -d ~/.oh-my-zsh ]; 
    then
        wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf --output-document=/tmp/PowerlineSymbols.otf
        wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf --output-document=/tmp/10-powerline-symbols.conf

        echo "Create  ~/.local/share/fonts if not exists..."
        mkdir -p ~/.local/share/fonts
        mkdir -p ~/.config/fontconfig/conf.d/

        echo "Apply powerline fonts ...."
        mv /tmp/PowerlineSymbols.otf ~/.local/share/fonts
        mv /tmp/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
        fc-cache -vf ~/.local/share/fonts

        echo "Installing agnoster themes for zsh..."
        wget -q http://raw.github.com/zakaziko99/agnosterzak-ohmyzsh-theme/master/agnosterzak.zsh-theme --output-document=$HOME/agnosterzak.zsh-theme
        sed -i.bak 's/ZSH_THEME=.*/ZSH_THEME="agnosterzak"/' ~/.zshrc

    else
        echo "Oh My zsh not installed" 2
fi
echo "Done"
#End By Reboot
sudo reboot now
exit 0
