touch /var/log/loadavg.log
printf "%s @@ %s\n" "$(cat /proc/loadavg)" "$(date)" >> /var/log/loadavg.log
