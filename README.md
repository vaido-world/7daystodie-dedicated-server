# 7daystodie-dedicated-server
## Usage 
```
apt-upgrade
curl -L https://github.com/vaido-world/7daystodie-dedicated-server/raw/master/linux-rewrite.bash | bash
```



## New notes

Minimal_setup.zip - seem to have the most development
linux.sh and linux-rewrite.bash - might be earlier versions.

linux.sh and linux-rewrite.bash, I think you need to switch to the `steam` user and only then execute the script.


### Tools
Kitty (putty fork) and Cyberduck might be useful, remember to use sftp instead of ftp on Cyberduck. 

### Minimal setup
Extract into the root home directory
and launch it without su steam:
`bash ./ubuntu-install-steamcmd-7dtd.bash`

use `top` command to check process and see RAM usage of the server instances 

When as root user, use `su steam` and type `screen -r` to get into the server screen session.

When as steam user type `exit` to return to root user.

To list all the sessions while being not steam user, but as a root
`ls -laR /var/run/screen/`

To join a session with root user
` screen -r steam/7DaysToDie_GameServer`

To kill the session as steam user
` screen -XS 7DaysToDie_GameServer quit`

<s>To kill the session as root user
`screen -XS "steam/7DaysToDie_GameServer" quit`</s>
> Note that this command doesn't work if the session is password protected.


## Old Notes

While 7 Days To Die Dedicated Server working:
After activating DMZ Zone on the internal network IP address and connecting to the external IP
Connection to server failed
Connection timed out

After restarting the 7 Days To Die Client and connecting to the external IP
Works perfectly

After Disalbing DMZ Zone on the internal network IP address and connecting to the external IP
Not being thrown out of the game. Possible to play.

After Exiting the server via 7 Days To Die Client and connecting to the external IP
Connection to server failed
Connection timed out


Enabling 26900 UDP/TCP port is not enough.
The correct Port instructions/requirements are:
TCP: 26900
UDB: 26900 26901 26902

After portforwarding ports, ask the 7 Days To Die Players/Clients to restart their game completely.


Example:


ID	Service Port	Internal Port	IP Address	Protocol	Status	Modify
1	26900-26902	26900-26902	192.168.0.102	ALL	Enabled	Modify Delete
```

# Recommended Upnp tool 
https://github.com/miniupnp/miniupnp/releases

## Example
`upnpc-static -a 192.168.0.102 25565 25565 udp`
