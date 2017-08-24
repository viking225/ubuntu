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
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886
sudo apt-get update
sudo apt-get install -y spotify-client#Telegram
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt-get update
sudo apt-get install -y telegram
#Mouse Binding
#sudo apt-get install -y xbindkeys
#sudo apt-get install -y xbindkeys-config
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
#Chromium
echo "#################### Chromium #######################"
sudo apt-get install chromium-browser -y
#PHP
echo "#################### PHP #######################"
sudo apt-get install php -y
#Node Js
echo "#################### Node JS 6 #######################"
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs -y
#Adapta Theme
echo "#################### Adapta Theme  #######################"
sudo add-apt-repository ppa:tista/adapta
sudo add-apt-repository ppa:snwh/pulp
sudo apt-get update 
sudo apt-get upgrade
sudo apt-get install adapta-backgrounds adapta-gtk-theme -y
sudo apt-get install paper-icon-theme -y
sudo apt-get install plank -y
#GIT KRAKEN
echo "########################## Git Kraken ######################"
wget -oq "$BASE_DIRECTORY/gitkraken.insall.deb" https://release.gitkraken.com/linux/gitkraken-amd64.deb --show-progress
sudo dpkg -i "BASE_DIRECTORY/gitkraken.insall.deb"
#sollar
echo "########################## Solaar gnome ######################"
sudo apt install solaar-gnome3 -y
#End By Reboot
sudo apt-get update
sudo apt-get upgrade
sudo reboot now
exit 0
