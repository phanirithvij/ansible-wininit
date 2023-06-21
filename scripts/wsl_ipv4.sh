#!/usr/bin/env sh

ifconfig | grep -v inet6 | grep inet | awk '{print $2}' | sed -n 1p | cut -d: -f2
