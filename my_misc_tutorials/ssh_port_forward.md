# About
ssh can be used to port forward/tunnel;  this is useful when trying to access localhost
ports on a remote machine.  The following command is used to portfoward the Piandao 
server's localhost port 8080 to this computer's port 8080;  the extra flags move the ssh 
session to the background and suppress its output (after logging in of course)

`ssh -f -N -L 8080:192.168.12.150:8080 robochad@192.168.12.150`

- flags described here: https://unix.stackexchange.com/q/100859/510729
