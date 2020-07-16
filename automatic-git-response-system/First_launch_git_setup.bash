# Install git client and setup local repository
sudo apt install git -y
cd "/home/steam/.steam/steamcmd/7dtd/"
git init

sudo git remote add origin https://boqsc:f80ea0344265617d5db2e72313101883f408196b@github.com/vaido-world/7daystodie-live-server.git
sudo git remote set-url origin https://boqsc:f80ea0344265617d5db2e72313101883f408196b@github.com/vaido-world/7daystodie-live-server.git

# .gitignore folders and files
echo "Data/*
7DaysToDieServer_Data/*
Saves/*
secure_serverconfig.xml
startserver_with_security.sh
" > .gitignore

mkdir "/home/steam/.steam/steamcmd/7dtd/Mods"
[ ! -f /home/steam/.steam/steamcmd/7dtd/Mods/README.md ] && touch /home/steam/.steam/steamcmd/7dtd/Mods/README.md

# Rename current branch "master" and push to a new branch with name "master-new"
# git branch -m master master-new
# sudo git push --set-upstream origin master-new
# git branch -m master-new master

# Do a push to the Github Repository
sudo git add .
sudo git config --global user.name "7daystodie-live-server"
sudo git commit -m "7 Days To Die Alpha 18"
sudo git push origin master -f

