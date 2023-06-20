#!/usr/bin/env sh

apk info|sort > ../installed-packages.txt
tar c -z -f ../backup-archive.tar.gz /root
