#!/usr/bin/env bash

CONFIG_PATH=/data/options.json

DEVICE=$(jq -r '.device' $CONFIG_PATH)
PIN=$(jq -r '.pin' $CONFIG_PATH)
LOGLEVEL=$(jq -r '.loglevel' $CONFIG_PATH)

echo "[gammu] Starting SMSD with device $DEVICE"

cat <<EOF >/etc/gammu-smsdrc
[gammu]
device = $DEVICE
connection = at

[smsd]
service = files
logfile = /data/smsd.log
logformat = textall
PIN = $PIN
EOF

gammu-smsd -c /etc/gammu-smsdrc --log-level "$LOGLEVEL"

