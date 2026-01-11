#!/usr/bin/with-contenv bashio
set -e

bashio::log.info "Starting Gammu SMSD add-on..."

# Load configuration
DEVICE=$(bashio::config 'device')
PIN=$(bashio::config 'pin')
LOGLEVEL=$(bashio::config 'loglevel')

bashio::log.info "Using device: ${DEVICE}"
bashio::log.info "Log level: ${LOGLEVEL}"

CONFIG_DIR="/data"
SMSD_CONFIG="/etc/gammu-smsdrc"

# Create directories
mkdir -p /data/inbox /data/outbox /data/sent /data/error

# Generate SMSD config
cat <<EOF > "${SMSD_CONFIG}"
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

bashio::log.info "Configuration file created at ${SMSD_CONFIG}"

# Start SMSD
bashio::log.info "Launching Gammu SMSD..."
exec gammu-smsd --config "${SMSD_CONFIG}" --pid /data/smsd.pid
