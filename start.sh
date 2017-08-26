#!/bin/sh
set -e

cd "$(dirname "$(realpath "$0")")"

if [ ! -d cobit-wallet ]; then ./install.sh; fi
cd cobit-wallet
./node_modules/.bin/ionic serve --nolivereload --nogulp -s --address 127.0.0.1
