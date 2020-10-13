#!/bin/bash
HOME=/home/steam
USER=steam
PWD=/home/steam/.steam/steamcmd/7dtd
SHELL=/bin/bash
LOGNAME=steam
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
HOME=/home/steam

echo "multiuser on" > /home/steam/.steam/steamcmd/7dtd/multiscreen.conf
echo "acladd root" >> /home/steam/.steam/steamcmd/7dtd/multiscreen.conf

# 2020-08-10T08:54:23 444.983 INF WorldGenerator:Socket data generation took 7 minutes 12 seconds
# 2020-08-10T08:54:23 444.983 INF Exited thread RWG
# UnauthorizedAccessException: Access to the path "/var/www/.local" is denied.



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
		HOME=/home/steam
        screen -c /home/steam/.steam/steamcmd/7dtd/multiscreen.conf -d -m -S "7DaysToDie_GameServer" "/home/steam/.steam/steamcmd/7dtd/startserver.sh" "-configfile=secure_serverconfig.xml"
		
#echo "$HOME test" > /home/steam/.steam/steamcmd/7dtd/test.txt
#echo "$USER test" >> /home/steam/.steam/steamcmd/7dtd/test.txt
#echo "$PWD test" >> /home/steam/.steam/steamcmd/7dtd/test.txt 