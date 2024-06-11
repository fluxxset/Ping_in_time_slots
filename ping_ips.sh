#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <interval_minutes> <total_duration_minutes>"
    exit 1
fi

interval_minutes=$1
duration_minutes=$2
interval_seconds=$(( interval_minutes * 60 ))
duration_seconds=$(( duration_minutes * 60 ))
ip_file="ip_list.txt"
log_file="ping_log.txt"

end_time=$(( $(date +%s) + duration_seconds ))

ping_ip() {
    ip=$1
    result=$(ping -c 1 $ip | grep 'time=' | awk -F'time=' '{ print $2 }' | cut -d ' ' -f 1)
    if [ -z "$result" ]; then
        result="No response"
    fi
    echo "$(date) - $ip - $result" >> $log_file
}

while [ $(date +%s) -lt $end_time ]; do
    while IFS= read -r ip; do
        ping_ip $ip
    done < $ip_file
    sleep $interval_seconds
done
