#!/usr/bin/env sh

source ./init.sh

apk add $(cat ../installed-packages.txt)
tar x -z -C /root -f ../backup-archive.tar.gz

