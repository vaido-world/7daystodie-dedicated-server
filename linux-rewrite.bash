#!/bin/bash
sudo apt update 
sudo apt upgrade -y -qq



# https://superuser.com/questions/1332341/console-setup-causes-apt-get-update-to-hang/1332926#1332926
# https://people.debian.org/~plessy/DebianInstallerDebconfTemplates.html
echo "console-setup   console-setup/charmap47 select  UTF-8" > encoding.conf
echo "console-setup   console-setup/codeset47 select  Guess optimal character set" >> encoding.conf
echo "keyboard-configuration   keyboard-configuration/layout select  English (US)" >> encoding.conf
echo "keyboard-configuration   keyboard-configuration/variant select English (US)" >> encoding.conf
debconf-set-selections encoding.conf
rm encoding.conf
apt-get update && apt-get upgrade -y


useradd -m steam
chsh
usermod --append --groups sudo steam
passwd steam
