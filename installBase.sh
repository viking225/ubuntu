#!/bin/bash
#Script d'installation de base du pc de kevin
echo "Exécution du script d'installation des utilitaires"
BASE_DIRECTORY = 'baseinstall'
mkdir "$BASE_DIRECTORY"

echo "##############################################################################"
echo "Graphic pilot"
sudo apt-get install -y vim
sudo add-apt-repository -y ppa:graphics-drivers/ppa
#sudo apt update
#sudo apt-get install -y nvidia-304
echo "#################### Spotify  #######################"
#Spotify
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install -y spotify-client
#Telegram
echo "###############  telegram ########################"
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt-get update
sudo apt-get install -y telegram
#Mouse Binding
#sudo apt-get install -y xbindkeys
#sudo apt-get install -y xbindkeys-config
echo "################ UTILS ##########"
#Git
sudo apt-get install -y git
#Sublime Text
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y  && sudo apt-get update && sudo apt-get install -y sublime-text-installer
#Filezilla
sudo apt-get install -y filezilla
#Tweak Tool
sudo apt-get install -y unity-tweak-tool
#Meld 
sudo apt-get install -y meld
#Shutter 
sudo apt-get install -y shutter
#Caffeine
sudo apt-get install caffeine -y
#Indicator Multiload 
sudo apt-get install -y indicator-multiload
#Filezilla
sudo apt-get install -y filezilla
#gparted
sudo apt-get install -y gparted
#disord
sudo apt-get install discord -y
#VLC
sudo apt-get install vlc -y
#pep
sudo apt-get install pep -y
#pip
sudo apt install python-pip -y
#curl
sudo apt install curl -y
#ACPI
sudo apt install acpi -y
#Chromium
echo "#################### Chromium #######################"
sudo apt-get install chromium-browser -y
#PHP
echo "#################### PHP #######################"
sudo apt-get install php -y
#Node Js
echo "#################### Npm #######################"
sudo apt install npm -y
#nvm
echo "#################### NODE VERSION MANAGER ##################"
wget --show-progress -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
nvm install node
#Adapta Theme
echo "#################### Adapta Theme  #######################"
sudo add-apt-repository ppa:tista/adapta
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install adapta-backgrounds adapta-gtk-theme -y
sudo apt-get install paper-icon-theme -ye
sudo apt-get install plank -y
#GIT KRAKEN
echo "########################## Download Git Kraken ######################"
wget -oq https://release.gitkraken.com/linux/gitkraken-amd64.deb --show-progress
sudo dpkg -i gitkraken-amd64.deb
#sollar
echo "########################## Solaar gnome ######################"
sudo apt install solaar-gnome3 -y
echo "########################## Terminator ######################"
sudo apt install terminator -y
echo "###################### WPS Writer ###########################"
wget -q --show-progress http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_amd64.deb --output-document=/tmp/wps_office_suite.deb
sudo dpkg -i /tmp/wps_office_suite.deb 
echo "Mongo Compass"
wget -q --show-progress https://downloads.mongodb.com/compass/mongodb-compass_1.8.2_amd64.deb --output-document=/tmp/mongodb_compass.deb
sudo dpkg -i /tmp/mongodb_compass.deb
#slack
echo "##################### SLACK ###################"
wget -q --show-progress https://downloads.slack-edge.com/linux_releases/slack-desktop-2.7.1-amd64.deb --output-document=/tmp/slack-desktop
sudo dpkg -i /tmp/slack-desktop

echo "##################### Docker ##########################"
echo "####################### Oh My Zsh #########################"
sudo apt install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
#End By Reboot
sudo apt-get update
sudo apt-get upgrade
sudo reboot now
exit 0
