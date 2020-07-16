#!/bin/bash



exec 3<>'/dev/tcp/localhost/8081'
echo 'hahaha' >&3 



# The bug seems to be resolved by adding delay between commands
(
sleep 1;
echo 'say "[f9caa7]Community update here and now please wait asdasd  asdasd "' >&3
sleep 1;
echo 'say "[f9caa7]Wait for restart"' )>&3


# The limit from the bash file to send a message is like this:
#echo 'say "[f9caa7]checking the say command in the game serfd"' >&3



# Weird test limitations to send commands from bash throught telnet via descriptor &3
# (echo 'say "[f9caa7]TheS from the bash AAAAAASA A AAAAAAASDAD "' >&3)
# echo 'say "[f9caa7]The from the bash"' >&3 



