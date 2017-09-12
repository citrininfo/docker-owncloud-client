#!/bin/bash

set -e

user=occlient
group=$user

group_options=""
[[ "$HOST_GID" != "" ]] && group_options="$group_options --gid $HOST_GID"
groupadd $group_options $group

user_options="--create-home --shell /bin/bash --no-user-group -g $group"
[[ "$HOST_UID" != "" ]] && user_options="$user_options --uid $HOST_UID"
useradd $user_options $user

if [ -e /conf/.netrc ]; then
  netrc=/home/$user/.netrc
  cp /conf/.netrc $netrc
  chown $user $netrc
  chmod 600 $netrc
fi

chown -R $user:$group /data

gosu $user "$@"
