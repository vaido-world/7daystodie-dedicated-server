#!/bin/bash
# Connect to the localhost Game Server Using Telnet
# 8081      - the game server telnet port
# localhost - Domain/IP
exec 3<>/dev/tcp/localhost/8081

# After connecting via Telnet, use Game Server Telnet Password to authenticate.
echo 'hahaha' >&3 

function checkIfShutdownAlreadyPlanned(){
	currentTime=$(date +%H:%M);
	lastTimePlannedShutdown=$(</var/tmp/date-for-7dtd-restart-check);
	
	if [[ "$lastTimePlannedShutdown" < "$currentTime" ]];
	then
		echo "$(date -d "$currentTime 10 minutes" +'%H:%M')" > /var/tmp/date-for-7dtd-restart-check
		(echo 'say "[f9caa7]Community update: A new shutdown has been planned"')>&3
	else
		sleep 1;
		(echo 'say "[f9caa7]Community update: additional update has been proposed and soon to be integrated"')>&3
		return 1;
	fi
}
checkIfShutdownAlreadyPlanned;
echo $? here
if [[ "$?" != "1" ]];
then
	sleep 1;
	echo asdaaaaaa >&3
	sleep 1;
	echo testsdf
	echo asdaa >&3
	(echo 'say "[f9caa7]Planing a new shutdown"')>&3
	(echo asd )>&3
fi
rm /var/tmp/date-for-7dtd-restart-check


# Check for the planned time
# cat /var/tmp/date-for-7dtd-restart-check

# Remove planned time 
# rm /var/tmp/date-for-7dtd-restart-check