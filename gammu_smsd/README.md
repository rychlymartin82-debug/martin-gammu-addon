# Gammu SMSD Add-on for Home Assistant Green

This add-on provides a fully working Gammu SMSD service for Huawei E3372h and similar USB modems.

## Features
- Sending and receiving SMS
- Inbox/outbox/sent/error directories
- SQLite backend (internal)
- Works on Home Assistant Green (no local build required)
- Uses prebuilt Docker image from GHCR

## Configuration
- `device`: USB port of the modem (e.g. `/dev/ttyUSB0`)
- `pin`: SIM PIN (optional)
- `loglevel`: INFO, DEBUG, ERROR

## Paths
- `/data/inbox`
- `/data/outbox`
- `/data/sent`
- `/data/error`
- `/data/smsd.log`

## Installation
1. Add this repository to Home Assistant Add-on Store.
2. Install the add-on.
3. Set the correct USB device.
4. Start the add-on.
