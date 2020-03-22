# 7daystodie-dedicated-server

```
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
