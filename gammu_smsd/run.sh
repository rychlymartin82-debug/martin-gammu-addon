#!/usr/bin/with-contenv bash
set -e

CONFIG_DIR=/data
SMSD_CONFIG=/etc/gammu-smsdrc

echo "Starting Gammu SMSD..."
echo "Using device: ${DEVICE}"

cat <<EOF > $SMSD_CONFIG
[gammu]
device = ${DEVICE}
connection = at

[smsd]
service = files
logfile = /data/smsd.log
logformat = textall
debuglevel = ${LOGLEVEL}
inboxpath = /data/inbox/
outboxpath = /data/outbox/
sentpath = /data/sent/
errorpath = /data/error/
PIN = ${PIN}
EOF

mkdir -p /data/inbox /data/outbox /data/sent /data/error

exec gammu-smsd --config $SMSD_CONFIG --pid /data/smsd.pid
