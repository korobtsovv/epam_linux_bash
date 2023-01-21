#!/usr/bin/env bash

allargs="Aviable arguments:
--all       - displays the IP addresses and symbolic names of all hosts in the current subnet
--target    - displays a list of open system TCP ports"

subnet="192.168.1.0/24"

function getAllHosts {
    nmap -sn -R $subnet
}
getPorts() {
    nmap -R $subnet
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




# subnet="192.168.1.0/24"
