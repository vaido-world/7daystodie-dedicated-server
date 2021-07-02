#!/bin/bash
cd "/home/steam/.steam/steamcmd/7dtd/"

sudo git remote add origin https://boqsc:7424cc665acb5fb6d4c08617027388a739f64baa@github.com/vaido-world/7daystodie-live-server.git
sudo git remote set-url origin https://boqsc:7424cc665acb5fb6d4c08617027388a739f64baa@github.com/vaido-world/7daystodie-live-server.git


# Do a push to the Github Repository
sudo git add .
sudo git config --global user.name "7daystodie-live-server"
sudo git commit -m "7 Days To Die Alpha 18"
sudo git push origin master -f
