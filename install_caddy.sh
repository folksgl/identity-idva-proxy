#!/bin/bash
# Install 'xcaddy' to build caddy binary with forwardproxy plugin.
# Download the xcaddy tar file, sending it to stdout and piping to tar for
# extraction. Results in 'xcaddy' binary in the current directory.
xcaddy_version=$(cat XCADDY_VERSION)
caddy_version=$(cat CADDY_VERSION)
wget --no-verbose https://github.com/caddyserver/xcaddy/releases/download/v"$xcaddy_version"/xcaddy_"$xcaddy_version"_linux_amd64.tar.gz -O - | tar -xz xcaddy
./xcaddy build v"$caddy_version" --with github.com/caddyserver/forwardproxy@caddy2
rm xcaddy
