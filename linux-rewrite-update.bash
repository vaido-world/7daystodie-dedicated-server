#!/bin/bash
#
# 7 Days To Die Dedicated Server 
# Installation and Configuration
#
#          [Script Overview]
# 1. Configure Upgrade for the Ubuntu distribution 
# 2. Upgrade Ubuntu 18.04 distribution to latest version
# 3. Create a new Linux User by the name "steam"
# 4. Fix add-apt-repository: command not found error
# 5. Agree with Terms of Use of SteamCmd 
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
  apt update
  apt-get --yes --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" upgrade

# Create a new Linux User by the name "steam"
useradd -m "steam"
echo "steam:123456789" | chpasswd
chsh "steam" --shell "/bin/bash"
usermod --append --groups "sudo" "steam"

# Agree with SteamCmd [Terms of Use]
su - steam <<- 'EOF'
    echo 123456789 | sudo -S echo > /dev/null
    echo steam steam/question select "I AGREE" | sudo debconf-set-selections
    echo steam steam/license note '' | sudo debconf-set-selections
EOF


# Install SteamCmd for Linux User "steam"
# SteamCmd is used to Download Game Server Files For Dedicated Servers and Update Them
su - steam <<- 'EOF'
    cd "$HOME"
    echo 123456789 | sudo -S echo > /dev/null
    sudo add-apt-repository multiverse
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install lib32gcc1 steamcmd -y
EOF

# Fix add-apt-repository: command not found error
apt-get install software-properties-common -y



# Use SteamCmd to Download Dedicated Server Files for 7 Days To Die 
su - steam <<- 'EOF'
    cd "$HOME"
    echo 123456789 | sudo -S echo > /dev/null
    steamcmd +login anonymous +force_install_dir ./7dtd +app_update 294420 +quit
EOF

# Use SteamCmd to Download Dedicated Server Files for 7 Days To Die 
su - steam <<- 'EOF'
    cd "$HOME"
    echo 123456789 | sudo -S echo > /dev/null
EOF

# Install XML document parser for parsing and changing 7 Days To Die serverconfig.xml and other .xml files
su - steam <<- 'EOF'
    cd "$HOME"
    echo 123456789 | sudo -S echo > /dev/null
    sudo apt-get install -y xmlstarlet
EOF




