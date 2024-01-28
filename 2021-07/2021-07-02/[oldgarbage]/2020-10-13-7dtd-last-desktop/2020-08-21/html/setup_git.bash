#!/bin/bash
# Install git client and setup local repository
sudo apt install git -y
cd "/home/steam/.steam/steamcmd/7dtd/"
git init

sudo git remote add origin https://boqsc:7424cc665acb5fb6d4c08617027388a739f64baa@github.com/vaido-world/7daystodie-live-server.git
sudo git remote set-url origin https://boqsc:7424cc665acb5fb6d4c08617027388a739f64baa@github.com/vaido-world/7daystodie-live-server.git

# .gitignore folders and files
echo "Data/*
7DaysToDieServer_Data/*
Saves/*
secure_serverconfig.xml
startserver_with_security.sh
" > .gitignore