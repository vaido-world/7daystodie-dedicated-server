#!/bin/bash
# Upgrade Ubuntu 18.04 to 18.04.4
# Installing 7 Days To Die Server
# Configure the 7 Days To Die Server 
#   Changes values in serverconfig.xml
#   Changes values in serveradmins.xml



# Configure the Ubuntu Upgrade (debconf defaults for console-setup)
# https://superuser.com/questions/1332341/console-setup-causes-apt-get-update-to-hang/1332926#1332926
# https://people.debian.org/~plessy/DebianInstallerDebconfTemplates.html
  echo "console-setup   console-setup/charmap47 select  UTF-8" > encoding.conf
  echo "console-setup   console-setup/codeset47 select  Guess optimal character set" >> encoding.conf
  echo "keyboard-configuration   keyboard-configuration/layout select  English (US)" >> encoding.conf
  echo "keyboard-configuration   keyboard-configuration/variant select English (US)" >> encoding.conf
  debconf-set-selections encoding.conf
  rm encoding.conf

# Configure the Ubuntu Upgrade (merging configurations)
# https://serverfault.com/questions/527789/how-to-automate-changed-config-files-during-apt-get-upgrade-in-ubuntu-12/839563#839563
  apt-get --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" upgrade

# Start the upgrade
apt-get update && apt-get upgrade -y

# Create a new Linux User by the name "steam"
useradd -m "steam"
passwd "steam"
chsh "steam" --shell "/bin/bash"
usermod --append --groups "sudo" "steam"
su "steam"

# Fix add-apt-repository: command not found error
sudo apt-get install software-properties-common


# Pre seed https://askubuntu.com/questions/506909/how-can-i-accept-the-lience-agreement-for-steam-prior-to-apt-get-install/1017487#1017487
echo steam steam/question select "I AGREE" | sudo debconf-set-selections
echo steam steam/license note '' | sudo debconf-set-selections

# Install SteamCmd
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd 

# Use SteamCmd to Download Dedicated Server Files for 7 Days To Die 
steamcmd +login anonymous +force_install_dir ./7dtd +app_update 294420 +quit

# Install XML documents parser
sudo apt-get install -y xmlstarlet

# Configure 7 Days to Die Server 

