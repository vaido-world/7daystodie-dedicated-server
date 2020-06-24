#!/bin/bash


# Configure the Upgrade

# https://superuser.com/questions/1332341/console-setup-causes-apt-get-update-to-hang/1332926#1332926
# https://people.debian.org/~plessy/DebianInstallerDebconfTemplates.html
  echo "console-setup   console-setup/charmap47 select  UTF-8" > encoding.conf
  echo "console-setup   console-setup/codeset47 select  Guess optimal character set" >> encoding.conf
  echo "keyboard-configuration   keyboard-configuration/layout select  English (US)" >> encoding.conf
  echo "keyboard-configuration   keyboard-configuration/variant select English (US)" >> encoding.conf
  debconf-set-selections encoding.conf
  rm encoding.conf

# https://serverfault.com/questions/527789/how-to-automate-changed-config-files-during-apt-get-upgrade-in-ubuntu-12/839563#839563
  apt-get --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" upgrade

# Start the upgrade
apt-get update && apt-get upgrade -y


useradd -m "steam"
passwd "steam"
chsh "steam" --shell "/bin/bash"
usermod --append --groups "sudo" "steam"

