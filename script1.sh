#!/usr/bin/env bash

# (c)Volodymyr Korobtsov
# Linux & Bash Task

allargs="Aviable arguments:
--all       - displays the IP addresses and symbolic names of all hosts in the current subnet
--target    - displays a list of open system TCP ports"

function getAllHosts {
    /usr/sbin/arp -a
}
function getPorts {
    /usr/bin/netstat -tln
}

if [[ $# = 0 ]]; then
    echo "Please input some argument."
    echo "$allargs"
else
    if [[ $1 == '--all' ]]; then
        getAllHosts
    elif [[ $1 == '--target' ]]; then
        getPorts
    else
        echo "Wrong argument!"
        echo "$allargs"
    fi
fi
