# scripts
A Netklaar collection of handy cli scripts

## what does it do?
1. detect-db.sh; provides functionality for detecting the creation of .php files 

## dependencies
An installed version of maldetect: https://www.rfxn.com/projects/linux-malware-detect/
An installed version of ClamAV
An installed version of inotify-tools

## installation
1. install and setup maldet
2. install clamav
3. install inotify-tools
4. if your on Debian 11 (bulsseye), fix maldet bug before starting maldet
5. install these scripts in /usr/local/share/netklaar/
   `git clone git@github.com:hansup/scripts.git`
6. copy logrotate script:
   `cp /usr/local/share/netklaar/scripts/logrotate/etc_logrotate.d_maldet /etc/logrotate/maldet`
7. add cronjob:
   '* * * * * /usr/local/share/netklaar/scripts/hosting/detect-bd.sh'

 
