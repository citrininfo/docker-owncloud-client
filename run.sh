#!/bin/bash

set -e

options="--non-interactive -n"

exlude_file="/conf/sync-exclude.lst"
[[ -e "$exclude_file" ]] && options="$options --exclude $exclude_file"

# check if we should trust selfsigned certificates
[[ "$TRUST_SELFSIGN" == "1" ]] && options="$options --trust"

# check if we should sync hidden files
[[ "$SYNC_HIDDEN" == "1" ]] && options="$options -h"

# check if we should silence output
[[ "$SHOW_OUTPUT" != "1" ]] && options="$options --silent"

owncloudcmd $options /data $SERVER
