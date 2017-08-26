#!/bin/sh
set -e

REV=$(cat cobit-rev)

echo "\n# Downloading the Cobit Bitcoin Wallet... this might take awhile.\n"

rm -rf installing
git clone https://github.com/cobit-wallet/cobit installing
cd installing
git checkout $REV

echo "\n# Installing the Cobit Bitcoin Wallet... this might take awhile.\n"

(cd app-template && node apply.js cobit)
npm remove cordova cordova-android cordova-custom-config cordova-plugin-qrscanner coveralls
npm install
npm run build:www

cd ..
mv -f installing cobit-wallet
