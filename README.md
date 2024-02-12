# 7daystodie-dedicated-server

#### 2024-02-12

```
curl -L "https://github.com/vaido-world/7daystodie-dedicated-server/raw/master/Minimal_setup.zip" -O
unzip "./Minimal_setup.zip" -d 7_Days_To_Die_Dedicated_Server
rm "./Minimal_setup.zip"
cd "/root/7_Days_To_Die_Dedicated_Server/Minimal_setup/"
bash ./ubuntu-install-steamcmd-7dtd.bash
```

`rm -rf "./7_Days_To_Die_Dedicated_Server/"`

```
apt -y install p7zip-full p7zip-rar
7z a "./Minimal_setup.zip" "./7_Days_To_Die_Dedicated_Server/Minimal_setup/"
```

```
tar -czvf Minimal_setup.tar.gz 7_Days_To_Die_Dedicated_Server
```

```
su steam
```

```
bash announce_server_about_update
```


#### 2024-01
Latest steam effort 2024 
[Mods.zip](https://github.com/vaido-world/7daystodie-dedicated-server/files/13933136/Mods.zip)



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
```
steam://connect/94.176.237.38:26900  
steam://connect/7dtd.vaido.world:26900/  
```


`steam://connect/193.111.199.207:4868`     
While the game is not running this way is possible as well    
steam://run/251570/connect/7dtd.vaido.world:26900  
`steam://run/251570//+connect 7dtd.vaido.world:26900`

Link click stats: https://cutt.ly/LmDkTlN-stats30

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

## Remember to set MaxZombies in the serverconfig.xml to 650, same can be done to the MaxAnimals.

## Monitoring the activity of the 7dtd server.
Type `top` into the ssh terminal and look at the CPU usage. The CPU usage is percentage sum of multicore.  
Press `1` on a keyboard to get the information about general usage of CPU cores.   
![image](https://user-images.githubusercontent.com/21064622/124397041-04886a00-dd16-11eb-8ac8-e96b4813ac22.png)


## Debugging the client side
`C:\Program Files (x86)\Steam\steamapps\common\7 Days To Die\7DaysToDie_Data`  
**Search for .txt log files named like:** output_log__2021-07-13__10-52-30.txt  



