# 7daystodie-dedicated-server
## Usage 
```
apt-upgrade
curl -L https://github.com/vaido-world/7daystodie-dedicated-server/raw/master/linux-rewrite.bash | bash
```

Subdomain suggestions: 7dtd or 7days   
Control Panel: http://7dtd.vaido.world:8080/  


## New notes
A link to the server can be introduced like this:   
While the game is running these can be used to connect to the server:  
`steam://connect/http://7dtd.vaido.world:26900/`     
`steam://connect/193.111.199.207:4868`     
While the game is not running this way is possible as well    
steam://run/251570/connect/7dtd.vaido.world:26900  
`steam://run/251570//+connect 7dtd.vaido.world:26900`

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
` screen -r steam`

To kill the session as steam user
` screen -XS 7DaysToDie_GameServer quit`

<s>To kill the session as root user
`screen -XS "steam/7DaysToDie_GameServer" quit`</s>
> Note that this command doesn't work if the session is password protected.


## `memcl` command in the in-game `F1` command line seems to regenerate some the spawning of the zombies.

## Monitoring the activity of the 7dtd server.
Type `top` into the ssh terminal and look at the CPU usage. The CPU usage is percentage sum of multicore.
Press `1` on a keyboard to get the information about general usage of CPU cores. 
![image](https://user-images.githubusercontent.com/21064622/124396699-cbe79100-dd13-11eb-9716-f2e49da22aae.png)



