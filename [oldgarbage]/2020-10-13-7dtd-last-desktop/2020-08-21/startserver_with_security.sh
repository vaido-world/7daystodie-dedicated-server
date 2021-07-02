[ "$(whoami)" = "steam" ] && ( 
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
	screen -d -m -S "7DaysToDie_GameServer" "/home/steam/.steam/steamcmd/7dtd/startserver.sh" "-configfile=secure_serverconfig.xml"
) || (
	echo You are trying to start the server not as a linux user named "steam"
)

