#!/bin/bash
DIR_ROTATE_DAYS=14
TARBALL_DELETION_DAYS=60
LOG_DIR=/var/log/modsecurity/audit/

cd $LOG_DIR

for d in */ ; do
  echo "compressing $LOG_DIR$d dirs that are $DIR_ROTATE_DAYS days old...";
  for DIR in $(find $d./ -maxdepth 1 -mindepth 1 -type d -mtime +"$((DIR_ROTATE_DAYS - 1))" | sort); do
    echo -n "compressing $LOG_DIR$DIR ... ";
    if tar czf "$DIR.tar.gz" "$DIR"; then
      echo "done" && rm -rf "$DIR";
    else
      echo "failed";
    fi
  done

  echo "removing $LOG_DIR$d .tar.gz files that are $TARBALL_DELETION_DAYS days old..."
  for FILE in $(find $d./ -maxdepth 1 -type f -mtime +"$((TARBALL_DELETION_DAYS - 1))" -name "*.tar.gz" | sort); do
    echo -n "removing $LOG_DIR$FILE ... ";
    if rm -f "$LOG_DIR/$FILE"; then
      echo "done";
    else
      echo "failed";
    fi
  done
done
