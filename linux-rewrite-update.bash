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


# Configure 7 Days To Die Server by Changing 7dtd/serverconfig.xml file
su - steam <<-'EOF1'
    cd "$HOME"
    echo 123456789 | sudo -S echo >/dev/null
# Change Default 7DTD Game Server Name
  xmlstarlet edit --inplace \
    --update "//property[@name='ServerName']/@value" \
    --value "[EU][PVP] 7 Days To Die Vanilla Public | XP 1000% | Loot 300%" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Add Website to the Description of the Game Server in the Lobby
  xmlstarlet edit --inplace \
    --update "//property[@name='ServerWebsiteURL']/@value" \
    --value "7days.vaido.world" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Change Default 7DTD Game Server Description
  xmlstarlet edit --inplace \
    --update "//property[@name='ServerDescription']/@value" \
    --value "[EU] 7 Days To Die 
    Vanilla Public PVP | XP 1000 | Loot 300
  The Dedicated server is based in Europe/Lithuania.
  If you can, support this server. 
  Contact the owner: vaidas.boqsc@gmail.com

  The Server is as close to the Vanilla as possible, 
  but focused on less tiring gameplay.

  No client side mods.

  Any suggestions are Welcome." "/home/steam/.steam/steamcmd/7dtd/serverconfig.xml"
# Change the Default 8 Player slot to 20
  xmlstarlet edit --inplace \
    --update "//property[@name='ServerMaxPlayerCount']/@value" \
    --value "20" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# The amount of Experience the Players get after Killing a zombie, Looting and other activities
  xmlstarlet edit --inplace \
    --update "//property[@name='XPMultiplier']/@value" \
    --value "1000" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Drop on Death Backpack only
  xmlstarlet edit --inplace \
    --update "//property[@name='DropOnDeath']/@value" \
    --value "3" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# The amount of Loot that Players will find in the World Containers
  xmlstarlet edit --inplace \
    --update "//property[@name='LootAbundance']/@value" \
    --value "300" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Respawn Loot twice as often
  xmlstarlet edit --inplace \
    --update "//property[@name='LootRespawnDays']/@value" \
    --value "15" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Let the administrator to join the server even if the server is full
  xmlstarlet edit --inplace \
    --update "//property[@name='ServerAdminSlots']/@value" \
    --value "1" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Make AirDrop Twice as often
  xmlstarlet edit --inplace \
    --update "//property[@name='AirDropFrequency']/@value" \
    --value "36" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Make AirDrop Visible on Map
  xmlstarlet edit --inplace \
    --update "//property[@name='AirDropMarker']/@value" \
    --value "true" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Change the Initial Incorrect 7 Days To Die Dedicated Server PlayerKillingMode
  xmlstarlet edit --inplace \
    --update "//property[@name='PlayerKillingMode']/@value" \
    --value "2" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml  
# Enable Random World Generator for the Server
  xmlstarlet edit --inplace \
    --update "//property[@name='GameWorld']/@value" \
    --value "RWG" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Set a Random Seed for the Random World Generator
  xmlstarlet edit --inplace \
    --update "//property[@name='WorldGenSeed']/@value" \
    --value "1354778" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Set the map size for the Random World Generator
# Has to be between 2048 and 16384
  xmlstarlet edit --inplace \
    --update "//property[@name='WorldGenSize']/@value" \
    --value "2048" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Set the Map Name for the Random World Generator
  xmlstarlet edit --inplace \
    --update "//property[@name='GameName']/@value" \
    --value "VaidoWorld" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
# Enable Control Panel for Direct Control of the GameServer
  xmlstarlet edit --inplace \
    --update "//property[@name='ControlPanelEnabled']/@value" \
    --value "true" /home/steam/.steam/steamcmd/7dtd/serverconfig.xml
EOF1





