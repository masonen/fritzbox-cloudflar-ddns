#!/bin/sh

tld=$(echo "${MYFRITZ_URL}" | awk -F. '{print $(NF-1)"."$NF}')
ns=$(dig +short NS ${tld} | head -n1 | sed 's/\.$//')

if [ -z "${ns}" ]; then
    echo "Failed to get NS record for ${tld}" >&2
    exit 1
fi


dig +short @${ns} A ${MYFRITZ_URL} > /ip/ip.txt 2>&1

if [ $? -ne 0 ]; then
    echo "Failed to get IP address for ${MYFRITZ_URL}" >&2
    exit 2
fi

echo "Wrote current ip address $(cat /ip/ip.txt) to /ip/ip.txt at $(date +"%Y-%m-%d %T") (used NS ${ns})"

exit 0