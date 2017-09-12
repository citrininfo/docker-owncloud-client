# citrin/owncloud-client

This is a simple docker container to start single runs of owncloud syncs.

## Usage Example

```bash
docker run -ti --rm \
  --volume ~/owncloud/data:/data \
  --volume ~/owncloud/conf:/conf \
  --env SERVER=https://my.owncloud.test/remote.php/webdav/Path/To/Sync \
  --env HOST_UID=$(id -u) \
  --env HOST_GID=$(id -g) \
  citrin/owncloud-client
```

This syncs the data in `~/owncloud/data` with `Path/To/Sync` on the server `my.owncloud.test`.

## Credentials

The credentials are safed in the [netrc](https://linux.die.net/man/5/netrc) file `~/owncloud/conf/.netrc`

For example:
```netrc
default login myuser password mypassword
```

## Options

The following environment variables are supported:
<dl>
  <dt>HOST_UID</dt>
  <dd>The user id to write the files as (Ubuntu default: 1000)</dd>
  <dt>HOST_GID</dt>
  <dd>The group id to write the files as (Ubuntu default: 1000)</dd>
  <dt>TRUST_SELFSIGN</dt>
  <dd>If set to 1 it adds --trust to the owncloudcmd</dd>
  <dt>SYNC_HIDDEN</dt>
  <dd>If set to 1 it adds -h to the owncloudcmd</dd>
  <dt>SHOW_OUTPUT</dt>
  <dd>If set to 1 it removes --silent from the owncloudcmd</dd>
</dl>

## Custom Call

If you don't want the custom options `--non-interactive -n` to be passed to owncloudcmd you can overwrite the CMD:

```bash
docker run -ti --rm \
  --volume ~/owncloud/data:/data \
  --volume ~/owncloud/conf:/conf \
  --env HOST_UID=$(id -u) \
  --env HOST_GID=$(id -g) \
  citrin/owncloud-client owncloudcmd /data https://my.owncloud.test/remote.php/webdav/Path/To/Sync
```

There you can pass any owncloudcmd options you might need.
