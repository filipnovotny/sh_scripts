#!/bin/bash

now="$(date +'%d/%m/%Y %T (%s)')" 
nfail=0
N=$1

while [ "$i" -le "$N" ]; do
    sleep 1
    ping google.com -c 1 > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
        nfail=$((nfail+1))
        echo "Ping failed on $now"
    fi
    i=$(( i + 1 ))
done
echo "recorded $nfail fails in $N seconds."
