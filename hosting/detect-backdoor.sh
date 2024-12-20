#!/usr/bin/env bash

EMAIL_RECIPIENT="hans@netklaar.nl"
BASE_LOG_DIR="/var/log"
MALDET_LOG_DIR="${BASE_LOG_DIR}/maldetect"
LOG_FILE="${MALDET_LOG_DIR}/inotify_log"
HOSTNAME=$(hostname -s)
OUTPUT=$(zgrep -in '\.php CREATE' ${LOG_FILE})

if [ "${OUTPUT}" ]; then
  MESSAGE="Nieuwe geplaatste .php bestanden gevonden op ${HOSTNAME}:
Logfile:
${LOG_FILE}

Lines:
${OUTPUT}

Dit bericht is automatisch verstuurd vanaf ${HOSTNAME}
"

  mail -s "Detect BACKDOOR Notificatie van ${HOSTNAME}" ${EMAIL_RECIPIENT} <<< ${MESSAGE}
  savelog ${LOG_FILE}
  echo "'php. CREATE' string found in ${LOG_FILE} on ${HOSTNAME}"
  systemctl restart maldet
#else
#  echo "no '.php CREATE' string found in ${LOG_FILE} on ${HOSTNAME}"
fi
