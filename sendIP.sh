#!/bin/bash
now=$(date "+%F")
date=$(date)
IP=$(hostname -I)
devName=$(hostname)
export USERS=$(who)
export USERSLEN=$(echo $USERS | wc -c)
echo $USERSLEN
if 
[ "$USERSLEN" -ge 49 ]; then echo "Prior logon detected"; exit
else echo "Logging " $IP $devName " to "  $REMOTE
sudo sshpass -f ~/.pass_file ssh -o 'StrictHostKeyChecking=no' $REMOTE "echo $I$
fi
exit


