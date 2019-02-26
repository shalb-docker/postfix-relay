#!/bin/sh

sed -i "s/#HOSTNAME_TMPL#/${RELAY_HOSTNAME}/" /etc/postfix/main.cf

trap "postfix stop; kill -SIGINT $(cat /var/run/rsyslogd.pid)" SIGINT
trap "postfix stop; kill -SIGTERM $(cat /var/run/rsyslogd.pid)" SIGTERM
trap "postfix reload; kill -SIGHUP $(cat /var/run/rsyslogd.pid)" SIGHUP

rm -rf /var/run/rsyslogd.pid
/usr/sbin/rsyslogd -n &

postfix start

sleep 2

while kill -0 "`cat /var/spool/postfix/pid/master.pid | xargs`" &> /dev/null; do
    sleep 3
done

kill -SIGTERM $(cat /var/run/rsyslogd.pid)
