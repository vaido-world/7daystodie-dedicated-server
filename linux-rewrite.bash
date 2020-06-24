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
cd "$home"

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

# Install XML document parser for parsing and changing 7 Days To Die serverconfig.xml and other .xml files
sudo apt-get install -y xmlstarlet

# Configure 7 Days to Die Server 

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

  Any suggestions are Welcome." /home/steam/.steam/steamcmd/7dtd/serverconfig.xml

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

# Also needs XML Password import from other file and make git ignore that file since it will hold the password for the control panel
#? Maybe use server modlet to change this setting
