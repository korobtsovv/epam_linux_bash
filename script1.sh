#!/usr/bin/env bash

# (c)Volodymyr Korobtsov
# Linux & Bash Task #1

allargs="Aviable arguments:
--all       - displays the IP addresses and symbolic names of all hosts in the current subnet
--target    - displays a list of open system TCP ports"

function getAllHosts {
    echo "Hosts in local network:"
    /usr/sbin/arp -a | awk '{print $2, $1}'
}
function getPorts {
    echo "Open TCP ports:"
    /usr/bin/netstat -t4ln | awk '{print $4}' | awk -F":" '{print $NF}' | tail +3
}

# Check arguments number
if [[ $# = 0 ]]; then
    echo "Please input some argument."
    echo "$allargs"
else
    # Check for wrong arguments
    for arg in $@; do
        if [ "$arg" == "--all" ] || [ "$arg" == "--target" ]; then
            continue
        else
            echo "ERROR! Wrong argument - '$arg'"
            echo "$allargs"
            exit 1
        fi
    done
    # Run script
    for arg in $@; do
        if [[ $arg == '--all' ]]; then
            getAllHosts
        elif [[ $arg == '--target' ]]; then
            getPorts
        fi
    done
fi
