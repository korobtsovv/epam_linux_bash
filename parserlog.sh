#!/usr/bin/env bash

# (c)Volodymyr Korobtsov
# Linux & Bash Task #2


# Check for entered script's parameter
if [[ $# -eq 0 ]]; then
    echo "Error! Please input log file as a parameter!"
    exit 1
elif [[ $# -gt 1 ]]; then
    echo "Error! Only one parameter allowed!"
    exit 2
fi

help="
1 - From which ip were the most requests?
2 - What is the most requested page?
3 - How many requests were there from each ip?
4 - What non-existent pages were clients referred to?
5 - What time did site get the most requests?
6 - What search bots have accessed the site? (UA + IP)"

# getAllIP=$(awk '{print $1}' $1)
# calcIP = ()

# for ip in ${getAllIP[@]}; do
#     if ip in calcIP

#     done

logFile=$1

function mostReqIP {
    echo "Most requests were from IP:"
    /usr/bin/awk '{gsub(/ /, "", $1); print $1}' $logFile | sort -k1 | uniq -c | sort -k1 | tail -5 | sort -r
}

function mostReqPages {
    awk '{print $7}' example_log.log | sort -k2 | uniq -c | sort -k1 | tail -10 | sort -r
}



function reqFromEachIp {
    echo "Requests from each IP:"
    /usr/bin/awk '{gsub(/ /, "", $1); print $1}' $logFile | sort -k1 | uniq -c | sort -k1
}

function req404 {
    echo "Non-existent pages were clients referred to:"
    awk '$9 ~ /404/ {print $7}' example_log.log | sort -k2 | uniq
}

function mostLoadTime {
    echo "Time when site got the most requests:"
    # fromDate=$(awk '{print $4}' example_log.log | awk -F":" '{print $1, $2}' | uniq -c | sort -k1 | tail -1 | awk '{gsub(/\[/, "", $2); print $2}')
    # fromTime=$(awk '{print $4}' example_log.log | awk -F":" '{print $1, $2}' | uniq -c | sort -k1 | tail -1 | awk '{print $3}')

     cmd=$(awk '{print $4}' example_log.log | awk -F":" '{print $1, $2}' | uniq -c | sort -k1 | tail -1)

    echo "$fromDate from $fromTime:00 to $((fromTime+1)):00"
}


echo "$help"
echo
read -p "Select question: " number


case $number in
    1)
        mostReqIP ;;
    2)
        mostReqPages ;;
    3)
        reqFromEachIp ;;
    4)
        req404 ;;
    5)
        mostLoadTime ;;
    6)
        echo "6" ;;
esac
