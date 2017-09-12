#!/bin/bash

set -e

options="--non-interactive -n"

# check if we should trust selfsigned certificates
if [[ "$TRUST_SELFSIGN" == "1" ]]; then
  options="$options --trust"
fi

# check if we should sync hidden files
if [[ "$SYNC_HIDDEN" == "1" ]]; then
  options="$options -h"
fi

# check if we should silence output
if [[ "$SHOW_OUTPUT" != "1" ]]; then
  options="$options --silent"
fi

owncloudcmd $options /data $SERVER
