#!/bin/bash
# echo "www-data  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/www-data
# passwd www-data



# Connect to the localhost Game Server Using Telnet
# 8081      - the game server telnet port
# localhost - Domain/IP
exec 3<>/dev/tcp/localhost/8081

# After connecting via Telnet, use Game Server Telnet Password to authenticate.
echo 'hahaha' >&3 

function checkIfShutdownAlreadyPlanned(){
    currentTimeAndDate=$(date -u +"%Y-%m-%dT%H:%M:%S");
    lastTimePlannedShutdown=$(</var/tmp/date-for-7dtd-restart-check);
    [[ $currentTimeAndDate > $lastTimePlannedShutdown ]] || [ -z "$lastTimePlannedShutdown" ] && {
        echo "$(date -u -d  "10 minutes" +"%Y-%m-%dT%H:%M:%S");" > /var/tmp/date-for-7dtd-restart-check
        return 0;
    } || {
		sleep 1;
        (echo 'say "[f9caa7]Community update: additional update has been proposed and soon to be integrated"')>&3
		sleep 1;
        (echo 'help')>&3 # Trigger chat, if not responsive
        return 1;
    }
}

checkIfShutdownAlreadyPlanned;
[[ "$?" = "0" ]] && {
    sleep 1;
    sleep 1;
    (echo 'say "[f9caa7]Community update here and now please wait."')>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 10 minutes."' )>&3
    sleep 300;
	(echo 'say "[f9caa7]Restart will happen in 5 minutes."' )>&3
    sleep 300;
    (echo 'say "[f9caa7]Restart will happen in 1 minute."' )>&3
    sleep 30;
    (echo 'say "[f9caa7]Restart will happen in 30 seconds."' )>&3
    sleep 20;
    (echo 'say "[f9caa7]Restart will happen in 10 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 9 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 8 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 7 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 6 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 5 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 4 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 3 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 2 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restart will happen in 1 seconds."' )>&3
    sleep 1;
    (echo 'say "[f9caa7]Restarting the server for Community update."' )>&3
    sleep 1;
    (echo 'shutdown')>&3
    sleep 5;
    screen -X -S "7DaysToDie_GameServer" quit
    sleep 2;


# 123456789 is the password for the linux account www-data
echo "123456789" | sudo -S -u steam bash <<EOF
screen -d -m -S "7DaysToDie_GameServer" "/home/steam/.steam/steamcmd/7dtd/startserver.sh" "-configfile=secure_serverconfig.xml"
    cp "/home/steam/.steam/steamcmd/7dtd/serverconfig.xml" "/home/steam/.steam/steamcmd/7dtd/secure_serverconfig.xml"
        xmlstarlet edit --inplace \
            --update "//property[@name='ControlPanelEnabled']/@value" \
            --value "true" /home/steam/.steam/steamcmd/7dtd/secure_serverconfig.xml
        xmlstarlet edit --inplace \
            --update "//property[@name='ControlPanelPassword']/@value" \
            --value "hahaha" /home/steam/.steam/steamcmd/7dtd/secure_serverconfig.xml
        xmlstarlet edit --inplace \
            --update "//property[@name='TelnetEnabled']/@value" \
            --value "true" /home/steam/.steam/steamcmd/7dtd/secure_serverconfig.xml
        xmlstarlet edit --inplace \
            --update "//property[@name='TelnetPort']/@value" \
            --value "8081" /home/steam/.steam/steamcmd/7dtd/secure_serverconfig.xml
        xmlstarlet edit --inplace \
            --update "//property[@name='TelnetPassword']/@value" \
            --value "hahaha" /home/steam/.steam/steamcmd/7dtd/secure_serverconfig.xml
       runuser -l  steam -c 'screen -d -m -S "7DaysToDie_GameServer" "/home/steam/.steam/steamcmd/7dtd/startserver.sh" "-configfile=secure_serverconfig.xml"'
EOF
} || {
    sleep 1;
}