# scripts
A Netklaar collection of handy cli scripts

## what does it do?
1. detect-db.sh; provides functionality for detecting the creation of .php files 

## dependencies
An installed version of maldetect: https://www.rfxn.com/projects/linux-malware-detect/
An installed version of ClamAV
An installed version of inotify-tools

## installation maldet
1. install and setup maldet
2. install clamav
3. install inotify-tools
4. if your on Debian 11 (bulsseye), fix maldet bug before starting maldet
5. install these scripts in /usr/local/share/netklaar/
   `git clone git@github.com:hansup/scripts.git`
6. copy logrotate script:
   `cp /usr/local/share/netklaar/scripts/logrotate/etc_logrotate.d_maldet /etc/logrotate.d/maldet`
7. add cronjobs:
   `* * * * * /usr/local/share/netklaar/scripts/hosting/detect-backdoor.sh`

## installation wordfence cli
1. wget https://github.com/wordfence/wordfence-cli/releases/latest/download/wordfence.deb
2. apt install ./wordfence.deb
3. wordfence -c ~/.config/wordfence/wordfence-cli.ini
4. apt install libvectorscan5
5. add cronjob:
   `30 4 * * 0 /usr/local/share/netklaar/scripts/hosting/malware-scan.sh`

## installation loadavg.sh
1. add cronjob:
   `* * * * * /usr/local/share/netklaar/scripts/hosting/loadavg.sh`

## installation rotate-modsecurity-dir.sh
1. add cronjob:
   `31 2 * * * /usr/local/share/netklaar/scripts/hosting/rotate-modsecurity-dir.sh`