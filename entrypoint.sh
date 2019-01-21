#!/bin/sh

# First run
python /app/update-dynamic-dns.py

# Start cron
/usr/sbin/crond -f -l 8