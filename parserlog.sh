#!/usr/bin/env bash

# (c)Volodymyr Korobtsov
# Linux & Bash Task #2


if [[ $#@ -eq 0 ]]; then
    echo "Error! Please input log file as parameter!"
elif [[ $#@ -gt 1 ]]; then
    echo "Error! Only one parameter allowed"
fi

logFile=$1
