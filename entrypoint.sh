#!/usr/bin/env bashio
args=()

CONFIG_PATH=/data/options.json

SERIAL=$(jq --raw-output ".SERIAL" $CONFIG_PATH)
BAUD=$(jq --raw-output ".BAUD" $CONFIG_PATH)
IPADDR=$(jq --raw-output ".IPADDR" $CONFIG_PATH)

if [ ! -z "$SERIAL" ]; then
    args+=(--serial $SERIAL)
fi

if [ ! -z "$BAUD" ]; then
    args+=(--baudrate $BAUD)
fi

if [ ! -z "$IPADDR" ]; then
    args=(--connect $IPADDR)
fi

nx584_server "${args[@]}"
