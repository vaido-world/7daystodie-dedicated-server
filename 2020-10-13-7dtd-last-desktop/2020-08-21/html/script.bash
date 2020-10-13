#!/bin/bash
# Connect to the localhost Game Server Using Telnet
# 8081      - the game server telnet port
# localhost - Domain/IP


exec 3<>/dev/tcp/localhost/8081
echo 'hahaha' >&3

sleep 1;
echo 'say "[f9caa7]Testing payload"' >&3



##  Debugging response from the server
#   If the server does not respond/output after running these commands, restart the server:
# exec 3<>/dev/tcp/localhost/8081
# echo 'hahaha' >&3
# cat <&3

# The expected output of <&3
# *** Connected with 7DTD server.
# *** Server version: Alpha 18.4 (b4) Compatibility Version: Alpha 18.4
# *** Dedicated server only build
# 
# Server IP:   194.5.157.96
# Server port: 26900
# Max players: 20
# Game mode:   GameModeSurvival
# World:       West Wikibi Territory
# Game name:   VaidoWorld
# Difficulty:  2
# 
# Press 'help' to get a list of all commands. Press 'exit' to end session.