#!/bin/sh

# Start getip.sh script once on start
/usr/local/bin/getip.sh

# Start cron daemon
supercronic /home/dnscron/crontab
